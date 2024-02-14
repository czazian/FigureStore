<%@ Page Title="" Language="C#" MasterPageFile="~/Cust.Master" AutoEventWireup="true" CodeBehind="EditProfile.aspx.cs" Inherits="Assignment.Customer.EditProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="EditProfile.css" />
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="edit">
        <div class="sidebar" id="sidebar">
            <div class="tt">
                <div id="ttt" class="ttt">
                    <span class="sel">MY ACTION</span>
                </div>

                <i style="font-size: 20px;" class="btn-show fa-solid fa-angles-left"></i>

            </div>
            <div class="inner-side">
                <asp:LinkButton CausesValidation="false" PostBackUrl="~/Customer/UserProfile.aspx" CssClass="lb" runat="server" ID="goProfile">
           <i class="fa-solid fa-address-card"></i>&nbsp;&nbsp;<span class="sel">MY PROFILE</span>
                </asp:LinkButton>

                <asp:LinkButton Style="color: #ff7e29" CausesValidation="false" PostBackUrl="~/Customer/EditProfile.aspx" CssClass="lb" runat="server" ID="goEdit">
           <i class="fa-solid fa-pen-to-square"></i>&nbsp;&nbsp;<span class="sel">EDIT PROFILE</span>
                </asp:LinkButton>

                <asp:LinkButton CausesValidation="false" PostBackUrl="~/Customer/OrderTrack.aspx" CssClass="lb" runat="server" ID="goOrder">
           <i class="fa-solid fa-cart-shopping"></i>&nbsp;&nbsp;<span class="sel">MY ORDER</span>
                </asp:LinkButton>

                <asp:LinkButton CausesValidation="false" OnClick="goLogout_Click" CssClass="lb" runat="server" ID="goLogout">
           <i class="fa-solid fa-right-from-bracket"></i>&nbsp;&nbsp;<span class="sel">LOGOUT</span>
                </asp:LinkButton>
            </div>
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

        <div class="box">
            <div class="title">
                <div class="maintitle">
                    Edit Profile
                </div>
                <div class="subtitle">
                    Manage Profile Information 
                </div>
            </div>
            <hr style="color: black; margin-top: 10px; margin-bottom: 10px; opacity: 1;" />
            <div class="changeimg">
                <div class="profile-title">
                    Your Profile Photo
                </div>

                <div class="image-container">
                    <div class="img">
                        <asp:Image Style="border-radius: 100px; width: 100%; width: 120px; height: 120px;"
                            runat="server" ID="profileimg" />
                    </div>
                    <div class="btn-grouping">
                        <div class="img-change-btn">
                            <asp:FileUpload accept=".png,.jpg,.jpeg,.gif" ID="FileUpload1" Style="display: none" runat="server" onchange="upload()" />
                            <input type="button" value="Change Photo" class="btn border b1" onclick="showBrowseDialog()" />

                            <asp:LinkButton OnClientClick="return true;" CausesValidation="false" runat="server" ID="hideBtn" Style="display: none;" OnClick="hideButton_Click" />
                        </div>
                        <div class="img-delete-btn">
                            <asp:LinkButton ID="Delete" CausesValidation="false" OnClick="Delete_Click" CssClass="btn border b2" runat="server">
                            <i class="fa-solid fa-trash" style="color:red"></i>&nbsp;Delete
                            </asp:LinkButton>
                        </div>
                    </div>
                </div>



                <div class="suggestion-img">
                    Change your photo. A photo of 120×120px and within 5MB is recommended.
                </div>
            </div>



            <asp:UpdatePanel runat="server" UpdateMode="Conditional">
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="edit" />
                </Triggers>
                <ContentTemplate>

                    <div class="edit-input">
                        <div class="profile-title">
                            Your Personal Information
                        </div>
                        <div class="edit-items">
                            <div class="form-floating username">
                                <asp:TextBox AutoPostBack="true" OnTextChanged="Change_TextChanged" runat="server" ID="txtUsername" class="form-control" placeholder="Username" />
                                <label for="txtUsername">Username</label>
                                <div class="msg">
                                    <asp:Label CssClass="lblMsg" runat="server" ID="modified1" />
                                    <asp:RequiredFieldValidator Display="Dynamic" runat="server" ControlToValidate="txtUsername" ForeColor="Red" ErrorMessage="*Please do not leave username empty." />
                                </div>
                            </div>
                            <div class="form-floating phoneno">
                                <asp:TextBox AutoPostBack="true" OnTextChanged="Change_TextChanged" runat="server" ID="txtPhoneno" class="form-control" placeholder="Phone No." />
                                <label for="txtPhoneno">Phone No.</label>
                                <div class="msg">
                                    <asp:Label CssClass="lblMsg" runat="server" ID="modified2" />
                                    <asp:RequiredFieldValidator Display="Dynamic" runat="server" ControlToValidate="txtPhoneno" ForeColor="Red" ErrorMessage="*Please do not leave phone number empty." />
                                </div>
                            </div>
                            <div class="form-floating address">
                                <asp:TextBox AutoPostBack="true" OnTextChanged="Change_TextChanged" Style="height: 100px; resize: none;" TextMode="MultiLine" runat="server" ID="txtHomeAddress" class="form-control" placeholder="Home Address" />
                                <label for="txtHomeAddress">Home Address</label>
                                <div class="msg">
                                    <asp:Label CssClass="lblMsg" runat="server" ID="modified3" />
                                    <asp:RequiredFieldValidator Display="Dynamic" runat="server" ControlToValidate="txtHomeAddress" ForeColor="Red" ErrorMessage="*Please do not leave home address empty." />
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="edit-btn">
                        <asp:Button OnClick="edit_Click" Enabled="false" ID="edit" PostBackUrl="~/Customer/EditProfile.aspx" CssClass="border btn btn-edit" runat="server" Text="Edit Profile" />
                    </div>

                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>
