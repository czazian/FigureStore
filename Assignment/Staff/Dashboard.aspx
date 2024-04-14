<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeFile="Dashboard.aspx.cs" Inherits="Assignment.Staff.Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        #dashbLi {
            background: #545454;
        }

        .lbltxt {
            font-size: 36px !important;
            font-weight: 500 !important;
            color: #ff7e29;
        }

        .box-topic {
            font-weight: 550 !important;
        }

        .number {
            font-size: 25px !important;
            font-weight: 400 !important;
        }

        .smlT {
            font-size: 14px;
            color: #8a8a8a;
            margin-left: 10px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="home-content">

        <%--first row--%>
        <div class="sales-boxes" style="padding-bottom: 10px;">
            <div class="info3 box">
                <div class="title" style="color: #ff7e29; font-weight: 600 !important;">
                    <i class="bx bx-happy-alt"></i>&nbsp;Welcome to Staff Portal,
                    <asp:Label ID="txtUsername" runat="server" Text="Label"></asp:Label>
                </div>
            </div>
        </div>

        <%--second row--%>
        <div class="overview-boxes">
            <div class="box">
                <div class="right-side">
                    <div class="box-topic">Total Order</div>
                    <div class="number">
                        <asp:Label ID="lblTotalOrder" CssClass="lbltxt" runat="server">0</asp:Label>
                        sales
                    </div>
                </div>
                <i class='bx bx-cart-alt cart' style="vertical-align: middle;"></i>
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

        <%--third row--%>
        <div class="sales-boxes">
            <div class="info1 box">
                <div class="title" style="font-size: 30px; font-weight: 600; color: #ff7e29"><i class="bx bx-line-chart-down"></i>&nbsp;Total Order<span class="smlT"> on this year</span></div>
                <canvas id="line"></canvas>
            </div>
            <div class="info2 box">
                <div class="title" style="font-size: 30px; font-weight: 600; color: #ff7e29"><i class="bx bx-line-chart-down"></i>&nbsp;Total Sold<span class="smlT"> on each category</span></div>
                <canvas id="pie"></canvas>
            </div>
        </div>
        <br>
        <%--forth row--%>
        <div class="sales-boxes">
            <div class="info3 box">
                <div class="title" style="font-size: 30px; font-weight: 600; color: #ff7e29"><i class="bx bx-paper-plane"></i>&nbsp;Recent Order</div>
                <div class="sales-details">

                    <asp:Repeater ID="RepeaterOrder" runat="server" DataSourceID="SqlDataSourceOrder">
                        <HeaderTemplate>
                            <ul class="details">
                                <hr />
                                <li class="topic">Order ID</li>
                                <hr />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <li class="txt-center">XYZ<%# Eval("OrderID") %>A</li>
                            <hr />
                        </ItemTemplate>
                        <FooterTemplate>
                            </ul>
       
                        </FooterTemplate>
                    </asp:Repeater>

                    <asp:Repeater ID="RepeaterMember" runat="server" DataSourceID="SqlDataSourceOrder">
                        <HeaderTemplate>
                            <ul class="details">
                                <hr />
                                <li class="topic">Member</li>
                                <hr />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <li class="txt-center"><%# Eval("Name") %></li>
                            <hr />
                        </ItemTemplate>
                        <FooterTemplate>
                            </ul>
       
                        </FooterTemplate>
                    </asp:Repeater>

                    <asp:Repeater ID="RepeaterOrderDate" runat="server" DataSourceID="SqlDataSourceOrder">
                        <HeaderTemplate>
                            <ul class="details">
                                <hr />
                                <li class="topic">Order Date</li>
                                <hr />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <li class="txt-center"><%# String.Format("{0:dd-MM-yyyy}", Eval("OrderDate")) %></li>
                            <hr />
                        </ItemTemplate>
                        <FooterTemplate>
                            </ul>
       
                        </FooterTemplate>
                    </asp:Repeater>

                    <asp:Repeater ID="RepeaterAmountPaid" runat="server" DataSourceID="SqlDataSourceOrder">
                        <HeaderTemplate>
                            <ul class="details">
                                <hr />
                                <li class="topic">Amount Paid</li>
                                <hr />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <li class="txt-center">RM <%# Eval("PaymentAmount") %></li>
                            <hr />
                        </ItemTemplate>
                        <FooterTemplate>
                            </ul>
       
                        </FooterTemplate>
                    </asp:Repeater>

                    <asp:Repeater ID="RepeaterStatus" runat="server" DataSourceID="SqlDataSourceOrder" OnItemDataBound="RepeaterStatus_ItemDataBound">
                        <HeaderTemplate>
                            <ul class="details">
                                <hr />
                                <li class="topic">Status</li>
                                <hr />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <li class="txt-center">
                                <asp:Label ID="StatusLabel" runat="server" Text='<%# Eval("OrderStatus") %>'></asp:Label>

                            </li>
                            <hr />
                        </ItemTemplate>
                        <FooterTemplate>
                            </ul>
       
                        </FooterTemplate>
                    </asp:Repeater>

                    <asp:Repeater ID="RepeaterOperation" runat="server" DataSourceID="SqlDataSourceOrder">
                        <HeaderTemplate>
                            <ul class="details">
                                <hr />
                                <li class="topic">Operation</li>
                                <hr />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <li class="txt-center">
                                <asp:HyperLink runat="server" ID="hrefView" NavigateUrl='<%# "~/Staff/ViewOrder.aspx?OrderID=" + Eval("OrderID") %>'><i class='bx bx-show'></i></asp:HyperLink>
                                <asp:HyperLink runat="server" ID="hrefEdit" NavigateUrl='<%# "~/Staff/EditOrder.aspx?OrderID=" + Eval("OrderID") %>'><i class='bx bxs-edit'></i></asp:HyperLink>
                            </li>
                            <hr />
                        </ItemTemplate>
                        <FooterTemplate>
                            </ul>
       
                        </FooterTemplate>
                    </asp:Repeater>
                </div>
            </div>
        </div>

        <br />
        <%--fifth row--%>
        <div class="sales-boxes">
            <div class="info3 box">
                <div class="title" style="font-size: 30px; font-weight: 600; color: #ff7e29"><i class="bx bx-error-alt"></i>&nbsp;Low Stock Product</div>
                <div class="sales-details">
                    <asp:Panel ID="pnlLowStock" runat="server" Visible='<%# HasLowStockProducts() %>'>

                        <asp:Repeater ID="RepeaterImage" runat="server" DataSourceID="SqlDataSourceLowStock">
                            <HeaderTemplate>
                                <ul class="details">
                                    <hr />
                                    <li class="topic">Image</li>
                                    <hr />
                            </HeaderTemplate>
                            <ItemTemplate>
                                <li>
                                    <asp:Image ID="img" runat="server" ImageUrl='<%# Eval("FigureImage1") %>' CssClass="poster" Height="90" Width="70" /><br />
                                </li>
                                <br />
                                <br />
                                <br />
                                <br />
                                <hr />
                            </ItemTemplate>
                            <FooterTemplate>
                                </ul>
           
                            </FooterTemplate>
                        </asp:Repeater>
                    </asp:Panel>
                    <asp:Panel ID="Panel1" runat="server" Visible='<%# HasLowStockProducts() %>'>

                        <asp:Repeater ID="RepeaterProduct" runat="server" DataSourceID="SqlDataSourceLowStock">
                            <HeaderTemplate>
                                <ul class="details">
                                    <hr />
                                    <li class="topic">Product</li>
                                    <hr />
                            </HeaderTemplate>
                            <ItemTemplate>

                                <li>
                                    <%# Eval("FigureName") %>
                </li>
                                <br />
                                <br />
                                <br />
                                <br />
                                <hr />
                            </ItemTemplate>
                            <FooterTemplate>
                                </ul> 
           
                            </FooterTemplate>
                        </asp:Repeater>
                    </asp:Panel>
                    <asp:Panel ID="Panel2" runat="server" Visible='<%# HasLowStockProducts() %>'>

                        <asp:Repeater ID="RepeaterPrice" runat="server" DataSourceID="SqlDataSourceLowStock">
                            <HeaderTemplate>
                                <ul class="details">
                                    <hr />
                                    <li class="topic">Price</li>
                                    <hr />
                            </HeaderTemplate>
                            <ItemTemplate>
                                <li class="txt-center">RM <%# Eval("FigurePrice") %>
                </li>
                                <br />
                                <br />
                                <br />
                                <br />
                                <hr />
                            </ItemTemplate>
                            <FooterTemplate>
                                </ul>
           
                            </FooterTemplate>
                        </asp:Repeater>
                    </asp:Panel>
                    <asp:Panel ID="Panel3" runat="server" Visible='<%# HasLowStockProducts() %>'>
                        <asp:Repeater ID="RepeaterQuantity" runat="server" DataSourceID="SqlDataSourceLowStock">
                            <HeaderTemplate>
                                <ul class="details">
                                    <hr />
                                    <li class="topic">Stock</li>
                                    <hr />
                            </HeaderTemplate>
                            <ItemTemplate>
                                <li class="txt-center">
                                    <%# Eval("FigureUnit") %>
                </li>
                                <br />
                                <br />
                                <br />
                                <br />
                                <hr />
                            </ItemTemplate>
                            <FooterTemplate>
                                </ul>
           
                            </FooterTemplate>
                        </asp:Repeater>
                    </asp:Panel>
                    <asp:Panel ID="Panel4" runat="server" Visible='<%# HasLowStockProducts() %>'>
                        <asp:Repeater ID="RepeaterOperationLow" runat="server" DataSourceID="SqlDataSourceLowStock">
                            <HeaderTemplate>
                                <ul class="details">
                                    <hr />
                                    <li class="topic">Operation</li>
                                    <hr />
                            </HeaderTemplate>
                            <ItemTemplate>
                                <li class="txt-center">
                                    <a href="../Staff/ViewProduct.aspx?figureID=<%# Eval("FigureID") %>"><i class='bx bxs-edit' style="background-color:dodgerblue;">Add</i></a>
                </li>
                                <br />
                                <br />
                                <br />
                                <br />
                                <hr />
                            </ItemTemplate>
                            <FooterTemplate>
                                </ul>
           
                            </FooterTemplate>
                        </asp:Repeater>

                    </asp:Panel>
                </div>
                <!-- Display message if no low stock products -->
                <asp:Panel ID="pnlNoLowStock" runat="server">
                    <p>No low stock product records.</p>
                </asp:Panel>
            </div>
            <asp:SqlDataSource ID="SqlDataSourceLowStock" runat="server" ConnectionString="<%$ ConnectionStrings:ApexOnlineShopDb %>"
                SelectCommand="SELECT TOP 5 FigureID, FigureImage1, FigureName, FigurePrice, FigureUnit FROM [Figure] WHERE FigureUnit < 10 ORDER BY FigureUnit ASC;"></asp:SqlDataSource>
        </div>

        <asp:HiddenField ID="lblTotalJanOrder" runat="server" />
        <asp:HiddenField ID="lblTotalFebOrder" runat="server" />
        <asp:HiddenField ID="lblTotalMacOrder" runat="server" />
        <asp:HiddenField ID="lblTotalAprOrder" runat="server" />
        <asp:HiddenField ID="lblTotalMayOrder" runat="server" />
        <asp:HiddenField ID="lblTotalJuneOrder" runat="server" />
        <asp:HiddenField ID="lblTotalJulyOrder" runat="server" />
        <asp:HiddenField ID="lblTotalOgosOrder" runat="server" />
        <asp:HiddenField ID="lblTotalSepOrder" runat="server" />
        <asp:HiddenField ID="lblTotalOctOrder" runat="server" />
        <asp:HiddenField ID="lblTotalNovOrder" runat="server" />
        <asp:HiddenField ID="lblTotalDecOrder" runat="server" />

        <asp:HiddenField ID="lbltotalNendoroidsSold" runat="server" />
        <asp:HiddenField ID="lbltotalScaleFiguresSold" runat="server" />
        <asp:HiddenField ID="lbltotalDollsSold" runat="server" />
        <asp:HiddenField ID="lbltotalGundamSold" runat="server" />
        <asp:HiddenField ID="lbltotalGoodsSold" runat="server" />

        <asp:SqlDataSource ID="SqlDataSourceOrder" runat="server" ConnectionString="<%$ ConnectionStrings:ApexOnlineShopDb %>" SelectCommand="
    SELECT TOP 5
        C.Name,
        O.OrderDate,
        O.PaymentAmount,
        F.OrderStatus,
        O.OrderID
    FROM
        [Customer] C
    JOIN
        [Order] O ON C.CustomerID = O.CustomerID
    JOIN
        OrderFigure F ON O.OrderID = F.OrderID
    ORDER BY
        O.OrderID DESC,
        O.OrderDate DESC;"></asp:SqlDataSource>

        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

        <script>
            const ctx = document.getElementById('line');
            const janTotal = document.getElementById('<%= lblTotalJanOrder.ClientID %>').value;
            const febTotal = document.getElementById('<%= lblTotalFebOrder.ClientID %>').value;
            const macTotal = document.getElementById('<%= lblTotalMacOrder.ClientID %>').value;
            const aprTotal = document.getElementById('<%= lblTotalAprOrder.ClientID %>').value;
            const mayTotal = document.getElementById('<%= lblTotalMayOrder.ClientID %>').value;
            const juneTotal = document.getElementById('<%= lblTotalJuneOrder.ClientID %>').value;
            const julyTotal = document.getElementById('<%= lblTotalJulyOrder.ClientID %>').value;
            const ogosTotal = document.getElementById('<%= lblTotalOgosOrder.ClientID %>').value;
            const sepTotal = document.getElementById('<%= lblTotalSepOrder.ClientID %>').value;
            const octTotal = document.getElementById('<%= lblTotalOctOrder.ClientID %>').value;
            const novTotal = document.getElementById('<%= lblTotalNovOrder.ClientID %>').value;
            const decTotal = document.getElementById('<%= lblTotalDecOrder.ClientID %>').value;

            new Chart(ctx, {
                type: 'line',
                data: {
                    labels: ['Jan', 'Feb', 'Mac', 'Apr', 'May', 'June', 'July', 'Ogos', 'Sept', 'Oct', 'Nov', 'Dec'],
                    datasets: [{
                        label: 'Total Order',
                        data: [janTotal, febTotal, macTotal, aprTotal, mayTotal, juneTotal, julyTotal, ogosTotal, sepTotal, octTotal, novTotal, decTotal],
                        borderWidth: 2,
                        borderColor: '#ff7e29'
                    }]
                },
                options: {
                    scales: {
                        y: {
                            beginAtZero: true
                        }
                    }
                }
            });

            const ctx2 = document.getElementById('pie');
            const totalSFSold = document.getElementById('<%= lbltotalScaleFiguresSold.ClientID %>').value;
            const totalNSold = document.getElementById('<%= lbltotalNendoroidsSold.ClientID %>').value;
            const totalDSold = document.getElementById('<%= lbltotalDollsSold.ClientID %>').value;
            const totalGdSold = document.getElementById('<%= lbltotalGundamSold.ClientID %>').value;
            const totalGSold = document.getElementById('<%= lbltotalGoodsSold.ClientID %>').value;

            new Chart(ctx2, {
                type: 'doughnut',
                data: {
                    labels: ['Scales Figures', 'Nendoroids', 'Dolls', 'Gundam', 'Goods'],
                    datasets: [{
                        label: 'Category',
                        data: [totalSFSold, totalNSold, totalDSold, totalGdSold, totalGSold],
                        borderWidth: 1
                    }]
                },
                options: {
                    scales: {
                        y: {
                            beginAtZero: true,
                        }
                    }
                }
            });
        </script>
</asp:Content>
