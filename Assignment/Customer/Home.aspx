<%@ Page Title="" Language="C#" MasterPageFile="~/Cust.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Assignment.Customer.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="Home.css" />
    <script src="Home.js" type="text/javascript"></script>
</asp:Content>


<%--Content here--%>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!--Banners-->
    <div class="slider" style="position: relative;">
        <div style="overflow: hidden; height: 350px; width: 100%; position: absolute;">
            <video autoplay loop muted class="slider-background" style="width: auto; min-width: 100%;">
                <source src='<%= ResolveUrl("~/Image/Element/sbackground.mp4") %>' type="video/mp4" />
            </video>
        </div>

        <div class="midPanel" style="position: relative;">

            <div id="promotionSlider" class="carousel slide" data-bs-ride="carousel">
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <asp:ImageButton ImageUrl="~/Image/Element/banner1.jpg" runat="server" ID="imgBtnBanner1" CssClass="iSlide d-block" Style="width: 580px; height: 327.5px;" AlternateText="Promotion" />
                    </div>
                    <div class="carousel-item">
                        <asp:ImageButton ImageUrl="~/Image/Element/banner2.jpg" runat="server" ID="imgBtnBanner2" CssClass="iSlide d-block" Style="width: 580px; height: 327.5px;" AlternateText="Promotion" />
                    </div>
                    <div class="carousel-item">
                        <asp:ImageButton ImageUrl="~/Image/Element/banner3.jpg" runat="server" ID="imgBtnBanner3" CssClass="iSlide d-block" Style="width: 580px; height: 327.5px;" AlternateText="Promotion" />
                    </div>
                    <div class="carousel-item">
                        <asp:ImageButton ImageUrl="~/Image/Element/banner4.jpg" runat="server" ID="imgBanner4" CssClass="iSlide d-block" Style="width: 580px; height: 327.5px;" AlternateText="Promotion" />
                    </div>
                    <div class="carousel-item">
                        <asp:ImageButton ImageUrl="~/Image/Element/banner5.jpg" runat="server" ID="imgBanner5" CssClass="iSlide d-block" Style="width: 580px; height: 327.5px;" AlternateText="Promotion" />
                    </div>
                </div>

                <asp:LinkButton ID="btnPreviousPage" runat="server" CssClass="carousel-control-prev" data-bs-target="#promotionSlider" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
                </asp:LinkButton>

                <asp:LinkButton ID="btnNextPage" runat="server" CssClass="carousel-control-next" data-bs-target="#promotionSlider" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
                </asp:LinkButton>
            </div>

            <div class="toper1">
                <asp:ImageButton CssClass="toper" ImageUrl="~/Image/Element/toper1.png" runat="server" PostBackUrl="~/FigureCategories/Nendoroid.aspx" />
            </div>

            <div class="toper2">
                <asp:ImageButton CssClass="toper" ImageUrl="~/Image/Element/toper2.png" runat="server" PostBackUrl="~/FigureCategories/ScaleFigure.aspx" />
            </div>
        </div>




        <!--Contents-->
        <div class="content-container">


            <!--Category 1-->
            <div class="contents">
                <div class="content-header">
                    SCALE FIGURES
                </div>
                <div id="carouselControl1" class="carousel itemslide" data-bs-ride="carousel">
                    <div class="carousel-inner">

                        <!--Each Display Maximum is 5 Items!!!-->
                        <!--Display1-->
                        <div class="carousel-item active center">
                            <div class="card-wrap">

                                <!--An Item-->
                                <div class="item">
                                    <div class="item-image">
                                        <asp:Image runat="server" CssClass="imgFigure" ID="Image8" ImageUrl="~/Image/Product/f2.jpg" />
                                    </div>
                                    <div class="item-name">
                                        <asp:Label ID="Label15" CssClass="sentence" runat="server" Text="TENITOL Jess"></asp:Label>
                                    </div>
                                    <div class="item-price">
                                        <asp:Label ID="Label16" runat="server" Text="RM 233.40"></asp:Label>
                                    </div>
                                    <div class="item-details">
                                        <div class="item-buy">
                                            <asp:LinkButton PostBackUrl="~/Customer/Cart.aspx?id=2&qty=1" runat="server">
                                                <i class="fa-solid fa-cart-shopping"></i>&nbsp;Buy
                                            </asp:LinkButton>
                                        </div>
                                        <div class="item-view">
                                            <asp:LinkButton PostBackUrl="~/Customer/IndividualFigure.aspx?id=2" runat="server">
                                                <i class="fa-solid fa-magnifying-glass-plus"></i>&nbsp;View
                                            </asp:LinkButton>
                                        </div>
                                    </div>
                                </div>
                                <!--End of An Item-->

                                <!--An Item-->
                                <div class="item">
                                    <div class="item-image">
                                        <asp:Image runat="server" CssClass="imgFigure" ID="Image9" ImageUrl="~/Image/Product/f3.jpg" />
                                    </div>
                                    <div class="item-name">
                                        <asp:Label ID="Label17" CssClass="sentence" runat="server" Text="Usada Pekora"></asp:Label>
                                    </div>
                                    <div class="item-price">
                                        <asp:Label ID="Label18" runat="server" Text="RM 1414.90"></asp:Label>
                                    </div>
                                    <div class="item-details">
                                        <div class="item-buy">
                                            <asp:LinkButton PostBackUrl="~/Customer/Cart.aspx?id=3&qty=1" runat="server">
                                                <i class="fa-solid fa-cart-shopping"></i>&nbsp;Buy
                                            </asp:LinkButton>
                                        </div>
                                        <div class="item-view">
                                            <asp:LinkButton PostBackUrl="~/Customer/IndividualFigure.aspx?id=3" runat="server">
                                                <i class="fa-solid fa-magnifying-glass-plus"></i>&nbsp;View
                                            </asp:LinkButton>
                                        </div>
                                    </div>
                                </div>
                                <!--End of An Item-->

                                <!--An Item-->
                                <div class="item">
                                    <div class="item-image">
                                        <asp:Image runat="server" CssClass="imgFigure" ID="Image10" ImageUrl="~/Image/Product/f4.jpg" />
                                    </div>
                                    <div class="item-name">
                                        <asp:Label ID="Label19" CssClass="sentence" runat="server" Text="Chen Hai"></asp:Label>
                                    </div>
                                    <div class="item-price">
                                        <asp:Label ID="Label20" runat="server" Text="RM 707.50"></asp:Label>
                                    </div>
                                    <div class="item-details">
                                        <div class="item-buy">
                                            <asp:LinkButton PostBackUrl="~/Customer/Cart.aspx?id=4&qty=1" runat="server">
                                                <i class="fa-solid fa-cart-shopping"></i>&nbsp;Buy
                                            </asp:LinkButton>
                                        </div>
                                        <div class="item-view">
                                            <asp:LinkButton PostBackUrl="~/Customer/IndividualFigure.aspx?id=4" runat="server">
                                                <i class="fa-solid fa-magnifying-glass-plus"></i>&nbsp;View
                                            </asp:LinkButton>
                                        </div>
                                    </div>
                                </div>
                                <!--End of An Item-->

                                <!--An Item-->
                                <div class="item">
                                    <div class="item-image">
                                        <asp:Image runat="server" CssClass="imgFigure" ID="Image11" ImageUrl="~/Image/Product/f5.jpg" />
                                    </div>
                                    <div class="item-name">
                                        <asp:Label ID="Label21" CssClass="sentence" runat="server" Text="Marcille Donato: Adding Color to the Dungeon"></asp:Label>
                                    </div>
                                    <div class="item-price">
                                        <asp:Label ID="Label22" runat="server" Text="RM 926.00"></asp:Label>
                                    </div>
                                    <div class="item-details">
                                        <div class="item-buy">
                                            <asp:LinkButton PostBackUrl="~/Customer/Cart.aspx?id=5&qty=1" runat="server">
                                                <i class="fa-solid fa-cart-shopping"></i>&nbsp;Buy
                                            </asp:LinkButton>
                                        </div>
                                        <div class="item-view">
                                            <asp:LinkButton PostBackUrl="~/Customer/IndividualFigure.aspx?id=5" runat="server">
                                                <i class="fa-solid fa-magnifying-glass-plus"></i>&nbsp;View
                                            </asp:LinkButton>
                                        </div>
                                    </div>
                                </div>
                                <!--End of An Item-->

                                <!--An Item-->
                                <div class="item">
                                    <div class="item-image">
                                        <asp:Image runat="server" CssClass="imgFigure" ID="Image12" ImageUrl="~/Image/Product/f6.jpg" />
                                    </div>
                                    <div class="item-name">
                                        <asp:Label ID="Label23" CssClass="sentence" runat="server" Text="Mikasa Ackerman: DX Ver."></asp:Label>
                                    </div>
                                    <div class="item-price">
                                        <asp:Label ID="Label24" runat="server" Text="RM 804.00"></asp:Label>
                                    </div>
                                    <div class="item-details">
                                        <div class="item-buy">
                                            <asp:LinkButton PostBackUrl="~/Customer/Cart.aspx?id=6&qty=1" runat="server">
                                                <i class="fa-solid fa-cart-shopping"></i>&nbsp;Buy
                                            </asp:LinkButton>
                                        </div>
                                        <div class="item-view">
                                            <asp:LinkButton PostBackUrl="~/Customer/IndividualFigure.aspx?id=6" runat="server">
                                                <i class="fa-solid fa-magnifying-glass-plus"></i>&nbsp;View
                                            </asp:LinkButton>
                                        </div>
                                    </div>
                                </div>
                                <!--End of An Item-->

                            </div>
                        </div>

                        <!--Display2-->
                        <div class="carousel-item">
                            <div class="card-wrap">

                                <!--An Item-->
                                <div class="item">
                                    <div class="item-image">
                                        <asp:Image runat="server" CssClass="imgFigure" ID="Image13" ImageUrl="~/Image/Product/f7.jpg" />
                                    </div>
                                    <div class="item-name">
                                        <asp:Label ID="Label25" CssClass="sentence" runat="server" Text="Kurige-chan"></asp:Label>
                                    </div>
                                    <div class="item-price">
                                        <asp:Label ID="Label26" runat="server" Text="RM 636.70"></asp:Label>
                                    </div>
                                    <div class="item-details">
                                        <div class="item-buy">
                                            <asp:LinkButton PostBackUrl="~/Customer/Cart.aspx?id=7&qty=1" runat="server">
                <i class="fa-solid fa-cart-shopping"></i>&nbsp;Buy
                                            </asp:LinkButton>
                                        </div>
                                        <div class="item-view">
                                            <asp:LinkButton PostBackUrl="~/Customer/IndividualFigure.aspx?id=7" runat="server">
                <i class="fa-solid fa-magnifying-glass-plus"></i>&nbsp;View
                                            </asp:LinkButton>
                                        </div>
                                    </div>
                                </div>
                                <!--End of An Item-->

                                <!--An Item-->
                                <div class="item">
                                    <div class="item-image">
                                        <asp:Image runat="server" CssClass="imgFigure" ID="Image14" ImageUrl="~/Image/Product/f8.jpg" />
                                    </div>
                                    <div class="item-name">
                                        <asp:Label ID="Label27" CssClass="sentence" runat="server" Text="POP UP PARADE Eren Yeager: Attack Titan Ver."></asp:Label>
                                    </div>
                                    <div class="item-price">
                                        <asp:Label ID="Label28" runat="server" Text="RM 154.00"></asp:Label>
                                    </div>
                                    <div class="item-details">
                                        <div class="item-buy">
                                            <asp:LinkButton PostBackUrl="~/Customer/Cart.aspx?id=8&qty=1" runat="server">
                <i class="fa-solid fa-cart-shopping"></i>&nbsp;Buy
                                            </asp:LinkButton>
                                        </div>
                                        <div class="item-view">
                                            <asp:LinkButton PostBackUrl="~/Customer/IndividualFigure.aspx?id=8" runat="server">
                <i class="fa-solid fa-magnifying-glass-plus"></i>&nbsp;View
                                            </asp:LinkButton>
                                        </div>
                                    </div>
                                </div>
                                <!--End of An Item-->

                                <!--An Item-->
                                <div class="item">
                                    <div class="item-image">
                                        <asp:Image runat="server" CssClass="imgFigure" ID="Image15" ImageUrl="~/Image/Product/f9.jpg" />
                                    </div>
                                    <div class="item-name">
                                        <asp:Label ID="Label29" CssClass="sentence" runat="server" Text="Racing Miku 2021: Private Ver."></asp:Label>
                                    </div>
                                    <div class="item-price">
                                        <asp:Label ID="Label30" runat="server" Text="RM 959.00"></asp:Label>
                                    </div>
                                    <div class="item-details">
                                        <div class="item-buy">
                                            <asp:LinkButton PostBackUrl="~/Customer/Cart.aspx?id=9&qty=1" runat="server">
                <i class="fa-solid fa-cart-shopping"></i>&nbsp;Buy
                                            </asp:LinkButton>
                                        </div>
                                        <div class="item-view">
                                            <asp:LinkButton PostBackUrl="~/Customer/IndividualFigure.aspx?id=9" runat="server">
                <i class="fa-solid fa-magnifying-glass-plus"></i>&nbsp;View
                                            </asp:LinkButton>
                                        </div>
                                    </div>
                                </div>
                                <!--End of An Item-->

                                <!--An Item-->
                                <div class="item">
                                    <div class="item-image">
                                        <asp:Image runat="server" CssClass="imgFigure" ID="Image7" ImageUrl="~/Image/Product/f41.jpg" />
                                    </div>
                                    <div class="item-name">
                                        <asp:Label ID="Label47" CssClass="sentence" runat="server" Text="Goblin Slayer"></asp:Label>
                                    </div>
                                    <div class="item-price">
                                        <asp:Label ID="Label48" runat="server" Text="RM 127.50"></asp:Label>
                                    </div>
                                    <div class="item-details">
                                        <div class="item-buy">
                                            <asp:LinkButton PostBackUrl="~/Customer/Cart.aspx?id=10&qty=1" runat="server">
                <i class="fa-solid fa-cart-shopping"></i>&nbsp;Buy
                                            </asp:LinkButton>
                                        </div>
                                        <div class="item-view">
                                            <asp:LinkButton PostBackUrl="~/Customer/IndividualFigure.aspx?id=10" runat="server">
                <i class="fa-solid fa-magnifying-glass-plus"></i>&nbsp;View
                                            </asp:LinkButton>
                                        </div>
                                    </div>
                                </div>
                                <!--End of An Item-->

                                <!--An Item-->
                                <div class="item">
                                    <div class="item-image">
                                        <asp:Image runat="server" CssClass="imgFigure" ID="Image24" ImageUrl="~/Image/Product/f42.jpg" />
                                    </div>
                                    <div class="item-name">
                                        <asp:Label ID="Label13" CssClass="sentence" runat="server" Text="Izuku Midoriya: Deku Ver"></asp:Label>
                                    </div>
                                    <div class="item-price">
                                        <asp:Label ID="Label14" runat="server" Text="RM 933.50"></asp:Label>
                                    </div>
                                    <div class="item-details">
                                        <div class="item-buy">
                                            <asp:LinkButton PostBackUrl="~/Customer/Cart.aspx?id=11&qty=1" runat="server">
                    <i class="fa-solid fa-cart-shopping"></i>&nbsp;Buy
                                            </asp:LinkButton>
                                        </div>
                                        <div class="item-view">
                                            <asp:LinkButton PostBackUrl="~/Customer/IndividualFigure.aspx?id=11" runat="server">
                    <i class="fa-solid fa-magnifying-glass-plus"></i>&nbsp;View
                                            </asp:LinkButton>
                                        </div>
                                    </div>
                                </div>
                                <!--End of An Item-->

                            </div>
                        </div>

                    </div>
                    <asp:LinkButton ID="LinkButton3" runat="server" CssClass="carousel-control-prev" data-bs-target="#carouselControl1" data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                    </asp:LinkButton>

                    <asp:LinkButton ID="LinkButton4" runat="server" CssClass="carousel-control-next" data-bs-target="#carouselControl1" data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                    </asp:LinkButton>
                </div>
            </div>
            <!--End of 1 Category-->



            <!--Category 2-->
            <div class="contents">
                <div class="content-header">
                    NENDOROIDS
                </div>
                <div id="carouselControl2" class="carousel itemslide" data-bs-ride="carousel">
                    <div class="carousel-inner">

                        <!--Each Display Maximum is 5 Items!!!-->
                        <!--Display1-->
                        <div class="carousel-item active">
                            <div class="card-wrap">

                                <!--An Item-->
                                <div class="item">
                                    <div class="item-image">
                                        <asp:Image runat="server" CssClass="imgFigure" ID="Image16" ImageUrl="~/Image/Product/f1.jpg" />
                                    </div>
                                    <div class="item-name">
                                        <asp:Label ID="Label31" CssClass="sentence" runat="server" Text="Nendoroid Frieren"></asp:Label>
                                    </div>
                                    <div class="item-price">
                                        <asp:Label ID="Label32" runat="server" Text="RM 209.00"></asp:Label>
                                    </div>
                                    <div class="item-details">
                                        <div class="item-buy">
                                            <asp:LinkButton PostBackUrl="~/Customer/Cart.aspx?id=1&qty=1" runat="server">
                                                <i class="fa-solid fa-cart-shopping"></i>&nbsp;Buy
                                            </asp:LinkButton>
                                        </div>
                                        <div class="item-view">
                                            <asp:LinkButton runat="server" PostBackUrl="~/Customer/IndividualFigure.aspx?id=1">
                                                <i class="fa-solid fa-magnifying-glass-plus"></i>&nbsp;View
                                            </asp:LinkButton>
                                        </div>
                                    </div>
                                </div>
                                <!--End of An Item-->

                                <!--An Item-->
                                <div class="item">
                                    <div class="item-image">
                                        <asp:Image runat="server" CssClass="imgFigure" ID="Image17" ImageUrl="~/Image/Product/f10.jpg" />
                                    </div>
                                    <div class="item-name">
                                        <asp:Label ID="Label33" CssClass="sentence" runat="server" Text="Nendoroid Chisato Nishikigi: Cafe LycoReco Uniform Ver."></asp:Label>
                                    </div>
                                    <div class="item-price">
                                        <asp:Label ID="Label34" runat="server" Text="RM 200.00"></asp:Label>
                                    </div>
                                    <div class="item-details">
                                        <div class="item-buy">
                                            <asp:LinkButton PostBackUrl="~/Customer/Cart.aspx?id=12&qty=1" runat="server">
                                                <i class="fa-solid fa-cart-shopping"></i>&nbsp;Buy
                                            </asp:LinkButton>
                                        </div>
                                        <div class="item-view">
                                            <asp:LinkButton runat="server" PostBackUrl="~/Customer/IndividualFigure.aspx?id=12">
                                                <i class="fa-solid fa-magnifying-glass-plus"></i>&nbsp;View
                                            </asp:LinkButton>
                                        </div>
                                    </div>
                                </div>
                                <!--End of An Item-->

                                <!--An Item-->
                                <div class="item">
                                    <div class="item-image">
                                        <asp:Image runat="server" CssClass="imgFigure" ID="Image18" ImageUrl="~/Image/Product/f11.jpg" />
                                    </div>
                                    <div class="item-name">
                                        <asp:Label ID="Label35" CssClass="sentence" runat="server" Text="Nendoroid Takina Inoue: Cafe LycoReco Uniform Ver."></asp:Label>
                                    </div>
                                    <div class="item-price">
                                        <asp:Label ID="Label36" runat="server" Text="RM 200.00"></asp:Label>
                                    </div>
                                    <div class="item-details">
                                        <div class="item-buy">
                                            <asp:LinkButton PostBackUrl="~/Customer/Cart.aspx?id=13&qty=1" runat="server">
                                                <i class="fa-solid fa-cart-shopping"></i>&nbsp;Buy
                                            </asp:LinkButton>
                                        </div>
                                        <div class="item-view">
                                            <asp:LinkButton runat="server" PostBackUrl="~/Customer/IndividualFigure.aspx?id=13">
                                                <i class="fa-solid fa-magnifying-glass-plus"></i>&nbsp;View
                                            </asp:LinkButton>
                                        </div>
                                    </div>
                                </div>
                                <!--End of An Item-->

                                <!--An Item-->
                                <div class="item">
                                    <div class="item-image">
                                        <asp:Image runat="server" CssClass="imgFigure" ID="Image19" ImageUrl="~/Image/Product/f12.jpg" />
                                    </div>
                                    <div class="item-name">
                                        <asp:Label ID="Label37" CssClass="sentence" runat="server" Text="Nendoroid Fern"></asp:Label>
                                    </div>
                                    <div class="item-price">
                                        <asp:Label ID="Label38" runat="server" Text="RM 189.00"></asp:Label>
                                    </div>
                                    <div class="item-details">
                                        <div class="item-buy">
                                            <asp:LinkButton PostBackUrl="~/Customer/Cart.aspx?id=14&qty=1" runat="server">
                                                <i class="fa-solid fa-cart-shopping"></i>&nbsp;Buy
                                            </asp:LinkButton>
                                        </div>
                                        <div class="item-view">
                                            <asp:LinkButton runat="server" PostBackUrl="~/Customer/IndividualFigure.aspx?id=14">
                                                <i class="fa-solid fa-magnifying-glass-plus"></i>&nbsp;View
                                            </asp:LinkButton>
                                        </div>
                                    </div>
                                </div>
                                <!--End of An Item-->

                                <!--An Item-->
                                <div class="item">
                                    <div class="item-image">
                                        <asp:Image runat="server" CssClass="imgFigure" ID="Image20" ImageUrl="~/Image/Product/f13.jpg" />
                                    </div>
                                    <div class="item-name">
                                        <asp:Label ID="Label39" CssClass="sentence" runat="server" Text="Nendoroid Shiroko Sunaookami"></asp:Label>
                                    </div>
                                    <div class="item-price">
                                        <asp:Label ID="Label40" runat="server" Text="RM 254.00"></asp:Label>
                                    </div>
                                    <div class="item-details">
                                        <div class="item-buy">
                                            <asp:LinkButton PostBackUrl="~/Customer/Cart.aspx?id=15&qty=1" runat="server">
                                                <i class="fa-solid fa-cart-shopping"></i>&nbsp;Buy
                                            </asp:LinkButton>
                                        </div>
                                        <div class="item-view">
                                            <asp:LinkButton runat="server" PostBackUrl="~/Customer/IndividualFigure.aspx?id=15">
                                                <i class="fa-solid fa-magnifying-glass-plus"></i>&nbsp;View
                                            </asp:LinkButton>
                                        </div>
                                    </div>
                                </div>
                                <!--End of An Item-->

                            </div>
                        </div>

                        <!--Display2-->
                        <div class="carousel-item">
                            <div class="card-wrap">

                                <!--An Item-->
                                <div class="item">
                                    <div class="item-image">
                                        <asp:Image runat="server" CssClass="imgFigure" ID="Image21" ImageUrl="~/Image/Product/f14.jpg" />
                                    </div>
                                    <div class="item-name">
                                        <asp:Label ID="Label41" CssClass="sentence" runat="server" Text="Nendoroid Shigure Ui"></asp:Label>
                                    </div>
                                    <div class="item-price">
                                        <asp:Label ID="Label42" runat="server" Text="RM 241.10"></asp:Label>
                                    </div>
                                    <div class="item-details">
                                        <div class="item-buy">
                                            <asp:LinkButton PostBackUrl="~/Customer/Cart.aspx?id=16&qty=1" runat="server">
                <i class="fa-solid fa-cart-shopping"></i>&nbsp;Buy
                                            </asp:LinkButton>
                                        </div>
                                        <div class="item-view">
                                            <asp:LinkButton runat="server" PostBackUrl="~/Customer/IndividualFigure.aspx?id=16">
                <i class="fa-solid fa-magnifying-glass-plus"></i>&nbsp;View
                                            </asp:LinkButton>
                                        </div>
                                    </div>
                                </div>
                                <!--End of An Item-->

                                <!--An Item-->
                                <div class="item">
                                    <div class="item-image">
                                        <asp:Image runat="server" CssClass="imgFigure" ID="Image22" ImageUrl="~/Image/Product/f15.jpg" />
                                    </div>
                                    <div class="item-name">
                                        <asp:Label ID="Label43" CssClass="sentence" runat="server" Text="Nendoroid Minato Aqua"></asp:Label>
                                    </div>
                                    <div class="item-price">
                                        <asp:Label ID="Label44" runat="server" Text="RM 196.20"></asp:Label>
                                    </div>
                                    <div class="item-details">
                                        <div class="item-buy">
                                            <asp:LinkButton PostBackUrl="~/Customer/Cart.aspx?id=17&qty=1" runat="server">
                <i class="fa-solid fa-cart-shopping"></i>&nbsp;Buy
                                            </asp:LinkButton>
                                        </div>
                                        <div class="item-view">
                                            <asp:LinkButton runat="server" PostBackUrl="~/Customer/IndividualFigure.aspx?id=17">
                <i class="fa-solid fa-magnifying-glass-plus"></i>&nbsp;View
                                            </asp:LinkButton>
                                        </div>
                                    </div>
                                </div>
                                <!--End of An Item-->

                                <!--An Item-->
                                <div class="item">
                                    <div class="item-image">
                                        <asp:Image runat="server" CssClass="imgFigure" ID="Image23" ImageUrl="~/Image/Product/f16.jpg" />
                                    </div>
                                    <div class="item-name">
                                        <asp:Label ID="Label45" CssClass="sentence" runat="server" Text="Nendoroid Cheshire"></asp:Label>
                                    </div>
                                    <div class="item-price">
                                        <asp:Label ID="Label46" runat="server" Text="RM 257.30"></asp:Label>
                                    </div>
                                    <div class="item-details">
                                        <div class="item-buy">
                                            <asp:LinkButton PostBackUrl="~/Customer/Cart.aspx?id=18&qty=1" runat="server">
                <i class="fa-solid fa-cart-shopping"></i>&nbsp;Buy
                                            </asp:LinkButton>
                                        </div>
                                        <div class="item-view">
                                            <asp:LinkButton runat="server" PostBackUrl="~/Customer/IndividualFigure.aspx?id=18">
                <i class="fa-solid fa-magnifying-glass-plus"></i>&nbsp;View
                                            </asp:LinkButton>
                                        </div>
                                    </div>
                                </div>
                                <!--End of An Item-->

                                <!--An Item-->
                                <div class="item">
                                    <div class="item-image">
                                        <asp:Image runat="server" CssClass="imgFigure" ID="Image25" ImageUrl="~/Image/Product/f39.jpg" />
                                    </div>
                                    <div class="item-name">
                                        <asp:Label ID="Label49" CssClass="sentence" runat="server" Text="Nendoroid Saitama"></asp:Label>
                                    </div>
                                    <div class="item-price">
                                        <asp:Label ID="Label50" runat="server" Text="RM 135.00"></asp:Label>
                                    </div>
                                    <div class="item-details">
                                        <div class="item-buy">
                                            <asp:LinkButton PostBackUrl="~/Customer/Cart.aspx?id=41&qty=1" runat="server">
