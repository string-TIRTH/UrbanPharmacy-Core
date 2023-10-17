using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlinePharmacyManagement.Views.Admin
{
    public partial class Sellers : System.Web.UI.Page
    {
        Models.Functions Con;
        protected void Page_Load(object sender, EventArgs e)
        {
            Con = new Models.Functions();
            if (!IsPostBack)
            {
                ShowSellers();
            }

        }
        private void ShowSellers()
        {
            string Query = "select * from SellerTbl";
            SellerList.DataSource = Con.GetData(Query);
            SellerList.DataBind();

        }

        protected void SaveBtn_Click(object sender, EventArgs e)
        {
            try
            {
                if (SAddressTb.Value == "" || SEmailTb.Value == "" || PasswordTb.Value == "" || SAddressTb.Value == "")
                {
                    ErrMsg.InnerText = "Missing Data!!!";
                }
                else
                {
                    string SName = SNameTb.Value;
                    string SEmail = SEmailTb.Value;
                    string SPass = PasswordTb.Value;
                    string SDOB = SDOBTb.Value;
                    string SGen = GenCb.SelectedItem.Value;
                    string SAdd = SAddressTb.Value;
                    string Query = "Insert into SellerTbl values ( '{0}' , '{1}','{2}','{3}','{4}','{5}')";
                    Query = string.Format(Query, SName, SEmail, SPass, SDOB, SGen, SAdd);
                    Con.SetData(Query);
                    ShowSellers();
                    ErrMsg.InnerText = "Seller Added!!!";
                    SNameTb.Value = "";
                    SEmailTb.Value = "";
                    PasswordTb.Value = "";
                    GenCb.SelectedIndex = -1;
                    SAddressTb.Value = "";
                }

            }
            catch (Exception Ex)
            {
                ErrMsg.InnerText = Ex.Message;

            }
        }

        protected void EditBtn_Click(object sender, EventArgs e)
        {
            try
            {
                if (SAddressTb.Value == "" || SEmailTb.Value == "" || PasswordTb.Value == "" || SAddressTb.Value == "")
                {
                    ErrMsg.InnerText = "Missing Data!!!";
                }
                else
                {
                    string SName = SNameTb.Value;
                    string SEmail = SEmailTb.Value;
                    string SPass = PasswordTb.Value;
                    string SDOB = SDOBTb.Value;
                    string SGen = GenCb.SelectedItem.Value;
                    string SAdd = SAddressTb.Value;
                    string Query = "update SellerTbl set SelName = '{0}' , SelEmail =  '{1}',SelPass = '{2}',SelDOB = '{3}',SelGen = '{4}',SelAdd = '{5}' where SelId = '{6}'";
                    Query = string.Format(Query, SName, SEmail, SPass, SDOB, SGen, SAdd, SellerList.SelectedRow.Cells[1].Text);
                    Con.SetData(Query);
                    ShowSellers();
                    ErrMsg.InnerText = "Seller updated!!!";
                    SNameTb.Value = "";
                    SEmailTb.Value = "";
                    PasswordTb.Value = "";
                    GenCb.SelectedIndex = -1;
                    SAddressTb.Value = "";
                }

            }
            catch (Exception Ex)
            {
                ErrMsg.InnerText = Ex.Message;

            }

        }

        protected void DeleteBtn_Click(object sender, EventArgs e)
        {
            try
            {
                if (SAddressTb.Value == "" || SEmailTb.Value == "" || PasswordTb.Value == "" || SAddressTb.Value == "")
                {
                    ErrMsg.InnerText = "Missing Data!!!";
                }
                else
                {
                    string SName = SNameTb.Value;
                    string SEmail = SEmailTb.Value;
                    string SPass = PasswordTb.Value;
                    string SDOB = SDOBTb.Value;
                    string SGen = GenCb.SelectedItem.Value;
                    string SAdd = SAddressTb.Value;
                    string Query = "delete from SellerTbl  where SelId = '{0}'";
                    Query = string.Format(Query, SellerList.SelectedRow.Cells[1].Text);
                    Con.SetData(Query);
                    ShowSellers();
                    ErrMsg.InnerText = "Seller deleted!!!";
                    SNameTb.Value = "";
                    SEmailTb.Value = "";
                    PasswordTb.Value = "";
                    GenCb.SelectedIndex = -1;
                    SAddressTb.Value = "";
                }

            }
            catch (Exception Ex)
            {
                ErrMsg.InnerText = Ex.Message;

            }


        }

        int key = 0;
        protected void SellerList_SelectedIndexChanged(object sender, EventArgs e)
        {
            key = Convert.ToInt32(SellerList.SelectedRow.Cells[1].Text);
            SNameTb.Value = SellerList.SelectedRow.Cells[2].Text;
            SEmailTb.Value = SellerList.SelectedRow.Cells[3].Text;
            PasswordTb.Value = SellerList.SelectedRow.Cells[4].Text;
            SDOBTb.Value = SellerList.SelectedRow.Cells[5].Text;
            GenCb.SelectedValue = SellerList.SelectedRow.Cells[6].Text;
            SAddressTb.Value = SellerList.SelectedRow.Cells[7].Text;

        }
    }
}