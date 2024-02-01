<%@ Page Title="" Language="C#" MasterPageFile="~/Cust.Master" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="Assignment.Customer.Search" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="Search.css" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="out">
        <div style="width: 100%; padding: 5px 0px 5px 60px;">
            <div class="content-header">
                SEARCH RESULTS
            </div>
            <div class="count" style="margin-bottom: 15px;">
                <asp:Label Style="font-weight: bold;" runat="server" ID="searchCount" />&nbsp;Item Found.
            </div>
        </div>
        <div runat="server" id="div" style="border: 1px solid grey; padding: 20px; width: 92%; font-size: 23px; text-align: center;">
            <asp:Label runat="server" ID="noResult" />
        </div>
        <div class="contents" style="margin: 5px 50px 20px 50px;">
            <div class="item-container group">

                <asp:Repeater runat="server" ID="figuresRepeater">
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
                                        <asp:LinkButton runat="server" ID="ToDestination" CommandArgument='<%# Eval("FigureID") %>' OnCommand="ToDestination_Command">
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
