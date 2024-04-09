<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="AddProduct.aspx.cs" Inherits="Assignment.Staff.AddProduct" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        #prodLi {
            background: #545454;
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
                padding: 30px 60px;
                margin: 0 20px;
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
            background-color: lightsalmon;
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
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="home-content">
    <div class="sales-boxes">

        <div class="recent-sales box">

            <div class="title" style="padding-bottom:25px; font-size:30px; font-weight:600; color: #ff7e29;"><i class="bx bx-list-plus"></i>&nbsp;Add New Product</div>
            <label class="label-field">Figure Name: </label>
            </br>
            </br>
             <asp:TextBox runat="server" ID="txtFigureName" CssClass="input-field"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtFigureName" ErrorMessage="This field is required" ForeColor="Red"></asp:RequiredFieldValidator>
            <br><br />
                <label class="label-field">Figure Series: </label>
            </br>
            </br>
            <asp:TextBox runat="server" ID="txtFigureSeries" CssClass="input-field"></asp:TextBox><br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtFigureSeries" ErrorMessage="This field is required" ForeColor="Red"></asp:RequiredFieldValidator>
            <br></br>
            <label class="label-field">Figure Manufacturer: </label>
            </br>
            </br>
           
        <asp:TextBox runat="server" ID="txtFigureManufacturer" CssClass="input-field"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtFigureManufacturer" ErrorMessage="This field is required" ForeColor="Red"></asp:RequiredFieldValidator>
        <br></br>
        <label class="label-field">Figure Specification: </label>
        </br>
</br>
        <asp:TextBox runat="server" ID="txtFigureSpecification" CssClass="input-field"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="txtFigureSpecification" ErrorMessage="This field is required" ForeColor="Red"></asp:RequiredFieldValidator>
        <br></br>
        <label class="label-field">Figure Release Date (DD-MM-YY): </label>
        </br>
</br>
        <asp:TextBox runat="server" ID="txtFigureReleaseDate" CssClass="input-field"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="txtFigureReleaseDate" ErrorMessage="This field is required" ForeColor="Red"></asp:RequiredFieldValidator>
        <br></br>
        <label class="label-field">Price (RM 0.00): </label>
            </br></br>
        <asp:TextBox runat="server" ID="txtFigurePrice" CssClass="input-field"></asp:TextBox><br />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"
            ControlToValidate="txtFigurePrice"
            ErrorMessage="This field is required"
            ForeColor="Red"
            Display="Dynamic">
            </asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                ControlToValidate="txtFigurePrice"
                ErrorMessage="Please enter a valid numeric format (e.g., 00.00)"
                ValidationExpression="\d+(\.\d{1,2})?"
                ForeColor="Red"
                Display="Dynamic">
            </asp:RegularExpressionValidator>
            <br></br>
            <label class="label-field">Category: </label>
            </br>
            </br>
            <asp:DropDownList runat="server" ID="ddlProductCategory" CssClass="input-field">
                <asp:ListItem Text="Scale Figures" Value="Scale Figures"></asp:ListItem>
                <asp:ListItem Text="Nendoroids" Value="Nendoroids"></asp:ListItem>
                <asp:ListItem Text="Gundam" Value="Gundam"></asp:ListItem>
                <asp:ListItem Text="Dolls" Value="Dolls"></asp:ListItem>
                <asp:ListItem Text="Goods" Value="Goods"></asp:ListItem>
            </asp:DropDownList>
            </br>
           <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="ddlProductCategory" ErrorMessage="This field is required" ForeColor="Red"></asp:RequiredFieldValidator>
            </br>
            </br>
            <label class="label-field">Quantity/Unit(s): </label>
            </br>
            </br>
            <asp:TextBox runat="server" ID="txtUnit" CssClass="input-field"></asp:TextBox></br>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtUnit" ErrorMessage="This field is required" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server"
                ControlToValidate="txtUnit"
                ErrorMessage="Please enter a valid numeric format"
                ValidationExpression="\d+"
                ForeColor="Red"
                Display="Dynamic">
            </asp:RegularExpressionValidator>
            </br>
            </br>
                
        <label class="label-field">Figure Image 1:</label></br></br>
           
        <asp:FileUpload runat="server" ID="newImgProd1" CssClass="input-field" style="align-content:center;" /></br>
           
        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="newImgProd1" ErrorMessage="This field is required" ForeColor="Red"></asp:RequiredFieldValidator>
        <br></br>
        <label class="label-field">Figure Image 2:</label></br></br>
        <asp:FileUpload runat="server" ID="newImgProd2" CssClass="input-field" style="align-content:center;"  /></br>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="newImgProd2" ErrorMessage="This field is required" ForeColor="Red"></asp:RequiredFieldValidator>
        <br></br>
        <label class="label-field">Figure Status: </label>
        <br />
            <br />
            <asp:DropDownList runat="server" ID="ddlfigurestatus" CssClass="input-field">
                <asp:ListItem>Available</asp:ListItem>
                <asp:ListItem>Pre-Order</asp:ListItem>
            </asp:DropDownList>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="ddlfigurestatus" ErrorMessage="This field is required" ForeColor="Red"></asp:RequiredFieldValidator>
            </br>
            <asp:Button runat="server" ID="btnBack" Text="Back" CssClass="form-button" PostBackUrl="~/Staff/Product.aspx" CausesValidation="False" />
            <asp:Button runat="server" ID="btnSubmit" Text="Submit" CssClass="form-button" OnClick="btnSubmit_Click" />
        </div>

    </div>
</asp:Content>