<i class="fa-solid fa-cart-shopping"></i>&nbsp;Buy
                                            </asp:LinkButton>
                                        </div>
                                        <div class="item-view">
                                            <asp:LinkButton runat="server" PostBackUrl="~/Customer/IndividualFigure.aspx?id=41">
<i class="fa-solid fa-magnifying-glass-plus"></i>&nbsp;View
                                            </asp:LinkButton>
                                        </div>
                                    </div>
                                </div>
                                <!--End of An Item-->

                                <!--An Item-->
                                <div class="item">
                                    <div class="item-image">
                                        <asp:Image runat="server" CssClass="imgFigure" ID="Image26" ImageUrl="~/Image/Product/f40.jpg" />
                                    </div>
                                    <div class="item-name">
                                        <asp:Label ID="Label51" CssClass="sentence" runat="server" Text="Nendoroid of Bond"></asp:Label>
                                    </div>
                                    <div class="item-price">
                                        <asp:Label ID="Label52" runat="server" Text="RM 208.00"></asp:Label>
                                    </div>
                                    <div class="item-details">
                                        <div class="item-buy">
                                            <asp:LinkButton PostBackUrl="~/Customer/Cart.aspx?id=42&qty=1" runat="server">
<i class="fa-solid fa-cart-shopping"></i>&nbsp;Buy
                                            </asp:LinkButton>
                                        </div>
                                        <div class="item-view">
                                            <asp:LinkButton runat="server" PostBackUrl="~/Customer/IndividualFigure.aspx?id=42">
