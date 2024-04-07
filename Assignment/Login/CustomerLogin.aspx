<%@ Page Title="" Language="C#" MasterPageFile="~/Cust.Master" AutoEventWireup="true" CodeBehind="CustomerLogin.aspx.cs" Inherits="Assignment.Login.CustomerLogin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="CustomerLogin.css" />
    <style>
        body {
            background-color: #f7f7f7;
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

    <div class="container">
        <div class="form-container">
            <div class="cus-forms">
                <div class="form login">

                    <!-- Login Form -->
                    <span class="login-title">Customer Login
                    </span>


                    <div style="padding-top:20px;">
                        <div class="input-field">
                            <asp:TextBox CausesValidation="false" runat="server" ID="email" placeholder="Enter your e-mail" />
                            <i class="uil uil-envelope icon"></i>
                        </div>
                        <div class="input-field">
                            <asp:TextBox CssClass="password" TextMode="Password" CausesValidation="false" runat="server" ID="password" placeholder="Enter your password" />
                            <i class="uil uil-lock icon"></i>
                            <i class="fa-solid fa-eye-slash showHidePw"></i>
                        </div>

                        <div class="loginerr">
                            <asp:Label Style="color: red; margin-bottom: -10px; align-items: center; display: flex; width: 100%; flex-flow: row nowrap; justify-content: right;" runat="server" ID="loginerr" />
                        </div>

                        <div class="input-field button">
                            <asp:Button OnClientClick="return true;" OnClick="login_Click" runat="server" ID="login" Text="Login" />
                        </div>
                    </div>


                    <div style="display: flex; flex-flow: row nowrap; gap: 10px; width: 100%; justify-content: center; margin-top: 20px">
                        <div class="login-signup">
                            <span class="text">Don't have an account?
                              <a href="#" class="text signup-link" style="color: #ff7e29; border: none; background-color: transparent; text-decoration: underline;">Register Now</a>
                            </span>
                        </div>
                        <br />
                        <div class="forget-password">
                            <span class="text">Forgot your password? 
                              <asp:Button Style="margin-left: -5px; text-align: center; color: #ff7e29; border: none; background-color: transparent; text-decoration: underline;" OnClientClick="return false;" runat="server" CausesValidation="false" data-bs-toggle="modal" data-bs-target="#staticBackdrop" Text="Recover Now" />
                            </span>

                            <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                                <div class="modal-dialog modal-dialog-centered">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h1 class="modal-title fs-5" id="staticBackdropLabel" style="font-weight: bold;">Password Recovery</h1>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                        </div>


                                        <!--An instance for update panel-->
                                        <asp:ScriptManager ID="ScriptManager1" runat="server">
                                        </asp:ScriptManager>

                                        <script type="text/javascript" language="javascript">
                                            Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
                                            function EndRequestHandler(sender, args) {
                                                if (args.get_error() != undefined) {
                                                    args.set_errorHandled(true);
                                                }
                                            }
                                        </script>

                                        <asp:UpdatePanel runat="server" ID="upEmail" UpdateMode="Conditional">
                                            <Triggers>
                                                <asp:AsyncPostBackTrigger ControlID="btnSendEmail" />
                                            </Triggers>
                                            <ContentTemplate>
                                                <table class="modal-body">
                                                    <tr class="emailRecover">
                                                        <td class="tt" style="font-weight: bold;">Email:&nbsp;</td>
                                                        <td class="ti">
                                                            <asp:TextBox CausesValidation="false" ID="txtRecoverEmail" TextMode="Email" runat="server" />
                                                            <asp:Button CausesValidation="false" runat="server" Text="Send" ID="btnSendEmail" CssClass="border btn" Style="background-color: #ff7e29; height: inherit; color: white; font-size: 13px;" OnClick="btnSendEmail_Click" />

                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="tt"></td>
                                                        <td class="ti" style="padding: 5px 15px 5px 15px;">
                                                            <asp:Label ID="message1" runat="server" />
                                                        </td>
                                                    </tr>

                                                    <tr class="verification">
                                                        <td class="tt">
                                                            <div style="font-weight: bold;">Verification Code:&nbsp;</div>
                                                        </td>
                                                        <td class="ti">
                                                            <asp:TextBox CausesValidation="false" runat="server" ID="verificationCode" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="tt"></td>
                                                        <td class="ti" style="padding: 5px 15px 5px 15px;">
                                                            <asp:Label ID="message2" runat="server" />
                                                        </td>
                                                    </tr>

                                                </table>



                                                <div class="modal-footer">
                                                    <asp:Button Enabled="false" runat="server" CausesValidation="false" Text="Resend" CssClass="btn btn-secondary" OnClick="resendbtn_Click" ID="resendbtn"/>
                                                    <asp:Button ID="recBtn" Enabled="false" OnClientClick="return true;" runat="server" CausesValidation="false" OnClick="Unnamed_Click" Style="background-color: #ff7e29; height: inherit; color: white;" CssClass="btn" Text="Recover" />
                                                </div>

                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                    </div>
                                </div>
                            </div>


                        </div>
                    </div>
                </div>


                <!-- Registration Form -->
                <div class="form signup">
                    <span class="login-title">Customer Registration</span>


                    <asp:UpdatePanel runat="server" ID="UpdatePanel1" UpdateMode="Conditional">
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="register" />
                        </Triggers>
                        <ContentTemplate>
                            <div>
                                <div class="input-field">
                                    <asp:TextBox CausesValidation="true" runat="server" ID="regName" placeholder="Enter your name" />
                                    <i class="uil uil-user"></i>
                                    <asp:RequiredFieldValidator CssClass="validator" ID="RequiredFieldValidator1" runat="server" ErrorMessage="*Please enter your registration name." ControlToValidate="regName" ForeColor="Red"></asp:RequiredFieldValidator>
                                </div>
                                <div class="input-field">
                                    <asp:TextBox CausesValidation="true" runat="server" ID="regPhone" placeholder="Enter your phone number" />
                                    <i class="uil uil-phone"></i>
                                    <asp:RequiredFieldValidator CssClass="validator" ID="RequiredFieldValidator2" runat="server" ErrorMessage="*Please enter your registration phone number." ControlToValidate="regPhone" ForeColor="Red"></asp:RequiredFieldValidator>
                                </div>
                                <div class="input-field">
                                    <asp:TextBox CausesValidation="true" runat="server" ID="regEmail" placeholder="Enter your email" />
                                    <i class="uil uil-envelope icon"></i>
                                    <asp:CustomValidator CssClass="validator" OnServerValidate="CustomValidator1_ServerValidate" ID="CustomValidator1" ForeColor="red" ControlToValidate="regEmail" runat="server"></asp:CustomValidator>
                                    <asp:Label Style="color: red; width: 100%; display: flex; flex-flow: row nowrap; justify-content: right;" runat="server" ID="error1" />
                                </div>
                                <div class="input-field">
                                    <asp:TextBox runat="server" ID="regAddress" placeholder="Enter your address" />
                                    <asp:RequiredFieldValidator CssClass="validator" ID="RequiredFieldValidator3" runat="server" ErrorMessage="*Please enter your registration address." ControlToValidate="regAddress" ForeColor="Red"></asp:RequiredFieldValidator>
                                    <i class="uil uil-map"></i>
                                </div>
                                <div class="input-field">
                                    <asp:TextBox CausesValidation="true" TextMode="Password" runat="server" ID="pass1" CssClass="password" placeholder="Create a password" />
                                    <i class="uil uil-lock icon" style="color: black;"></i>
                                    <i class="uil uil-eye-slash showHidePw" style="color: black;"></i>
                                </div>
                                <div class="input-field">
                                    <asp:TextBox CausesValidation="true" runat="server" TextMode="Password" ID="pass2" CssClass="password" placeholder="Confirm a password" />
                                    <asp:CustomValidator ValidateEmptyText="True" CssClass="validator" ID="CustomValidator2" OnServerValidate="CustomValidator2_ServerValidate" ForeColor="red" ControlToValidate="pass2" runat="server"></asp:CustomValidator>
                                    <i class="uil uil-lock icon"></i>
                                    <i class="fa-solid fa-eye-slash showHidePw"></i>
                                    <asp:Label Style="color: red; width: 100%; display: flex; flex-flow: row nowrap; justify-content: right;" runat="server" ID="error2" />
                                </div>

                                <div class="input-field button">
                                    <asp:Button OnClientClick="return true;" runat="server" ID="register" OnClick="register_Click" Text="Register" />
                                </div>
                            </div>

                        </ContentTemplate>
                    </asp:UpdatePanel>


                    <div class="login-signup" style="display: flex; justify-content: center; margin-top: 20px;">
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
    <script> 
        function registered() {
            alert("Your account has been successfully registered!");
        }

        function error() {
            alert("Something wrong with your input!");
        }

        $('#<%= email.ClientID %>').keypress(function (event) {
            if (event.keyCode == 13) {
                event.preventDefault();
            }
        });

        $('#<%= password.ClientID %>').keypress(function (event) {
            if (event.keyCode == 13) {
                event.preventDefault();
            }
        });


    </script>
    <script src="CustomerLogin.js" type="text/javascript"></script>
</asp:Content>
