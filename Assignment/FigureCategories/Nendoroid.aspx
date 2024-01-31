<%@ Page Title="" Language="C#" MasterPageFile="~/Cust.Master" AutoEventWireup="true" CodeBehind="Nendoroid.aspx.cs" Inherits="Assignment.FigureCategories.Nendoroid" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="Category.css" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="box">
        <div class="header-cont">
            <asp:Image runat="server" ImageUrl="~/Image/Element/longbanner2.jpg" />
            <div class="header-tt">
                NENDOROIDS
            </div>
        </div>

        <div class="content">

            <div class="left" id="left">
                <button onclick="hide()" id="btnOpen" class="openCloseBtn" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasScrolling" aria-controls="offcanvasScrolling"><i class='fas fa-chevron-right'></i></button>

                <div class="offcanvas offcanvas-start show" data-bs-scroll="true" data-bs-backdrop="false" tabindex="-1" id="offcanvasScrolling" aria-labelledby="offcanvasScrollingLabel">
                    <div class="offcanvas-header" id="offcanvas-header">
                        <h5 class="offcanvas-title" id="offcanvasScrollingLabel">Filter</h5>
                        <button onclick="show()" id="btnHide" class="button" type="button" data-bs-dismiss="offcanvas" aria-label="Close"><i class="fa-solid fa-xmark"></i></button>
                    </div>
                    <div class="offcanvas-body" id="offcanvas-body">
                        <div class="pricerange" style="border-bottom: 1px solid lightgrey; padding-bottom: 15px;">
                            <div class="title-selector2">
                                Price Range
                            </div>
                            <div class="pricerange-cont">
                                <div class="col">
                                    <div class="input-group">
                                        <asp:TextBox runat="server" CssClass="border form-control" placeholder="Minimum Price" />
                                    </div>
                                </div>
                                &nbsp-&nbsp
                                <div class="col">
                                    <div class="input-group">
                                        <asp:TextBox runat="server" CssClass="border form-control" placeholder="Maximum Price" />
                                    </div>
                                </div>
                            </div>
                            <div class="btn-apply">
                                <asp:Button runat="server" CssClass="btn border applybtn" Text="APPLY" />
                            </div>
                        </div>
                        <div class="status-selector" style="border-top: 1px solid lightgrey; padding-top: 15px; border-bottom: 1px solid lightgrey; padding-bottom: 15px;">
                            <div class="title-selector">
                                Status
                            </div>
                            <div class="form-check" id="collpaseStatus">
                                <asp:RadioButtonList CssClass="selection" runat="server" ID="CheckBoxList1">
                                    <asp:ListItem Value="All Product">All Product</asp:ListItem>
                                    <asp:ListItem Value="Pre-Order">Pre-Order</asp:ListItem>
                                    <asp:ListItem Value="Available">Available</asp:ListItem>
                                </asp:RadioButtonList>
                            </div>
                        </div>
                        <div class="manufacturer-selector" style="border-top: 1px solid lightgrey; padding-top: 15px; border-bottom: 1px solid lightgrey; padding-bottom: 15px;">
                            <div class="title-selector">
                                Manufacturer
                            </div>
                            <div class="form-check" id="collapseManu">
                                <asp:CheckBoxList CssClass="selection" runat="server" ID="cbxManufacturer">
                                    <asp:ListItem Value="Good Smile Company">Good Smile Company</asp:ListItem>
                                    <asp:ListItem Value="Solarain">Solarain</asp:ListItem>
                                    <asp:ListItem Value="PROOF">PROOF</asp:ListItem>
                                    <asp:ListItem Value="Max Factory">Max Factory</asp:ListItem>
                                    <asp:ListItem Value="METAL ROBOT SPIRITS">METAL ROBOT SPIRITS</asp:ListItem>
                                </asp:CheckBoxList>
                            </div>
                        </div>
                        <div class="series-selector" style="border-top: 1px solid lightgrey; padding-top: 15px;">
                            <div class="title-selector">
                                Series
                            </div>
                            <div class="form-check" id="collapseSeries">
                                <asp:CheckBoxList CssClass="selection" runat="server" ID="cbxSeries">
                                    <asp:ListItem Value="Frieren: Beyond Journey's End">Frieren: Beyond Journey's End</asp:ListItem>
                                    <asp:ListItem Value="Butareba: The Story of a Man Turned into a Pig">Butareba: The Story of a Man Turned into a Pig</asp:ListItem>
                                    <asp:ListItem Value="Azur Lane">Azur Lane</asp:ListItem>
                                    <asp:ListItem Value="Mobile Suit Gundam: Iron-Blooded Orphans">Mobile Suit Gundam: Iron-Blooded Orphans</asp:ListItem>
                                    <asp:ListItem Value="Pop Team Epic Season 2">Pop Team Epic Season 2</asp:ListItem>
                                </asp:CheckBoxList>
                            </div>

                        </div>
                    </div>
                </div>
            </div>

            <div class="right">
                <div class="items-cont">
                    <div class="sort">
                        <div class="noOfResult">
                            <asp:Label runat="server" ID="resultno" Text="12 Results" />
                        </div>
                        <div class="sort-cont">
                            <div class="sort-title">
                                Sort By
                            </div>
                            <div class="sort-list">
                                <asp:DropDownList CssClass="list-item" runat="server" ID="ddlSort">
                                    <asp:ListItem Value="1">Lowest Price</asp:ListItem>
                                    <asp:ListItem Value="2">Highest Price</asp:ListItem>
                                    <asp:ListItem Value="3">a-Z</asp:ListItem>
                                    <asp:ListItem Value="4">Z-a</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                    </div>
                    <div class="item-container">
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
                                <asp:Image runat="server" CssClass="imgFigure" ID="Image1" ImageUrl="~/Image/Product/f2.jpg" />
                            </div>
                            <div class="item-name">
                                <asp:Label ID="Label1" CssClass="sentence" runat="server" Text="TENITOL Jess"></asp:Label>
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
                                <asp:Image runat="server" CssClass="imgFigure" ID="Image2" ImageUrl="~/Image/Product/f2.jpg" />
                            </div>
                            <div class="item-name">
                                <asp:Label ID="Label3" CssClass="sentence" runat="server" Text="TENITOL Jess"></asp:Label>
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
                                <asp:Image runat="server" CssClass="imgFigure" ID="Image3" ImageUrl="~/Image/Product/f2.jpg" />
                            </div>
                            <div class="item-name">
                                <asp:Label ID="Label5" CssClass="sentence" runat="server" Text="TENITOL Jess"></asp:Label>
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
                                <asp:Image runat="server" CssClass="imgFigure" ID="Image4" ImageUrl="~/Image/Product/f2.jpg" />
                            </div>
                            <div class="item-name">
                                <asp:Label ID="Label7" CssClass="sentence" runat="server" Text="TENITOL Jess"></asp:Label>
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
            </div>

        </div>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="JS" runat="server">
    <script type="text/javascript">
        function hide() {
            document.getElementById("btnOpen").style.display = "none";
            document.getElementById("offcanvasScrolling").style.maxWidth = "350px";
            document.getElementById("offcanvas-header").style.display = "flex";
            document.getElementById("offcanvas-body").style.display = "flex";
        }
        var myOffcanvas = document.getElementById('offcanvasScrolling')
        myOffcanvas.addEventListener('hidden.bs.offcanvas',
            function () {
                document.getElementById("btnOpen").style.display = "block";
                document.getElementById("offcanvasScrolling").style.maxWidth = "0px";
                document.getElementById("offcanvas-header").style.display = "none";
                document.getElementById("offcanvas-body").style.display = "none";
            })
    </script>
</asp:Content>
