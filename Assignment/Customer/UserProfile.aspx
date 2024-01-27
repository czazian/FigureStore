<%@ Page Title="" Language="C#" MasterPageFile="~/Cust.Master" AutoEventWireup="true" CodeBehind="UserProfile.aspx.cs" Inherits="Assignment.Customer.UserProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="UserProfile.css" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="profile">
        <div class="sidebar">
            <div class="tt">
                MY ACTION
            </div>
            <div class="inner-side">
                <asp:LinkButton PostBackUrl="~/Customer/UserProfile.aspx" CssClass="lb" runat="server" ID="goProfile">
                    <i class="fa-solid fa-address-card"></i>&nbsp;&nbsp;MY PROFILE
                </asp:LinkButton>

                <asp:LinkButton PostBackUrl="~/Customer/EditProfile.aspx" CssClass="lb" runat="server" ID="goEdit">
                    <i class="fa-solid fa-pen-to-square"></i>&nbsp;&nbsp;EDIT PROFILE
                </asp:LinkButton>

                <asp:LinkButton PostBackUrl="~/Customer/OrderTrack.aspx" CssClass="lb" runat="server" ID="goOrder">
                    <i class="fa-solid fa-cart-shopping"></i>&nbsp;&nbsp;MY ORDER
                </asp:LinkButton>

                <asp:LinkButton PostBackUrl="~/Customer/Home.aspx" CssClass="lb" runat="server" ID="goLogout">
                    <i class="fa-solid fa-right-from-bracket"></i>&nbsp;&nbsp;LOGOUT
                </asp:LinkButton>
            </div>
        </div>


        <div class="main">
            <div class="left">
                <div class="profileimg">
                    <asp:Image Style="width: 100%; border-radius: 10px;" runat="server" ID="profileimg" ImageUrl="~/Image/Profile/user.jpg" />
                </div>
                <div class="profilename">
                    @<asp:Label runat="server" ID="username" Text="Lala Yang" />
                </div>
            </div>
            <div class="right">
                <fieldset class="right-content">
                    <legend>User Profile</legend>
                    <table class="profile-info">
                        <tr>
                            <th>Email Address <div style="height:inherit;text-align:right;">:</div></th>
                            <td><asp:Label runat="server" ID="email" Text="lalayang@gmail.com"/></td>
                        </tr>
                        <tr>
                            <th>Phone No. <div style="height:inherit;text-align:right;">:</div></th>
                            <td><asp:Label runat="server" ID="phone" Text="012-34567890"/></td>
                        </tr>
                        <tr>
                            <th>Home Address <div style="height:inherit;text-align:right;">:</div></th>
                            <td><asp:Label runat="server" ID="address" Text="TARUMT, Jalan Genting Kelang, Setapak, 53300 Kuala Lumpur, Federal Territory of Kuala Lumpur."/></td>
                        </tr>

                    </table>
                    <div class="edit-btn">
                        <asp:Button PostBackUrl="~/Customer/EditProfile.aspx" CssClass="border btn btn-edit" runat="server" Text="Edit Profile" />
                    </div>
                </fieldset>
            </div>
        </div>


    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="JS" runat="server">
</asp:Content>
