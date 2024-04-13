<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeFile="Report.aspx.cs" Inherits="Assignment.Staff.Report" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        #reportLi {
            background: #545454;
        }

        body {
            min-width:1700px;
        }

        .home-content .sales-boxes {
            display: flex;
            justify-content: space-between;
            padding: 0 50px;
        }

            /* left box */
            .home-content .sales-boxes .recent-sales {
                width: 97%;
                background: #fff;
                padding: 30px 60px;
                margin: 0 20px;
                margin-bottom: 10px;
                border-radius: 12px;
                box-shadow: 0 5px 10px rgba(0, 0, 0, 0.1);
            }

            .home-content .sales-boxes .sales-details {
                display: flex;
                align-items: center;
                justify-content: space-between;
            }

        .sales-boxes .box .title {
            font-size: 24px;
            font-weight: 500;
            margin-bottom: 10px;
        }

        .sales-boxes .sales-details li.topic {
            font-size: 20px;
            font-weight: 500;
            margin-bottom: 18px;
        }

        .sales-boxes .sales-details li {
            list-style: none;
            margin: 8px 0;
            height: 18px;
        }

            .sales-boxes .sales-details li a {
                font-size: 18px;
                color: #333;
                font-size: 400;
                text-decoration: none;
            }

        .sales-boxes .box .button {
            width: 100%;
            display: flex;
            justify-content: flex-end;
        }

            .sales-boxes .box .button a {
                color: #fff;
                background: #0A2558;
                padding: 4px 12px;
                font-size: 15px;
                font-weight: 400;
                border-radius: 4px;
                text-decoration: none;
                transition: all 0.3s ease;
            }

        .form-button {
            color: #fff;
            background-color: #ff7e29;
            padding: 4px 12px;
            font-size: 15px;
            font-weight: 400;
            border-radius: 4px;
            text-decoration: none;
            transition: all 0.3s ease;
            margin-top: 10px;
            margin-bottom: 10px;
            width: 160px;
            height: 40px;
            border: white;
        }

            .form-button:hover {
                background-color: #fa9e61;
            }

        .form-button2 {
            color: #fff;
            background-color: lightsalmon;
            font-size: 15px;
            font-weight: 400;
            border-radius: 20px;
            text-decoration: none;
            transition: all 0.3s ease;
            width: 40px;
            height: 30px;
            border: white;
        }

            .form-button2:hover {
                background-color: white;
                border: 1px solid lightsalmon;
                color: lightsalmon;
            }

        .border-lightsalmon {
            border: 2px solid lightsalmon;
        }

        a {
            color: white;
            text-decoration: none;
        }

        .sales-boxes .box .button a:hover {
            background: #0d3073;
        }

        .toggle-checkbox input {
            width: 20px;
            height: 20px;
            margin-right: 8px;
            margin-top: 4px;
            margin-bottom: 4px;
            margin-left: 2px;
        }

        /* Right box */
        .home-content .sales-boxes .top-sales {
            width: 35%;
            background: #fff;
            padding: 20px 30px;
            margin: 0 20px 0 0;
            border-radius: 12px;
            box-shadow: 0 5px 10px rgba(0, 0, 0, 0.1);
        }

        .sales-boxes .top-sales li {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin: 10px 0;
        }

            .sales-boxes .top-sales li a img {
                height: 60px;
                width: 40px;
                object-fit: cover;
                border-radius: 12px;
                margin-right: 10px;
                background: #333;
            }

        .img-file {
            width: 50%;
            height: 50%;
            margin-bottom: 20px;
        }

        .img-small {
            width: 50px;
            height: 80px;
        }

        .sales-boxes .top-sales li a {
            display: flex;
            align-items: center;
            text-decoration: none;
        }

        .sales-boxes .top-sales li .product,
        .price {
            font-size: 17px;
            font-weight: 400;
            color: #333;
        }

        .overview-boxes .box {
            display: flex;
            align-items: center;
            justify-content: space-between;
            width: calc(100% / 4 - 12px);
            background: #fff;
            border-radius: 12px;
            box-shadow: 0 5px 10px rgba(0,0,0,0.1);
        }

        .lbltxt {
            font-size: 36px !important;
            font-weight: 500 !important;
            color: #ff7e29;
        }

        .box-topic {
            font-weight: 750 !important;
        }

        .number {
            font-size: 12px;
            font-weight: 400 !important;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="home-content">
        <div style="padding: 0 50px;">
            <div class="overview-boxes">
                <div class="box">
                    <div class="right-side">
                        <div class="box-topic">Total Order</div>
                        <div class="number">
                            <asp:Label ID="lblTotalOrder" CssClass="lbltxt" runat="server">0</asp:Label>
                             sales
                        </div>
                    </div>
                    <i class='bx bx-cart-alt cart' style="vertical-align:middle;"></i>
                </div>
                <div class="box">
                    <div class="right-side">
                        <div class="box-topic">Quantity Sold</div>
                        <div class="number">
                            <asp:Label ID="lblQuanSales" CssClass="lbltxt" runat="server">0</asp:Label>
                             units
                        </div>
                    </div>
                    <i class='bx bxs-cart-add cart two'></i>
                </div>
                <div class="box">
                    <div class="right-side">
                        <div class="box-topic">Sales Profit</div>
                        <div class="number">
                            RM 
                <asp:Label ID="lblSalesProfit" CssClass="lbltxt" runat="server">0</asp:Label>
                        </div>
                    </div>
                    <i class='bx bxs-cart-add cart three'></i>
                </div>
                <div class="box">
                    <div class="right-side">
                        <div class="box-topic">Total Profit</div>
                        <div class="number">
                            RM
                <asp:Label ID="lblTotalProfit" CssClass="lbltxt" runat="server">0</asp:Label>
                        </div>
                    </div>
                    <i class='bx bx-cart cart three'></i>
                </div>
            </div>
        </div>


        <div class="sales-boxes">
            <div class="recent-sales box">
                <div class="title" style="padding-bottom: 10px; font-size: 30px; font-weight: 600; color: #ff7e29"><i class="bx bxs-report"></i>&nbsp;Sales Report</div>

                <asp:DropDownList runat="server" ID="timeFilter" OnSelectedIndexChanged="timeFilter_SelectedIndexChanged" AutoPostBack="True">
                    <asp:ListItem Text="All Time" Value="all" Selected="True"></asp:ListItem>
                    <asp:ListItem Text="This Year" Value="year"></asp:ListItem>
                    <asp:ListItem Text="This Month" Value="month"></asp:ListItem>
                    <asp:ListItem Text="Today" Value="today"></asp:ListItem>
                </asp:DropDownList>


                <div class="sales-details">

                    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
                        <HeaderTemplate>
                            <ul class="details">
                                <hr />
                                <li class="topic">No</li>
                                <hr />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <li><%# Container.ItemIndex + 1 %></li>
                            <hr />
                        </ItemTemplate>
                        <FooterTemplate>
                            </ul>
                        </FooterTemplate>
                    </asp:Repeater>

                    <asp:Repeater ID="Repeater2" runat="server" DataSourceID="SqlDataSource1">
                        <HeaderTemplate>
                            <ul class="details">
                                <hr />
                                <li class="topic">Product</li>
                                <hr />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <li><a href="../../Staff/Product/product_view.aspx?bookID=<%# Eval("FigureID") %>"><%# Eval("FigureName") %></a></li>
                            <hr />
                        </ItemTemplate>
                        <FooterTemplate>
                            </ul>
                        </FooterTemplate>
                    </asp:Repeater>

                    <asp:Repeater ID="Repeater3" runat="server" DataSourceID="SqlDataSource1">
                        <HeaderTemplate>
                            <ul class="details">
                                <hr />
                                <li class="topic">Price</li>
                                <hr />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <li>RM <%# Eval("FigurePrice") %></li>
                            <hr />
                        </ItemTemplate>
                        <FooterTemplate>
                            </ul>
                        </FooterTemplate>
                    </asp:Repeater>

                    <asp:Repeater ID="Repeater4" runat="server" DataSourceID="SqlDataSource1">
                        <HeaderTemplate>
                            <ul class="details">
                                <hr />
                                <li class="topic">Sold</li>
                                <hr />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <li class="txt-center"><%# Eval("Quantity Sold") %></li>
                            <hr />
                        </ItemTemplate>
                        <FooterTemplate>
                            </ul>
                        </FooterTemplate>
                    </asp:Repeater>

                    <asp:Repeater ID="Repeater5" runat="server" DataSourceID="SqlDataSource1">
                        <HeaderTemplate>
                            <ul class="details">
                                <hr />
                                <li class="topic">Total</li>
                                <hr />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <li>RM <%# Eval("Total Price") %></li>
                            <hr />
                        </ItemTemplate>
                        <FooterTemplate>
                            </ul>
                        </FooterTemplate>
                    </asp:Repeater>
                </div>
                </br>
            </br>
             <asp:Label ID="lblNoRecord" runat="server"></asp:Label>
            </div>
        </div>
        <div class="sales-boxes">
            <div class="recent-sales box">
                <div class="top-sales box" style="padding-top: auto; padding-right: auto; padding-bottom: auto; padding-left: auto; margin: auto; width: auto; box-shadow: none">


                    <asp:Repeater ID="Repeater6" runat="server" DataSourceID="SqlDataSource2">
                        <HeaderTemplate>
                            <div class="title" style="color:#ff7e29">Top 10 Product</div>
                            <hr />
                            <div style="display: flex; justify-content: space-between; height: 25px;">
                                <div>Rank</div>
                                <div>Sold</div>
                            </div>
                            <hr />
                            <ul class="details" style="padding-top: auto; padding-right: auto; padding-bottom: auto; padding-left: auto; margin: auto; font-style: italic;">
                        </HeaderTemplate>
                        <ItemTemplate>
                            <li>
                                <a href="../Product/product_view.aspx?bookID=<%# Eval("FigureID") %>">
                                    <span class="product mr-20 ml-20"><%# Container.ItemIndex + 1 %></span>
                                    <img src="../../<%# Eval("FigureImage1").ToString().Substring(1) %>" width="100">
                                    <span class="product"><%# Eval("FigureName") %></span>
                                </a>
                                &nbsp;<span class="quantitySold"><b><%# Eval("Quantity Sold") %></b></span></li>
                            <hr />
                        </ItemTemplate>
                        <FooterTemplate>
                            </ul>
                        </FooterTemplate>
                    </asp:Repeater>
                    </br>
            <asp:Label ID="lblTop" runat="server"></asp:Label>
                </div>
            </div>

            <div class="recent-sales box">

                <div class="top-sales box" style="padding-top: auto; padding-right: auto; padding-bottom: auto; padding-left: auto; margin: auto; width: auto; box-shadow: none">

                    <asp:Repeater ID="Repeater7" runat="server" DataSourceID="SqlDataSource3">
                        <HeaderTemplate>
                            <div class="title" style="color:#ff7e29">Least 10 Product</div>
                            <hr />
                            <div style="display: flex; justify-content: space-between; height: 25px;">
                                <div>Rank</div>
                                <div>Sold</div>
                            </div>
                            <hr />
                            <ul class="details" style="font-style: italic">
                        </HeaderTemplate>
                        <ItemTemplate>
                            <li>
                                <a href="../Product/product_view.aspx?bookID=<%# Eval("FigureID") %>">
                                    <span class="product mr-20 ml-20"><%# Container.ItemIndex + 1 %></span>
                                    <img src="../../<%# Eval("FigureImage1").ToString().Substring(1) %>" width="100">
                                    <span class="product"><%# Eval("FigureName") %></span>
                                </a>
                                &nbsp;<span class="quantitySold"><b><%# Eval("Quantity Sold") %></b></span></li>
                            <hr />
                        </ItemTemplate>
                        <FooterTemplate>
                            </ul>
                        </FooterTemplate>
                    </asp:Repeater>
                    </br>
            <asp:Label ID="lblLeast" runat="server"></asp:Label>
                </div>
            </div>
        </div>
    </div>
    <br />
    <br />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ApexOnlineShopDb %>"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ApexOnlineShopDb %>"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ApexOnlineShopDb %>"></asp:SqlDataSource>
</asp:Content>
