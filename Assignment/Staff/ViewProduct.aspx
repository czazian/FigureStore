<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="ViewProduct.aspx.cs"
    Inherits="Assignment.Staff.ViewProduct" %>
    <asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <style>
            #prodLi {
                background: #545454;
            }

            .input-field {
                height: 45px !important;
                width: 100%;
                outline: none;
                background: #fafafa !important;
                border: 2px solid #EFEEF1;
                border-radius: 6px;
                font-size: 18px;
                padding: 0 15px !important;
                margin-bottom: 15px;
                margin-top: 10px;
            }

            .input-field2 {
                height: 45px !important;
                width: 100%;
                outline: none;
                background: #fafafa !important;
                border: 2px solid #EFEEF1;
                border-radius: 6px;
                font-size: 18px;
                padding: 0 15px !important;
                margin-bottom: 0px !important;
                margin-top: 0px;
            }

            .home-content .sales-boxes {
                display: flex;
                justify-content: space-between;
                padding: 0 50px;
            }

                /* left box */
                .home-content .sales-boxes .recent-sales {
                    width: 97%;
                    background: #fff;
                    padding: 30px 20px;
                    margin: 0 5px;
                    margin-bottom: 10px;
                    border-radius: 12px;
                    box-shadow: 0 5px 10px rgba(0, 0, 0, 0.1);
                }

                .home-content .sales-boxes .sales-details {
                    display: flex;
                    align-items: center;
                    justify-content: space-between;
                }

            .sales-boxes .box .title {
                font-size: 24px;
                font-weight: 500;
                margin-bottom: 10px;
            }

            .sales-boxes .sales-details li.topic {
                font-size: 20px;
                font-weight: 500;
                margin-bottom: 18px;
            }

            .sales-boxes .sales-details li {
                list-style: none;
                margin: 8px 0;
                height: 18px;
            }

                .sales-boxes .sales-details li a {
                    font-size: 18px;
                    color: #333;
                    font-size: 400;
                    text-decoration: none;
                }

            .sales-boxes .box .button {
                width: 100%;
                display: flex;
                justify-content: flex-end;
            }

                .sales-boxes .box .button a {
                    color: #fff;
                    background: #0A2558;
                    padding: 4px 12px;
                    font-size: 15px;
                    font-weight: 400;
                    border-radius: 4px;
                    text-decoration: none;
                    transition: all 0.3s ease;
                }

            .form-button {
                color: #fff;
                background-color: #ff7e29;
                padding: 4px 12px;
                font-size: 15px;
                font-weight: 400;
                border-radius: 4px;
                text-decoration: none;
                transition: all 0.3s ease;
                margin-top: 10px;
                margin-bottom: 10px;
                width: 160px;
                height: 40px;
                border: white;
            }

                .form-button:hover {
                    background-color: #fa9e61;
                }

            .form-button2 {
                color: #fff;
                background-color: #ff7e29;
                font-size: 15px;
                font-weight: 400;
                border-radius: 20px;
                text-decoration: none;
                transition: all 0.3s ease;
                width: 40px;
                height: 30px;
                border: white;
            }

                .form-button2:hover {
                    background-color: white;
                    border: 1px solid lightsalmon;
                    color: lightsalmon;
                }

            .border-lightsalmon {
                border: 2px solid lightsalmon;
            }

            a {
                color: white;
                text-decoration: none;
            }

            .sales-boxes .box .button a:hover {
                background: #0d3073;
            }

            .toggle-checkbox input {
                width: 20px;
                height: 20px;
                margin-right: 8px;
                margin-top: 4px;
                margin-bottom: 4px;
                margin-left: 2px;
            }

            /* Right box */
            .home-content .sales-boxes .top-sales {
                width: 35%;
                background: #fff;
                padding: 20px 30px;
                margin: 0 20px 0 0;
                border-radius: 12px;
                box-shadow: 0 5px 10px rgba(0, 0, 0, 0.1);
            }

            .sales-boxes .top-sales li {
                display: flex;
                align-items: center;
                justify-content: space-between;
                margin: 10px 0;
            }

                .sales-boxes .top-sales li a img {
                    height: 60px;
                    width: 40px;
                    object-fit: cover;
                    border-radius: 12px;
                    margin-right: 10px;
                    background: #333;
                }

            .img-file {
                width: 50%;
                height: 50%;
                margin-bottom: 20px;
            }

            .img-small {
                width: 50px;
                height: 80px;
            }

            .sales-boxes .top-sales li a {
                display: flex;
                align-items: center;
                text-decoration: none;
            }

            .sales-boxes .top-sales li .product,
            .price {
                font-size: 17px;
                font-weight: 400;
                color: #333;
            }


            .noSpinners::-webkit-inner-spin-button,
            .noSpinners::-webkit-outer-spin-button {
                -webkit-appearance: none;
                -moz-appearance: none;
                appearance: none;
                margin: 0;
            }

            .product-container {
                width: 100%;
                height: contain;
                justify-content: center;
                display: flex;
                margin: 20px 0px 20px 0px;
                gap: 15px;
            }

            .product-header {
                border-bottom: 1px solid lightgrey;
                padding: 13px 20px 13px 20px;
                display: flex;
                flex-flow: row nowrap;
            }

            .left-box {
                display: flex;
                flex-flow: column nowrap;
                width: 800px;
                border: 1px solid grey;
                border-radius: 15px;
                height: fit-content;
            }

            .right-box {
                border: 1px solid grey;
                border-radius: 15px;
                width: 350px;
                display: flex;
                flex-flow: column nowrap;
                align-items: center;
                gap: 10px;
                height: fit-content;
                padding-bottom: 10px;
            }

            .quantity-container {
                width: 100%;
                margin-top: 10px;
            }

            .price {
                font-weight: bold;
                background-color: #212121;
                border-radius: 15px;
                color: white;
                width: 100%;
                text-align: center;
                font-size: 1.3rem;
                padding: 15px 10px 15px 10px;
            }

            .top-container {
                display: flex;
                flex-flow: column nowrap;
            }

            .main-img {
                width: 85%;
                display: flex;
                justify-content: center;
                margin: 0px;
            }

            .select-img {
                width: 15%;
                border-left: 1px solid lightgrey;
                display: flex;
                flex-flow: column nowrap;
                align-items: center;
            }

            .middle {
                display: flex;
                flex-flow: row nowrap;
                margin: 0px;
                padding: 0px;
            }

            .sideimg {
                width: 100%;
                padding: 10px;
                cursor: pointer;
            }

            table {
                width: 100%;
            }

            td, tr {
                padding: 10px;
                vertical-align: top;
            }

            .title {
                color: #ff7e29;
            }

            .title2 {
                font-weight:600;
                color: #ff7e29;
                vertical-align:middle;
            }

            /*Suggestion*/
            .product-suggestion {
                height: fit-content;
                width: 230px;
                padding: 10px 20px 0px 20px;
                margin-bottom: -15px;
            }

            .sname, .sprice {
                text-align: center;
                font-weight: bold;
                color: #ff7e29;
            }

            .sprice {
                margin-top: 5px;
            }

            .deconone {
                text-decoration: none !important;
            }


            .simg {
                transition: 0.35s ease-in-out;
            }

                .simg:hover {
                    transform: scale(1.07);
                }

            /*Click this back to top*/
            .toTop {
                position: fixed;
                bottom: 15px;
                right: 15px;
                display: none;
            }

            .left-info {
                display: flex;
                flex-flow: column nowrap;
                justify-content: center;
                padding: 0px 15px 0px 0px;
                width: 80%;
            }

            .status-icon {
                display: flex;
                flex-flow: row nowrap;
                height: inherit;
                align-items: center;
                margin: 5px;
                margin-left: auto;
                color: white;
                font-weight: bold;
                font-size: 13px;
                width: 20%;
                justify-content: right;
            }

            .topStatus {
                background-color: grey;
                border-radius: 6px;
                padding: 6px 18px 6px 18px;
            }

            /*Mobile and Tablet*/
            @media (max-width: 869px) {
                .product-container {
                    flex-flow: column nowrap;
                }

                .left-box {
                    width: 100%;
                    margin: 5px;
                }

                .middle {
                    flex-flow: column nowrap;
                }

                .select-img {
                    flex-flow: row nowrap;
                    width: 40%;
                }

                .main-img {
                    width: 100%;
                }

                .right-box {
                    width: 100%;
                    margin: 5px;
                    flex-flow: column nowrap;
                    padding-bottom: 10px;
                    gap: 20px;
                }

                .product-suggestion {
                    display: flex;
                    margin-bottom: 20px;
                    flex-flow: column nowrap;
                    justify-content: center !important;
                    width: 100%;
                    gap: 20px;
                    align-items: center;
                }

                .suggestion1 {
                    margin-bottom: 20px;
                    width: 40%;
                }
            }

        </style>
    </asp:Content>
    <asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="home-content">
            <div class="sales-boxes">
            <div class="recent-sales box width-75">
                <div class="top-container">
                    <div class="product-header">
                        <div class="left-info">
                            <div class="header-title">
                                <h1 class="title" style="font-weight:600; font-size:30px; padding-bottom:15px;"><i class="bx bx-receipt"></i>&nbsp;Product Details</h1>
                                <span class="title2">Figure Name : </span>
                                <asp:TextBox runat="server" ID="txtFigureName" CssClass="input-field" ReadOnly="True">
                                </asp:TextBox>
                            </div>
                            <div class="series">
                                <span class="title2">Series : </span>
                                <asp:TextBox runat="server" ID="txtFigureSeries" CssClass="input-field" ReadOnly="True">
                                </asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <div class="middle">
                        <div class="main-img">
                            <asp:Image runat="server" ID="mainimg" Style="width: 80%; padding: 20px;" />
                        </div>
                        <div class="select-img">
                            <div class="img1" id="img1" style="border: 3px solid #ff7e29">
                                <asp:ImageButton OnClientClick="changeImg1(); return false;" CssClass="sideimg"
                                    runat="server" ID="newImgProd1" />
                            </div>
                            <div class="img2" id="img2">
                                <asp:ImageButton OnClientClick="changeImg2(); return false;" CssClass="sideimg"
                                    runat="server" ID="newImgProd2" />
                            </div>
                        </div>
                    </div>
                </div>
                <div style="padding: 10px; border-top: 1px solid lightgrey;">
                    <table class="product-details">
                        <tr class="releasedate">
                            <td class="title2">Release Date :
                            </td>
                            <td class="p-release">
                                <asp:TextBox runat="server" ID="txtFigureReleaseDate" CssClass="input-field2"
                                    ReadOnly="True">
                                </asp:TextBox>
                            </td>
                        </tr>
                        <tr class="releasedate">
                            <td class="title2">Category :
                            </td>
                            <td class="p-release">
                                <asp:DropDownList runat="server" ID="ddlProductCategory" CssClass="input-field2"
                                    Enabled="False">
                                    <asp:ListItem Text="Scale Figures" Value="Scale Figures"></asp:ListItem>
                                    <asp:ListItem Text="Nendoroids" Value="Nendoroids"></asp:ListItem>
                                    <asp:ListItem Text="Gundam" Value="Gundam"></asp:ListItem>
                                    <asp:ListItem Text="Dolls" Value="Dolls"></asp:ListItem>
                                    <asp:ListItem Text="Goods" Value="Goods"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr class="manufacturer">
                            <td class="title2">Manufacturer :
                            </td>
                            <td class="p-manufacturer">
                                <asp:TextBox runat="server" ID="txtFigureManufacturer" CssClass="input-field2"
                                    ReadOnly="True">
                                </asp:TextBox>
                            </td>
                        </tr>
                        <tr class="releasedate">
                            <td class="title2">Price(RM) :
                            </td>
                            <td class="p-release">
                                <asp:TextBox runat="server" ID="txtFigurePrice" CssClass="input-field2" ReadOnly="True">
                                </asp:TextBox>
                            </td>
                        </tr>
                        <tr class="status">
                            <td class="title2">Status :
                            </td>
                            <td class="p-status">
                                <asp:DropDownList runat="server" ID="ddlfigurestatus" CssClass="input-field2"
                                    Enabled="false">
                                    <asp:ListItem>Available</asp:ListItem>
                                    <asp:ListItem>Pre-Order</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr class="specification">
                            <td class="title2">Specification :
                            </td>
                            <td class="p-specification">
                                <asp:TextBox runat="server" ID="txtFigureSpecification" CssClass="input-field2"
                                    ReadOnly="True" TextMode="MultiLine" style="height:auto !important;">
                                </asp:TextBox>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>

            <div class="recent-sales box width-25">
                <div class="title">Update Stock</div>
                <label class="label-field">Current Quantity: </label>
                </br>

                <asp:TextBox runat="server" ID="txtUnit" CssClass="input-field" ReadOnly="True">
                </asp:TextBox>
                </br>



                <label class="label-field">Add Quantity: </label>
                </br>

                <asp:TextBox runat="server" ID="txtAddQuantity" CssClass="input-field border-lightsalmon"
                    OnTextChanged="Page_Load">0</asp:TextBox>
                <div style="width: 100%; display: flex; justify-content: center; gap:10px;">
                    <asp:Button ID="btn10" runat="server" Text="10" CssClass="form-button2"
                        OnClick="btnShortCutQuantity_Click" CausesValidation="False" />
                    <asp:Button ID="btn20" runat="server" Text="20" CssClass="form-button2"
                        OnClick="btnShortCutQuantity_Click" CausesValidation="False" />
                    <asp:Button ID="btn30" runat="server" Text="30" CssClass="form-button2"
                        OnClick="btnShortCutQuantity_Click" CausesValidation="False" />
                    <asp:Button ID="btn40" runat="server" Text="40" CssClass="form-button2"
                        OnClick="btnShortCutQuantity_Click" CausesValidation="False" />
                    <asp:Button ID="btn50" runat="server" Text="50" CssClass="form-button2"
                        OnClick="btnShortCutQuantity_Click" CausesValidation="False" />
                </div>
                <br />
                 <br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server"
                    ControlToValidate="txtAddQuantity" ErrorMessage="This field is required" ForeColor="Red"
                    Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidatorQuantity" runat="server"
                    ControlToValidate="txtAddQuantity" ErrorMessage="Please enter a valid numeric format"
                    ValidationExpression="\d+" ForeColor="Red" Display="Dynamic">
                </asp:RegularExpressionValidator>
                <asp:Button ID="btnCal" runat="server" Text="Calculate" CssClass="form-button2 width-100 mb-10"
                    OnClick="btnCal_Click" style="cursor: pointer;"/>
                 <br />
                 <br />
                <label class="label-field">Latest Quantity: </label>
                </br>
                <asp:TextBox runat="server" ID="txtLatestQuantity" CssClass="input-field" ReadOnly="True"></asp:TextBox>
                 <br /> <br />
                <asp:Button runat="server" ID="Button1" Text="Confirm to Add" CssClass="form-button"
                    OnClick="btnSubmit_Click" style="width:100%; cursor: pointer;"/>
                <asp:Button runat="server" ID="Button2" Text="Back" CssClass="form-button"
                    PostBackUrl="~/Staff/Product.aspx" CausesValidation="False"  style="width:100%; cursor: pointer;"/>
            </div>
           </div>
        </div>

        <script type="text/javascript">

            function changeImg1() {
                //Get Imaghe Path to change
                var path = document.getElementById('<%= newImgProd1.ClientID %>').src;

                //Change image
                document.getElementById('<%= mainimg.ClientID %>').src = path;

                //Change border color
                document.getElementById("img2").style.border = "none";
                document.getElementById("img1").style.border = "3px solid #ff7e29";
            }

            function changeImg2() {
                //Get Imaghe Path to change
                var path = document.getElementById('<%= newImgProd2.ClientID %>').src;

                //Change image
                document.getElementById('<%= mainimg.ClientID %>').src = path;

                //Change border color
                document.getElementById("img1").style.border = "none";
                document.getElementById("img2").style.border = "3px solid #ff7e29";
            }

        </script>
    </asp:Content>