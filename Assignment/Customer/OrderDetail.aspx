<%@ Page Title="" Language="C#" MasterPageFile="~/Cust.Master" AutoEventWireup="true" CodeBehind="OrderDetail.aspx.cs" Inherits="Assignment.Customer.OrderDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="OrderDetail.css" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="detail">
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
            <div class="order-container">
                <div class="back">
                    <asp:LinkButton PostBackUrl="~/Customer/OrderTrack.aspx" CssClass="lbn" runat="server">
                        <i class="fa-solid fa-arrow-left"></i>&nbsp;&nbsp;&nbsp;Orders
                    </asp:LinkButton>
                </div>
                <div class="order-title">
                    <div class="top-title">
                        <div class="title">
                            Order details&nbsp;#<asp:Label runat="server" ID="orderID" Text="20233101" />
                        </div>
                        <div class="current-status">
                            <asp:Label runat="server" Text="SHIPPING" />
                        </div>
                    </div>
                    <div class="date-title">
                        <div class="date">
                            Order Date:&nbsp;<asp:Label runat="server" ID="orderDate" Text="10 March 2024" />
                        </div>
                        |
                        <div class="estimate">
                            Estimate Arrival Date:&nbsp;<asp:Label runat="server" ID="orderEstimate" Text="16 March 2024" />
                        </div>
                    </div>
                </div>
                <div class="status-container">
                    <div class="status-line">
                        <div id="bar-progress" class="mt-5 mt-lg-0">
                            <!--Add step-active class for current phase-->
                            <!--Please change the done-date when a phase is done-->
                            <div class="step step-active">
                                <span class="check-container">
                                    <span class="check"><i class="fa-regular fa-clipboard"></i></span>
                                </span>
                                <h5>Order Received</h5>
                                <div class="done-date">
                                    <asp:Label runat="server" ID="Label3" Text="8:23 PM 10/3/2024" />
                                </div>
                            </div>
                            <div class="seperator"></div>
                            <div class="step step-active">
                                <span class="check-container">
                                    <span class="check"><i class="fa-solid fa-truck"></i></span>
                                </span>
                                <h5>Shipping</h5>
                                <div class="done-date">
                                    <asp:Label runat="server" ID="Label2" Text="8:23 PM 12/3/2024" />
                                </div>
                            </div>
                            <div class="seperator"></div>
                            <div class="step">
                                <span class="check-container">
                                    <span class="check"><i class="fa-solid fa-truck-fast"></i></span>
                                </span>
                                <h5>Out for delivery</h5>
                                <div class="done-date">
                                    <asp:Label runat="server" ID="Label1" Text="" />
                                </div>
                            </div>
                            <div class="seperator"></div>
                            <div class="step">
                                <span class="check-container">
                                    <span class="check"><i class="fa-solid fa-check"></i></span>
                                </span>
                                <h5>Delivered</h5>
                                <div class="done-date">
                                    <asp:Label runat="server" ID="donedate" Text="" />
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="item-ordered">
                        <div class="item-ordered-title">
                            Item Ordered
                        </div>
                        <div class="items-cont">
                            <!--An Item-->
                            <div class="products">
                                <div class="left">
                                    <div class="img">
                                        <asp:Image Style="width: 100%;" runat="server" ID="pImage" ImageUrl="~/Image/Product/f1.jpg" />
                                    </div>
                                    <div class="text">
                                        <div class="product-name" style="color: #ff7e29; font-weight: bold; font-size: 18px;">
                                            <asp:Label ID="Label4" runat="server" Text="Nendoroids Frieren" />
                                        </div>
                                        <div class="qty">
                                            <span>Quantity :&nbsp;</span><asp:Label ID="qty" runat="server" Text="2" />
                                        </div>
                                    </div>
                                </div>
                                <div class="right">
                                    <asp:Label runat="server" ID="itemtotal" Text="RM 200.00" />
                                </div>
                            </div>
                            <!--End of An Item-->

                            <!--An Item-->
                            <div class="products">
                                <div class="left">
                                    <div class="img">
                                        <asp:Image Style="width: 100%;" runat="server" ID="Image2" ImageUrl="~/Image/Product/f1.jpg" />
                                    </div>
                                    <div class="text">
                                        <div class="product-name" style="color: #ff7e29; font-weight: bold; font-size: 18px;">
                                            <asp:Label ID="Label8" runat="server" Text="Nendoroids Frieren" />
                                        </div>
                                        <div class="qty">
                                            <span>Quantity :&nbsp;</span><asp:Label ID="Label9" runat="server" Text="2" />
                                        </div>
                                    </div>
                                </div>
                                <div class="right">
                                    <asp:Label runat="server" ID="Label10" Text="RM 200.00" />
                                </div>
                            </div>
                            <!--End of An Item-->

                            <!--An Item-->
                            <div class="products">
                                <div class="left">
                                    <div class="img">
                                        <asp:Image Style="width: 100%;" runat="server" ID="Image1" ImageUrl="~/Image/Product/f1.jpg" />
                                    </div>
                                    <div class="text">
                                        <div class="product-name" style="color: #ff7e29; font-weight: bold; font-size: 18px;">
                                            <asp:Label ID="Label5" runat="server" Text="Nendoroids Frieren" />
                                        </div>
                                        <div class="qty">
                                            <span>Quantity :&nbsp;</span><asp:Label ID="Label6" runat="server" Text="2" />
                                        </div>
                                    </div>
                                </div>
                                <div class="right">
                                    <asp:Label runat="server" ID="Label7" Text="RM 200.00" />
                                </div>
                            </div>
                            <!--End of An Item-->

                            <!--Bottom Information-->
                            <div class="bottom-info">
                                <div class="b1">
                                    <div class="t" style="color: #ff7e29">Information</div>
                                    <table class="info-container">
                                        <tr>
                                            <th>Name</th>
                                            <td>:</td>
                                            <td>
                                                <asp:Label runat="server" ID="name" Text="Lala Yang" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>Phone No.</th>
                                            <td>:</td>
                                            <td>
                                                <asp:Label runat="server" ID="Label11" Text="012-34567890" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>Home Address
                                            </th>
                                            <td>:</td>
                                            <td>
                                                <asp:Label runat="server" ID="homeaddress" Text="TARUMT, Jalan Genting Kelang, Setapak, 53300 Kuala Lumpur, Federal Territory of Kuala Lumpur." />
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>Payment Method
                                            </th>
                                            <td>:</td>
                                            <td>
                                                <asp:Label runat="server" ID="paymentmethod" Text="Cash On Delivery" />
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                                <div class="b2">
                                    <div class="t" style="color: #ff7e29">Order Summary</div>
                                    <table class="order-summary">
                                        <tr>
                                            <th>Subtotal
                                            </th>
                                            <td>:</td>
                                            <td class="tRight">
                                                <asp:Label runat="server" ID="lblSubtotal" Text="RM 600.00" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>Discount
                                            </th>
                                            <td>:</td>
                                            <td class="tRight">
                                                <asp:Label runat="server" ID="lblDiscount" Text="RM 60.00" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>Delivery
                                            </th>
                                            <td>:</td>
                                            <td class="tRight">
                                                <asp:Label runat="server" ID="lblDelivery" Text="RM 25.00" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <th style="padding-bottom: 20px;">Tax
                                            </th>
                                            <td style="padding-bottom: 20px;">:</td>
                                            <td class="tRight" style="padding-bottom: 20px;">
                                                <asp:Label runat="server" ID="lblTax" Text="RM 36.00" />
                                            </td>
                                        </tr>
                                        <tr class="last-column">
                                            <th style="padding-top: 20px;">Total
                                            </th>
                                            <td style="font-weight: 100; padding-top: 20px;">:</td>
                                            <td style="padding-top: 20px;" class="tRight">
                                                <asp:Label runat="server" ID="lblTotal" Text="RM 601.00" />
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
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

</asp:Content>
