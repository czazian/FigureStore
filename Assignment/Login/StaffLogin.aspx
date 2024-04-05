<%@ Page Title="" Language="C#" MasterPageFile="~/Cust.Master" AutoEventWireup="true" CodeBehind="StaffLogin.aspx.cs" Inherits="Assignment.Login.StaffLogin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="StaffLogin.css" />
    <style>
        body {
            background-color: #e8e8e8;
        }

        .form-container {
            width: 430px;
            box-shadow: 0 5px 10px rgba(0, 0, 0, 0.7);
            margin: 3% 34% 3% 34%;
        }

            .form-container .cus-forms {
                display: flex;
                align-items: center;
                height: 400px;
                width: 200%;
                transition: height 0.2s ease;
            }

        .form .button input {
            border: none;
            color: #fff;
            font-size: 17px;
            font-weight: 500;
            letter-spacing: 1px;
            border-radius: 6px;
            background-color: #ff7e29;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .input-field input:is(:focus, :valid) {
            border-bottom-color: #ff7e29;
        }

        .button input:hover {
            background-color: #fa9552;
        }
    </style>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- Login Form -->
    <div class="container">
        <div class="form-container">
            <div class="staff-forms">
                <div class="form login">
                    <span class="login-title">Staff Login Page
                    </span>

                    <div>
                        <div class="input-field">
                            <asp:TextBox ID="txtStaffusername" name="id" runat="server" placeholder="Enter Staff ID"></asp:TextBox>
                            <asp:Label ID="lblError" runat="server" ForeColor="Red"></asp:Label>
                            <i class="uil uil-user"></i>
                        </div>
                        <div class="input-field">
                            <asp:TextBox ID="txtPassword" TextMode="Password" name="password" runat="server" CssClass="password" placeholder="Enter your password"></asp:TextBox>
                            <asp:Label ID="lblError0" runat="server" ForeColor="Red"></asp:Label>
                            <i class="uil uil-lock icon"></i>
                            <i class="fa-solid fa-eye-slash showHidePw"></i>
                        </div>
                        <div class="input-field button">
                            <asp:Button ID="btnSubmit" OnClientClick="return true;" runat="server" Text="Login" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>


<asp:Content ContentPlaceHolderID="JS" runat="server">
    <script src="StaffLogin.js" type="text/javascript"></script>
    <script>

    </script>
</asp:Content>
