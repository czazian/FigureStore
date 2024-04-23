<%@ Page Title="" Language="C#" MasterPageFile="~/Cust.Master" AutoEventWireup="true" CodeBehind="IndividualFigure.aspx.cs" Inherits="Assignment.Customer.IndividualFigure" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="InidividualFigure.css" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="product-container">
        <div class="left-box">
            <div class="top-container">
                <div class="product-header">
                    <div class="left-info">
                        <div class="header-title">
                            <asp:Label Style="font-weight: bold; font-size: 18px; color: #ff7e29" ID="pname" runat="server" Text="Nendoroid Frieren" />
                        </div>
                        <div class="series">
                            <span style="color: #ff7e29;">Series : </span>
                            <asp:Label ID="lblSeries" runat="server" Text="Frieren: Beyond Journey's End" />
                        </div>
                    </div>
                    <div class="status-icon" id="status">
                        <asp:Label runat="server" ID="lblTopStatus" CssClass="topStatus" Text="test" />
                    </div>
                </div>
                <div class="middle">
                    <div class="main-img">
                        <asp:Image runat="server" ID="mainimg" Style="width: 90%; padding: 20px;" />
                    </div>
                    <div class="select-img">
                        <div class="img1" id="img1" style="border: 3px solid #ff7e29">
                            <asp:ImageButton OnClientClick="changeImg1(); return false;" CssClass="sideimg" runat="server" ID="Image1" />
                        </div>
                        <div class="img2" id="img2">
                            <asp:ImageButton OnClientClick="changeImg2(); return false;" CssClass="sideimg" runat="server" ID="Image2" />
                        </div>
                    </div>
                </div>
            </div>
            <div style="padding: 10px; border-top: 1px solid lightgrey;">
                <table class="product-details">
                    <tr class="releasedate">
                        <td class="title">Release Date :
                        </td>
                        <td class="p-release">
                            <asp:Label runat="server" ID="prelease" Text="Jul 2024" />
                        </td>
                    </tr>
                    <tr class="manufacturer">
                        <td class="title">Manufacturer :
                        </td>
                        <td class="p-manufacturer">
                            <asp:Label runat="server" ID="pmanufacturer" Text="Good Smile Company" />
                        </td>
                    </tr>
                    <tr class="unit">
                        <td class="title">Available Unit :
                        </td>
                        <td class="p-unit">
                            <asp:Label runat="server" ID="punit" Text="50" />
                        </td>
                    </tr>
                    <tr class="status">
                        <td class="title">Status :
                        </td>
                        <td class="p-status">
                            <asp:Label runat="server" ID="pStatus" />
                        </td>
                    </tr>
                    <tr class="specification">
                        <td class="title">Specification :
                        </td>
                        <td class="p-specification">
                            <asp:Label runat="server" ID="pspecification" Text="Painted plastic non-scale articulated figure with stand included. Approximately 100mm in height." />
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <div class="right-box">
            <div class="price">
                Price :
                <asp:Label runat="server" ID="txtPrice" Text="RM 100.00" />
            </div>

            <div class="quantity-container">
                <table>
                    <tr>
                        <td class="q-title" style="margin-top: 5px; font-weight: bold; text-align: right;">Quantity
                        </td>
                        <td style="width: contain;">
                            <div>
                                <div>
                                    <div style="display: flex; flex-flow: row nowrap; justify-content: left;">
                                        <!--Deduct 1-->
                                        <span class="input-group-btn">
                                            <asp:LinkButton ValidationGroup="grp" OnClientClick="return false" runat="server" ID="btnMinus" CssClass="quantity-left-minus btn btn-number" Style="background-color: #ff7e29; color: white;" data-type="minus" data-field="">
                                                <i class="fa-solid fa-minus"></i>
                                            </asp:LinkButton>
                                        </span>

                                        <asp:TextBox ValidationGroup="grp" AutoPostBack="true" Text="1" ID="txtQuantity" runat="server" Style="border-color: #f0f0f0; text-align: center;" type="text" TextMode="Number" min="1" max="100" CssClass="noSpinners quantity" />

                                        <!--Add 1-->
                                        <span class="input-group-btn">
                                            <span class="input-group-btn">
                                                <asp:LinkButton ValidationGroup="grp" Style="background-color: #ff7e29; color: white" OnClientClick="return false;" runat="server" ID="btnAdd" CssClass="quantity-right-plus btn btn-number" data-type="plus" data-field="">
                                                    <i class="fa-solid fa-plus"></i>
                                                </asp:LinkButton>
                                            </span>
                                        </span>
                                    </div>
                                    <div style="display: flex; align-items: center; flex-flow: row nowrap; margin-top: 5px;">
                                        <asp:RangeValidator ID="rangevalidator" Type="Integer" SetFocusOnError="true" ForeColor="Red" ErrorMessage="Quantity must not be more than available unit." runat="server" ControlToValidate="txtQuantity" MinimumValue="1" />
                                    </div>
                                </div>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>

            <!--Add to card button-->
            <div class="row details-row addtocart" style="width: 100%;">
                <div style="display: flex; justify-content: center;">
                    <asp:Button OnClick="btnCart_Click" runat="server" ID="btnCart" CssClass="btn" Style="background-color: #ff7e29; width: 83%; margin-top: 5px; color: white; font-weight: bold;" Text="Add to cart" />
                </div>
            </div>

            <hr />

            <div class="info" style="margin-left: 10px; margin-right: 10px; margin-top: -10px; display: flex; flex-flow: column nowrap;">
                <div clas="notice" style="font-weight: bold;">
                    Notice : 
                </div>
                <div style="color: red;">
                    Please ensure that your quantity selected is not exceed
                    <asp:Label Style="font-weight: bold" ID="maxQty" runat="server" />, which is the maximum available unit for this product. 
                </div>
            </div>

            <hr style="margin-top: 0px; margin-bottom: 10px;" />


            <div style="text-align: left; font-weight: bold; font-size: 18px; align-self: flex-start; margin-left: 15px; margin-bottom: 10px;">
                Product Suggestions
            </div>
            <div class="product-suggestion">
                <!--Product Suggestion-->
                <asp:Repeater runat="server" ID="SuggestionRpt">
                    <ItemTemplate>
                        <div class="suggestion1">
                            <div class="simg">
                                <asp:Image Style="width: 100%; margin-bottom: 10px;" runat="server" ID="sImg" ImageUrl='<%# Eval("FigureImage1") %>' />
                            </div>
                            <div class="sname">
                                <asp:Label CssClass="deconone" runat="server" ID="sName" Text='<%# Eval("FigureName") %>' />
                            </div>
                            <div class="sprice">
                                <asp:Label CssClass="deconone" runat="server" ID="sPrice" Text='<%# Convert.ToDecimal(Eval("FigurePrice")).ToString("C2") %>' />
                            </div>
                            <asp:Button ID="view" OnCommand="view_Command" CommandArgument='<%# Eval("FigureID") %>' Font-Underline="false" Style="background-color: #ff7e29; width: 100%; font-weight: bold; color: white; margin-top: 5px;" runat="server" CssClass="btn border viewbtn" Text="View" />
                            <hr />
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
                <hr />
            </div>
        </div>
    </div>

    <div class="product-container">
        <!-- Rating show at here -->
        <div class="bottom-box">
            <div class="rating-container" style="width: 100%;">
                <h1 style="font-size: 25px; color: crimson; margin: 28px; font-weight: bold;">Customer Reviews</h1>
                <div style="display: flex; justify-content: space-between; align-items: center; flex-flow: row wrap; padding: 40px;">
                    <div style="display: flex; margin-left: 20px; margin-right: 20px;">
                        <div style="border: 1px solid white; padding: 30px 20px; border-radius: 100px; background-color: orangered; color: white;">
                            <asp:Label runat="server" ID="lblRate" Text="" Style="font-size: 50px; margin-top: 3px;" />
                        </div>
                        <div style="margin-left: 30px; display: flex; flex-flow: column nowrap; justify-content: center;">
                            <div class="stars" style="margin-bottom: 13px; font-size: 20px; text-shadow: 1px 1px grey">
                                <asp:Label runat="server" ID="ranking" />
                            </div>
                            <div class="noOfPeople">
                                <asp:Label runat="server" ID="people" />
                            </div>
                        </div>
                    </div>

                    <div class="rating" style="flex: 0 1 500px;">
                        <div class="row">
                            <div class="side">
                                <div>5 <i class="fa-solid fa-star" style="color: lightcoral"></i></div>
                            </div>
                            <div class="middle">
                                <div class="bar-container">
                                    <div class="bar-5" id="bar5"></div>
                                </div>
                            </div>
                            <div class="side right">
                                <div>
                                    <asp:Label runat="server" ID="lblFiveStar" />
                                </div>
                            </div>
                            <div class="side">
                                <div>4 <i class="fa-solid fa-star" style="color: lightcoral"></i></div>
                            </div>
                            <div class="middle">
                                <div class="bar-container">
                                    <div class="bar-4" id="bar4"></div>
                                </div>
                            </div>
                            <div class="side right">
                                <div>
                                    <asp:Label runat="server" ID="lblFourStar" />
                                </div>
                            </div>
                            <div class="side">
                                <div>3 <i class="fa-solid fa-star" style="color: lightcoral"></i></div>
                            </div>
                            <div class="middle">
                                <div class="bar-container">
                                    <div class="bar-3" id="bar3"></div>
                                </div>
                            </div>
                            <div class="side right">
                                <div>
                                    <asp:Label runat="server" ID="lblThreeStar" />
                                </div>
                            </div>
                            <div class="side">
                                <div>2 <i class="fa-solid fa-star" style="color: lightcoral"></i></div>
                            </div>
                            <div class="middle">
                                <div class="bar-container">
                                    <div class="bar-2" id="bar2"></div>
                                </div>
                            </div>
                            <div class="side right">
                                <div>
                                    <asp:Label runat="server" ID="lblTwoStar" />
                                </div>
                            </div>
                            <div class="side">
                                <div>1 &nbsp;<i class="fa-solid fa-star" style="color: lightcoral"></i></div>
                            </div>
                            <div class="middle">
                                <div class="bar-container">
                                    <div class="bar-1" id="bar1"></div>
                                </div>
                            </div>
                            <div class="side right">
                                <div>
                                    <asp:Label runat="server" ID="lblOneStar" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <%
                    if (CommentRepeater.Controls.Count == 0)
                    {
                        emptyComment.Visible = true;
                        emptyComment.Text = "No comment yet.";
                    }
                    else
                    {
                        emptyComment.Visible = false;
                        emptyComment.Text = "";
                    }
                %>

                <div class="comment-container" style="width: 100%;">
                    <div style="display: flex; flex-flow: row nowrap; justify-content: space-between; margin-bottom: 10px;">
                        <h1 style="font-size: 22px; margin: 28px; color: dimgray; font-weight: bold;">Comments</h1>
                        <asp:DropDownList Style="font-size: 15px; height: 30px; margin-top: 5px; margin-right:28px" runat="server" ID="ddlFilter" OnSelectedIndexChanged="ddlFilter_SelectedIndexChanged" AutoPostBack="true">
                            <asp:ListItem Selected="True" Value="0">Sort by Star (1-5)</asp:ListItem>
                            <asp:ListItem Value="1">Sort by Star (5 - 1)</asp:ListItem>
                            <asp:ListItem Value="2">Sort by Latest</asp:ListItem>
                            <asp:ListItem Value="3">Sort by Oldest</asp:ListItem>
                            <asp:ListItem Value="4">Show only 1 Star</asp:ListItem>
                            <asp:ListItem Value="5">Show only 2 Stars</asp:ListItem>
                            <asp:ListItem Value="6">Show only 3 Stars</asp:ListItem>
                            <asp:ListItem Value="7">Show only 4 Stars</asp:ListItem>
                            <asp:ListItem Value="8">Show only 5 Stars</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <asp:Label Style="padding-top: 20px; padding-bottom: 20px; border: 1.5px solid grey; color: dimgray; font-size: 1.2rem; text-align: center; width: 95%; display: flex; flex-flow: row nowrap; justify-content: center; margin: 10px 0px 10px 30px;" runat="server" ID="emptyComment" />

                    <!-- Comment Repeater -->
                    <asp:Repeater runat="server" ID="CommentRepeater">
                        <ItemTemplate>
                            <div class="one-comment" style="padding: 10px; margin-bottom: 20px;">
                                <div style="display: flex;">
                                    <div class="photo">
                                        <asp:Image runat="server" ID="profileImg" Width="80" Height="80" Style="border-radius: 10px; border: 3px outset crimson;" ImageUrl='<%# Eval("Image") %>' />
                                    </div>
                                    <div class="info" style="display: flex; justify-content: space-between; width: 100%;">
                                        <div class="personal-info" style="margin-left: 10px; display: flex; flex-flow: column nowrap; justify-content: center; gap: 15px;">
                                            <div class="name">
                                                <asp:Label Style="font-size: 19px; color: dodgerblue; font-weight: bold;" runat="server" ID="lblName" Text='<%# Eval("Name") %>' />
                                            </div>

                                            <div class="star star-box" id="starID">
                                                <input type="hidden" value='<%# Eval("RateStar") %>' class="starHidden" />
                                            </div>
                                        </div>
                                        <div class="date" style="margin-right: 10px;">
                                            <asp:Label Style="font-size: 15px;" runat="server" ID="lblDate" Text='<%# DateTime.Parse(Eval("CommentDate").ToString()).ToString("dd MMM yyyy") %>' />
                                        </div>
                                    </div>
                                </div>

                                <div class="long-comment" style="width: 100%; line-height: 18px; margin-top: 6px;">
                                    <asp:Label runat="server" ID="lblComment" Text='<%# Eval("COmment") %>' />
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>
        </div>
        <!-- Rating end -->
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

