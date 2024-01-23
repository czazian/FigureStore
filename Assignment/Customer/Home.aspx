<%@ Page Title="" Language="C#" MasterPageFile="~/Cust.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Assignment.Customer.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="Home.css" />
    <script src="Home.js" type="text/javascript"></script>
</asp:Content>


<%--Content here--%>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!--Banners-->


    <div class="slider" style="position: relative;">
        <div style="overflow: hidden; height: 350px; width: contain; position: absolute;">
            <video autoplay loop muted class="slider-background">
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
                <div id="carouselControl1"  class="carousel itemslide" data-bs-ride="carousel">
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
                                        <asp:Label ID="Label16" runat="server" Text="RM 100.00"></asp:Label>
                                    </div>
                                    <div class="item-details">
                                        <div class="item-buy">
                                            <asp:LinkButton runat="server">
                                                <i class="fa-solid fa-cart-shopping"></i>&nbsp;Buy
                                            </asp:LinkButton>
                                        </div>
                                        <div class="item-view">
                                            <asp:LinkButton PostBackUrl="~/Customer/IndividualFigure.aspx" runat="server">
                                                <i class="fa-solid fa-magnifying-glass-plus"></i>&nbsp;View
                                            </asp:LinkButton>
                                        </div>
                                    </div>
                                </div>
                                <!--End of An Item-->

                                <!--An Item-->
                                <div class="item">
                                    <div class="item-image">
                                        <asp:Image runat="server" CssClass="imgFigure" ID="Image9" ImageUrl="~/Image/Product/f1.jpg" />
                                    </div>
                                    <div class="item-name">
                                        <asp:Label ID="Label17" CssClass="sentence" runat="server" Text="Nendoroid Frieren"></asp:Label>
                                    </div>
                                    <div class="item-price">
                                        <asp:Label ID="Label18" runat="server" Text="RM 100.00"></asp:Label>
                                    </div>
                                    <div class="item-details">
                                        <div class="item-buy">
                                            <asp:LinkButton runat="server">
                                                <i class="fa-solid fa-cart-shopping"></i>&nbsp;Buy
                                            </asp:LinkButton>
                                        </div>
                                        <div class="item-view">
                                            <asp:LinkButton PostBackUrl="~/Customer/IndividualFigure.aspx" runat="server">
                                                <i class="fa-solid fa-magnifying-glass-plus"></i>&nbsp;View
                                            </asp:LinkButton>
                                        </div>
                                    </div>
                                </div>
                                <!--End of An Item-->

                                <!--An Item-->
                                <div class="item">
                                    <div class="item-image">
                                        <asp:Image runat="server" CssClass="imgFigure" ID="Image10" ImageUrl="~/Image/Product/f1.jpg" />
                                    </div>
                                    <div class="item-name">
                                        <asp:Label ID="Label19" CssClass="sentence" runat="server" Text="Nendoroid Frieren"></asp:Label>
                                    </div>
                                    <div class="item-price">
                                        <asp:Label ID="Label20" runat="server" Text="RM 100.00"></asp:Label>
                                    </div>
                                    <div class="item-details">
                                        <div class="item-buy">
                                            <asp:LinkButton runat="server">
                                                <i class="fa-solid fa-cart-shopping"></i>&nbsp;Buy
                                            </asp:LinkButton>
                                        </div>
                                        <div class="item-view">
                                            <asp:LinkButton PostBackUrl="~/Customer/IndividualFigure.aspx" runat="server">
                                                <i class="fa-solid fa-magnifying-glass-plus"></i>&nbsp;View
                                            </asp:LinkButton>
                                        </div>
                                    </div>
                                </div>
                                <!--End of An Item-->

                                <!--An Item-->
                                <div class="item">
                                    <div class="item-image">
                                        <asp:Image runat="server" CssClass="imgFigure" ID="Image11" ImageUrl="~/Image/Product/f1.jpg" />
                                    </div>
                                    <div class="item-name">
                                        <asp:Label ID="Label21" CssClass="sentence" runat="server" Text="Nendoroid Frieren"></asp:Label>
                                    </div>
                                    <div class="item-price">
                                        <asp:Label ID="Label22" runat="server" Text="RM 100.00"></asp:Label>
                                    </div>
                                    <div class="item-details">
                                        <div class="item-buy">
                                            <asp:LinkButton runat="server">
                                                <i class="fa-solid fa-cart-shopping"></i>&nbsp;Buy
                                            </asp:LinkButton>
                                        </div>
                                        <div class="item-view">
                                            <asp:LinkButton PostBackUrl="~/Customer/IndividualFigure.aspx" runat="server">
                                                <i class="fa-solid fa-magnifying-glass-plus"></i>&nbsp;View
                                            </asp:LinkButton>
                                        </div>
                                    </div>
                                </div>
                                <!--End of An Item-->

                                <!--An Item-->
                                <div class="item">
                                    <div class="item-image">
                                        <asp:Image runat="server" CssClass="imgFigure" ID="Image12" ImageUrl="~/Image/Product/f1.jpg" />
                                    </div>
                                    <div class="item-name">
                                        <asp:Label ID="Label23" CssClass="sentence" runat="server" Text="Nendoroid Frieren"></asp:Label>
                                    </div>
                                    <div class="item-price">
                                        <asp:Label ID="Label24" runat="server" Text="RM 100.00"></asp:Label>
                                    </div>
                                    <div class="item-details">
                                        <div class="item-buy">
                                            <asp:LinkButton runat="server">
                                                <i class="fa-solid fa-cart-shopping"></i>&nbsp;Buy
                                            </asp:LinkButton>
                                        </div>
                                        <div class="item-view">
                                            <asp:LinkButton PostBackUrl="~/Customer/IndividualFigure.aspx" runat="server">
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
                                        <asp:Image runat="server" CssClass="imgFigure" ID="Image13" ImageUrl="~/Image/Product/f1.jpg" />
                                    </div>
                                    <div class="item-name">
                                        <asp:Label ID="Label25" CssClass="sentence" runat="server" Text="Nendoroid Frieren"></asp:Label>
                                    </div>
                                    <div class="item-price">
                                        <asp:Label ID="Label26" runat="server" Text="RM 100.00"></asp:Label>
                                    </div>
                                    <div class="item-details">
                                        <div class="item-buy">
                                            <asp:LinkButton runat="server">
                <i class="fa-solid fa-cart-shopping"></i>&nbsp;Buy
                                            </asp:LinkButton>
                                        </div>
                                        <div class="item-view">
                                            <asp:LinkButton PostBackUrl="~/Customer/IndividualFigure.aspx" runat="server">
                <i class="fa-solid fa-magnifying-glass-plus"></i>&nbsp;View
                                            </asp:LinkButton>
                                        </div>
                                    </div>
                                </div>
                                <!--End of An Item-->

                                <!--An Item-->
                                <div class="item">
                                    <div class="item-image">
                                        <asp:Image runat="server" CssClass="imgFigure" ID="Image14" ImageUrl="~/Image/Product/f1.jpg" />
                                    </div>
                                    <div class="item-name">
                                        <asp:Label ID="Label27" CssClass="sentence" runat="server" Text="Nendoroid Frieren"></asp:Label>
                                    </div>
                                    <div class="item-price">
                                        <asp:Label ID="Label28" runat="server" Text="RM 100.00"></asp:Label>
                                    </div>
                                    <div class="item-details">
                                        <div class="item-buy">
                                            <asp:LinkButton runat="server">
                <i class="fa-solid fa-cart-shopping"></i>&nbsp;Buy
                                            </asp:LinkButton>
                                        </div>
                                        <div class="item-view">
                                            <asp:LinkButton PostBackUrl="~/Customer/IndividualFigure.aspx" runat="server">
                <i class="fa-solid fa-magnifying-glass-plus"></i>&nbsp;View
                                            </asp:LinkButton>
                                        </div>
                                    </div>
                                </div>
                                <!--End of An Item-->

                                <!--An Item-->
                                <div class="item">
                                    <div class="item-image">
                                        <asp:Image runat="server" CssClass="imgFigure" ID="Image15" ImageUrl="~/Image/Product/f1.jpg" />
                                    </div>
                                    <div class="item-name">
                                        <asp:Label ID="Label29" CssClass="sentence" runat="server" Text="Nendoroid Frieren"></asp:Label>
                                    </div>
                                    <div class="item-price">
                                        <asp:Label ID="Label30" runat="server" Text="RM 100.00"></asp:Label>
                                    </div>
                                    <div class="item-details">
                                        <div class="item-buy">
                                            <asp:LinkButton runat="server">
                <i class="fa-solid fa-cart-shopping"></i>&nbsp;Buy
                                            </asp:LinkButton>
                                        </div>
                                        <div class="item-view">
                                            <asp:LinkButton PostBackUrl="~/Customer/IndividualFigure.aspx" runat="server">
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
                <div id="carouselControl2" class="carousel itemslide"  data-bs-ride="carousel">
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
                                        <asp:Label ID="Label32" runat="server" Text="RM 100.00"></asp:Label>
                                    </div>
                                    <div class="item-details">
                                        <div class="item-buy">
                                            <asp:LinkButton runat="server">
                                                <i class="fa-solid fa-cart-shopping"></i>&nbsp;Buy
                                            </asp:LinkButton>
                                        </div>
                                        <div class="item-view">
                                            <asp:LinkButton runat="server">
                                                <i class="fa-solid fa-magnifying-glass-plus"></i>&nbsp;View
                                            </asp:LinkButton>
                                        </div>
                                    </div>
                                </div>
                                <!--End of An Item-->

                                <!--An Item-->
                                <div class="item">
                                    <div class="item-image">
                                        <asp:Image runat="server" CssClass="imgFigure" ID="Image17" ImageUrl="~/Image/Product/f1.jpg" />
                                    </div>
                                    <div class="item-name">
                                        <asp:Label ID="Label33" CssClass="sentence" runat="server" Text="Nendoroid Frieren"></asp:Label>
                                    </div>
                                    <div class="item-price">
                                        <asp:Label ID="Label34" runat="server" Text="RM 100.00"></asp:Label>
                                    </div>
                                    <div class="item-details">
                                        <div class="item-buy">
                                            <asp:LinkButton runat="server">
                                                <i class="fa-solid fa-cart-shopping"></i>&nbsp;Buy
                                            </asp:LinkButton>
                                        </div>
                                        <div class="item-view">
                                            <asp:LinkButton runat="server">
                                                <i class="fa-solid fa-magnifying-glass-plus"></i>&nbsp;View
                                            </asp:LinkButton>
                                        </div>
                                    </div>
                                </div>
                                <!--End of An Item-->

                                <!--An Item-->
                                <div class="item">
                                    <div class="item-image">
                                        <asp:Image runat="server" CssClass="imgFigure" ID="Image18" ImageUrl="~/Image/Product/f1.jpg" />
                                    </div>
                                    <div class="item-name">
                                        <asp:Label ID="Label35" CssClass="sentence" runat="server" Text="Nendoroid Frieren"></asp:Label>
                                    </div>
                                    <div class="item-price">
                                        <asp:Label ID="Label36" runat="server" Text="RM 100.00"></asp:Label>
                                    </div>
                                    <div class="item-details">
                                        <div class="item-buy">
                                            <asp:LinkButton runat="server">
                                                <i class="fa-solid fa-cart-shopping"></i>&nbsp;Buy
                                            </asp:LinkButton>
                                        </div>
                                        <div class="item-view">
                                            <asp:LinkButton runat="server">
                                                <i class="fa-solid fa-magnifying-glass-plus"></i>&nbsp;View
                                            </asp:LinkButton>
                                        </div>
                                    </div>
                                </div>
                                <!--End of An Item-->

                                <!--An Item-->
                                <div class="item">
                                    <div class="item-image">
                                        <asp:Image runat="server" CssClass="imgFigure" ID="Image19" ImageUrl="~/Image/Product/f1.jpg" />
                                    </div>
                                    <div class="item-name">
                                        <asp:Label ID="Label37" CssClass="sentence" runat="server" Text="Nendoroid Frieren"></asp:Label>
                                    </div>
                                    <div class="item-price">
                                        <asp:Label ID="Label38" runat="server" Text="RM 100.00"></asp:Label>
                                    </div>
                                    <div class="item-details">
                                        <div class="item-buy">
                                            <asp:LinkButton runat="server">
                                                <i class="fa-solid fa-cart-shopping"></i>&nbsp;Buy
                                            </asp:LinkButton>
                                        </div>
                                        <div class="item-view">
                                            <asp:LinkButton runat="server">
                                                <i class="fa-solid fa-magnifying-glass-plus"></i>&nbsp;View
                                            </asp:LinkButton>
                                        </div>
                                    </div>
                                </div>
                                <!--End of An Item-->

                                <!--An Item-->
                                <div class="item">
                                    <div class="item-image">
                                        <asp:Image runat="server" CssClass="imgFigure" ID="Image20" ImageUrl="~/Image/Product/f1.jpg" />
                                    </div>
                                    <div class="item-name">
                                        <asp:Label ID="Label39" CssClass="sentence" runat="server" Text="Nendoroid Frieren"></asp:Label>
                                    </div>
                                    <div class="item-price">
                                        <asp:Label ID="Label40" runat="server" Text="RM 100.00"></asp:Label>
                                    </div>
                                    <div class="item-details">
                                        <div class="item-buy">
                                            <asp:LinkButton runat="server">
                                                <i class="fa-solid fa-cart-shopping"></i>&nbsp;Buy
                                            </asp:LinkButton>
                                        </div>
                                        <div class="item-view">
                                            <asp:LinkButton runat="server">
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
                                        <asp:Image runat="server" CssClass="imgFigure" ID="Image21" ImageUrl="~/Image/Product/f1.jpg" />
                                    </div>
                                    <div class="item-name">
                                        <asp:Label ID="Label41" CssClass="sentence" runat="server" Text="Nendoroid Frieren"></asp:Label>
                                    </div>
                                    <div class="item-price">
                                        <asp:Label ID="Label42" runat="server" Text="RM 100.00"></asp:Label>
                                    </div>
                                    <div class="item-details">
                                        <div class="item-buy">
                                            <asp:LinkButton runat="server">
                <i class="fa-solid fa-cart-shopping"></i>&nbsp;Buy
                                            </asp:LinkButton>
                                        </div>
                                        <div class="item-view">
                                            <asp:LinkButton runat="server">
                <i class="fa-solid fa-magnifying-glass-plus"></i>&nbsp;View
                                            </asp:LinkButton>
                                        </div>
                                    </div>
                                </div>
                                <!--End of An Item-->

                                <!--An Item-->
                                <div class="item">
                                    <div class="item-image">
                                        <asp:Image runat="server" CssClass="imgFigure" ID="Image22" ImageUrl="~/Image/Product/f1.jpg" />
                                    </div>
                                    <div class="item-name">
                                        <asp:Label ID="Label43" CssClass="sentence" runat="server" Text="Nendoroid Frieren"></asp:Label>
                                    </div>
                                    <div class="item-price">
                                        <asp:Label ID="Label44" runat="server" Text="RM 100.00"></asp:Label>
                                    </div>
                                    <div class="item-details">
                                        <div class="item-buy">
                                            <asp:LinkButton runat="server">
                <i class="fa-solid fa-cart-shopping"></i>&nbsp;Buy
                                            </asp:LinkButton>
                                        </div>
                                        <div class="item-view">
                                            <asp:LinkButton runat="server">
                <i class="fa-solid fa-magnifying-glass-plus"></i>&nbsp;View
                                            </asp:LinkButton>
                                        </div>
                                    </div>
                                </div>
                                <!--End of An Item-->

                                <!--An Item-->
                                <div class="item">
                                    <div class="item-image">
                                        <asp:Image runat="server" CssClass="imgFigure" ID="Image23" ImageUrl="~/Image/Product/f1.jpg" />
                                    </div>
                                    <div class="item-name">
                                        <asp:Label ID="Label45" CssClass="sentence" runat="server" Text="Nendoroid Frieren"></asp:Label>
                                    </div>
                                    <div class="item-price">
                                        <asp:Label ID="Label46" runat="server" Text="RM 100.00"></asp:Label>
                                    </div>
                                    <div class="item-details">
                                        <div class="item-buy">
                                            <asp:LinkButton runat="server">
                <i class="fa-solid fa-cart-shopping"></i>&nbsp;Buy
                                            </asp:LinkButton>
                                        </div>
                                        <div class="item-view">
                                            <asp:LinkButton runat="server">
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
                    GOODS
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
                                        <asp:Image runat="server" CssClass="imgFigure" ID="imgFigure" ImageUrl="~/Image/Product/f1.jpg" />
                                    </div>
                                    <div class="item-name">
                                        <asp:Label ID="lblName" CssClass="sentence" runat="server" Text="Nendoroid Frieren"></asp:Label>
                                    </div>
                                    <div class="item-price">
                                        <asp:Label ID="lblPrice" runat="server" Text="RM 100.00"></asp:Label>
                                    </div>
                                    <div class="item-details">
                                        <div class="item-buy">
                                            <asp:LinkButton runat="server">
                                                <i class="fa-solid fa-cart-shopping"></i>&nbsp;Buy
                                            </asp:LinkButton>
                                        </div>
                                        <div class="item-view">
                                            <asp:LinkButton runat="server">
                                                <i class="fa-solid fa-magnifying-glass-plus"></i>&nbsp;View
                                            </asp:LinkButton>
                                        </div>
                                    </div>
                                </div>
                                <!--End of An Item-->

                                <!--An Item-->
                                <div class="item">
                                    <div class="item-image">
                                        <asp:Image runat="server" CssClass="imgFigure" ID="Image1" ImageUrl="~/Image/Product/f1.jpg" />
                                    </div>
                                    <div class="item-name">
                                        <asp:Label ID="Label1" CssClass="sentence" runat="server" Text="Nendoroid Frieren"></asp:Label>
                                    </div>
                                    <div class="item-price">
                                        <asp:Label ID="Label2" runat="server" Text="RM 100.00"></asp:Label>
                                    </div>
                                    <div class="item-details">
                                        <div class="item-buy">
                                            <asp:LinkButton runat="server">
                                                <i class="fa-solid fa-cart-shopping"></i>&nbsp;Buy
                                            </asp:LinkButton>
                                        </div>
                                        <div class="item-view">
                                            <asp:LinkButton runat="server">
                                                <i class="fa-solid fa-magnifying-glass-plus"></i>&nbsp;View
                                            </asp:LinkButton>
                                        </div>
                                    </div>
                                </div>
                                <!--End of An Item-->

                                <!--An Item-->
                                <div class="item">
                                    <div class="item-image">
                                        <asp:Image runat="server" CssClass="imgFigure" ID="Image2" ImageUrl="~/Image/Product/f1.jpg" />
                                    </div>
                                    <div class="item-name">
                                        <asp:Label ID="Label3" CssClass="sentence" runat="server" Text="Nendoroid Frieren"></asp:Label>
                                    </div>
                                    <div class="item-price">
                                        <asp:Label ID="Label4" runat="server" Text="RM 100.00"></asp:Label>
                                    </div>
                                    <div class="item-details">
                                        <div class="item-buy">
                                            <asp:LinkButton runat="server">
                                                <i class="fa-solid fa-cart-shopping"></i>&nbsp;Buy
                                            </asp:LinkButton>
                                        </div>
                                        <div class="item-view">
                                            <asp:LinkButton runat="server">
                                                <i class="fa-solid fa-magnifying-glass-plus"></i>&nbsp;View
                                            </asp:LinkButton>
                                        </div>
                                    </div>
                                </div>
                                <!--End of An Item-->

                                <!--An Item-->
                                <div class="item">
                                    <div class="item-image">
                                        <asp:Image runat="server" CssClass="imgFigure" ID="Image3" ImageUrl="~/Image/Product/f1.jpg" />
                                    </div>
                                    <div class="item-name">
                                        <asp:Label ID="Label5" CssClass="sentence" runat="server" Text="Nendoroid Frieren"></asp:Label>
                                    </div>
                                    <div class="item-price">
                                        <asp:Label ID="Label6" runat="server" Text="RM 100.00"></asp:Label>
                                    </div>
                                    <div class="item-details">
                                        <div class="item-buy">
                                            <asp:LinkButton runat="server">
                                                <i class="fa-solid fa-cart-shopping"></i>&nbsp;Buy
                                            </asp:LinkButton>
                                        </div>
                                        <div class="item-view">
                                            <asp:LinkButton runat="server">
                                                <i class="fa-solid fa-magnifying-glass-plus"></i>&nbsp;View
                                            </asp:LinkButton>
                                        </div>
                                    </div>
                                </div>
                                <!--End of An Item-->

                                <!--An Item-->
                                <div class="item">
                                    <div class="item-image">
                                        <asp:Image runat="server" CssClass="imgFigure" ID="Image4" ImageUrl="~/Image/Product/f1.jpg" />
                                    </div>
                                    <div class="item-name">
                                        <asp:Label ID="Label7" CssClass="sentence" runat="server" Text="Nendoroid Frieren"></asp:Label>
                                    </div>
                                    <div class="item-price">
                                        <asp:Label ID="Label8" runat="server" Text="RM 100.00"></asp:Label>
                                    </div>
                                    <div class="item-details">
                                        <div class="item-buy">
                                            <asp:LinkButton runat="server">
                                                <i class="fa-solid fa-cart-shopping"></i>&nbsp;Buy
                                            </asp:LinkButton>
                                        </div>
                                        <div class="item-view">
                                            <asp:LinkButton runat="server">
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
                                        <asp:Image runat="server" CssClass="imgFigure" ID="Image5" ImageUrl="~/Image/Product/f1.jpg" />
                                    </div>
                                    <div class="item-name">
                                        <asp:Label ID="Label9" CssClass="sentence" runat="server" Text="Nendoroid Frieren"></asp:Label>
                                    </div>
                                    <div class="item-price">
                                        <asp:Label ID="Label10" runat="server" Text="RM 100.00"></asp:Label>
                                    </div>
                                    <div class="item-details">
                                        <div class="item-buy">
                                            <asp:LinkButton runat="server">
                <i class="fa-solid fa-cart-shopping"></i>&nbsp;Buy
                                            </asp:LinkButton>
                                        </div>
                                        <div class="item-view">
                                            <asp:LinkButton runat="server">
                <i class="fa-solid fa-magnifying-glass-plus"></i>&nbsp;View
                                            </asp:LinkButton>
                                        </div>
                                    </div>
                                </div>
                                <!--End of An Item-->

                                <!--An Item-->
                                <div class="item">
                                    <div class="item-image">
                                        <asp:Image runat="server" CssClass="imgFigure" ID="Image6" ImageUrl="~/Image/Product/f1.jpg" />
                                    </div>
                                    <div class="item-name">
                                        <asp:Label ID="Label11" CssClass="sentence" runat="server" Text="Nendoroid Frieren"></asp:Label>
                                    </div>
                                    <div class="item-price">
                                        <asp:Label ID="Label12" runat="server" Text="RM 100.00"></asp:Label>
                                    </div>
                                    <div class="item-details">
                                        <div class="item-buy">
                                            <asp:LinkButton runat="server">
                <i class="fa-solid fa-cart-shopping"></i>&nbsp;Buy
                                            </asp:LinkButton>
                                        </div>
                                        <div class="item-view">
                                            <asp:LinkButton runat="server">
                <i class="fa-solid fa-magnifying-glass-plus"></i>&nbsp;View
                                            </asp:LinkButton>
                                        </div>
                                    </div>
                                </div>
                                <!--End of An Item-->

                                <!--An Item-->
                                <div class="item">
                                    <div class="item-image">
                                        <asp:Image runat="server" CssClass="imgFigure" ID="Image7" ImageUrl="~/Image/Product/f1.jpg" />
                                    </div>
                                    <div class="item-name">
                                        <asp:Label ID="Label13" CssClass="sentence" runat="server" Text="Nendoroid Frieren"></asp:Label>
                                    </div>
                                    <div class="item-price">
                                        <asp:Label ID="Label14" runat="server" Text="RM 100.00"></asp:Label>
                                    </div>
                                    <div class="item-details">
                                        <div class="item-buy">
                                            <asp:LinkButton runat="server">
                <i class="fa-solid fa-cart-shopping"></i>&nbsp;Buy
                                            </asp:LinkButton>
                                        </div>
                                        <div class="item-view">
                                            <asp:LinkButton runat="server">
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
</asp:Content>
