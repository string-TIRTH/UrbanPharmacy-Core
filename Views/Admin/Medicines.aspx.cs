﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlinePharmacyManagement.Views.Admin
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        Models.Functions Con;
        protected void Page_Load(object sender, EventArgs e)
        {
            Con = new Models.Functions();
            if (!IsPostBack)
            {
                ShowMedicines();
                GetCategories();    
            }
        }
        private void ShowMedicines()
        {
            string Query = "select * from MedicineTbl";
            MedicineList.DataSource = Con.GetData(Query);
            MedicineList.DataBind();
        } 
        private void GetCategories()
        {
            string Query = "select * from CategoryTbl";
            CatCb.DataTextField = Con.GetData(Query).Columns["CatName"].ToString();
            CatCb.DataValueField = Con.GetData(Query).Columns["CatId"].ToString();
            CatCb.DataSource = Con.GetData(Query);
            CatCb.DataBind();
        }

        protected void SaveBtn_Click(object sender, EventArgs e)
        {
            try
            {
                if (MedCodeTb.Value == "")
                {
                    ErrMsg.InnerText = "Missing Data!!!";
                }
                else
                {
                    string MCode = MedCodeTb.Value;
                    string MName = MedNameTb.Value;
                    string MPrice = PriceTb.Value;
                    string MStock = QtyTb.Value;
                    string MDate = ExpDate.Value;
                    string MCat = CatCb.SelectedValue.ToString();
                    string Query = "Insert into MedicineTbl values ( '{0}' , '{1}','{2}','{3}','{4}','{5}')";
                    Query = string.Format(Query, MCode, MName, MPrice, MStock, MDate, MCat);
                    Con.SetData(Query);
                    ShowMedicines();
                    ErrMsg.InnerText = "Medicine Added!!!";
                    MedCodeTb.Value = "";

                }

            }
            catch (Exception Ex)
            {
                ErrMsg.InnerText = Ex.Message;

            }
        }

        String key = "";
        protected void MedicineList_SelectedIndexChanged(object sender, EventArgs e)
        {
            key = MedicineList.SelectedRow.Cells[1].Text;
            MedCodeTb.Value = MedicineList.SelectedRow.Cells[1].Text;
            MedNameTb.Value = MedicineList.SelectedRow.Cells[2].Text;
            PriceTb.Value = MedicineList.SelectedRow.Cells[3].Text;
            QtyTb.Value = MedicineList.SelectedRow.Cells[4].Text;
            ExpDate.Value = MedicineList.SelectedRow.Cells[5].Text;
            CatCb.SelectedValue = MedicineList.SelectedRow.Cells[6].Text;
        }

        protected void EditBtn_Click(object sender, EventArgs e)
        {

            try
            {
                if (QtyTb.Value == "" || MedNameTb.Value == "" || PriceTb.Value=="")
                {
                    ErrMsg.InnerText = "Missing Data!!!";
                }
                else
                {
                    string MCode = MedCodeTb.Value;
                    string MName = MedNameTb.Value;
                    string MPrice = PriceTb.Value;
                    string MStock = QtyTb.Value;
                    string MDate = ExpDate.Value;
                    string MCat = CatCb.SelectedValue.ToString();
                    string Query = "Update MedicineTbl set MedName= '{0}', MedPrice= '{1}',MedStock= '{2}',MedExpDate= '{3}',MedCategory= '{4}' where MedCode='{5}'  ";
                    Query = string.Format(Query, MName, MPrice, MStock, MDate, MCat, MedicineList.SelectedRow.Cells[1].Text);
                    Con.SetData(Query);
                    ShowMedicines();
                    ErrMsg.InnerText = "Medicine Updated!!!";
                    MedCodeTb.Value = "";
                    PriceTb.Value = "";
                    QtyTb.Value = "";
                    CatCb.SelectedIndex =-1;


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
                if (QtyTb.Value == "" || MedNameTb.Value == "" || PriceTb.Value == "")
                {
                    ErrMsg.InnerText = "Missing Data!!!";
                }
                else
                {
                    string MCode = MedCodeTb.Value;
                    string MName = MedNameTb.Value;
                    string MPrice = PriceTb.Value;
                    string MStock = QtyTb.Value;
                    string MDate = ExpDate.Value;
                    string MCat = CatCb.SelectedValue.ToString();
                    string Query = "Delete from MedicineTbl where MedCode='{0}'  ";
                    Query = string.Format(Query, MedicineList.SelectedRow.Cells[1].Text);
                    Con.SetData(Query);
                    ShowMedicines();
                    ErrMsg.InnerText = "Medicine deleted!!!";
                    MedCodeTb.Value = "";
                    PriceTb.Value = "";
                    QtyTb.Value = "";
                    CatCb.SelectedIndex = -1;


                }

            }
            catch (Exception Ex)
            {
                ErrMsg.InnerText = Ex.Message;

            }
        }
    }
}