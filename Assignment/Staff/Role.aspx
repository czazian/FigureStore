<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeFile="Role.aspx.cs" Inherits="Assignment.Staff.Role" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        #roleLi {
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
                <div class="title" style="padding-bottom: 10px; font-size: 30px; font-weight: 600; color: #ff7e29"><i class="bx bx-street-view"></i>&nbsp;Role/Position List</div>
                <div style="display: flex; justify-content: space-between; align-items: flex-start;">
                    <div class="search-box">
                        <asp:TextBox runat="server" ID="txtSearch" placeholder="Search..."></asp:TextBox>
                        <asp:LinkButton runat="server" ID="linkBtnSearch" OnClick="linkBtnSearch_Click"><i class='bx bx-search' style="background-color: #ff7e29;"></i></asp:LinkButton>
                    </div>
                    <div>
                        <asp:Button runat="server" ID="createStaffBtn" Text="Add New Role" CssClass="form-button" Style="cursor: pointer;" PostBackUrl="~/Staff/AddRole.aspx" />
                    </div>
                </div>
                <div class="sales-details" style="padding-top: 25px;">
                    <asp:Repeater ID="Repeater5" runat="server" DataSourceID="SqlDataSource1">
                        <HeaderTemplate>
                            <ul class="details">
                                <hr />
                                <li class="topic">No</li>
                                <hr />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <li><%# Container.ItemIndex + 1 %>.</li>
                            <hr />
                        </ItemTemplate>
                        <FooterTemplate>
                            </ul>
       
                        </FooterTemplate>
                    </asp:Repeater>

                    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
                        <HeaderTemplate>
                            <ul class="details">
                                <hr />
                                <li class="topic">Role</li>
                                <hr />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <li><%# Eval("RoleName") %></li>
                            <hr />
                        </ItemTemplate>
                        <FooterTemplate>
                            </ul>
       
                        </FooterTemplate>
                    </asp:Repeater>

                    <asp:Repeater ID="Repeater2" runat="server" DataSourceID="SqlDataSource1">
                        <HeaderTemplate>
                            <ul class="details">
                                <hr />
                                <li class="topic">Product</li>
                                <hr />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <li class="box txt-center">
                                <input type="hidden" value="<%# Eval("ProductPermission") %>" class="hiddenF"><i class="icon "></i></li>
                            <hr />
                        </ItemTemplate>
                        <FooterTemplate>
                            </ul>
       
                        </FooterTemplate>
                    </asp:Repeater>

                    <asp:Repeater ID="Repeater3" runat="server" DataSourceID="SqlDataSource1">
                        <HeaderTemplate>
                            <ul class="details">
                                <hr />
                                <li class="topic">Report</li>
                                <hr />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <li class="box txt-center">
                                <input type="hidden" value="<%# Eval("ReportPermission") %>" class="hiddenF"><i class="icon "></i></li>
                            <hr />
                        </ItemTemplate>
                        <FooterTemplate>
                            </ul>
       
                        </FooterTemplate>
                    </asp:Repeater>

                    <asp:Repeater ID="Repeater4" runat="server" DataSourceID="SqlDataSource1">
                        <HeaderTemplate>
                            <ul class="details">
                                <hr />
                                <li class="topic">Member</li>
                                <hr />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <li class="box txt-center">
                                <input type="hidden" value="<%# Eval("MemberPermission") %>" class="hiddenF"><i class="icon "></i></li>
                            <hr />
                        </ItemTemplate>
                        <FooterTemplate>
                            </ul>
       
                        </FooterTemplate>
                    </asp:Repeater>

                    <asp:Repeater ID="Repeater6" runat="server" DataSourceID="SqlDataSource1">
                        <HeaderTemplate>
                            <ul class="details">
                                <hr />
                                <li class="topic">Staff</li>
                                <hr />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <li class="box txt-center">
                                <input type="hidden" value="<%# Eval("StaffPermission") %>" class="hiddenF"><i class="icon "></i></li>
                            <hr />
                        </ItemTemplate>
                        <FooterTemplate>
                            </ul>
       
                        </FooterTemplate>
                    </asp:Repeater>

                    <asp:Repeater ID="Repeater8" runat="server" DataSourceID="SqlDataSource1">
                        <HeaderTemplate>
                            <ul class="details">
                                <hr />
                                <li class="topic">Role</li>
                                <hr />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <li class="box txt-center">
                                <input type="hidden" value="<%# Eval("RolePermission") %>" class="hiddenF"><i class="icon "></i></li>
                            <hr />
                        </ItemTemplate>
                        <FooterTemplate>
                            </ul>
       
                        </FooterTemplate>
                    </asp:Repeater>

                    <asp:Repeater ID="Repeater7" runat="server" DataSourceID="SqlDataSource1">
                        <HeaderTemplate>
                            <ul class="details">
                                <hr />
                                <li class="topic">Operation</li>
                                <hr />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <li class="txt-center">
                                <%--still trying make it query string send and retrieve work--%>
                                <a href="ViewRole.aspx?roleID=<%# Eval("AdminRoleID") %>"><i class='bx bx-show'></i></a>&nbsp;
                                <a href="EditRole.aspx?roleID=<%# Eval("AdminRoleID") %>"><i class='bx bxs-edit' style="background-color:dodgerblue;"></i></a>&nbsp;
                                <asp:LinkButton runat="server" ID="Hyperlink1" OnClientClick='<%# CreateConfirmation(Eval("RoleName")) %>' OnCommand="delete_click" CommandName="deleteClick" CommandArgument='<%# Eval("AdminRoleID")%>'><i class='bx bxs-trash'></i></asp:LinkButton>
                            </li>
                            <hr />
                        </ItemTemplate>
                        <FooterTemplate>
                            </ul>
       
                        </FooterTemplate>
                    </asp:Repeater>
                </div>
            </div>
        </div>
    </div>
    <br />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ApexOnlineShopDb %>" SelectCommand="SELECT * FROM [AdminRole]"></asp:SqlDataSource>

    <script>
        //display true or false for each repeater item 
        $(document).ready(function () {
            //$('.ic').each(function () {
            //    $(this).addclass('bx bxs-check-circle');
            //});
            $('.box').each(function () {
                var value = parseInt($(this).find('.hiddenF').val()); // Get the value, modify selector based on your Label's structure
                var icon = $(this).find('.icon'); // Select the icon element

                // Use conditions to change the icon based on the value
                if (value == 0) {
                    icon.addClass('bx bxs-x-circle');
                } else if (value == 1) {
                    icon.addClass('bx bxs-check-circle');
                }
            });
        });


</script>
    <br />
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ApexOnlineShopDb %>" SelectCommand="SELECT * FROM Admin[Role] WHERE ([RoleName] LIKE '%' + @RoleName + '%')">
        <SelectParameters>
            <asp:ControlParameter ControlID="txtSearch" Name="RoleName" PropertyName="Text" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
