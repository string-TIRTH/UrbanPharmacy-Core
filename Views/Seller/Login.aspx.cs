using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlinePharmacyManagement.Views.Seller
{
    public partial class Login : System.Web.UI.Page
    {
        Models.Functions Con;
        protected void Page_Load(object sender, EventArgs e)
        {
            Con = new Models.Functions();
        }

        public static string SName, SelEmail;
        public static int Std;
        protected void LoginBtn_Click(object sender, EventArgs e)
        {
            try
            {
                string Query = "select SelId,SelName,SelEmail,SelPass from SellerTbl where SelEmail = '{0}' and SelPass = '{1}'";
                Query = string.Format(Query, EmailTb.Value, PasswordTb.Value);
                DataTable dt = Con.GetData(Query);
                if(dt.Rows.Count == 0)
                {
                    ErrMsg.InnerText = "Invalid Seller!!!";
                }
                else
                {
                    Std = Convert.ToInt32(dt.Rows[0][0].ToString());
                    SName = dt.Rows[0][1].ToString();
                    Response.Redirect("Billing.aspx");
                 }

            }catch(Exception ex)
            {
                ErrMsg.InnerText = ex.Message;
            }
        }
    }
}