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
                            <asp:TextBox ID="txtStaffusername"  name="id" runat="server" placeholder="Enter Staff ID"></asp:TextBox>
                            <asp:Label ID="lblError" runat="server" ForeColor="Red"></asp:Label>
                            <i class="uil uil-user"></i>
                        </div>
                        <div class="input-field">
                            <asp:TextBox ID="txtPassword" TextMode="Password" name="password" runat="server" CssClass="password"  placeholder="Enter your password"></asp:TextBox>
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
