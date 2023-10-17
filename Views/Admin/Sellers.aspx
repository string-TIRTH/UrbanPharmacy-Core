<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="Sellers.aspx.cs" Inherits="OnlinePharmacyManagement.Views.Admin.Sellers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        /* Style for the entire page content */
        .container-fluid {
            padding: 15px;
        }

        /* Style for the form section */
        .form-section {
            background-color: #f7f7f7;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        /* Style for form elements */
        .form-control {
            border: 1px solid #ccc;
            border-radius: 5px;
            margin-bottom: 15px;
            padding: 10px;
        }

        /* Style for buttons */
        .btn {
            border: none;
            border-radius: 5px;
            padding: 12px 24px;
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
            border-collapse: collapse;
            width: 100%;
            border: 1px solid #ccc;
            border-radius: 10px;
            background-color: #fff;
        }

        /* Style for table headers */
        .table th {
            background-color: #337ab7;
            color: #000;
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
            margin-bottom: 25px;
        }

        .text-danger {
            color: #d9534f;
        }

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

        /* Add your theme-specific styles here */
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Mybody" runat="server">
    <div class="container-fluid">
        <div class="row mt-5">
            <div class="col-md-4 form-section">
                <h3 class="mb-4">Seller Details</h3>
                <div class="row mb-3">
                    <div class="col">
                        <input type="text" class="form-control" placeholder="Seller Name" runat="server" id="SNameTb">
                    </div>
                    <div class="col">
                        <input type="text" class="form-control" placeholder="Seller Email" runat="server" id="SEmailTb">
                    </div>
                </div>
                <div class="row mb-3">
                    <div class="col">
                        <label class="form-label"></label>
                        <input type="password" class="form-control" placeholder="Seller Password" runat="server" id="PasswordTb">
                    </div>
                    <div class="col">
                        <label class="form-label">Seller DOB</label>
                        <input type="date" class="form-control" runat="server" id="SDOBTb">
                    </div>
                </div>
                <div class="row mb-3">
                    <div class="col">
                        <asp:DropDownList ID="GenCb" runat="server" CssClass="form-control" placeholder="Gender" >
                            <asp:ListItem Value="">Select Your Gender</asp:ListItem>
                            <asp:ListItem>Male</asp:ListItem>
                            <asp:ListItem>Female</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="col">
                        <input type="text" class="form-control" placeholder="Seller Address" id="SAddressTb" runat="server"/>
                    </div>
                </div>
                <div class="row">
                    <label id="ErrMsg" class="text-danger" runat="server"></label>
                    <div class="col d-grid">
                        <asp:Button ID="EditBtn" runat="server" Text="Edit" class="btn btn-success btn-block" OnClick="EditBtn_Click" />
                    </div>
                    <div class="col d-grid">
                        <asp:Button ID="SaveBtn" runat="server" Text="Save" class="btn btn-primary btn-block" OnClick="SaveBtn_Click" />
                    </div>
                    <div class="col d-grid">
                        <asp:Button ID="DeleteBtn" runat="server" Text="Delete" class="btn btn-danger btn-block" OnClick="DeleteBtn_Click" />
                    </div>
                </div>
            </div>
            <div class="col-md-8">
                <h2 class="mb-4">Seller List</h2>
                <asp:GridView ID="SellerList" class="table table-bordered table-hover" runat="server" AutoGenerateSelectButton="True" OnSelectedIndexChanged="SellerList_SelectedIndexChanged"></asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>
