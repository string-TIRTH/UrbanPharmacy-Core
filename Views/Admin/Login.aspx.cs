using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlinePharmacyManagement.Views.Admin
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void LoginBtn_Click(object sender, EventArgs e)
        {
            string email = txtEmail.Text;
            string password = txtPassword.Text;

            // Check if the provided email and password match the admin credentials
            if (email == "admin@gmail.com" && password == "123456")
            {
                // Redirect to Medicines.aspx
                Response.Redirect("Medicines.aspx");
            }
            else
            {
                ErrMsg.Text = "Invalid credentials. Please try again.";
            }
        }

    }
}