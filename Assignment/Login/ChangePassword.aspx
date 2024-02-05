<%@ Page Title="" Language="C#" MasterPageFile="~/Cust.Master" AutoEventWireup="true" CodeBehind="ChangePassword.aspx.cs" Inherits="Assignment.Login.ChangePassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="StaffLogin.css" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">
        <div class="form-container">
            <div class="staff-forms">
                <div class="form login">
                    <span class="login-title">Change Your Password
                    </span>

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

                    <asp:UpdatePanel runat="server" ID="UpdatePanel1">
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="changePW" />
                        </Triggers>
                        <ContentTemplate>
                            <div>
                                <div class="input-field">
                                    <asp:TextBox TextMode="Password" CssClass="password" runat="server" ID="pass1" placeholder="Enter Password 1" />
                                    <i class="uil uil-user"></i>
                                </div>
                                <div class="input-field">
                                    <asp:TextBox TextMode="Password" CssClass="password" runat="server" ID="pass2" placeholder="Enter Password 2" />
                                    <i class="fa-solid fa-eye-slash showHidePw"></i>
                                    <asp:Label Style="color: red; width: 100%; display: flex; flex-flow: row nowrap; justify-content: right;" runat="server" ID="error2" />
                                </div>

                                <div class="input-field button">
                                    <asp:Button ID="changePW" runat="server" Text="Change Password" OnClick="Unnamed_Click" />
                                </div>
                            </div>

                        </ContentTemplate>
                    </asp:UpdatePanel>

                </div>
            </div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="JS" runat="server">
    <script src="StaffLogin.js" type="text/javascript"></script>
</asp:Content>
