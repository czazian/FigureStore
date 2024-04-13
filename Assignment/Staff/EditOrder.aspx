<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeFile="EditOrder.aspx.cs" Inherits="Assignment.Staff.EditOrder" %>
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

         <!--                        order info-->
         <div class="recent-sales box">

             <div class="title">Customer Info</div>
             <br />
             <asp:Image runat="server" ID="txtImg" Style="border-radius: 100px; width: 60%; width: 160px; height: 160px; margin-left:35%"/>
             </br>
             </br>
                 <label class="label-field">Full Name:</label></br></br>
                         <asp:TextBox runat="server" ID="txtFullName" CssClass="input-field" Enabled="false"></asp:TextBox>
             <br>
                 <label class="label-field">Member Email:</label></br>
             </br>
                 <asp:TextBox runat="server" ID="txtEmail" CssClass="input-field" Enabled="false"></asp:TextBox>
             <br>
                 <label class="label-field">Phone No:</label></br>
             </br>
                 <asp:TextBox runat="server" ID="txtPhoneNo" CssClass="input-field" Enabled="false"></asp:TextBox>
             <br>
         </div>


         <!--                        customer info-->
         <div class="recent-sales box">
             <div class="title">Order Detail</div>
             </br>
                     <label class="label-field">Payment Method: </label>
             </br></br>
                 <asp:TextBox runat="server" ID="txtPayMethod" CssClass="input-field" Enabled="false"></asp:TextBox>
             <br>
                 <label class="label-field">Shipping Address:</label>
             </br>
             </br>
                 <asp:TextBox runat="server" ID="txtShippingAdd" CssClass="input-field" Enabled="false"></asp:TextBox>
             <br>
                 <label class="label-field">Total Amount (RM):</label></br>
             </br>
                 <asp:TextBox runat="server" ID="txtTotalAmount" CssClass="input-field" Enabled="false"></asp:TextBox>
             <br>
                 <label class="label-field">Order Date: </label>
             </br>
             </br>
                 <asp:TextBox runat="server" ID="txtOrderDate" CssClass="input-field" Enabled="false"></asp:TextBox>
             <br>
                 <label class="label-field">Status:</label></br>
             </br>
             <asp:DropDownList runat="server" ID="ddlStatus" Enabled="true" CssClass="input-field border-lightsalmon" OnDataBound="ddlStatus_DataBound">
                 <asp:ListItem Value="Pending" Selected="False"></asp:ListItem>
                 <asp:ListItem Value="Shipping"></asp:ListItem>
                 <asp:ListItem Value="Delivered"></asp:ListItem>
             </asp:DropDownList>
             <asp:HiddenField runat="server" ID="hdnSelectedStatus" />
             <asp:Button runat="server" ID="Button1" Text="Submit" CssClass="form-button" OnClientClick="return confirmStatusUpdate();" OnClick="Button1_Click" />
             <asp:Button runat="server" ID="Button2" Text="Back" CssClass="form-button" PostBackUrl="~/Staff/OrderList.aspx" />
             <br>
         </div>

     </div>

     <!--                    order detail-->
     <div class="sales-boxes">
         <div class="recent-sales box">
             <div class="title">Order List</div>

             <div class="sales-details">
                 <asp:Repeater ID="RepeaterNo" runat="server">
                     <HeaderTemplate>
                         <ul class="details">
                             <li class="topic">No</li>
                             <hr />
                     </HeaderTemplate>
                     <ItemTemplate>
                         <li><%# Container.ItemIndex + 1 %>.</li>
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

                 <asp:Repeater ID="RepeaterImage" runat="server">
                     <HeaderTemplate>
                         <ul class="details">
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

                 <asp:Repeater ID="RepeaterProduct" runat="server">
                     <HeaderTemplate>
                         <ul class="details">
                             <li class="topic">Product</li>
                             <hr />
                     </HeaderTemplate>
                     <ItemTemplate>
                         <li><%# Eval("FigureName") %></li>
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

                 <asp:Repeater ID="RepeaterQuantity" runat="server">
                     <HeaderTemplate>
                         <ul class="details">
                             <li class="topic">Quantity</li>
                             <hr />
                     </HeaderTemplate>
                     <ItemTemplate>
                         <li><%# Eval("OrderQuantity") %></li>
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

                 <asp:Repeater ID="RepeaterPrice" runat="server">
                     <HeaderTemplate>
                         <ul class="details">
                             <li class="topic">Price </li>
                             <hr />
                     </HeaderTemplate>
                     <ItemTemplate>
                         <li>RM <%# Eval("FigurePrice") %></li>
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
             </div>

             <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ApexOnlineShopDb %>"
                 SelectCommand="SELECT PF.FigureImage1, PF.FigureName, PF.FigurePrice, F.OrderQuantity
                FROM [Order] O
                JOIN OrderFigure F ON O.OrderID = F.OrderID
                JOIN Figure PF ON F.FigureID = PF.FigureID
                WHERE O.OrderID = @OrderID">
                 <SelectParameters>
                     <asp:QueryStringParameter Name="OrderID" QueryStringField="OrderID" Type="Int32" />
                 </SelectParameters>
             </asp:SqlDataSource>
         </div>   

     </div>

     </div>

    <script type="text/javascript">
    function confirmStatusUpdate() {
        var selectedStatus = document.getElementById('<%= ddlStatus.ClientID %>').value;
        document.getElementById('<%= hdnSelectedStatus.ClientID %>').value = selectedStatus;

        return confirm('Are you sure you want to update the status to ' + selectedStatus + '?');
    }
</script>
</asp:Content>
