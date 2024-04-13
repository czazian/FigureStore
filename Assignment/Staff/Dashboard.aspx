<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeFile="Dashboard.aspx.cs" Inherits="Assignment.Staff.Dashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        #dashbLi {
            background: #545454 ;
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
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="home-content">

        <div class="sales-boxes" style="padding-bottom:10px;">
            <div class="info3 box">
                <div class="title" style="color:#ff7e29; font-weight:600 !important;"><i class="bx bx-happy-alt"></i>&nbsp;Welcome to Staff Portal, XXX</div>
        </div>

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

        <asp:HiddenField ID="lblTotalJanOrder" runat="server" />
        <asp:HiddenField ID="lblTotalFebOrder" runat="server" />
        <asp:HiddenField ID="lblTotalMacOrder"  runat="server" />
        <asp:HiddenField ID="lblTotalAprOrder" runat="server" />
        <asp:HiddenField ID="lblTotalMayOrder" runat="server" />
        <asp:HiddenField ID="lblTotalJuneOrder" runat="server" />
        <asp:HiddenField ID="lblTotalJulyOrder" runat="server" />
        <asp:HiddenField ID="lblTotalOgosOrder" runat="server" />
        <asp:HiddenField ID="lblTotalSepOrder" runat="server" />
        <asp:HiddenField ID="lblTotalOctOrder" runat="server" />
        <asp:HiddenField ID="lblTotalNovOrder" runat="server" />
        <asp:HiddenField ID="lblTotalDecOrder" runat="server" />

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
                    label: '# of Votes',
                    data: [janTotal, febTotal, macTotal, aprTotal, mayTotal, juneTotal, julyTotal, ogosTotal, sepTotal, octTotal, novTotal, decTotal],
                    borderWidth: 1
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

        new Chart(ctx2, {
            type: 'pie',
            data: {
                labels: ['Red', 'Blue', 'Yellow', 'Green', 'Purple', 'Orange'],
                datasets: [{
                    label: '# of Votes',
                    data: [12, 19, 3, 5, 2, 3],
                    borderWidth: 1
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
    </script>

</asp:Content>