<asp:Content ID="Content4" ContentPlaceHolderID="JS" runat="server">

    <script type="text/javascript">

        function changeImg1() {
            //Get Imaghe Path to change
            var path = document.getElementById('<%= Image1.ClientID %>').src;

            //Change image
            document.getElementById('<%= mainimg.ClientID %>').src = path;

            //Change border color
            document.getElementById("img2").style.border = "none";
            document.getElementById("img1").style.border = "3px solid #ff7e29";
        }

        function changeImg2() {
            //Get Imaghe Path to change
            var path = document.getElementById('<%= Image2.ClientID %>').src;

            //Change image
            document.getElementById('<%= mainimg.ClientID %>').src = path;

            //Change border color
            document.getElementById("img1").style.border = "none";
            document.getElementById("img2").style.border = "3px solid #ff7e29";
        }


        //Add and deduct quantity
        $(document).ready(function () {

            var quantitiy = 0;
            $('.quantity-right-plus').click(function (e) {

                // Stop acting like a button
                e.preventDefault();
                // Get the field name
                var quantity = parseInt($('.quantity').val());

                $('.quantity').val(quantity + 1);

            });

            $('.quantity-left-minus').click(function (e) {
                // Stop acting like a button
                e.preventDefault();
                // Get the field name
                var quantity = parseInt($('.quantity').val());

                if (quantity > 1) {
                    $('.quantity').val(quantity - 1);
                }
            });

        });
    </script>
    <!--Rating Star-->
    <script>
        $(document).ready(function () {
            //Each Comment will be Loop
            $(".starBox").each(function () {
                let starBox = $(this);
                let numberOfStar = parseInt($(this).find('.starHidden').val()); //Able to get no of star for each comment

                //Know the number of star of each comment
                for (let i = 0; i < numberOfStar; i++) {
                    var element = document.createElement("i");
                    element.classList.add("fa-solid", "fa-star");
                    element.style.color = "crimson";
                    starBox.append(element.cloneNode());
                }
            })

            //set the progress bar length of each rate star 
            var one = <%= this.percentageOfOne %>;
         var two = <%= this.percentageOfTwo %>;
         var three = <%= this.percentageOfThree %>;
         var four = <%= this.percentageOfFour %>;
         var five = <%= this.percentageOfFive %>;

         document.getElementById('bar1').style.width = one + "%";
         document.getElementById('bar2').style.width = two + "%";
         document.getElementById('bar3').style.width = three + "%";
         document.getElementById('bar4').style.width = four + "%";
         document.getElementById('bar5').style.width = five + "%";


         //Set the color of the ranking
         var rank = document.getElementById('<%=ranking.ClientID%>').innerHTML;
         var rankItem = document.getElementById('<%=ranking.ClientID%>');
         console.log(rank);
         if (rank == "Excellent") {
             rankItem.style.color = "lawngreen";
         } else if (rank == "Good") {
             rankItem.style.color = "#ffc654";
         } else if (rank == "Unsatisfied") {
             rankItem.style.color = "#f53d3d";
         } else {
             rankItem.style.color = "#bdbdbd";
         }
     })
    </script>
</asp:Content>

