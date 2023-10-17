<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Seller/SellerMaster.Master" AutoEventWireup="true" CodeBehind="Billing.aspx.cs" Inherits="OnlinePharmacyManagement.Views.Seller.Billing" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <head>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>
    <style>
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
</head>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <script type="text/javascript">
       // Function to generate and automatically download PDF
       function printGrid() {
           var doc = new jsPDF();
           doc.autoTable({ html: '#<%= BillGV.ClientID %>' });

           // Create a hidden link element to trigger the download
           var link = document.createElement('a');
           link.href = doc.output('bloburl');
           link.download = 'bill.pdf';

           // Simulate a click event on the link
           link.click();
       }
   </script>
    <div class="container-fluid" style="padding: 15px;">
        <div class="row">
            <h4 class="text-success">Online Pharmacy Billing</h4>
        </div>
        <div class="row">
            <div class="col-md-4 form-section">
                <div class="row mb-3">
                    <div class="col">
                        <label class="text-success h6">Medicine Code</label>
                        <input type="text" class="form-control text-field" placeholder="Medicine code" runat="server" id="MedNameTb" autocomplete="off">
                    </div>
                    <div class="col">
                        <label class="text-success h6">Medicine Price</label>
                        <input type="text" class="form-control text-field" placeholder="Medicine Price" runat="server" id="MedPriceTb" autocomplete="off">
                    </div>
                </div>
                <div class="row mb-3">
                    <div class="col">
                        <label class="text-success h6">Medicine Quantity</label>
                        <input type="text" class="form-control text-field" placeholder="Medicine Quantity" runat="server" id="MedQty" autocomplete="off">
                    </div>
                    <div class="col">
                        <label class="text-success h6">Billing Date</label>
                        <input type="date" class="form-control text-field" runat="server" id="BillingDate">
                    </div>
                </div>
                <div class="row">
                    <label class="text-danger text-center" id="ErrMsg" runat="server"></label>
                    <div class="col d-grid">
                        <asp:Button ID="AddToBillBtn" runat="server" Text="Add To Bill" CssClass="btn btn-success btn-block" OnClick="AddToBillBtn_Click" />
                    </div>
                    <div class="col d-grid">
                        <asp:Button ID="ResetBtn" runat="server" Text="Reset" CssClass="btn btn-danger btn-block" OnClick="ResetBtn_Click" />
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                        <h2 class="text-success" style="font-size: 24px; margin-top: 20px;">Categories List</h2>
                        <asp:GridView ID="MedicinesList" class="table table-bordered table-hover" runat="server" AutoGenerateSelectButton="True" OnSelectedIndexChanged="MedicinesList_SelectedIndexChanged"></asp:GridView>
                    </div>
                </div>
            </div>
            <div class="col-md-8">
                <h2 class="text-success text-center" style="font-size: 24px;">Client's Bill</h2>
                <asp:GridView ID="BillGV" class="table table-bordered table-hover" runat="server"></asp:GridView>
                <div class="row" style="margin-top: 20px;">
                    <div class="col-6"></div>
                    <div class="col-6">
                        <label class="text-danger text-center h6" id="GrdTotTb" runat="server"></label>
                    </div>
                </div>
                <div class="row">
                    <div class="col d-grid">
                        <asp:Button ID="PrintBtn" runat="server" Text="Print" CssClass="btn btn-success btn-block" OnClientClick="printGrid(); return false;" />
                    </div>
                    <div class="col d-grid">
                        <asp:Button ID="ClearBtn" runat="server" Text="Clear" CssClass="btn btn-warning btn-block" />
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        function printGrid() {
        var doc = new jsPDF();
        doc.autoTable({ html: '#<%= BillGV.ClientID %>' });
        doc.save('bill.pdf');
    }
    </script>
</asp:Content>
