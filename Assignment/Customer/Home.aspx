<%@ Page Title="" Language="C#" MasterPageFile="~/Cust.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Assignment.Customer.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>


<%--Content here--%>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!--Banners-->
    <div id="promotionSlider" class="carousel slide" data-bs-ride="carousel">
        <div class="carousel-inner">
            <div class="carousel-item active">
                <asp:ImageButton ImageUrl="~/Image/banner1.png" runat="server" ID="imgBtnBanner1" CssClass="d-block w-100" AlternateText="Promotion" />
            </div>
            <div class="carousel-item">
                <asp:ImageButton ImageUrl="~/Image/banner2.png" runat="server" ID="imgBtnBanner2" CssClass="d-block w-100" AlternateText="Promotion" />
            </div>
            <div class="carousel-item">
                <asp:ImageButton ImageUrl="~/Image/banner3.png" runat="server" ID="imgBtnBanner3" CssClass="d-block w-100" AlternateText="Promotion" />
            </div>
        </div>

        <asp:LinkButton ID="btnPreviousPage" runat="server" CssClass="carousel-control-prev" data-bs-target="#promotionSlider" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
        </asp:LinkButton>

        <asp:LinkButton ID="btnNextPage" runat="server" CssClass="carousel-control-next" data-bs-target="#promotionSlider" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
        </asp:LinkButton>
    </div>
</asp:Content>
