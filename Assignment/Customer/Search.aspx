<%@ Page Title="" Language="C#" MasterPageFile="~/Cust.Master" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="Assignment.Customer.Search" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="Search.css" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div style="margin: 5px 50px 20px 50px;">
        <div class="content-header">
            SEARCH RESULTS
        </div>
        <div class="count" style="margin-bottom: 15px;">
            <asp:Label Style="font-weight: bold;" runat="server" ID="searchCount" Text="3" />&nbsp;Item Found.
        </div>
    </div>
    <div class="contents" style="margin: 5px 50px 20px 50px;">
        <div class="item-container w3-center group">

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
            <!--An Item-->
            <div class="item">
                <div class="item-image">
                    <asp:Image runat="server" CssClass="imgFigure" ID="Image5" ImageUrl="~/Image/Product/f2.jpg" />
                </div>
                <div class="item-name">
                    <asp:Label ID="Label9" CssClass="sentence" runat="server" Text="TENITOL Jess"></asp:Label>
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
                    <asp:Image runat="server" CssClass="imgFigure" ID="Image6" ImageUrl="~/Image/Product/f2.jpg" />
                </div>
                <div class="item-name">
                    <asp:Label ID="Label11" CssClass="sentence" runat="server" Text="TENITOL Jess"></asp:Label>
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
                    <asp:Image runat="server" CssClass="imgFigure" ID="Image7" ImageUrl="~/Image/Product/f2.jpg" />
                </div>
                <div class="item-name">
                    <asp:Label ID="Label13" CssClass="sentence" runat="server" Text="TENITOL Jess"></asp:Label>
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
            <!--An Item-->
            <div class="item">
                <div class="item-image">
                    <asp:Image runat="server" CssClass="imgFigure" ID="Image9" ImageUrl="~/Image/Product/f2.jpg" />
                </div>
                <div class="item-name">
                    <asp:Label ID="Label17" CssClass="sentence" runat="server" Text="TENITOL Jess"></asp:Label>
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
                        <asp:LinkButton runat="server">
                <i class="fa-solid fa-magnifying-glass-plus"></i>&nbsp;View
                        </asp:LinkButton>
                    </div>
                </div>
            </div>
            <!--End of An Item-->

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
</asp:Content>