</asp:Content>


<asp:Content ID="Content3" ContentPlaceHolderID="JS" runat="server">
    <script type="text/javascript">
        function showBrowseDialog() {
            var fileuploadctrl = document.getElementById('<%= FileUpload1.ClientID %>');
            fileuploadctrl.click();
        }

        function upload() {
            var btn = document.getElementById('<%= hideBtn.ClientID %>');
            btn.click();
        }

    </script>
    <script type="text/javascript">
        let show = document.querySelector(".btn-show");
        let title = document.querySelectorAll(".sel");
        let sidebar = document.getElementById("sidebar");
        let ttt = document.getElementById("ttt");
        var option = sessionStorage.getItem("option");

        show.addEventListener("click", () => {
            if (option === "show" || option === null) {
                sessionStorage.setItem("option", "hide");
                location.reload();
            } else if (option === "hide") {
                sessionStorage.setItem("option", "show");
                location.reload();
            }
        })

    </script>
    <script>
        function run() {

            if (option === "hide") {

                //operation
                show.classList.replace("fa-angles-left", "fa-angles-right");
                sidebar.style.width = "auto";
                ttt.style.display = "none";

                title.forEach(tt => {
                    tt.classList.add("hideTitle");
                })

                $('#<%= goProfile.ClientID %>').hover(function () {
                    $(this).tooltip({ placement: "right", title: "MY PROFILE" });
                });
                $('#<%= goEdit.ClientID %>').hover(function () {
                    $(this).tooltip({ placement: "right", title: "EDIT PROFILE" });
                });
                $('#<%= goOrder.ClientID %>').hover(function () {
                    $(this).tooltip({ placement: "right", title: "MY ORDER" });
                });
                $('#<%= goLogout.ClientID %>').hover(function () {
                    $(this).tooltip({ placement: "right", title: "LOGOUT" });
                });
            } else if (option === "show") {

                //operation
                show.classList.replace("fa-angles-right", "fa-angles-left");
                sidebar.style.width = "200px";
                ttt.style.display = "block";

                title.forEach(tt => {
                    tt.classList.remove("hideTitle");
                })

                $('#<%= goProfile.ClientID %>').hover(function () {
                    $(this).tooltip("dispose");
                });
                $('#<%= goEdit.ClientID %>').hover(function () {
                    $(this).tooltip("dispose");
                });
                $('#<%= goOrder.ClientID %>').hover(function () {
                    $(this).tooltip("dispose");
                });
                $('#<%= goLogout.ClientID %>').hover(function () {
                    $(this).tooltip("dispose");
                });
            }

        }
    </script>
</asp:Content>
