<%@ Page Title="" Language="C#" MasterPageFile="~/Cust.Master" AutoEventWireup="true" CodeBehind="cart.aspx.cs" Inherits="Assignment.Customer.cart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="Cart.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!--Remove the Query String after it is obtained, to avoid keep adding item-->
    <script>
        $(document).ready(function () {
            history.pushState(null, "", location.href.split("?")[0]);

            //Disabled the checkout and total amount if the cart is empty
            var qty = document.getElementById('<%= lblTotal.ClientID %>').innerHTML;
            var checkout = document.getElementById('checkout');
            var amount = document.getElementById('total-payment');

            if (qty > 0) {
                checkout.style.display = "flex";
                amount.style.display = "flex";
            } else if (qty == 0) {
                checkout.style.display = "none";
                amount.style.display = "none";
            }
        })

        $('<%= lblTotal.ClientID %>').on('labelchanged', function () {
            //Disabled the checkout and total amount if the cart is empty
            var qty = document.getElementById('<%= lblTotal.ClientID %>').innerHTML;
            var checkout = document.getElementById('checkout');
            var amount = document.getElementById('total-payment');

            if (qty > 0) {
                checkout.style.display = "flex";
                amount.style.display = "flex";
            } else if (qty == 0) {
                checkout.style.display = "none";
                amount.style.display = "none";
            }
        })
    </script>

    <% 
        //Obtain shopping cart
        Assignment.Objects.ShoppingCart shoppingCart = (Assignment.Objects.ShoppingCart)Session["shoppingCart"];

        if (shoppingCart == null)
        {
            shoppingCart = new Assignment.Objects.ShoppingCart();
            Session["shoppingCart"] = shoppingCart;
        }

        List<Assignment.Objects.OrderCart> figures = shoppingCart.getCartItems();

        if (figures.Count == 0)
        {
            lblEmptyCart.Text = "Cart is empty. Kindly add an item and come back again!";
        }
    %>

    <!--Start shopping cart -->
    <div class="product-container">
        <div class="left-box" id="left">
            <div class="top-container">
                <div class="header-title">
                    <asp:Label Style="font-weight: bold; font-size: 25px; color: #ff7e29; margin-right: 10px;" ID="pname" runat="server" Text="My Cart" />
                </div>

                <div class="middle">
                    <!--Start of cart content-->
                    <table class="oneProductContainer" style="width: 100%;">
                        <!--HEADER-->
                        <tr style="text-align: center; font-size: 18px; border-bottom: 1px solid lightgrey;">
                            <th></th>
                            <th></th>
                            <th>Quantity</th>
                            <th>Item Price</th>
                            <th>SubTotal</th>
                        </tr>
                        <asp:Repeater runat="server" ID="FigureRepeater" OnItemDataBound="FigureRepeater_ItemDataBound">

                            <ItemTemplate>
                                <asp:HiddenField runat="server" ID="hdnID" Value='<%# Eval("FigureID") %>' />
                                <tr class="item">

                                    <!-- Figure Image -->
                                    <td class="start1">
                                        <asp:ImageButton CssClass="inner-img" runat="server" ID="ProductImage" ImageUrl='<%# Eval("FigureImage1") %>' OnCommand="ProductImage_Command" CommandArgument='<%# Eval("FigureID") %>' />
                                    </td>

                                    <!-- Figure Name, Series and remove button -->
                                    <td class="start2">
                                        <div class="product-name" style="color: #ff7e29; font-weight: bold; font-size: 18px;">
                                            <asp:Label ID="productname" runat="server" Text='<%# Eval("FigureName") %>' />
                                        </div>
                                        <div class="product-series">
                                            <span style="color: #ff7e29;">Series : </span>
                                            <asp:Label ID="lblSeries" runat="server" Text='<%# Eval("FigureSeries") %>' />
                                        </div>
                                        <div class="remove-btn">
                                            <asp:LinkButton CommandArgument='<%# Eval("FigureID") %>' OnClick="btnDelete_Click" CssClass="removebtn" runat="server" Text="Remove" ID="removeitem" OnClientClick="return confirm('Are you sure you want to delete this item ?')">
                                            </asp:LinkButton>
                                        </div>
                                    </td>

                                    <!-- Quantity -->
                                    <td class="mid">
                                        <asp:TextBox runat="server" Style="width: 70px; text-align: center;" TextMode="Number" ID="txtQty" Text='<%# Eval("selectedQuantity") %>' Min="1" />
                                    </td>

                                    <!-- Figure price -->
                                    <td class="end">
                                        <asp:Label runat="server" ID="itemprice" Text='<%# "RM " + Eval("FigurePrice") %>' />
                                    </td>

                                    <!-- total price -->
                                    <td class="total-price">
                                        <asp:Label runat="server" ID="itemSubtotal" Text="" />
                                    </td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>

                        <!--End of Cart Content-->

                    </table>


                    <!--If cart is empty-->
                    <div style="text-align: center; width: 100%; padding: 10px; margin-top: 15px;">
                        <asp:Label ID="lblEmptyCart" runat="server" Style="color: crimson; font-size: 1.2rem; font-weight: bold; text-align: center;"></asp:Label>
                    </div>
                </div>
            </div>
        </div>


        <div class="right-box" id="right-box">
            <!--Information-->
            <div class="info" id="total-payment">
                <p>Total : RM</p>
                &nbsp;
                <div class="total">
                    <asp:Label ID="lblTotal" runat="server" />
                </div>
            </div>

            <!--Checkout Button-->
            <div class="row details-row" style="width: 100%; display: flex; gap: 10px;">
                <div class="checkout" id="checkout" style="display: flex; justify-content: center">
                    <asp:LinkButton PostBackUrl="~/Customer/Checkout.aspx" runat="server" ID="btnCheckout" CssClass="btn-checkout" Style="background-color: #ff7e29; color: white; font-weight: bold; text-decoration: none; text-align: center;">
                        <i class="fa-solid fa-cart-shopping"></i>&nbsp;Checkout
                    </asp:LinkButton>
                </div>
                <div style="display: flex; justify-content: center;">
                    <asp:Button PostBackUrl="~/Customer/Home.aspx" runat="server" ID="Button1" CssClass="btn-addmore" Style="background-color: #212121; color: white;" Text="Add More Product ?" />
                </div>
            </div>

            <!--Info-->
            <div class="info-notice" style="margin-left: 10px; margin-right: 10px; display: flex; flex-flow: column nowrap;">
                <div class="notice" style="font-weight: bold;">
                    Notice : 
                </div>
                <div style="color: red;">
                    Please ensure that your quantity selected for each item is not exceeding maximum available unit for each product. 
                </div>
            </div>
        </div>
    </div>


    <script>
        $(function () {
            var top = $('#right-box').offset().top - parseFloat($('#right-box').css('marginTop').replace(/auto/, 0));
            var footTop = $('#footer').offset().top - parseFloat($('#footer').css('marginTop').replace(/auto/, 0));

            var maxY = footTop - $('#right-box').outerHeight();

            $(window).scroll(function (evt) {
                var y = $(this).scrollTop();
                if (y > top) {
                    if (y < maxY) {
                        $('#right-box').addClass('fixed').removeAttr('style');
                    } else {
                        $('#right-box').removeClass('fixed').css({
                            position: 'absolute',
                            top: (maxY - top) + 'px'
                        });
                    }
                } else {
                    $('#right-box').removeClass('fixed');
                }
            });
        });
    </script>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="JS" runat="server">
</asp:Content>