<i class="fa-solid fa-magnifying-glass-plus"></i>&nbsp;View
                                            </asp:LinkButton>
                                        </div>
                                    </div>
                                </div>
                                <!--End of An Item-->

                            </div>
                        </div>

                    </div>
                    <asp:LinkButton ID="LinkButton5" runat="server" CssClass="carousel-control-prev" data-bs-target="#carouselControl2" data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                    </asp:LinkButton>

                    <asp:LinkButton ID="LinkButton6" runat="server" CssClass="carousel-control-next" data-bs-target="#carouselControl2" data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                    </asp:LinkButton>
                </div>
            </div>
            <!--End of 1 Category-->



            <!--Category 3-->
            <div class="contents">
                <div class="content-header">
                    DOLLS
                </div>
                <div id="carouselControl3" class="carousel itemslide" data-bs-ride="carousel">
                    <div class="carousel-inner">

                        <!--Each Display Maximum is 5 Items!!!-->
                        <!--Display1-->
                        <div class="carousel-item active">
                            <div class="card-wrap">

                                <!--An Item-->
                                <div class="item">
                                    <div class="item-image">
                                        <asp:Image runat="server" CssClass="imgFigure" ID="imgFigure" ImageUrl="~/Image/Product/f17.jpg" />
                                    </div>
                                    <div class="item-name">
                                        <asp:Label ID="lblName" CssClass="sentence" runat="server" Text="Shangri-La Frontier Plushie Emul"></asp:Label>
                                    </div>
                                    <div class="item-price">
                                        <asp:Label ID="lblPrice" runat="server" Text="RM 106.00"></asp:Label>
                                    </div>
                                    <div class="item-details">
                                        <div class="item-buy">
                                            <asp:LinkButton PostBackUrl="~/Customer/Cart.aspx?id=19&qty=1" runat="server">
                                                <i class="fa-solid fa-cart-shopping"></i>&nbsp;Buy
                                            </asp:LinkButton>
                                        </div>
                                        <div class="item-view">
                                            <asp:LinkButton runat="server" PostBackUrl="~/Customer/IndividualFigure.aspx?id=19">
                                                <i class="fa-solid fa-magnifying-glass-plus"></i>&nbsp;View
                                            </asp:LinkButton>
                                        </div>
                                    </div>
                                </div>
                                <!--End of An Item-->

                                <!--An Item-->
                                <div class="item">
                                    <div class="item-image">
                                        <asp:Image runat="server" CssClass="imgFigure" ID="Image1" ImageUrl="~/Image/Product/f18.jpg" />
                                    </div>
                                    <div class="item-name">
                                        <asp:Label ID="Label1" CssClass="sentence" runat="server" Text="Shangri-La Frontier Plushie Sunraku"></asp:Label>
                                    </div>
                                    <div class="item-price">
                                        <asp:Label ID="Label2" runat="server" Text="RM 106.00"></asp:Label>
                                    </div>
                                    <div class="item-details">
                                        <div class="item-buy">
                                            <asp:LinkButton PostBackUrl="~/Customer/Cart.aspx?id=20&qty=1" runat="server">
                                                <i class="fa-solid fa-cart-shopping"></i>&nbsp;Buy
                                            </asp:LinkButton>
                                        </div>
                                        <div class="item-view">
                                            <asp:LinkButton runat="server" PostBackUrl="~/Customer/IndividualFigure.aspx?id=20">
                                                <i class="fa-solid fa-magnifying-glass-plus"></i>&nbsp;View
                                            </asp:LinkButton>
                                        </div>
                                    </div>
                                </div>
                                <!--End of An Item-->

                                <!--An Item-->
                                <div class="item">
                                    <div class="item-image">
                                        <asp:Image runat="server" CssClass="imgFigure" ID="Image2" ImageUrl="~/Image/Product/f19.jpg" />
                                    </div>
                                    <div class="item-name">
                                        <asp:Label ID="Label3" CssClass="sentence" runat="server" Text="Love Live! Nijigasaki High School Idol Club Plushie Ayumu Uehara"></asp:Label>
                                    </div>
                                    <div class="item-price">
                                        <asp:Label ID="Label4" runat="server" Text="RM 141.50"></asp:Label>
                                    </div>
                                    <div class="item-details">
                                        <div class="item-buy">
                                            <asp:LinkButton PostBackUrl="~/Customer/Cart.aspx?id=21&qty=1" runat="server">
                                                <i class="fa-solid fa-cart-shopping"></i>&nbsp;Buy
                                            </asp:LinkButton>
                                        </div>
                                        <div class="item-view">
                                            <asp:LinkButton runat="server" PostBackUrl="~/Customer/IndividualFigure.aspx?id=21">
                                                <i class="fa-solid fa-magnifying-glass-plus"></i>&nbsp;View
                                            </asp:LinkButton>
                                        </div>
                                    </div>
                                </div>
                                <!--End of An Item-->

                                <!--An Item-->
                                <div class="item">
                                    <div class="item-image">
                                        <asp:Image runat="server" CssClass="imgFigure" ID="Image3" ImageUrl="~/Image/Product/f20.jpg" />
                                    </div>
                                    <div class="item-name">
                                        <asp:Label ID="Label5" CssClass="sentence" runat="server" Text="Attack on Titan Cart Titan Plushie"></asp:Label>
                                    </div>
                                    <div class="item-price">
                                        <asp:Label ID="Label6" runat="server" Text="RM 530.60"></asp:Label>
                                    </div>
                                    <div class="item-details">
                                        <div class="item-buy">
                                            <asp:LinkButton PostBackUrl="~/Customer/Cart.aspx?id=22&qty=1" runat="server">
                                                <i class="fa-solid fa-cart-shopping"></i>&nbsp;Buy
                                            </asp:LinkButton>
                                        </div>
                                        <div class="item-view">
                                            <asp:LinkButton runat="server" PostBackUrl="~/Customer/IndividualFigure.aspx?id=22">
                                                <i class="fa-solid fa-magnifying-glass-plus"></i>&nbsp;View
                                            </asp:LinkButton>
                                        </div>
                                    </div>
                                </div>
                                <!--End of An Item-->

                                <!--An Item-->
                                <div class="item">
                                    <div class="item-image">
                                        <asp:Image runat="server" CssClass="imgFigure" ID="Image4" ImageUrl="~/Image/Product/f21.jpg" />
                                    </div>
                                    <div class="item-name">
                                        <asp:Label ID="Label7" CssClass="sentence" runat="server" Text="Atelier Ryza: Ever Darkness & the Secret Hideout The Animation Plushie Reisalin Stout"></asp:Label>
                                    </div>
                                    <div class="item-price">
                                        <asp:Label ID="Label8" runat="server" Text="RM 141.50"></asp:Label>
                                    </div>
                                    <div class="item-details">
                                        <div class="item-buy">
                                            <asp:LinkButton PostBackUrl="~/Customer/Cart.aspx?id=23&qty=1" runat="server">
                                                <i class="fa-solid fa-cart-shopping"></i>&nbsp;Buy
                                            </asp:LinkButton>
                                        </div>
                                        <div class="item-view">
                                            <asp:LinkButton runat="server" PostBackUrl="~/Customer/IndividualFigure.aspx?id=23">
                                                <i class="fa-solid fa-magnifying-glass-plus"></i>&nbsp;View
                                            </asp:LinkButton>
                                        </div>
                                    </div>
                                </div>
                                <!--End of An Item-->

                            </div>
                        </div>

                        <!--Display2-->
                        <div class="carousel-item">
                            <div class="card-wrap">

                                <!--An Item-->
                                <div class="item">
                                    <div class="item-image">
                                        <asp:Image runat="server" CssClass="imgFigure" ID="Image5" ImageUrl="~/Image/Product/f22.jpg" />
                                    </div>
                                    <div class="item-name">
                                        <asp:Label ID="Label9" CssClass="sentence" runat="server" Text="Frieren: Beyond Journey's End Plushie Frieren"></asp:Label>
                                    </div>
                                    <div class="item-price">
                                        <asp:Label ID="Label10" runat="server" Text="RM 141.50"></asp:Label>
                                    </div>
                                    <div class="item-details">
                                        <div class="item-buy">
                                            <asp:LinkButton PostBackUrl="~/Customer/Cart.aspx?id=24&qty=1" runat="server">
                <i class="fa-solid fa-cart-shopping"></i>&nbsp;Buy
                                            </asp:LinkButton>
                                        </div>
                                        <div class="item-view">
                                            <asp:LinkButton runat="server" PostBackUrl="~/Customer/IndividualFigure.aspx?id=24">
                <i class="fa-solid fa-magnifying-glass-plus"></i>&nbsp;View
                                            </asp:LinkButton>
                                        </div>
                                    </div>
                                </div>
                                <!--End of An Item-->

                                <!--An Item-->
                                <div class="item">
                                    <div class="item-image">
                                        <asp:Image runat="server" CssClass="imgFigure" ID="Image6" ImageUrl="~/Image/Product/f23.jpg" />
                                    </div>
                                    <div class="item-name">
                                        <asp:Label ID="Label11" CssClass="sentence" runat="server" Text="Sword Art Online the Movie -Progressive- Scherzo of Deep Night Plushie Asuna"></asp:Label>
                                    </div>
                                    <div class="item-price">
                                        <asp:Label ID="Label12" runat="server" Text="RM 160.00"></asp:Label>
                                    </div>
                                    <div class="item-details">
                                        <div class="item-buy">
                                            <asp:LinkButton PostBackUrl="~/Customer/Cart.aspx?id=25&qty=1" runat="server">
                <i class="fa-solid fa-cart-shopping"></i>&nbsp;Buy
                                            </asp:LinkButton>
                                        </div>
                                        <div class="item-view">
                                            <asp:LinkButton runat="server" PostBackUrl="~/Customer/IndividualFigure.aspx?id=25">
                <i class="fa-solid fa-magnifying-glass-plus"></i>&nbsp;View
                                            </asp:LinkButton>
                                        </div>
                                    </div>
                                </div>
                                <!--End of An Item-->

                                <!--An Item-->
                                <div class="item">
                                    <div class="item-image">
                                        <asp:Image runat="server" CssClass="imgFigure" ID="Image27" ImageUrl="~/Image/Product/f36.jpg" />
                                    </div>
                                    <div class="item-name">
                                        <asp:Label ID="Label53" CssClass="sentence" runat="server" Text="Cyberpunk: Edgerunners Plushie Rebecca"></asp:Label>
                                    </div>
                                    <div class="item-price">
                                        <asp:Label ID="Label54" runat="server" Text="RM 123.00"></asp:Label>
                                    </div>
                                    <div class="item-details">
                                        <div class="item-buy">
                                            <asp:LinkButton PostBackUrl="~/Customer/Cart.aspx?id=38&qty=1" runat="server">
