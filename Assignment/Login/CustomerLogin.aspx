<%@ Page Title="" Language="C#" MasterPageFile="~/Cust.Master" AutoEventWireup="true" CodeBehind="CustomerLogin.aspx.cs" Inherits="Assignment.Login.CustomerLogin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="CustomerLogin.css " />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- Login Form -->
    <div class="container">
        <div class="form-container">
            <div class="cus-forms">
                <div class="form login">

                    <span class="login-title">Customer Login Page
                    </span>
                    
                    <div>
                        <div class="input-field">
                            <input type="text" name="email" placeholder="Enter your e-mail">
                            <i class="uil uil-envelope icon"></i>
                        </div>
                        <div class="input-field">
                            <input type="password" name="password" placeholder="Enter your password">
                            <i class="uil uil-lock icon"></i>
                            <i class="uil uil-eye-slash showHidePw"></i>
                        </div>

                        <div class="input-field button">
                            <input type="submit" value="Login">
                        </div>
                    </div>

                    <div class="login-signup">
                        <span class="text">Don't have an account?
                                    <a href="#" class="text signup-link">Register Now</a>
                        </span>
                    </div>
                </div>

                <!-- Registration Form -->
                <div class="form signup">
                    <span class="login-title">Registration Page</span>

                    <div>
                        <div class="input-field">
                            <input type="text" name="name" placeholder="Enter your name" required>
                            <i class="uil uil-user"></i>
                        </div>
                        <div class="input-field">
                            <input type="text" name="phone" placeholder="Enter your phone number" required>
                            <i class="uil uil-phone"></i>
                        </div>
                        <div class="input-field">
                            <input type="text" name="email" placeholder="Enter your email" required>
                            <i class="uil uil-envelope icon"></i>
                        </div>
                        <div class="input-field">
                            <input type="text" name="address" placeholder="Enter your address" required>
                            <i class="uil uil-map"></i>
                        </div>
                        <div class="input-field">
                            <input type="password" name="pass1" class="password" placeholder="Create a password" required>
                            <i class="uil uil-lock icon"></i>
                            <i class="uil uil-eye-slash showHidePw"></i>
                        </div>
                        <div class="input-field">
                            <input type="password" name="pass2" class="password" placeholder="Confirm a password" required>
                            <i class="uil uil-lock icon"></i>
                            <i class="uil uil-eye-slash showHidePw"></i>
                        </div>

                        <div class="input-field button">
                            <input type="submit" value="Register">
                        </div>
                    </div>

                    <div class="login-signup">
                        <span class="text">Already have an account?
                                    <a href="#" class="text login-link">Login Now</a>
                        </span>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>

<asp:Content ContentPlaceHolderID="JS" runat="server">
    <script src="CustomerLogin.js" type="text/javascript"></script>
</asp:Content>