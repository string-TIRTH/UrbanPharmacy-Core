using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlinePharmacyManagement.Views.Admin
{
    public partial class Categories : System.Web.UI.Page
    {
        Models.Functions Con;
        protected void Page_Load(object sender, EventArgs e)
        {
            Con = new Models.Functions();
            if(!IsPostBack)
            {
                ShowCategories();
            }
            
        }
        private void ShowCategories()
        {
            string Query = "select CatId as Number,CatName as [Category Names] from CategoryTbl";
            CategoryList.DataSource = Con.GetData(Query);
            CategoryList.DataBind();    
        }
        
        protected void SaveBtn_Click(object sender, EventArgs e)
        {
            try
            {
                if (CatNameTb.Value == "")
                {
                    ErrMsg.InnerText = "Missing Data!!!";
                }
                else
                {
                    string CatName = CatNameTb.Value;
                    string Query = "Insert into CategoryTbl (CatName) values ('{0}')";
                    Query = string.Format(Query, CatName);
                    Con.SetData(Query);
                    ShowCategories();
                    ErrMsg.InnerText = "Category Added!!!";
                    CatNameTb.Value = "";

                }

            }
            catch(Exception Ex)
            {
                ErrMsg.InnerText = Ex.Message;

            }

           
        }

        protected void CategoryList_SelectedIndexChanged(object sender, EventArgs e)
        {
            CatNameTb.Value = CategoryList.SelectedRow.Cells[2].Text;

        }

        protected void DeleteBtn_Click(object sender, EventArgs e)
        {
            try
            {
                if (CatNameTb.Value == "")
                {
                    ErrMsg.InnerText = "Missing Data!!!";
                }
                else
                {
                    string CatName = CatNameTb.Value;
                    string Query = "Delete from CategoryTbl where CatId ='{0}'";
                    Query = string.Format(Query, CategoryList.SelectedRow.Cells[1].Text);
                    Con.SetData(Query);
                    ShowCategories();
                    ErrMsg.InnerText = "Category Added!!!";
                    CatNameTb.Value = "";

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
                if (CatNameTb.Value == "")
                {
                    ErrMsg.InnerText = "Missing Data!!!";
                }
                else
                {
                    string CatName = CatNameTb.Value;
                    string Query = "Update CategoryTbl set CatName='{0}' where CatId ='{1}'";
                    Query = string.Format(Query, CatName, CategoryList.SelectedRow.Cells[1].Text);
                    Con.SetData(Query);
                    ShowCategories();
                    ErrMsg.InnerText = "Category Added!!!";
                    CatNameTb.Value = "";

                }

            }
            catch (Exception Ex)
            {
                ErrMsg.InnerText = Ex.Message;

            }
        }
    }
}