<i class="fa-solid fa-cart-shopping"></i>&nbsp;Buy
                                            </asp:LinkButton>
                                        </div>
                                        <div class="item-view">
                                            <asp:LinkButton runat="server" PostBackUrl="~/Customer/IndividualFigure.aspx?id=38">
<i class="fa-solid fa-magnifying-glass-plus"></i>&nbsp;View
                                            </asp:LinkButton>
                                        </div>
                                    </div>
                                </div>
                                <!--End of An Item-->

                                <!--An Item-->
                                <div class="item">
                                    <div class="item-image">
                                        <asp:Image runat="server" CssClass="imgFigure" ID="Image28" ImageUrl="~/Image/Product/f37.jpg" />
                                    </div>
                                    <div class="item-name">
                                        <asp:Label ID="Label55" CssClass="sentence" runat="server" Text="BLUELOCK Plushie Isagi Yoichi"></asp:Label>
                                    </div>
                                    <div class="item-price">
                                        <asp:Label ID="Label56" runat="server" Text="RM 138.00"></asp:Label>
                                    </div>
                                    <div class="item-details">
                                        <div class="item-buy">
                                            <asp:LinkButton PostBackUrl="~/Customer/Cart.aspx?id=39&qty=1" runat="server">
<i class="fa-solid fa-cart-shopping"></i>&nbsp;Buy
                                            </asp:LinkButton>
                                        </div>
                                        <div class="item-view">
                                            <asp:LinkButton runat="server" PostBackUrl="~/Customer/IndividualFigure.aspx?id=39">
