<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="StaffProfile.aspx.cs" Inherits="Assignment.Staff.StaffProfile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        /*Content*/
        .main {
            width: 1000px;
            height: 650px;
            display: flex;
            flex-flow: row nowrap;
            margin: auto;
            border-radius: 10px;
            padding-top: 120px;
        }


        .left {
            border-radius: 5px;
            padding: 20px;
            background-color: #fc873a;
            width: 35%;
            height: 100%;
            display: flex;
            flex-flow: column nowrap;
            align-items: center;
            justify-content: center;
            gap: 10px;
        }


        .profileimg {
            width: 250px;
            height: 250px;
            border-radius: 150px;
            border: 2px solid grey;
            overflow: hidden;
        }

        .profilename {
            font-size: 22px;
            color: white;
            font-weight: bold;
            text-indent: 8px;
        }

        .right {
            border-radius: 5px;
            width: 65%;
            padding: 30px;
            background-color: white;
        }

        .right-content {
            border-radius: 10px;
            height: 100%;
            width: 100%;
            padding: 10px;
            display: flex;
            flex-flow: column nowrap;
            border-block:solid 3px;
        }

        legend {
            margin-top: -30px;
            margin-left: 6px;
            background-color: white;
            width: fit-content;
            padding: 0px 6px 0px 6px;
            font-weight: bold;
            font-size: 28px;
            color: #ff7e29;
        }

        .profile-info {
            width: 100%;
            font-size: 18px;
        }

        th {
            width: 165px;
            margin-bottom: 20px;
            color: #ff7e29;
            vertical-align: top;
            padding: 8px;
            display: flex;
            flex-flow: row nowrap;
            justify-content: space-between;
        }

        td {
            padding: 8px;
            vertical-align: top;
        }

        .btn-edit {
            padding: 10px 20px 10px 20px;
            background-color: #ff7e29;
            color: white;
            font-weight: bold;
            text-align: right;
            margin: 10px;
        }

            .btn-edit:hover {
                color: white;
                background-color: #f56a0f;
            }

        .edit-btn {
            display: flex;
            flex-flow: row nowrap;
            justify-content: right;
            margin-top: auto;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="main">
    <div class="left">
        <div class="profileimg">
            <asp:Image Style="width: 250px; height: 250px; border-radius: 100px; z-index: 3;"
                runat="server" ID="profileimg" ImageUrl="~/Image/Profile/userprofile.jpg"/>
        </div>
        <div class="profilename">
            @<asp:Label runat="server" ID="username" />
        </div>
    </div>
        <div class="right">
                <h1 style="font-size:32px; padding-bottom:25px;"><i class="bx bx-user"></i>&nbsp;User Profile</h1>
                <div class="profile-info">
                    <label class="label-field">Username: </label>
                    </br>
                    <asp:TextBox runat="server" ID="txtUsername" CssClass="input-field"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtUsername" ErrorMessage="This field is required" ForeColor="Red"></asp:RequiredFieldValidator>
                    <br>
                        <label class="label-field">Old Password:</label></br>
                    <asp:TextBox runat="server" ID="txtPrevPassw" CssClass="input-field" AutoPostBack="True"  OnTextChanged="txtPrevPassw_TextChanged"></asp:TextBox>
                    <asp:Label ID="lblPrevPassErrorMsg" runat="server" ForeColor="#FF3300"></asp:Label>
                    <asp:HiddenField ID="prevPasswHashed" runat="server" />
                    <asp:HiddenField ID="hiddenVal_prevPass" runat="server" Value="no" />
                    <br />
                    <br>
                        <label class="label-field">New Password:</label></br>
                    <asp:TextBox runat="server" ID="txtNewPassw" CssClass="input-field"></asp:TextBox>
                    <br>
                        <label class="label-field">Role: </label>
                    </br>

                    <!--                            edit role is not allow in profile-->
                    <asp:DropDownList runat="server" ID="ddlRole" CssClass="input-field" Enabled="False">
                        <asp:ListItem Text="Admin" Value="Admin" Selected="False"></asp:ListItem>
                        <asp:ListItem Text="Manager" Value="Manager"></asp:ListItem>
                        <asp:ListItem Text="Crew" Value="Crew"></asp:ListItem>
                    </asp:DropDownList>
                    <br>
                </div>
                <div class="edit-btn">
                    <asp:Button runat="server" ID="btnSubmit" Text="Update" CssClass="form-button" OnClick="btnSubmit_Click"/>
                </div>
        </div>
    </div>
</asp:Content>
