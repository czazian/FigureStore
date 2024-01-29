<%@ Page Title="" Language="C#" MasterPageFile="~/Cust.Master" AutoEventWireup="true" CodeBehind="OrderDetail.aspx.cs" Inherits="Assignment.Customer.OrderDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="OrderDetail.css" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="detail">
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

        <div class="main-content">
            <div class="order-container">
                <div class="back">
                    <asp:LinkButton PostBackUrl="~/Customer/OrderTrack.aspx" CssClass="lbn" runat="server">
                        <i class="fa-solid fa-arrow-left"></i>&nbsp;&nbsp;&nbsp;Orders
                    </asp:LinkButton>
                </div>
                <div class="order-title">
                    <div class="top-title">
                        <div class="title">
                            Order details&nbsp;#<asp:Label runat="server" ID="orderID" Text="20233101" />
                        </div>
                        <div class="current-status">
                            <asp:Label runat="server" Text="SHIPPING" />
                        </div>
                    </div>
                    <div class="date-title">
                        <div class="date">
                            Order Date:&nbsp;<asp:Label runat="server" ID="orderDate" Text="10 March 2024" />
                        </div>
                        |
                        <div class="estimate">
                            Estimate Arrival Date:&nbsp;<asp:Label runat="server" ID="orderEstimate" Text="16 March 2024" />
                        </div>
                    </div>
                </div>
                <div class="status-container">
                    <div class="status-line">
                        <div id="bar-progress" class="mt-5 mt-lg-0">
                            <!--Add step-active class for current phase-->
                            <!--Please change the done-date when a phase is done-->
                            <div class="step step-active">
                                <span class="check-container">
                                    <span class="check"><i class="fa-regular fa-clipboard"></i></span>
                                </span>
                                <h5>Order Received</h5>
                                <div class="done-date">
                                    <asp:Label runat="server" ID="Label3" Text="8:23 PM 10/3/2024" />
                                </div>
                            </div>
                            <div class="seperator"></div>
                            <div class="step step-active">
                                <span class="check-container">
                                    <span class="check"><i class="fa-solid fa-truck"></i></span>
                                </span>
                                <h5>Shipping</h5>
                                <div class="done-date">
                                    <asp:Label runat="server" ID="Label2" Text="8:23 PM 12/3/2024" />
                                </div>
                            </div>
                            <div class="seperator"></div>
                            <div class="step">
                                <span class="check-container">
                                    <span class="check"><i class="fa-solid fa-truck-fast"></i></span>
                                </span>
                                <h5>Out for delivery</h5>
                                <div class="done-date">
                                    <asp:Label runat="server" ID="Label1" Text="" />
                                </div>
                            </div>
                            <div class="seperator"></div>
                            <div class="step">
                                <span class="check-container">
                                    <span class="check"><i class="fa-solid fa-check"></i></span>
                                </span>
                                <h5>Delivered</h5>
                                <div class="done-date">
                                    <asp:Label runat="server" ID="donedate" Text="" />
                                </div>
                            </div>
                        </div>
                    </div>

                    <div>
                    </div>

                </div>
            </div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="JS" runat="server">
</asp:Content>