<i class="fa-solid fa-magnifying-glass-plus"></i>&nbsp;View
                                            </asp:LinkButton>
                                        </div>
                                    </div>
                                </div>
                                <!--End of An Item-->

                                <!--An Item-->
                                <div class="item">
                                    <div class="item-image">
                                        <asp:Image runat="server" CssClass="imgFigure" ID="Image29" ImageUrl="~/Image/Product/f38.jpg" />
                                    </div>
                                    <div class="item-name">
                                        <asp:Label ID="Label57" CssClass="sentence" runat="server" Text="Hatsune Miku NT Big Plushie"></asp:Label>
                                    </div>
                                    <div class="item-price">
                                        <asp:Label ID="Label58" runat="server" Text="RM 598.90"></asp:Label>
                                    </div>
                                    <div class="item-details">
                                        <div class="item-buy">
                                            <asp:LinkButton PostBackUrl="~/Customer/Cart.aspx?id=40&qty=1" runat="server">
<i class="fa-solid fa-cart-shopping"></i>&nbsp;Buy
                                            </asp:LinkButton>
                                        </div>
                                        <div class="item-view">
                                            <asp:LinkButton runat="server" PostBackUrl="~/Customer/IndividualFigure.aspx?id=40">
<i class="fa-solid fa-magnifying-glass-plus"></i>&nbsp;View
                                            </asp:LinkButton>
                                        </div>
                                    </div>
                                </div>
                                <!--End of An Item-->

                            </div>
                        </div>

                    </div>
                    <asp:LinkButton ID="LinkButton1" runat="server" CssClass="carousel-control-prev" data-bs-target="#carouselControl3" data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                    </asp:LinkButton>

                    <asp:LinkButton ID="LinkButton2" runat="server" CssClass="carousel-control-next" data-bs-target="#carouselControl3" data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                    </asp:LinkButton>
                </div>
            </div>
            <!--End of 1 Category-->


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
