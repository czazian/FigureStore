<%@ Page Title="" Language="C#" MasterPageFile="~/Cust.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="Assignment.Customer.Cart" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="Cart.css" />
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="product-container">
        <div class="left-box">
            <div class="top-container">
                <div class="header-title">
                    <asp:Label Style="font-weight: bold; font-size: 25px; color: #ff7e29; margin-right: 10px;" ID="pname" runat="server" Text="My Cart" />
                </div>

                <div class="middle">

                    <table class="oneProductContainer" style="width: 100%;">
                        <tr style="text-align: center; font-size: 18px; border-bottom: 1px solid lightgrey;">
                            <th></th>
                            <th></th>
                            <th>Quantity</th>
                            <th>Item Price</th>
                            <th>SubTotal</th>
                        </tr>

                        <!--One product-->
                        <tr class="item">
                            <td class="start1">
                                <asp:ImageButton CssClass="inner-img" runat="server" ID="ProductImage" ImageUrl="~/Image/Product/f1.jpg" PostBackUrl="~/Customer/IndividualFigure.aspx" />
                            </td>
                            <td class="start2">
                                <div class="product-name" style="color: #ff7e29; font-weight: bold; font-size: 18px;">
                                    <asp:Label ID="productname" runat="server" Text="Nendoroid Frieren" />
                                </div>
                                <div class="product-series">
                                    <span style="color: #ff7e29;">Series : </span>
                                    <asp:Label ID="lblSeries" runat="server" Text="Frieren: Beyond Journey's End" />
                                </div>
                                <div class="remove-btn">
                                    <asp:Button OnClientClick="return confirm('Are you sure to delete this item ?')" ID="removeitem" CssClass="removebtn" runat="server" Text="Remove" />
                                </div>
                            </td>


                            <td class="mid">
                                <asp:TextBox Text="2" Style="width: 70px; text-align: center;" TextMode="Number" runat="server" ID="txtQty" Min="1" />
                            </td>

                            <td class="end">
                                <asp:Label runat="server" ID="itemprice" Text="RM 100.00" />
                            </td>

                            <td class="total-price">
                                <asp:Label runat="server" ID="itemSubtotal" Text="RM 200.00" />
                            </td>
                        </tr>
                        <!--End of one product-->


                        <!--One product-->
                        <tr class="item">
                            <td class="start1">
                                <asp:ImageButton CssClass="inner-img" runat="server" ID="ImageButton1" ImageUrl="~/Image/Product/f2.jpg" PostBackUrl="~/Customer/IndividualFigure.aspx" />
                            </td>
                            <td class="start2">
                                <div class="product-name" style="color: #ff7e29; font-weight: bold; font-size: 18px;">
                                    <asp:Label ID="Label1" runat="server" Text="TENITOL Jess" />
                                </div>
                                <div class="product-series">
                                    <span style="color: #ff7e29;">Series : </span>
                                    <asp:Label ID="Label2" runat="server" Text="Butareba: The Story of a Man Turned into a Pig" />
                                </div>
                                <div class="remove-btn">
                                    <asp:Button OnClientClick="return confirm('Are you sure to delete this item ?')" ID="Button2" CssClass="removebtn" runat="server" Text="Remove" />
                                </div>
                            </td>


                            <td class="mid">
                                <asp:TextBox Text="2" Style="width: 70px; text-align: center;" TextMode="Number" runat="server" ID="TextBox1" Min="1" />
                            </td>

                            <td class="end">
                                <asp:Label runat="server" ID="Label3" Text="RM 100.00" />
                            </td>

                            <td class="total-price">
                                <asp:Label runat="server" ID="Label4" Text="RM 200.00" />
                            </td>
                        </tr>
                        <!--End of one product-->


                        <!--One product-->
                        <tr class="item">
                            <td class="start1">
                                <asp:ImageButton CssClass="inner-img" runat="server" ID="ImageButton2" ImageUrl="~/Image/Product/f4.jpg" PostBackUrl="~/Customer/IndividualFigure.aspx" />
                            </td>
                            <td class="start2">
                                <div class="product-name" style="color: #ff7e29; font-weight: bold; font-size: 18px;">
                                    <asp:Label ID="Label5" runat="server" Text="Chen Hai" />
                                </div>
                                <div class="product-series">
                                    <span style="color: #ff7e29;">Series : </span>
                                    <asp:Label ID="Label6" runat="server" Text="Azur Lane" />
                                </div>
                                <div class="remove-btn">
                                    <asp:Button OnClientClick="return confirm('Are you sure to delete this item ?')" ID="Button3" CssClass="removebtn" runat="server" Text="Remove" />
                                </div>
                            </td>


                            <td class="mid">
                                <asp:TextBox Text="2" Style="width: 70px; text-align: center;" TextMode="Number" runat="server" ID="TextBox2" Min="1" />
                            </td>

                            <td class="end">
                                <asp:Label runat="server" ID="Label7" Text="RM 100.00" />
                            </td>

                            <td class="total-price">
                                <asp:Label runat="server" ID="Label8" Text="RM 200.00" />
                            </td>
                        </tr>
                        <!--End of one product-->


                    </table>

                </div>
            </div>
        </div>


        <div class="right-box" id="right-box">
            <!--Information-->
            <div class="info">
                <p>Total : </p>
                &nbsp;
                <div class="total">
                    <asp:Label ID="lblTotal" runat="server" Text="RM 200.00" />
                </div>
            </div>

            <!--Checkout Button-->
            <div class="row details-row" style="width: 100%;">
                <div style="display: flex; justify-content: center">
                    <asp:LinkButton runat="server" ID="btnCheckoutt" CssClass="btn-checkout" Style="background-color: #ff7e29; color: white; font-weight: bold; text-decoration: none; text-align: center;">
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
        window.addEventListener("scroll", function () {
            let box = document.getElementById("right-box");
            var elementTarget = document.getElementById("outer-header");
            if (window.scrollY > (elementTarget.offsetTop + elementTarget.offsetHeight)) {
                box.style.top = "0px";
            }

            var elementTarget2 = document.getElementById("dropdown");
            if (window.scrollY < (elementTarget2.offsetTop + elementTarget2.offsetHeight)) {
                box.style.top = "161px";
            }
        });
    </script>

</asp:Content>
