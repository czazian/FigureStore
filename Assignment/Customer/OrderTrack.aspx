<%@ Page Title="" Language="C#" MasterPageFile="~/Cust.Master" AutoEventWireup="true" CodeBehind="OrderTrack.aspx.cs" Inherits="Assignment.Customer.OrderTrack" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="OrderTrack.css" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="track">
        <div class="sidebar" id="sidebar">
            <div class="tt">
                <div id="ttt" class="ttt">
                    <span class="sel">MY ACTION</span>
                </div>

                <i style="font-size: 20px;" class="btn-show fa-solid fa-angles-left"></i>

            </div>
            <div class="inner-side">
                <asp:LinkButton CausesValidation="false" PostBackUrl="~/Customer/UserProfile.aspx" CssClass="lb" runat="server" ID="goProfile">
                  <i class="fa-solid fa-address-card"></i>&nbsp;&nbsp;<span class="sel">MY PROFILE</span>
                </asp:LinkButton>

                <asp:LinkButton CausesValidation="false" PostBackUrl="~/Customer/EditProfile.aspx" CssClass="lb" runat="server" ID="goEdit">
                  <i class="fa-solid fa-pen-to-square"></i>&nbsp;&nbsp;<span class="sel">EDIT PROFILE</span>
                </asp:LinkButton>

                <asp:LinkButton Style="color: #ff7e29" CausesValidation="false" PostBackUrl="~/Customer/OrderTrack.aspx" CssClass="lb" runat="server" ID="goOrder">
                  <i class="fa-solid fa-cart-shopping"></i>&nbsp;&nbsp;<span class="sel">MY ORDER</span>
                </asp:LinkButton>

                <asp:LinkButton CausesValidation="false" OnClick="goLogout_Click" CssClass="lb" runat="server" ID="goLogout">
                  <i class="fa-solid fa-right-from-bracket"></i>&nbsp;&nbsp;<span class="sel">LOGOUT</span>
                </asp:LinkButton>
            </div>
        </div>

        <div class="main-content">
            <div class="topSelection">
                <div class="all selection select" id="all">
                    <asp:LinkButton ID="btn1" OnClientClick="allOrder(); return false;" runat="server" CssClass="btn sButton">
                        All Order&nbsp;<asp:Label CssClass="lbl" runat="server" ID="orderCount" Text="(3)" />
                    </asp:LinkButton>
                </div>
                <div class="received selection" id="received">
                    <asp:LinkButton ID="btn2" OnClientClick="received(); return false;" runat="server" CssClass="btn sButton">
                        Order Received&nbsp;<asp:Label CssClass="lbl" runat="server" ID="receivedCount" Text="(1)" />
                    </asp:LinkButton>
                </div>
                <div class="shipping selection" id="shipping">
                    <asp:LinkButton ID="btn3" OnClientClick="shipping(); return false;" runat="server" CssClass="btn sButton">
                        Shipping&nbsp;<asp:Label CssClass="lbl" runat="server" ID="shippingCount" Text="(1)" />
                    </asp:LinkButton>
                </div>
                <div class="delivered selection" id="delivered">
                    <asp:LinkButton ID="btn4" OnClientClick="delivered(); return false;" runat="server" CssClass="btn sButton">
                        Delivered&nbsp;<asp:Label CssClass="lbl" runat="server" ID="deliveredCount" Text="(1)" />
                    </asp:LinkButton>
                </div>
            </div>
            <div class="order-container">
                <!--An Order-->
                <div class="anOrder">
                    <div class="top-item">
                        <div class="orderID">
                            <i class='fas fa-tag'></i>&nbsp;Order ID :&nbsp;#<asp:Label runat="server" ID="orderID" Text="20233101" />
                        </div>
                        <div class="status">
                            <i class="fa-solid fa-truck"></i>&nbsp;<asp:Label runat="server" ID="lblStatus" Text="Order Received" />
                        </div>
                    </div>
                    <div class="middle1">
                        <div class="img" style="width: 200px; height: contain;">
                            <asp:ImageButton CssClass="imga" PostBackUrl="~/Customer/IndividualFigure.aspx" Style="width: 100%;" runat="server" ID="orderimg" ImageUrl="~/Image/Product/f1.jpg" />
                        </div>
                        <div class="product">
                            <div class="name">
                                <asp:Label runat="server" ID="lblName" Text="Nendoroid Frieren" />
                            </div>
                            <div class="quantity">
                                ×<asp:Label runat="server" ID="lblQty" Text="2" />
                            </div>
                        </div>
                        <div class="subtotal">
                            <asp:Label runat="server" ID="lblSubtotal" Text="RM 200.00" />
                        </div>
                    </div>
                    <div class="middle2">
                        <div class="noOfItems">
                            <asp:Label Style="color: grey" runat="server" ID="noOfItems" Text="3 Items" />
                        </div>
                        <div class="totalForAll" style="font-size: 18px;">
                            <span style="color: grey">Order Total :</span>&nbsp;<asp:Label Style="font-weight: bold; color: #ff7e29" runat="server" ID="lblTotal" Text="RM 200.00" />
                        </div>
                    </div>
                    <div class="bottom">
                        <div class="estimate">
                            Products will be shipped out by&nbsp;<asp:Label Style="text-decoration: underline" runat="server" ID="estimate" Text="8 March 2024" />
                        </div>
                        <div class="view-order-btn">
                            <asp:LinkButton PostBackUrl="~/Customer/OrderDetail.aspx" CssClass="viewOrder btn border" runat="server">
                                <i class="fa-solid fa-circle-info"></i>&nbsp;&nbsp;VIEW ORDER
                            </asp:LinkButton>
                        </div>
                    </div>
                </div>
                <!--End Of An Order-->
                <!--An Order-->
                <div class="anOrder">
                    <div class="top-item">
                        <div class="orderID">
                            <i class='fas fa-tag'></i>&nbsp;Order ID :&nbsp;#<asp:Label runat="server" ID="Label1" Text="20233102" />
                        </div>
                        <div class="status">
                            <i class="fa-solid fa-truck"></i>&nbsp;<asp:Label runat="server" ID="Label2" Text="Order Received" />
                        </div>
                    </div>
                    <div class="middle1">
                        <div class="img" style="width: 200px; height: contain;">
                            <asp:ImageButton PostBackUrl="~/Customer/IndividualFigure.aspx" Style="width: 100%;" runat="server" ID="ImageButton1" ImageUrl="~/Image/Product/f2.jpg" />
                        </div>
                        <div class="product">
                            <div class="name">
                                <asp:Label runat="server" ID="Label3" Text="TENITOL Jess" />
                            </div>
                            <div class="quantity">
                                ×<asp:Label runat="server" ID="Label4" Text="2" />
                            </div>
                        </div>
                        <div class="subtotal">
                            <asp:Label runat="server" ID="Label5" Text="RM 200.00" />
                        </div>
                    </div>
                    <div class="middle2">
                        <div class="noOfItems">
                            <asp:Label Style="color: grey" runat="server" ID="Label6" Text="1 Item" />
                        </div>
                        <div class="totalForAll" style="font-size: 18px;">
                            <span style="color: grey">Order Total :</span>&nbsp;<asp:Label Style="font-weight: bold; color: #ff7e29" runat="server" ID="Label7" Text="RM 200.00" />
                        </div>
                    </div>
                    <div class="bottom">
                        <div class="estimate">
                            Products will be shipped out by&nbsp;<asp:Label Style="text-decoration: underline" runat="server" ID="Label8" Text="8 March 2024" />
                        </div>
                        <div class="view-order-btn">
                            <asp:LinkButton PostBackUrl="~/Customer/OrderDetail.aspx" CssClass="viewOrder btn border" runat="server">
                                <i class="fa-solid fa-circle-info"></i>&nbsp;&nbsp;VIEW ORDER
                            </asp:LinkButton>
                        </div>
                    </div>
                </div>
                <!--End Of An Order-->
                <!--An Order-->
                <div class="anOrder">
                    <div class="top-item">
                        <div class="orderID">
                            <i class='fas fa-tag'></i>&nbsp;Order ID :&nbsp;#<asp:Label runat="server" ID="Label9" Text="20233103" />
                        </div>
                        <div class="status">
                            <i class="fa-solid fa-truck"></i>&nbsp;<asp:Label runat="server" ID="Label10" Text="Order Received" />
                        </div>
                    </div>
                    <div class="middle1">
                        <div class="img" style="width: 200px; height: contain;">
                            <asp:ImageButton PostBackUrl="~/Customer/IndividualFigure.aspx" Style="width: 100%;" runat="server" ID="ImageButton2" ImageUrl="~/Image/Product/f4.jpg" />
                        </div>
                        <div class="product">
                            <div class="name">
                                <asp:Label runat="server" ID="Label11" Text="Chen Hai" />
                            </div>
                            <div class="quantity">
                                ×<asp:Label runat="server" ID="Label12" Text="2" />
                            </div>
                        </div>
                        <div class="subtotal">
                            <asp:Label runat="server" ID="Label13" Text="RM 200.00" />
                        </div>
                    </div>
                    <div class="middle2">
                        <div class="noOfItems">
                            <asp:Label Style="color: grey" runat="server" ID="Label14" Text="1 Item" />
                        </div>
                        <div class="totalForAll" style="font-size: 18px;">
                            <span style="color: grey">Order Total :</span>&nbsp;<asp:Label Style="font-weight: bold; color: #ff7e29" runat="server" ID="Label15" Text="RM 200.00" />
                        </div>
                    </div>
                    <div class="bottom">
                        <div class="estimate">
                            Products will be shipped out by&nbsp;<asp:Label Style="text-decoration: underline" runat="server" ID="Label16" Text="8 March 2024" />
                        </div>
                        <div class="view-order-btn">
                            <asp:LinkButton PostBackUrl="~/Customer/OrderDetail.aspx" CssClass="viewOrder btn border" runat="server">
                                <i class="fa-solid fa-circle-info"></i>&nbsp;&nbsp;VIEW ORDER
                            </asp:LinkButton>
                        </div>
                    </div>
                </div>
                <!--End Of An Order-->
            </div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="JS" runat="server">
    <script type="text/javascript">
        let show = document.querySelector(".btn-show");
        let title = document.querySelectorAll(".sel");
        let sidebar = document.getElementById("sidebar");
        let ttt = document.getElementById("ttt");
        var option = sessionStorage.getItem("option");

        show.addEventListener("click", () => {
            if (option === "show" || option === null) {
                sessionStorage.setItem("option", "hide");
                location.reload();
            } else if (option === "hide") {
                sessionStorage.setItem("option", "show");
                location.reload();
            }
        })

    </script>
    <script>
        function run() {

            if (option === "hide") {

                //operation
                show.classList.replace("fa-angles-left", "fa-angles-right");
                sidebar.style.width = "auto";
                ttt.style.display = "none";

                title.forEach(tt => {
                    tt.classList.add("hideTitle");
                })

                $('#<%= goProfile.ClientID %>').hover(function () {
                    $(this).tooltip({ placement: "right", title: "MY PROFILE" });
                });
                $('#<%= goEdit.ClientID %>').hover(function () {
                    $(this).tooltip({ placement: "right", title: "EDIT PROFILE" });
                });
                $('#<%= goOrder.ClientID %>').hover(function () {
                    $(this).tooltip({ placement: "right", title: "MY ORDER" });
                });
                $('#<%= goLogout.ClientID %>').hover(function () {
                    $(this).tooltip({ placement: "right", title: "LOGOUT" });
                });
            } else if (option === "show") {

                //operation
                show.classList.replace("fa-angles-right", "fa-angles-left");
                sidebar.style.width = "200px";
                ttt.style.display = "block";

                title.forEach(tt => {
                    tt.classList.remove("hideTitle");
                })

                $('#<%= goProfile.ClientID %>').hover(function () {
                    $(this).tooltip("dispose");
                });
                $('#<%= goEdit.ClientID %>').hover(function () {
                    $(this).tooltip("dispose");
                });
                $('#<%= goOrder.ClientID %>').hover(function () {
                    $(this).tooltip("dispose");
                });
                $('#<%= goLogout.ClientID %>').hover(function () {
                    $(this).tooltip("dispose");
                });
            }

        }
    </script>



    <script>
    //May need to change. When the user click on a button, the system should trigger the click button whether is "Order Received", "Shipping", "All Order" or something else. Apply the "select" class according to the value. 

        function allOrder() {
            document.getElementById("all").classList.add("select");
            document.getElementById("received").classList.remove("select");
            document.getElementById("shipping").classList.remove("select");
            document.getElementById("delivered").classList.remove("select");
        }

        function received() {
            document.getElementById("received").classList.add("select");
            document.getElementById("all").classList.remove("select");
            document.getElementById("shipping").classList.remove("select");
            document.getElementById("delivered").classList.remove("select");
        }

        function shipping() {
            document.getElementById("shipping").classList.add("select");
            document.getElementById("received").classList.remove("select");
            document.getElementById("all").classList.remove("select");
            document.getElementById("delivered").classList.remove("select");
        }

        function delivered() {
            document.getElementById("delivered").classList.add("select");
            document.getElementById("received").classList.remove("select");
            document.getElementById("shipping").classList.remove("select");
            document.getElementById("all").classList.remove("select");
        }
    </script>
</asp:Content>
