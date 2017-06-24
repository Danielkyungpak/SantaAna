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
                using (SqlCommand cmd = new SqlCommand("Address_Insert", sqlConn))
                {
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
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
    }
}