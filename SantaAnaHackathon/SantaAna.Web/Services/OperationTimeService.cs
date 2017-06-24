using SantaAna.Web.Models.Requests;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace SantaAna.Web.Services
{
    public class OperationTimeService
    {
        public static int OperationTimeInsert(OperationTimeAddRequest payload)
        {
            int id = 0;
            string connString = System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            using (SqlConnection sqlConn = new SqlConnection(connString))
            {
                using (SqlCommand cmd = new SqlCommand("Address_Insert", sqlConn))
                {
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Monday", payload.Monday);
                    cmd.Parameters.AddWithValue("@Tuesday", payload.Tuesday);
                    cmd.Parameters.AddWithValue("@Wednesday", payload.Wednesday);
                    cmd.Parameters.AddWithValue("@Thursday", payload.Thursday);
                    cmd.Parameters.AddWithValue("@Friday", payload.Friday);
                    cmd.Parameters.AddWithValue("@Saturday", payload.Saturday);
                    cmd.Parameters.AddWithValue("@Sunday", payload.Sunday);

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