<%@ Page Title="" Language="C#" MasterPageFile="~/Cust.Master" AutoEventWireup="true" CodeBehind="EditProfile.aspx.cs" Inherits="Assignment.Customer.EditProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="EditProfile.css" />
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="edit">
        <div class="sidebar">
            <div class="tt">
                MY ACTION
            </div>
            <div class="inner-side">
                <asp:LinkButton PostBackUrl="~/Customer/UserProfile.aspx" CssClass="lb" runat="server" ID="goProfile">
                  <i class="fa-solid fa-address-card"></i>&nbsp;&nbsp;MY PROFILE
                </asp:LinkButton>

                <asp:LinkButton PostBackUrl="~/Customer/EditProfile.aspx" CssClass="lb" runat="server" ID="goEdit">
                  <i class="fa-solid fa-pen-to-square"></i>&nbsp;&nbsp;EDIT PROFILE
                </asp:LinkButton>

                <asp:LinkButton PostBackUrl="~/Customer/OrderTrack.aspx" CssClass="lb" runat="server" ID="goOrder">
                  <i class="fa-solid fa-cart-shopping"></i>&nbsp;&nbsp;MY ORDER
                </asp:LinkButton>

                <asp:LinkButton PostBackUrl="~/Customer/Home.aspx" CssClass="lb" runat="server" ID="goLogout">
                  <i class="fa-solid fa-right-from-bracket"></i>&nbsp;&nbsp;LOGOUT
                </asp:LinkButton>
            </div>
        </div>

        <div class="box">
            <div class="title">
                <div class="maintitle">
                    Edit Profile
                </div>
                <div class="subtitle">
                    Manage Profile Information 
                </div>
            </div>
            <hr style="color: black; margin-top: 10px; margin-bottom: 10px; opacity: 1;" />
            <div class="changeimg">
                <div class="profile-title">
                    Your Profile Photo
                </div>
                <div class="image-container">
                    <div class="img">
                        <asp:Image Style="border-radius: 100px; width: 100%; width: 120px; height: 120px;"
                            runat="server" ID="profileimg" ImageUrl="~/Image/Profile/user.jpg" />
                    </div>
                    <div class="btn-grouping">
                        <div class="img-change-btn">
                            <asp:FileUpload accept=".png,.jpg,.jpeg,.gif" ID="FileUpload1" Style="display: none" runat="server" onchange="upload()" />
                            <input type="button" value="Change Photo" class="btn border b1" onclick="showBrowseDialog()" />

                            <asp:Button runat="server" ID="hideButton" Style="display: none;" OnClick="hideButton_Click" />
                        </div>
                        <div class="img-delete-btn">
                            <asp:LinkButton OnClick="Delete_Click" CssClass="btn border b2" runat="server">
                            <i class="fa-solid fa-trash" style="color:red"></i>&nbsp;Delete
                            </asp:LinkButton>
                        </div>
                    </div>
                </div>
                <div class="suggestion-img">
                    Change your photo. A photo of 120×120px is recommended.
                </div>
            </div>
            <div class="edit-input">
                <div class="profile-title">
                    Your Personal Information
                </div>
                <div class="edit-items">
                    <div class="form-floating username">
                        <asp:TextBox Text="Lala Yang" runat="server" ID="txtUsername" class="form-control" placeholder="Username" />
                        <label for="txtUsername">Username</label>
                    </div>
                    <div class="form-floating phoneno">
                        <asp:TextBox Text="012-34567890" runat="server" ID="txtPhoneno" class="form-control" placeholder="Phone No." />
                        <label for="txtPhoneno">Phone No.</label>
                    </div>
                    <div class="form-floating address">
                        <asp:TextBox Text="TARUMT, Jalan Genting Kelang, Setapak, 53300 Kuala Lumpur, Federal Territory of Kuala Lumpur." Style="height: 100px; resize: none;" TextMode="MultiLine" runat="server" ID="txtHomeAddress" class="form-control" placeholder="Home Address" />
                        <label for="txtHomeAddress">Home Address</label>
                    </div>
                </div>
            </div>
            <div class="edit-btn">
                <asp:Button PostBackUrl="~/Customer/EditProfile.aspx" CssClass="border btn btn-edit" runat="server" Text="Edit Profile" />
            </div>
        </div>
    </div>
</asp:Content>


<asp:Content ID="Content3" ContentPlaceHolderID="JS" runat="server">
    <script type="text/javascript">
        function showBrowseDialog() {
            var fileuploadctrl = document.getElementById('<%= FileUpload1.ClientID %>');
            fileuploadctrl.click();
        }

        function upload() {
            var btn = document.getElementById('<%= hideButton.ClientID %>');
            btn.click();
        }
    </script>
</asp:Content>
