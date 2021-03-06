﻿using SantaAna.Web.Models.Domain;
using SantaAna.Web.Models.Requests;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace SantaAna.Web.Services
{
    public class MainService
    {
        public static int MainInsert(MainUpdatedAddRequest payload)
        {
            int id = 0;
            string connString = System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            using (SqlConnection sqlConn = new SqlConnection(connString))
            {
                using (SqlCommand cmd = new SqlCommand("Service_Insert", sqlConn))
                {
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Name", payload.Name);
                    cmd.Parameters.AddWithValue("@PostedBy", payload.PostedBy);
                    cmd.Parameters.AddWithValue("@contactId", payload.contactId);
                    cmd.Parameters.AddWithValue("@addressId", payload.addressId);
                    cmd.Parameters.AddWithValue("@hoursId", payload.hoursId);
                    cmd.Parameters.AddWithValue("@Description", payload.Description);


                    DataTable dt = new DataTable();
                    DataColumn dc = new DataColumn("ServiceTag", typeof(String));
                    dt.Columns.Add(dc);

                    for (int i = 0; i < payload.Tags.Count; i++)
                    {
                        var category = payload.Tags[i].Name;

                        DataRow dr = dt.NewRow();

                        dr[0] = category;

                        dt.Rows.Add(dr);
                    }
                    cmd.Parameters.AddWithValue("@TableParams", dt);


                    SqlParameter param = new SqlParameter();
                    param.ParameterName = "@ID";
                    param.SqlDbType = System.Data.SqlDbType.Int;
                    param.Direction = System.Data.ParameterDirection.Output;
                    cmd.Parameters.Add(param);

                    sqlConn.Open();
                    cmd.ExecuteNonQuery();

                    id = (int)cmd.Parameters["@ID"].Value;
                }
            }
            return id;
        }

        public static ServiceModel ServiceSelectById(int id)
        {

            {
                ServiceModel s = new ServiceModel();
                string connString = System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
                using (SqlConnection sqlConn = new SqlConnection(connString))
                {
                    using (SqlCommand cmd = new SqlCommand("Service_SelectById", sqlConn))
                    {
                        cmd.CommandType = System.Data.CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@Id", id);

                        sqlConn.Open();
                        SqlDataReader reader = cmd.ExecuteReader(System.Data.CommandBehavior.CloseConnection);
                        while (reader.Read())
                        {
                            s.PostedBy = reader.GetString(0);
                            s.description = reader.GetString(1);
                            s.name = reader.GetString(2);
                            s.email = reader.GetString(3);
                            s.phone = reader.GetString(4);
                            s.website = reader.GetString(5);
                            s.monday = reader.GetString(6);
                            s.tuesday = reader.GetString(7);
                            s.wednesday = reader.GetString(8);
                            s.thursday = reader.GetString(9);
                            s.friday = reader.GetString(10);
                            s.saturday = reader.GetString(11);
                            s.sunday = reader.GetString(12);
                            s.addressline1 = reader.GetString(13);
                            s.addressline2 = reader.GetString(14);
                            s.city = reader.GetString(15);
                            s.state = reader.GetString(16);
                            s.zip = reader.GetString(17);
                        }
                    }

                }
                return s;
            }
        }

        public static List<Service> GetServiceAll()
        {
            List<Service> serviceList = new List<Service>();
            Dictionary<int, Service> serviceDictionary = new Dictionary<int, Service>();
            List<Tag> categoryList = new List<Tag>();
            int set = 0;

            string connString = System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

            using (SqlConnection sqlConn = new SqlConnection(connString))
            {
                using (SqlCommand cmd = new SqlCommand("Service_SelectAll", sqlConn))
                {
                    sqlConn.Open();
                    SqlDataReader reader = cmd.ExecuteReader(System.Data.CommandBehavior.CloseConnection);
                    while (reader.HasRows)
                    {
                        while (reader.Read())
                        {
                            Service service = new Service();
                            switch (set)
                            {
                                case 0:
                                    Service s = new Service();
                                    int startingIndex = 0;
                                    s.Id = reader.GetInt32(startingIndex++);
                                    s.Name = reader.GetString(startingIndex++);
                                    s.PostedBy = reader.GetString(startingIndex++);
                                    s.ContactId = reader.GetInt32(startingIndex++);
                                    s.AddressId = reader.GetInt32(startingIndex++);
                                    s.HoursId = reader.GetInt32(startingIndex++);
                                    s.Description = reader.GetString(startingIndex++);
                                    s.Tags = new List<Tag>();
                                    serviceList.Add(s);
                                    serviceDictionary.Add(s.Id, s);
                                    break;
                                case 1:
                                    Tag tag = new Tag();
                                    if (!reader.IsDBNull(1))
                                    {
                                        tag.ID = reader.GetInt32(0);
                                        tag.Name = reader.GetString(1);
                                        serviceDictionary[tag.ID].Tags.Add(tag);
                                    }
                                    break;
                            }
                        }
                        reader.NextResult();
                        set++;
                    }

                }
                return serviceList;
            }
        }

        public static List<Tag> GetTags()
        {
            List<Tag> tags = new List<Tag>();

            string connString = System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

            using (SqlConnection sqlConn = new SqlConnection(connString))
            {
                using (SqlCommand cmd = new SqlCommand("Tag_SelectAll", sqlConn))
                {
                    sqlConn.Open();
                    SqlDataReader reader = cmd.ExecuteReader(System.Data.CommandBehavior.CloseConnection);
                    while (reader.Read())
                    {
                        Tag service = new Tag();
                        {
                            Tag s = new Tag();
                            int startingIndex = 0;
                            s.ID = reader.GetInt32(startingIndex++);
                            s.Name = reader.GetString(startingIndex++);
                            tags.Add(s);

                        }
                    }
                    return tags;
                }
            }


        }

        public static List<ServiceFix> GetServiceByTags(List<TagFix> model)
        {
            List<ServiceFix> list = new List<ServiceFix>();
            // 
            //List<TagFix> t = tags.OfType<TagFix>().ToList();


            DataTable tbl = new DataTable();
            tbl.Columns.Add("tagName");
            // Add All tag names into tbl
            for (var i = 0; i < model.Count; i++)
            {
                //DataRow row = tbl.NewRow();
                //row["tagName"] = model[i].name;
                tbl.Rows.Add(model[i].name);
            }
            // At this point DataTable tbl is fully populated with correct tag names.
            string connString = System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ToString();

            using (SqlConnection sqlConn = new SqlConnection(connString))
            {
                using (SqlCommand cmd = new SqlCommand("Service_SelectByTags", sqlConn))
                {
                    // Pass tbl as a table parameter.
                    cmd.CommandType = CommandType.StoredProcedure;
                    SqlParameter tableParam = cmd.Parameters.AddWithValue("@List", tbl);
                    tableParam.SqlDbType = SqlDbType.Structured;

                    // Open Connection
                    sqlConn.Open();
                    // Create reader
                    SqlDataReader reader = cmd.ExecuteReader(System.Data.CommandBehavior.CloseConnection);
                    // Execute reader
                    while (reader.Read())
                    {
                        ServiceFix s = new ServiceFix();
                        int index = 0;
                        s.Id = reader.GetInt32(index++);
                        s.Name = reader.GetString(index++);
                        s.PostedBy = reader.GetString(index++);
                        s.ContactId = reader.GetInt32(index++);
                        s.AddressId = reader.GetInt32(index++);
                        s.HoursId = reader.GetInt32(index++);
                        s.Description = reader.GetString(index++);
                        s.Tags = model;

                        list.Add(s);
                    }
                }
            }

            return list;
        }
    }
}
