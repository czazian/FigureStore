<%@ Page Title="" Language="C#" MasterPageFile="~/Cust.Master" AutoEventWireup="true" CodeBehind="UserProfile.aspx.cs" Inherits="Assignment.Customer.UserProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="UserProfile.css" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="profile">
        <div class="sidebar" id="sidebar">
            <div class="tt">
                <div id="ttt" class="ttt">
                    <span class="sel">MY ACTION</span>
                </div>

                <i style="font-size: 20px;" class="btn-show fa-solid fa-angles-left"></i>

            </div>
            <div class="inner-side">
                <asp:LinkButton Style="color: #ff7e29" CausesValidation="false" PostBackUrl="~/Customer/UserProfile.aspx" CssClass="lb" runat="server" ID="goProfile">
           <i class="fa-solid fa-address-card"></i>&nbsp;&nbsp;<span class="sel">MY PROFILE</span>
                </asp:LinkButton>

                <asp:LinkButton CausesValidation="false" PostBackUrl="~/Customer/EditProfile.aspx" CssClass="lb" runat="server" ID="goEdit">
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


        <div class="main">
            <div class="left">
                <div class="profileimg">
                    <asp:Image Style="width: 250px; height: 250px; border-radius: 100px; z-index: 3;"
                        runat="server" ID="profileimg" />
                </div>
                <div class="profilename">
                    @<asp:Label runat="server" ID="username" />
                </div>
            </div>
            <div class="right">
                <fieldset class="right-content">
                    <legend>User Profile</legend>
                    <table class="profile-info">
                        <tr>
                            <th>Email Address
                                <div style="height: inherit; text-align: right;">:</div>
                            </th>
                            <td>
                                <asp:Label runat="server" ID="email" /></td>
                        </tr>
                        <tr>
                            <th>Phone No.
                                <div style="height: inherit; text-align: right;">:</div>
                            </th>
                            <td>
                                <asp:Label runat="server" ID="phone" /></td>
                        </tr>
                        <tr>
                            <th>Home Address
                                <div style="height: inherit; text-align: right;">:</div>
                            </th>
                            <td>
                                <asp:Label runat="server" ID="address" /></td>
                        </tr>

                    </table>
                    <div class="edit-btn">
                        <asp:Button PostBackUrl="~/Customer/EditProfile.aspx" CssClass="border btn btn-edit" runat="server" Text="Go Edit Profile" />
                    </div>
                </fieldset>
            </div>
        </div>


    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="JS" runat="server">
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
