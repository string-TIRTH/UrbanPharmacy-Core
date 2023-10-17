<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="OnlinePharmacyManagement.Views.Seller.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>
    </title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <style>
        body {
            background-color: #F1F3F6;
            font-family: 'Arial', sans-serif;
        }

        .container {
            width: 400px;
            margin: 0 auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
            margin-top: 10%;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-label {
            color: #202A44;
            font-weight: bold;
        }

        .form-control {
            background-color: #F0F3F6;
            border: none;
        }

        .form-text {
            color: #777;
        }

        .btn {
            background-color: #202A44;
            color: #fff;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            font-weight: bold;
            transition: background-color 0.3s;
        }

        .btn:hover {
            background-color: #151F33;
        }

        .link {
            color: #3498db;
            text-decoration: none;
        }

        .img {
            display: block;
            margin: 0 auto;
            margin-bottom: 20px;
        }
    </style>
</head>
<body class="">
    <div class="container">
        <h2 class="text-center">Pharmacy Management System</h2>
        <img class="img" src="../../Assets/Images/logo_img.png" height="90px" />
        <form runat="server">
                    
                <div class="form-group">
                     <label for="exampleInputEmail1" class="form-label">Email address</label>
                        <input type="email" class="form-control" id="EmailTb" runat="server" autocomplete="off" aria-describedby="emailHelp">
               </div>
               <div class="form-group">
               <label for="exampleInputPassword1"  class="form-label">Password</label>
                        <input type="password" class="form-control" id="PasswordTb" runat="server" autocomplete="off">
                    </div>     
             <div class="form-group">
                <label for="ddlRole" class="form-label">Select Role</label>
                <asp:DropDownList ID="ddlRole" runat="server" CssClass="form-control">
                    <asp:ListItem Text="Seller" Value="Seller" />
                    <asp:ListItem Text="Admin" Value="Admin" />
                    
                </asp:DropDownList>
            </div>
           <div class="d-grid">
               <label id="ErrMsg" class="text-danger" runat="server"></label>
                <asp:Button ID="LoginBtn" runat="server" Text="Login" CssClass="btn btn-block" OnClick="LoginBtn_Click" />
            </div>
        </form>
            </div>
            <script>
        // JavaScript to handle the role selection and redirection
        document.getElementById('ddlRole').addEventListener('change', function () {
            const selectedRole = this.value;
            if (selectedRole === 'Admin') {
                window.location.href = '../Admin/Login.aspx';
            } else if (selectedRole === 'Seller') {
                window.location.href = '../Seller/Login.aspx';
            }
        });
            </script>
</body>
</html>
