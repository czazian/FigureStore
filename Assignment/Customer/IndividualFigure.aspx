<%@ Page Title="" Language="C#" MasterPageFile="~/Cust.Master" AutoEventWireup="true" CodeBehind="IndividualFigure.aspx.cs" Inherits="Assignment.Customer.IndividualFigure" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="InidividualFigure.css" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="product-container">
        <div class="left-box">
            <div class="top-container">
                <div class="product-header">
                    <div class="header-title">
                        <asp:Label Style="font-weight: bold; font-size: 18px; color: #ff7e29" ID="pname" runat="server" Text="Nendoroid Frieren" />
                    </div>
                    <div class="series">
                        <span style="color: #ff7e29;">Series : </span>
                        <asp:Label ID="lblSeries" runat="server" Text="Frieren: Beyond Journey's End" />
                    </div>
                </div>
                <div class="middle">
                    <div class="main-img">
                        <asp:Image runat="server" ID="mainimg" Style="width: 90%; padding: 20px;" />
                    </div>
                    <div class="select-img">
                        <div class="img1" id="img1" style="border: 3px solid #ff7e29">
                            <asp:ImageButton OnClientClick="changeImg1(); return false;" CssClass="sideimg" runat="server" ID="Image1" />
                        </div>
                        <div class="img2" id="img2">
                            <asp:ImageButton OnClientClick="changeImg2(); return false;" CssClass="sideimg" runat="server" ID="Image2" />
                        </div>
                    </div>
                </div>
            </div>
            <div style="padding: 10px; border-top: 1px solid lightgrey;">
                <table class="product-details">
                    <tr class="releasedate">
                        <td class="title">Release Date :
                        </td>
                        <td class="p-release">
                            <asp:Label runat="server" ID="prelease" Text="Jul 2024" />
                        </td>
                    </tr>
                    <tr class="manufacturer">
                        <td class="title">Manufacturer :
                        </td>
                        <td class="p-manufacturer">
                            <asp:Label runat="server" ID="pmanufacturer" Text="Good Smile Company" />
                        </td>
                    </tr>
                    <tr class="unit">
                        <td class="title">Available Unit :
                        </td>
                        <td class="p-unit">
                            <asp:Label runat="server" ID="punit" Text="50" />
                        </td>
                    </tr>
                    <tr class="specification">
                        <td class="title">Specification :
                        </td>
                        <td class="p-specification">
                            <asp:Label runat="server" ID="pspecification" Text="Painted plastic non-scale articulated figure with stand included. Approximately 100mm in height." />
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <div class="right-box">
            <div class="price">
                Price :
                <asp:Label runat="server" ID="txtPrice" Text="RM 100.00" />
            </div>

            <div class="quantity-container">
                <table>
                    <tr>
                        <td class="q-title" style="margin-top:5px; font-weight: bold; text-align: right;">Quantity
                        </td>
                        <td style="width: contain;">
                            <div>
                                <div>
                                    <div style="display: flex; flex-flow: row nowrap; justify-content: left;">
                                        <!--Deduct 1-->
                                        <span class="input-group-btn">
                                            <asp:LinkButton ValidationGroup="grp" OnClientClick="return false" runat="server" ID="btnMinus" CssClass="quantity-left-minus btn btn-number" Style="background-color: #ff7e29; color: white;" data-type="minus" data-field="">
                    <i class="fa-solid fa-minus"></i>
                                            </asp:LinkButton>
                                        </span>

                                        <asp:TextBox ValidationGroup="grp" AutoPostBack="true" Text="1" ID="txtQuantity" runat="server" Style="border-color: #f0f0f0; text-align: center;" type="text" TextMode="Number" min="1" max="100" CssClass="noSpinners quantity" />

                                        <!--Add 1-->
                                        <span class="input-group-btn">
                                            <span class="input-group-btn">
                                                <asp:LinkButton ValidationGroup="grp" Style="background-color: #ff7e29; color: white" OnClientClick="return false;" runat="server" ID="btnAdd" CssClass="quantity-right-plus btn btn-number" data-type="plus" data-field="">
                        <i class="fa-solid fa-plus"></i>
                                                </asp:LinkButton>
                                            </span>
                                        </span>
                                    </div>

                                </div>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>

            <!--Add to card button-->
            <div class="row details-row addtocart" style="width: 100%;">
                <div style="display: flex; justify-content: center;">
                    <asp:Button PostBackUrl="~/Customer/Cart.aspx" runat="server" ID="btnCart" CssClass="btn" Style="background-color: #ff7e29; width: 83%; margin-top: 5px; color: white; font-weight: bold;" Text="Add to cart" />
                </div>
            </div>

            <hr />

            <div class="info" style="margin-left: 10px; margin-right: 10px; margin-top: -10px; display: flex; flex-flow: column nowrap;">
                <div clas="notice" style="font-weight: bold;">
                    Notice : 
                </div>
                <div style="color: red;">
                    Please ensure that your quantity selected is not exceed
                    <asp:Label Style="font-weight: bold" Text="50" ID="maxQty" runat="server" />, which is the maximum available unit for this product. 
                </div>
            </div>

            <hr style="margin-top: 0px; margin-bottom: 10px;" />


            <div style="text-align: left; font-weight: bold; font-size: 18px; align-self: flex-start; margin-left: 15px; margin-bottom: 10px;">
                Product Suggestions
            </div>
            <div class="product-suggestion">
                <!--Product Suggestion-->
                <asp:Repeater runat="server" ID="SuggestionRpt">
                    <ItemTemplate>
                        <div class="suggestion1">
                            <div class="simg">
                                <asp:Image Style="width: 100%; margin-bottom: 10px;" runat="server" ID="sImg" ImageUrl='<%# Eval("FigureImage1") %>' />
                            </div>
                            <div class="sname">
                                <asp:Label CssClass="deconone" runat="server" ID="sName" Text='<%# Eval("FigureName") %>' />
                            </div>
                            <div class="sprice">
                                <asp:Label CssClass="deconone" runat="server" ID="sPrice" Text='<%# Convert.ToDecimal(Eval("FigurePrice")).ToString("C2") %>' />
                            </div>
                            <asp:Button ID="view" OnCommand="view_Command" CommandArgument='<%# Eval("FigureID") %>' Font-Underline="false" Style="background-color:#ff7e29; width:100%; font-weight:bold;color:white; margin-top:5px;" runat="server" CssClass="btn border" Text="View"/>
                            <hr />
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
                <hr />
            </div>



        </div>
    </div>

    <!--Click this button back to top of the page-->
    <div class="toTop" id="toTop">
        <asp:LinkButton OnClientClick="toTop() ;return false;" ID="top" runat="server">
            <i style="border-radius: 50px; background-color:#ff7e29; padding: 10px 12.5px 10px 12.5px; color:white; font-size: 20px;" class="fa-solid fa-arrow-up"></i>
        </asp:LinkButton>
    </div>

    <script>
        window.addEventListener("scroll", function () {
            let box = document.getElementById("toTop");
            var elementTarget = document.getElementById("dropdown");
            if (window.scrollY > (elementTarget.offsetTop + elementTarget.offsetHeight)) {
                box.style.display = "block";
            } else {
                box.style.display = "none";
            }
        });

        function toTop() {
            document.documentElement.scrollTop = 0;
        }
    </script>


