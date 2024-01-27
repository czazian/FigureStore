<%@ Page Title="" Language="C#" MasterPageFile="~/Cust.Master" AutoEventWireup="true" CodeBehind="EditProfile.aspx.cs" Inherits="Assignment.Customer.EditProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="EditProfile.css" />
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="edit">
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
    </div>
</asp:Content>


<asp:Content ID="Content3" ContentPlaceHolderID="JS" runat="server">
</asp:Content>
