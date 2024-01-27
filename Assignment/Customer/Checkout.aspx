<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Checkout.aspx.cs" Inherits="Assignment.Customer.Checkout" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css" rel="stylesheet" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <link href='https://fonts.googleapis.com/css?family=Poppins' rel='stylesheet' />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta2/css/all.min.css"
        integrity="sha512-YWzhKL2whUzgiheMoBFwW8CKV4qpHQAEuvilg9FAn5VJUDwKZZxkJNuGM4XkWuk94WCrrwslk8yWNGmY1EduTA=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    <link href="Checkout.css" rel="stylesheet" />

    <title>Apex Online Shop</title>
    <link rel="icon" type="image/x-icon" href="~/Image/Element/window.png" />
</head>
<body>
    <form id="form1" runat="server" class="all-container">
        <div class="left-box">
            <div class="logo">
                <asp:Image Style="border-radius: 5px;" Width="180px" runat="server" ID="imgLogo" ImageUrl="~/Image/Element/Logo.png" />
            </div>
            <div class="cont">

                <span class="small-title">Payment Methods
                </span>

                <div class="supported-methods">
                    <div data-bs-toggle="tooltip" data-bs-placement="top" data-bs-title="Cash On Delivery" class="cash">
                        <asp:ImageButton ID="cash" OnClientClick="cash(); return false;" runat="server" CssClass="method selected" ImageUrl="~/Image/Element/cash.png" />
                    </div>
                    <div data-bs-toggle="tooltip" data-bs-placement="top" data-bs-title="Visa Card" class="visa">
                        <asp:ImageButton ID="visa" OnClientClick="visa(); return false;" runat="server" CssClass="method" ImageUrl="~/Image/Element/visa.png" />
                    </div>
                    <div data-bs-toggle="tooltip" data-bs-placement="top" data-bs-title="Master Card" class="master">
                        <asp:ImageButton ID="master" OnClientClick="master(); return false;" runat="server" CssClass="method" ImageUrl="~/Image/Element/master.png" />
                    </div>
                </div>
            </div>
            <div class="payment-container" id="payment-container">
                <div class="title">
                    Payment Information
                </div>
                <div class="box1">
                    <div class="form-floating cardno">
                        <asp:TextBox runat="server" ID="txtCardNo" class="form-control" placeholder="Card Number" />
                        <label for="txtCardNo">Card Number</label>
                    </div>
                    <div class="card-details">
                        <div class="form-floating expiry">
                            <asp:TextBox runat="server" ID="txtExpiryDate" class="form-control" placeholder="Expiry Date" />
                            <label for="txtExpiryDate">Expiry Date</label>
                        </div>
                        <div class="form-floating cvv">
                            <asp:TextBox runat="server" ID="txtCVV" class="form-control" placeholder="CVV" />
                            <label for="txtCVV">CVV</label>
                        </div>
                    </div>
                </div>
            </div>
            <div class="fill">
                <div class="title">
                    Shipping Address
                </div>
                <div class="box2">
                    <div class="name">
                        <div class="form-floating fname">
                            <asp:TextBox runat="server" ID="txtFirstName" class="form-control" placeholder="First Name" />
                            <label for="txtFirstName">First Name</label>
                        </div>
                        <div class="form-floating lname">
                            <asp:TextBox runat="server" ID="txtLastName" class="form-control" placeholder="Last Name" />
                            <label for="txtLastName">Last Name</label>
                        </div>
                    </div>
                    <div class="form-floating email">
                        <asp:TextBox runat="server" ID="txtEmail" class="form-control" placeholder="Email" />
                        <label for="txtEmail">Email</label>
                    </div>
                    <div class="form-floating address">
                        <asp:TextBox TextMode="MultiLine" Style="height: 100px; resize: none;" runat="server" ID="txtAddress" class="form-control" placeholder="Address" />
                        <label for="txtAddress">Address</label>
                    </div>
                    <div class="form-floating houseno">
                        <asp:TextBox runat="server" ID="TextBox1" class="form-control" placeholder="House no. or Unit no." />
                        <label for="txtHouse">House no. / Unit no.</label>
                    </div>
                    <div class="state">
                        <div class="form-floating city">
                            <asp:TextBox runat="server" ID="txtCity" class="form-control" placeholder="City" />
                            <label for="txtCity">City</label>
                        </div>
                        <div class="form-floating statename">
                            <asp:DropDownList runat="server" CssClass="form-control" ID="ddlState">
                                <asp:ListItem Selected="True" runat="server" Text="Please select your state" />
                                <asp:ListItem runat="server" Text="Selangor" Value="Selangor" />
                                <asp:ListItem runat="server" Text="Johor" Value="Johor" />
                                <asp:ListItem runat="server" Text="Kedah" Value="Kedah" />
                                <asp:ListItem runat="server" Text="Kelantan" Value="Kelantan" />
                                <asp:ListItem runat="server" Text="Malacca" Value="Malacca" />
                                <asp:ListItem runat="server" Text="Negeri Sembilan" Value="Negeri Sembilan" />
                                <asp:ListItem runat="server" Text="Pahang" Value="Pahang" />
                                <asp:ListItem runat="server" Text="Penang" Value="Penang" />
                                <asp:ListItem runat="server" Text="Perak" Value="Perak" />
                                <asp:ListItem runat="server" Text="Perlis" Value="Perlis" />
                                <asp:ListItem runat="server" Text="Sabah" Value="Sabah" />
                                <asp:ListItem runat="server" Text="Sarawak" Value="Sarawak" />
                                <asp:ListItem runat="server" Text="Kuala Lumpur" Value="Kuala Lumpur" />
                            </asp:DropDownList>
                            <label for="ddlState">State</label>
                        </div>
                        <div class="form-floating postcode">
                            <asp:TextBox runat="server" ID="txtPostCode" class="form-control" placeholder="Postcode" />
                            <label for="txtPostCode">Postcode</label>
                        </div>
                    </div>
                    <div class="form-floating phone">
                        <asp:TextBox TextMode="Phone" runat="server" ID="txtPhone" class="form-control" placeholder="Phone" />
                        <label for="txtPhone">Phone</label>
                    </div>
                </div>
                <div class="checkout">
                    <asp:Button Style="background-color: #212121; color: white; padding: 5px; border-radius: 5px;" runat="server" ID="btnBack" Text="Back to Cart" PostBackUrl="~/Customer/Cart.aspx" />
                    <asp:LinkButton PostBackUrl="~/Customer/OrderConfirmation.aspx" Style="background-color: #ff7e29; color: white; padding: 8.5px; text-decoration: none; border-radius: 5px;" runat="server" ID="lkbCheckout">
                        <i class="fa-solid fa-cart-shopping"></i>&nbsp;Checkout
                    </asp:LinkButton>
                </div>
            </div>
        </div>

        <div class="right-box">

            <!--An Item-->
            <div class="products">
                <div class="left">
                    <div class="img">
                        <asp:Image Style="width: 100%;" runat="server" ID="pImage" ImageUrl="~/Image/Product/f1.jpg" />
                    </div>
                    <div class="text">
                        <div class="product-name" style="color: #ff7e29; font-weight: bold; font-size: 18px;">
                            <asp:Label ID="Label1" runat="server" Text="Nendoroids Frieren" />
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
                        <asp:Image Style="width: 100%;" runat="server" ID="Image1" ImageUrl="~/Image/Product/f1.jpg" />
                    </div>
                    <div class="text">
                        <div class="product-name" style="color: #ff7e29; font-weight: bold; font-size: 18px;">
                            <asp:Label ID="Label2" runat="server" Text="Nendoroids Frieren" />
                        </div>
                        <div class="qty">
                            <span>Quantity :&nbsp;</span><asp:Label ID="Label3" runat="server" Text="2" />
                        </div>
                    </div>
                </div>
                <div class="right">
                    <asp:Label runat="server" ID="Label4" Text="RM 200.00" />
                </div>
            </div>
            <!--End of An Item-->

            <hr />
            <table class="payment">
                <tr class="subtotal">
                    <td class="tt t2">Total :
                    </td>
                    <td style="text-align: left">
                        <asp:Label runat="server" ID="total" Text="RM 400.00"></asp:Label>
                    </td>
                </tr>
                <tr class="discount">
                    <td class="tt t2">Discount :
                    </td>
                    <td style="text-align: left">
                        <asp:Label runat="server" ID="discount" Text="RM 60.00"></asp:Label>
                    </td>
                </tr>
                <tr class="shipping-fee">
                    <td class="tt t2">Shipping Fee :
                    </td>
                    <td style="text-align: left">
                        <asp:Label runat="server" ID="shipping" Text="RM 25.00"></asp:Label>
                    </td>
                </tr>
                <tr class="tax">
                    <td class="tt t2">Tax (6%) :
                    </td>
                    <td style="text-align: left">
                        <asp:Label runat="server" ID="tax" Text="RM 24.00"></asp:Label>
                    </td>
                </tr>
            </table>

            <hr />

            <div class="all-total">
                <div class="tt">Overall Total :</div>
                <div>
                    <asp:Label runat="server" ID="alltotal" Text="RM 389.00" />
                </div>
            </div>
        </div>


        <script type="text/javascript">
            const tooltipTriggerList = document.querySelectorAll('[data-bs-toggle="tooltip"]')
            const tooltipList = [...tooltipTriggerList].map(tooltipTriggerEl => new bootstrap.Tooltip(tooltipTriggerEl))

            function cash() {
                //Appearance
                document.getElementById('<%= cash.ClientID %>').classList.add("selected");
                document.getElementById('<%= visa.ClientID %>').classList.remove("selected");
                document.getElementById('<%= master.ClientID %>').classList.remove("selected");

                //Behavior
                let box = document.getElementById("payment-container");
                box.classList.remove("payment-container-show")

                //Remove data if choose back cod
                document.getElementById('<%= txtExpiryDate.ClientID %>').value = "";
                document.getElementById('<%= txtCardNo.ClientID %>').value = "";
                document.getElementById('<%= txtCVV.ClientID %>').value = "";
            }

            function visa() {
                //Appearance
                document.getElementById('<%= visa.ClientID %>').classList.add("selected");
                document.getElementById('<%= cash.ClientID %>').classList.remove("selected");
                document.getElementById('<%= master.ClientID %>').classList.remove("selected");

                //Behavior
                let box = document.getElementById("payment-container");
                box.classList.add("payment-container-show");
            }

            function master() {
                //Appearance
                document.getElementById('<%= master.ClientID %>').classList.add("selected");
                document.getElementById('<%= cash.ClientID %>').classList.remove("selected");
                document.getElementById('<%= visa.ClientID %>').classList.remove("selected");

                //Behavior
                let box = document.getElementById("payment-container");
                box.classList.add("payment-container-show");
            }
        </script>

    </form>
</body>
</html>
