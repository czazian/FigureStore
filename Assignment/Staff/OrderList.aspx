<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeFile="OrderList.aspx.cs" Inherits="Assignment.Staff.OrderList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        #orderLi {
            background: #545454;
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
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="home-content">
        <div class="sales-boxes">
            <div class="recent-sales box">
                <div class="title" style="padding-bottom: 10px; font-size: 30px; font-weight: 600; color: #ff7e29"><i class="bx bxs-cart"></i>&nbsp;Order List</div>
                <div style="display: flex; justify-content: space-between; align-items: flex-start;">
                    <div class="search-box">
                        <asp:TextBox runat="server" ID="txtSearch" placeholder="Search..." ClientIDMode="Static" onkeypress="return onEnterKeyPress(event)"></asp:TextBox>
                        <asp:LinkButton runat="server" ID="linkBtnSearch" OnClick="linkBtnSearch_Click"><i class='bx bx-search' style="background-color: #ff7e29;"></i></asp:LinkButton>
                    </div>
                </div>
                <div class="sales-details">

                    <asp:Repeater ID="RepeaterOrder" runat="server">
                        <HeaderTemplate>
                            <ul class="details">
                                <hr />
                                <li class="topic">Order ID</li>
                                <hr />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <li><%# Eval("OrderID") %>.</li>
                            <hr />
                        </ItemTemplate>
                        <FooterTemplate>
                            </ul>
       
                        </FooterTemplate>
                    </asp:Repeater>

                    <asp:Repeater ID="RepeaterMember" runat="server">
                        <HeaderTemplate>
                            <ul class="details">
                                <hr />
                                <li class="topic">Member</li>
                                <hr />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <li><a href="#"><span class="product"><%# Eval("Name") %></span></a></li>
                            <hr />
                        </ItemTemplate>
                        <FooterTemplate>
                            </ul>
       
                        </FooterTemplate>
                    </asp:Repeater>

                    <asp:Repeater ID="RepeaterPhone" runat="server">
                        <HeaderTemplate>
                            <ul class="details">
                                <hr />
                                <li class="topic">Phone No</li>
                                <hr />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <li><a href="#"><span class="product"><%# Eval("PhoneNo") %></span></a></li>
                            <hr />
                        </ItemTemplate>
                        <FooterTemplate>
                            </ul>
       
                        </FooterTemplate>
                    </asp:Repeater>

                    <asp:Repeater ID="RepeaterOrderDate" runat="server">
                        <HeaderTemplate>
                            <ul class="details">
                                <hr />
                                <li class="topic">Order Date</li>
                                <hr />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <li><a href="#"><span class="product"><%# String.Format("{0:dd/MM/yyyy}", Eval("OrderDate")) %></span></a></li>
                            <hr />
                        </ItemTemplate>
                        <FooterTemplate>
                            </ul>
       
                        </FooterTemplate>
                    </asp:Repeater>

                    <asp:Repeater ID="RepeaterAmountPaid" runat="server">
                        <HeaderTemplate>
                            <ul class="details">
                                <hr />
                                <li class="topic">Amount Paid</li>
                                <hr />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <li class="txt-center"><a href="#">RM <%# Eval("PaymentAmount") %></a></li>
                            <hr />
                        </ItemTemplate>
                        <FooterTemplate>
                            </ul>
       
                        </FooterTemplate>
                    </asp:Repeater>

                    <asp:Repeater ID="RepeaterStatus" runat="server" OnItemDataBound="RepeaterStatus_ItemDataBound">
                        <HeaderTemplate>
                            <ul class="details">
                                <hr />
                                <li class="topic">Status</li>
                                <hr />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <li>
                                <asp:Label ID="StatusLabel" runat="server" Text='<%# Eval("OrderStatus") %>'></asp:Label></li>
                            <hr />
                        </ItemTemplate>
                        <FooterTemplate>
                            </ul>
       
                        </FooterTemplate>
                    </asp:Repeater>

                    <asp:Repeater ID="RepeaterOperation" runat="server">
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
                    <br />
                </div>
                <asp:Label ID="lblNoRecordsFound" runat="server" Text="No matching records found." CssClass="lblNoRecord"></asp:Label>
            </div>

        </div>

    </div>
    <script type="text/javascript">
        function onEnterKeyPress(event) {
            if (event.keyCode === 13) {
                document.getElementById('<%= linkBtnSearch.ClientID %>').click();
                return false;
            }
            return true;
        }
</script>
</asp:Content>
