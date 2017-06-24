using SantaAna.Web.Models.Requests;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace SantaAna.Web.Services
{
    public class AddressService
    {
        public static int AddressInsert(AddressAddRequest payload)
        {
            int id = 0;
            string connString = System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            using (SqlConnection sqlConn = new SqlConnection(connString))
            {
                using (SqlCommand cmd = new SqlCommand("Address_Insert", sqlConn))
                {
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@AddressLine1", payload.AddressLine1);
                    cmd.Parameters.AddWithValue("@AddressLine2", payload.AddressLine2);
                    cmd.Parameters.AddWithValue("@City", payload.City);
                    cmd.Parameters.AddWithValue("@State", payload.State);
                    cmd.Parameters.AddWithValue("@Zip", payload.Zip);

                    SqlParameter param = new SqlParameter();
                    param.ParameterName = "@ID";
                    param.SqlDbType = System.Data.SqlDbType.Int;
                    param.Direction = System.Data.ParameterDirection.Output;
                    cmd.Parameters.Add(param);

                    sqlConn.Open();
                    cmd.ExecuteNonQuery();

                    id = (int)cmd.Parameters["@Id"].Value;

                }

            }
            return id;
        }
    }
}