</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="JS" runat="server">

    <script type="text/javascript">

        function changeImg1() {
            //Get Imaghe Path to change
            var path = document.getElementById('<%= Image1.ClientID %>').src;

            //Change image
            document.getElementById('<%= mainimg.ClientID %>').src = path;

            //Change border color
            document.getElementById("img2").style.border = "none";
            document.getElementById("img1").style.border = "3px solid #ff7e29";
        }

        function changeImg2() {
            //Get Imaghe Path to change
            var path = document.getElementById('<%= Image2.ClientID %>').src;

            //Change image
            document.getElementById('<%= mainimg.ClientID %>').src = path;

            //Change border color
            document.getElementById("img1").style.border = "none";
            document.getElementById("img2").style.border = "3px solid #ff7e29";
        }


        //Add and deduct quantity
        $(document).ready(function () {

            var quantitiy = 0;
            $('.quantity-right-plus').click(function (e) {

                // Stop acting like a button
                e.preventDefault();
                // Get the field name
                var quantity = parseInt($('.quantity').val());

                $('.quantity').val(quantity + 1);

            });

            $('.quantity-left-minus').click(function (e) {
                // Stop acting like a button
                e.preventDefault();
                // Get the field name
                var quantity = parseInt($('.quantity').val());

                if (quantity > 1) {
                    $('.quantity').val(quantity - 1);
                }
            });

        });
    </script>
</asp:Content>
