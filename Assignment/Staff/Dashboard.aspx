<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeFile="Dashboard.aspx.cs" Inherits="Assignment.Staff.Dashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        #dashbLi {
            background: #545454 ;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="home-content">

        <div class="sales-boxes" style="padding-bottom:10px;">
            <div class="info3 box">
                <div class="title">Welcome to Staff Portal</div>
            </div>
        </div>

        <div class="overview-boxes">
            <div class="box">
                <div class="right-side">
                    <div class="box-topic">Total Order</div>
                <div class="number">
                    <asp:Label ID="lblTotalOrder" runat="server">0</asp:Label>
                </div>
                <div class="indicator">
                    <!--                                <i class='bx bx-up-arrow-alt'></i>
                                                            <span class="text">Up from yesterday</span>-->
                </div>
            </div>
            <i class='bx bx-cart-alt cart'></i>
        </div>
        <div class="box">
            <div class="right-side">
                <div class="box-topic">Quantity Sold</div>
                <div class="number">
                    <asp:Label ID="lblQuanSales" runat="server">0</asp:Label>
                </div>
                <div class="indicator">
                    <!--                                <i class='bx bx-up-arrow-alt'></i>
                                                            <span class="text">Up from yesterday</span>-->
                </div>
            </div>
            <i class='bx bxs-cart-add cart two'></i>
        </div>
        <div class="box">
            <div class="right-side">
                <div class="box-topic">Sales Profit</div>
                <div class="number">
                    RM 
                    <asp:Label ID="lblSalesProfit" runat="server">0</asp:Label>
                </div>
                <div class="indicator">
                    <!--                                <i class='bx bx-up-arrow-alt'></i>
                                                            <span class="text">Up from yesterday</span>-->
                </div>
            </div>
            <i class='bx bxs-cart-add cart three'></i>
        </div>
        <div class="box">
            <div class="right-side">
                <div class="box-topic">Total Profit</div>
                <div class="number">
                    RM
                    <asp:Label ID="lblTotalProfit" runat="server">0</asp:Label>
                </div>
                <div class="indicator">
                </div>
            </div>
            <i class='bx bx-cart cart three'></i>
        </div>
    </div>

        <div class="sales-boxes">
            <div class="info1 box">
                <canvas id="line"></canvas>
            </div>
            <div class="info2 box">
                <canvas id="pie"></canvas>
            </div>
        </div>
        <br>
        <div class="sales-boxes">
            <div class="info3 box">
                <div class="title">Recent Order</div> <%--display with recent customer--%>
<hr />
            </div>
        </div>


</div>

    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

    <script src="DashboardChartA.js"></script>
    <script src="DashboardChartB.js"></script>

</asp:Content>
