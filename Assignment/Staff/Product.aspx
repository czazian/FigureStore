<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Product.aspx.cs" Inherits="Assignment.Staff.Product" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        #prodLi {
    background: #545454 ;
}
        
.home-content .sales-boxes {
    display: flex;
    justify-content: space-between;
    /* padding: 0 20px; */
}

    /* left box */
    .home-content .sales-boxes .recent-sales {
        width: 97%;
        background: #fff;
        padding: 20px 30px;
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
    height:18px;
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

    .border-lightsalmon{
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
                <div class="title" style="padding-bottom:10px; font-size:30px;">Product List</div>
                <div style="display: flex; justify-content: space-between; align-items: flex-start;">

                    <div class="search-box">
                        <asp:TextBox runat="server" ID="txtSearch" placeholder="Search..."></asp:TextBox>
                        <asp:LinkButton runat="server" ID="linkBtnSearch" OnClick="linkBtnSearch_Click"><i class='bx bx-search' style="background-color:#ff7e29;"></i></asp:LinkButton>
                    </div>
                    <div>
                        <asp:Button runat="server" ID="createProductBtn" Text="Add New Product" CssClass="form-button" PostBackUrl="~/Staff/AddProduct.aspx" />
                    </div>
                </div>


                <div class="sales-details">

                    <asp:Repeater ID="Repeater5" runat="server" DataSourceID="SqlDataSource1">
                        <HeaderTemplate>
                            <ul class="details">
                                <hr />
                                <li class="topic">No</li>
                                <hr />
                        </headertemplate>
                        <itemtemplate>
                            <li><%# Container.ItemIndex + 1 %>.</li>
                            <hr />
                        </itemtemplate>
                        <footertemplate>
                            </ul>
                        </footertemplate>
                    </asp:Repeater>

                    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
                        <headertemplate>
                            <ul class="details">
                                <hr />
                                <li class="topic">Title</li>
                                <hr />
                        </headertemplate>
                        <itemtemplate>
                            <li><%# Eval("FigureName") %></li>
                            <hr />
                        </itemtemplate>
                        <footertemplate>
                            </ul>
                        </footertemplate>
                    </asp:Repeater>

                    <asp:Repeater ID="Repeater2" runat="server" DataSourceID="SqlDataSource1">
                        <headertemplate>
                            <ul class="details">
                                <hr />
                                <li class="topic">Price</li>
                                <hr />
                        </headertemplate>
                        <itemtemplate>
                            <li>RM <%# Eval("FigurePrice") %></li>
                            <hr />
                        </itemtemplate>
                        <footertemplate>
                            </ul>
                        </footertemplate>
                    </asp:Repeater>

                    <asp:Repeater ID="Repeater3" runat="server" DataSourceID="SqlDataSource1">
                        <headertemplate>
                            <ul class="details">
                                <hr />
                                <li class="topic">Category</li>
                                <hr />
                        </headertemplate>
                        <itemtemplate>
                            <li><%# Eval("FigureCategory") %></li>
                            <hr />
                        </itemtemplate>
                        <footertemplate>
                            </ul>
                        </footertemplate>
                    </asp:Repeater>

                    <asp:Repeater ID="Repeater7" runat="server" DataSourceID="SqlDataSource1">
                        <headertemplate>
                            <ul class="details">
                                <hr />
                                <li class="topic">Unit</li>
                                <hr />
                        </headertemplate>
                        <itemtemplate>
                            <li class="txt-center"><%# Eval("FigureUnit") %></li>
                            <hr />
                        </itemtemplate>
                        <footertemplate>
                            </ul>
                        </footertemplate>
                    </asp:Repeater>

                    <asp:Repeater ID="Repeater6" runat="server" DataSourceID="SqlDataSource1" OnItemCommand="Repeater6_ItemCommand">
                        <headertemplate>
                            <ul class="details">
                                <hr />
                                <li class="topic">Operation</li>
                                <hr />
                        </headertemplate>
                        <itemtemplate>
                            <li class="txt-center">
                                <%--still trying make it query string send and retrieve work--%>
                                <a href="product_view.aspx?figureID=<%# Eval("FigureID") %>"><i class='bx bx-show'></i></a>
                                <a href="product_edit.aspx?figureID=<%# Eval("FigureID") %>"><i class='bx bxs-edit'></i></a>
                                <a href="product_addStock.aspx?figureID=<%# Eval("FigureID") %>"><i class='bx bxs-package'></i></a>
                                <asp:LinkButton runat="server" ID="Hyperlink1" OnClientClick='<%# CreateConfirmation(Eval("FigureName")) %>' OnCommand="delete_click" CommandName="deleteClick" CommandArgument='<%# Eval("FigureID")%>'><i class='bx bxs-trash'></i></asp:LinkButton>
                            </li>
                            <hr />
                        </itemtemplate>
                        <footertemplate>
                            </ul>
                        </footertemplate>
                    </asp:Repeater>

                </div>

                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ApexOnlineShopDb %>" SelectCommand="SELECT * FROM [Figure]"></asp:SqlDataSource>
                <br />
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ApexOnlineShopDb %>" SelectCommand="SELECT * FROM [Figure] WHERE ([FigureName] LIKE '%' + @FigureName + '%')">
                    <selectparameters>
                        <asp:ControlParameter ControlID="txtSearch" Name="FigureName" PropertyName="Text" Type="String" />
                    </selectparameters>
                </asp:SqlDataSource>
                <br />
            </div>
        </div>
    </div>
</asp:Content>
