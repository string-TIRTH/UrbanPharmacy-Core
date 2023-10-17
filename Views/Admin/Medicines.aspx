<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="Medicines.aspx.cs" Inherits="OnlinePharmacyManagement.Views.Admin.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        /* Style for the entire page content */
        .container-fluid {
            padding: 5px;
        }

        /* Style for the form section */
        .form-section {
            background-color: #f5f5f5;;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        /* Style for form elements */
        .form-control {
            border: 1px solid #ccc;
            border-radius: 5px;
            margin-bottom: 10px;
        }

        /* Style for buttons */
        .btn {
            border: none;
            border-radius: 5px;
            padding: 10px 20px;
            cursor: pointer;
        }

        .btn-success {
            background-color: #5cb85c;
            color: #fff;
        }

        .btn-primary {
            background-color: #337ab7;
            color: #fff;
        }

        .btn-danger {
            background-color: #d9534f;
            color: #fff;
        }

        /* Style for the table */
        .table {
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        /* Style for table headers */
        .table th {
            background-color: #f5f5f5;
            text-align: center;
        }

        /* Style for table rows */
        .table tr {
            transition: background-color 0.3s;
        }

        .table tr:hover {
            background-color: #f2f2f2;
        }

        /* Additional styles for specific elements */
        .mb-3 {
            margin-bottom: 20px;
        }

        .text-danger {
            color: #d9534f;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Mybody" runat="server">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-4 form-section">
                <h3 class="mb-3" style ="margin:20px;;">Medicine Details</h3>
                <div class="mb-3">
                    <input type="text" class="form-control" placeholder="Medicine Code" runat="server" id="MedCodeTb" autocomplete="off">
                </div>
                <div class="mb-3">
                    <input type="text" class="form-control" placeholder="Medicine Name" runat="server" id="MedNameTb" autocomplete="off">
                </div>
                <div class="mb-3">
                    <input type="text" class="form-control" placeholder="Medicine Price" runat="server" id="PriceTb" autocomplete="off">
                </div>
                <div class="mb-3">
                    <input type="text" class="form-control" placeholder="Medicine Stock" runat="server" id="QtyTb" autocomplete="off">
                </div>
                <div class="mb-3">
                    <input type="date" class="form-control" placeholder="Expiry Date" runat="server" id="ExpDate">
                </div>
                <div class="mb-3">
                    <asp:DropDownList ID="CatCb" runat="server" CssClass="form-control" placeholder="Medicine Category">
                        <asp:ListItem Value="">Medicine Category</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <label id="ErrMsg" class="text-danger" runat="server"></label>
                <div class="mb-3">
                    <asp:Button ID="EditBtn" runat="server" Text="Edit" class="btn btn-success btn-block" OnClick="EditBtn_Click" />
                </div>
                <div class="mb-3">
                    <asp:Button ID="SaveBtn" runat="server" Text="Save" class="btn btn-primary btn-block" OnClick="SaveBtn_Click" />
                </div>
                <div class="mb-3">
                    <asp:Button ID="DeleteBtn" runat="server" Text="Delete" class="btn btn-danger btn-block" OnClick="DeleteBtn_Click" />
                </div>
            </div>
            <div class="col-md-8">
                <h2 class="mb-3">Medicines List</h2>
                <asp:GridView ID="MedicineList" class="table table-bordered table-hover" runat="server" AutoGenerateSelectButton="True" OnSelectedIndexChanged="MedicineList_SelectedIndexChanged">
                </asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>
