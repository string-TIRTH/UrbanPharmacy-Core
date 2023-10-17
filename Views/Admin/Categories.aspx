<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="Categories.aspx.cs" Inherits="OnlinePharmacyManagement.Views.Admin.Categories" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        /* Style for the entire page content */
        .container-fluid {
            padding: 5px;
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
            border: 1px solid #ccc;
            border-radius: 10px;
            background-color: #fff;
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
            margin-bottom: 25px;
        }

        .text-danger {
            color: #d9534f;
        }

        /* Custom styles for the specific page elements */
        .table-success {
            background-color: #dff0d8;
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

        /* Add your theme-specific styles here */
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Mybody" runat="server">
    <div class="container-fluid">
        <div class="row mt-5">
            <div class="col-md-4 form-section">
                <h3 class="mb-4">Category Details</h3>
                <div class="mb-3">
                    <input type="text" class="form-control" placeholder="Category Name" runat="server" id="CatNameTb" autocomplete="off">
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
                <h2 class="mb-4">Categories List</h2>
                <asp:GridView ID="CategoryList" class="table table-bordered table-hover" runat="server" AutoGenerateSelectButton="True" OnSelectedIndexChanged="CategoryList_SelectedIndexChanged">
                </asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>
