using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Runtime.InteropServices.WindowsRuntime;
using System.Web;

namespace OnlinePharmacyManagement.Models
{

    public class Functions
    {
        private SqlConnection Con;
        private SqlCommand cmd;
        private DataTable dt;
        private SqlDataAdapter sda;
        private string ConString;

        public Functions()
        {
            ConString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=D:\College_Lab_work\Sem_5\WDA\Project\OnlinePharmacyManagement\database\PharmacyMange.mdf;Integrated Security=True;Connect Timeout=30";
            Con = new SqlConnection(ConString);
            cmd = new SqlCommand();
            cmd.Connection = Con;

        }
        public DataTable GetData(String Query)
        {
            dt = new DataTable();
            sda = new SqlDataAdapter(Query, ConString);
            sda.Fill(dt);
            return dt;
        }

        public int SetData(String Query) {
            int cnt = 0;
            if(Con.State== ConnectionState.Closed)
            {
                Con.Open(); 
            }
            cmd.CommandText = Query;
            cnt = cmd.ExecuteNonQuery();
            Con.Close();
            return cnt;

        }
    }
}
    
