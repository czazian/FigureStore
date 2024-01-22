<%@ Page Title="" Language="C#" MasterPageFile="~/Cust.Master" AutoEventWireup="true" CodeBehind="StaffLogin.aspx.cs" Inherits="Assignment.Login.StaffLogin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="StaffLogin.css" />
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
                            <input type="text" name="id" placeholder="Enter Staff ID">
                            <i class="uil uil-user"></i>
                        </div>
                        <div class="input-field">
                            <input type="password" name="password" class="password" placeholder="Enter your password">
                            <i class="uil uil-lock icon"></i>
                            <i class="uil uil-eye-slash showHidePw"></i>
                        </div>
                        <div class="input-field button">
                            <input type="submit" value="Login">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>


<asp:Content ContentPlaceHolderID="JS" runat="server">
    <script src="StaffLogin.js" type="text/javascript"></script>
</asp:Content>
