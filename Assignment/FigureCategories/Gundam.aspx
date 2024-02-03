<%@ Page Title="" Language="C#" MasterPageFile="~/Cust.Master" AutoEventWireup="true" CodeBehind="Gundam.aspx.cs" Inherits="Assignment.FigureCategories.Gundam" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="Category.css" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="box">
        <div class="header-cont">
            <asp:Image runat="server" ImageUrl="~/Image/Element/longbanner3.jpg" />
            <div class="header-tt">
                GUNDAMS
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
                                By Price Range
                            </div>
                            <div class="pricerange-cont">
                                <div class="col">
                                    <div class="input-group">
                                        <asp:TextBox ID="minPrice" runat="server" CssClass="border form-control" placeholder="Minimum Price" />
                                    </div>
                                </div>
                                &nbsp-&nbsp
                                <div class="col">
                                    <div class="input-group">
                                        <asp:TextBox ID="maxPrice" runat="server" CssClass="border form-control" placeholder="Maximum Price" />
                                    </div>
                                </div>
                            </div>
                            <div class="btn-apply">
                                <asp:Button OnClick="Apply_Click" runat="server" CssClass="btn border applybtn" Text="APPLY" />
                            </div>
                            <div class="err-price">
                                <asp:Label runat="server" ID="errorPrice" Visible="false" Style="color:red;" Text="Please enter a valid minimum price or maximum price."/>
                            </div>
                        </div>
                        <div class="status-selector" style="border-top: 1px solid lightgrey; padding-top: 15px; border-bottom: 1px solid lightgrey; padding-bottom: 15px;">
                            <div class="title-selector">
                                By Status
                            </div>
                            <div class="form-check" id="collpaseStatus">
                                <asp:RadioButtonList AutoPostBack="true" OnSelectedIndexChanged="RadioButtonList_SelectedIndexChanged" CssClass="selection" runat="server" ID="RadioButtonList">
                                    <asp:ListItem Value="All Product">All Product</asp:ListItem>
                                    <asp:ListItem Value="Pre-Order">Pre-Order</asp:ListItem>
                                    <asp:ListItem Value="Available">Available</asp:ListItem>
                                </asp:RadioButtonList>
                            </div>
                        </div>
                        <div class="manufacturer-selector" style="border-top: 1px solid lightgrey; padding-top: 15px; border-bottom: 1px solid lightgrey; padding-bottom: 15px;">
                            <div class="title-selector">
                                By Manufacturer
                            </div>
                            <div class="form-check" id="collapseManu">
                                <asp:CheckBoxList AutoPostBack="true" CssClass="selection" OnSelectedIndexChanged="cbxManufacturer_SelectedIndexChanged" runat="server" ID="cbxManufacturer">
                                </asp:CheckBoxList>
                                <asp:Label runat="server" ID="onlyOneM" Visible="false"></asp:Label>
                            </div>
                        </div>
                        <div class="series-selector" style="border-top: 1px solid lightgrey; padding-top: 15px; border-bottom: 1px solid lightgrey; padding-bottom: 15px;">
                            <div class="title-selector">
                                By Series
                            </div>
                            <div class="form-check" id="collapseSeries">
                                <asp:CheckBoxList AutoPostBack="true" CssClass="selection" OnSelectedIndexChanged="cbxSeries_SelectedIndexChanged" runat="server" ID="cbxSeries">
                                </asp:CheckBoxList>
                                <asp:Label runat="server" ID="onlyOneS" Visible="false"></asp:Label>
                            </div>
                        </div>
                        <div class="clear-all" style="border-top: 1px solid lightgrey; padding-top: 15px;">
                            <asp:Button CssClass="btn clearall-btn" runat="server" ID="clearAll" Text="Clear All" OnClick="clearAll_Click" />
                        </div>
                    </div>
                </div>
            </div>

            <div class="right">
                <div class="items-cont">
                    <div class="sort">
                        <div class="noOfResult">
                            <asp:Label runat="server" ID="resultno" />
                        </div>
                        <div class="sort-cont">
                            <div class="sort-title">
                                Sort By
                            </div>
                            <div class="sort-list">
                                <asp:DropDownList AutoPostBack="true" OnSelectedIndexChanged="ddlSort_SelectedIndexChanged" CssClass="list-item" runat="server" ID="ddlSort">
                                    <asp:ListItem Selected="True">Default</asp:ListItem>
                                    <asp:ListItem Value="1">Lowest Price</asp:ListItem>
                                    <asp:ListItem Value="2">Highest Price</asp:ListItem>
                                    <asp:ListItem Value="3">a-Z</asp:ListItem>
                                    <asp:ListItem Value="4">Z-a</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                    </div>
                    <div class="item-container">

                        <asp:Repeater runat="server" ID="gundamRepater">
                            <ItemTemplate>
                                <!--An Item-->
                                <div class="item">
                                    <div class="item-image">
                                        <asp:Image runat="server" CssClass="imgFigure" ID="Image8" ImageUrl='<%# Eval("FigureImage1") %>' />
                                    </div>
                                    <div class="detail-cont">
                                        <div class="item-name">
                                            <asp:Label ID="lblName" CssClass="sentence" runat="server" Text='<%# Eval("FigureName") %>'></asp:Label>
                                        </div>
                                        <div class="item-price">
                                            <asp:Label ID="lblPrice" runat="server" Text='<%# Convert.ToDecimal(Eval("FigurePrice")).ToString("C2") %>'></asp:Label>
                                        </div>
                                        <div class="item-details">
                                            <div class="item-buy">
                                                <asp:LinkButton runat="server">
  <i class="fa-solid fa-cart-shopping"></i>&nbsp;Buy
                                                </asp:LinkButton>
                                            </div>
                                            <div class="item-view">
                                                <asp:LinkButton runat="server" ID="destination" CommandArgument='<%# Eval("FigureID") %>' OnCommand="destination_Command">
  <i class="fa-solid fa-magnifying-glass-plus"></i>&nbsp;View
                                                </asp:LinkButton>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!--End of An Item-->
                            </ItemTemplate>
                        </asp:Repeater>

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
