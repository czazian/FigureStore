<%@ Page Title="" Language="C#" MasterPageFile="~/Cust.Master" AutoEventWireup="true" CodeBehind="OrderTrack.aspx.cs" Inherits="Assignment.Customer.OrderTrack" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="OrderTrack.css" />
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>

    <style>
        /* Modal container */
        .modal {
            display: none; /* Hidden by default */
            position: fixed; /* Stay in place */
            z-index: 1000; /* Sit on top */
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto; /* Enable scroll if needed */
            background-color: rgb(0,0,0); /* Fallback color */
            background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
        }

        /* Modal content */
        .modal-content {
            background-color: #fefefe;
            margin: 15% auto; /* 15% from the top and centered */
            padding: 20px;
            border: 1px solid #888;
            width: 25%; /* Could be more or less, depending on screen size */
            border-radius: 10px;
            text-align: center;
        }

        /* Close button */
        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }

            .close:hover,
            .close:focus {
                color: black;
                text-decoration: none;
                cursor: pointer;
            }

        /* Rating stars */
        .rating {
            margin-bottom: 20px;
        }

            .rating input[type="radio"] {
                display: none;
            }

            .rating label {
                font-size: 20px;
                color: #aaa;
                cursor: pointer;
            }

            .rating input[type="radio"]:checked ~ label {
                color: orange;
            }


    </style>
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
            <div class="order-container">
                <asp:SqlDataSource ID="TrackingSource" runat="server" ConnectionString="<%$ ConnectionStrings:ApexOnlineShopDb %>" SelectCommand="SELECT DISTINCT O.OrderID AS OrderID, O.PaymentAmount AS PaymentAmount, O.OrderDate AS OrderDate, R.OrderQuantity AS OrderQuantity, R.OrderStatus AS OrderStatus, F.FigureID AS FigureID, F.FigureName AS FigureName, F.FigurePrice AS FigurePrice, F.FigureImage1 AS FigureImage1 FROM [Order] O JOIN [Customer] C ON O.CustomerID = C.CustomerID JOIN [OrderFigure] R ON R.OrderID = O.OrderID JOIN [Figure] F ON R.FigureID = F.FigureID WHERE O.CustomerID = @custID ORDER BY OrderDate DESC;">
                    <SelectParameters>
                        <asp:Parameter Name="custID" />
                    </SelectParameters>
                </asp:SqlDataSource>

                <asp:Repeater ID="OrderRepeater" runat="server" OnItemDataBound="OrderRepeater_ItemDataBound">
                    <ItemTemplate>
                        <asp:HiddenField runat="server" ID="hdnDate" Value='<%# Bind("OrderDate", "{0:dd-MM-yyyy}") %>' />
                        <asp:HiddenField runat="server" ID="hdnID" Value='<%# Eval("FigureID") %>' />
                        <!--An Order-->
                        <div class="anOrder">
                            <div class="top-item">
                                <div class="orderID">
                                    <i class='fas fa-tag'></i>&nbsp;Order ID :&nbsp;#<asp:Label runat="server" ID="orderID" Text='<%# Eval("OrderDate", "{0:yyyyMMdd}")+"-"+Eval("OrderID") %>' />
                                </div>
                                <div class="status">
                                    <i class="fa-solid fa-truck"></i>&nbsp;<asp:Label runat="server" ID="lblStatus" Text='<%# Eval("OrderStatus") %>' />
                                </div>
                            </div>
                            <div class="middle1">
                                <div class="img" style="width: 200px; height: contain;">
                                    <asp:ImageButton CssClass="imga" PostBackUrl='<%# "~/Customer/IndividualFigure.aspx?id=" + Eval("FigureID") %>' Style="width: 100%;" runat="server" ID="orderimg" ImageUrl='<%# Eval("FigureImage1") %>' />
                                </div>
                                <div class="product">
                                    <div class="name">
                                        <asp:Label runat="server" ID="lblName" Text='<%# Eval("FigureName") %>' />
                                    </div>
                                    <div class="quantity">
                                        ×<asp:Label runat="server" ID="lblQty" Text='<%# Eval("OrderQuantity") %>' />
                                    </div>
                                </div>
                                <div class="subtotal">
                                    <asp:Button ID="btnToRate" runat="server" Text="Rate" CommandArgument='<%# Eval("FigureID") %>' OnCommand="btnToRate_Command" />
                                </div>
                            </div>
                            <div class="middle2">
                                <div class="noOfItems">
                                    <asp:Label Style="color: grey" runat="server" ID="lblOrderDate" Text='<%# Bind("OrderDate", "{0:dd-MM-yyyy}") %>' />
                                </div>
                                <div class="totalForAll" style="font-size: 18px;">
                                    <span style="color: grey">Order Total :</span>&nbsp;<asp:Label Style="font-weight: bold; color: #ff7e29" runat="server" ID="lblTotal" Text='<%# "RM "+Eval("PaymentAmount") %>' />
                                </div>
                            </div>
                            <div class="bottom">
                                <div class="estimate">
                                    Products will be shipped out by&nbsp;<asp:Label Style="text-decoration: underline" runat="server" ID="lblEstimateDate" Text="" />
                                </div>
                                <div class="view-order-btn">
                                    <asp:LinkButton CommandArgument='<%# Eval("OrderID") %>' CssClass="viewOrder btn border" runat="server" ID="viewOrder" OnCommand="viewOrder_Command">
                                        <i class="fa-solid fa-circle-info"></i>&nbsp;&nbsp;VIEW ORDER
                                    </asp:LinkButton>
                                </div>
                            </div>
                        </div>
                        <!--End Of An Order-->
                    </ItemTemplate>
                </asp:Repeater>

                <asp:Label ID="lblFail" runat="server" Text="" Style="font-weight: bold; color: red; font-size: 20px; margin-top: 100px; margin-bottom: 100px;"></asp:Label>

                <!-- Rating modal -->
                <div id="ratingModal" class="modal">
                    <div class="modal-content">
                        <span class="close">&times;</span>
                        <h2>Rate the Product</h2>
                        <div class="rating">
                            <input type="radio" id="star5" name="rating" value="5" /><label for="star5" title="5 stars"><i class="bx bxs-star"></i></label>
                            <input type="radio" id="star4" name="rating" value="4" /><label for="star4" title="4 stars"><i class="bx bxs-star"></i></label>
                            <input type="radio" id="star3" name="rating" value="3" /><label for="star3" title="3 stars"><i class="bx bxs-star"></i></label>
                            <input type="radio" id="star2" name="rating" value="2" /><label for="star2" title="2 stars"><i class="bx bxs-star"></i></label>
                            <input type="radio" id="star1" name="rating" value="1" /><label for="star1" title="1 star"><i class="bx bxs-star"></i></label>
                        </div>
                        <asp:TextBox ID="txtFeedback" runat="server" placeholder="Enter your feedback" Style="width: 100%; padding: 10px; margin-bottom: 20px; border: 1px solid #ccc; border-radius: 5px; box-sizing: border-box;"/>
                        <asp:Label ID="lblErrorMsg" runat="server" Text="" Style="color: red; font-weight: bold; margin-bottom: 20px;" />
                        <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" Style="background-color: orange; color: white; margin:10px 50px; padding: 10px 20px; border: none; border-radius: 5px; cursor: pointer; transition: background-color 0.3s ease;"/>
                    </div>
                </div>
                <!-- End rating modal -->
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
        function openModal() {
            document.getElementById("ratingModal").style.display = "block";
        }

        var closeBtn = document.querySelector(".close");

        if (closeBtn) {
            closeBtn.addEventListener("click", function () {
                closeModal();
            });
        }
        function closeModal() {
            document.getElementById("ratingModal").style.display = "none";
        }
    </script>

</asp:Content>
