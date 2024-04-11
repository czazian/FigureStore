<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeFile="EditMember.aspx.cs" Inherits="Assignment.Staff.EditMember" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href='https://fonts.googleapis.com/css?family=Poppins' rel='stylesheet'>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta2/css/all.min.css"
        integrity="sha512-YWzhKL2whUzgiheMoBFwW8CKV4qpHQAEuvilg9FAn5VJUDwKZZxkJNuGM4XkWuk94WCrrwslk8yWNGmY1EduTA=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <style>
        #memberLi {
            background: #545454;
        }

        .edit {
            display: flex;
            flex-flow: row nowrap;
            min-height: 90vh;
            width: 100%;
            background-color: #e3e5e8;
        }

        .profile:nth-child(2) {
            justify-content: center;
        }

        /***/

        .sidebar {
            width: 200px;
            background-color: #333131;
            color: white;
        }

        .tt {
            font-size: 20px;
            font-weight: bold;
            border-bottom: 1px solid lightgrey;
            margin-bottom: 10px;
            display: flex;
            flex-flow: row nowrap;
        }

        .ttt {
            padding: 20px 15px 20px 15px;
        }

        .hideTitle {
            display: none;
        }

        .btn-show {
            height: auto;
            display: flex;
            justify-content: center;
            align-items: center;
            margin: auto;
            text-align: center;
            cursor: pointer;
            padding: 20px;
        }

        /***/

        .inner-side {
            display: flex;
            flex-flow: column nowrap;
            align-items: center;
            min-height: 80vh;
        }

        .lb {
            text-decoration: none;
            padding: 20px 20px 20px 20px;
            font-size: 16px;
            width: 100%;
            border-bottom: 1px solid lightgrey;
        }

            .lb:hover {
                background-color: #1c1c1c;
            }

            .lb:nth-child(1) {
                margin-top: -10px;
            }

            .lb:nth-child(2) {
                background-color: #1c1c1c;
            }



        /*Content*/
        .box {
            border-radius: 10px;
            padding: 20px 45px 20px 45px;
            width: 650px;
            height: fit-content;
            margin: 0 auto 20px auto;
            background-color: white;
        }

        .maintitle {
            font-size: 25px;
            font-weight: bold;
            color: #ff7e29;
        }

        .subtitle, .suggestion-img {
            color: grey;
            font-size: 12px;
            font-weight: 600;
        }

        .profile-title {
            font-weight: bold;
            margin-bottom: 8px;
            color: #ff7e29;
        }

        .image-container {
            display: flex;
            flex-flow: row nowrap;
            gap: 20px;
        }

        .changeimg {
            width: 100%;
        }

        .btn-grouping {
            display: flex;
            flex-flow: column nowrap;
            height: inherit;
            justify-content: center;
            gap: 5px;
        }

        .img {
            width: 120px;
            height: 120px;
            overflow: hidden;
        }

        .b1, .b2, .btn-edit {
            text-decoration: none;
            font-size: 12px;
            font-weight: bold;
            width: 130px;
        }

        .b1 {
            color: white;
            background-color: #ff7e29;
            padding: 10px 15px 10px 15px;
            border: none;
        }

        .b2 {
            padding: 10px 15px 10px 15px;
        }

        .suggestion-img {
            margin-top: 10px;
        }

        .edit-input {
            margin-top: 18px;
        }

        .edit-items {
            display: flex;
            flex-flow: column nowrap;
            gap: 7px;
        }

        .form-control:focus {
            border-width: 2.5px;
            box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.045);
            border-color: #ff7e29 !important;
        }

        .btn-edit {
            padding: 10px 20px 10px 20px;
            background-color: #ff7e29;
            color: white;
            font-weight: bold;
            text-align: center;
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

        .msg {
            display: flex;
            flex-flow: row nowrap;
            width: 100%;
            justify-content: space-between;
            padding: 5px;
        }

        .lblMsg {
            color: #ff7e29;
        }

        .nav-links {
            padding-left: 0;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="home-content">
        <div class="box">
            <div class="title">
                <div class="maintitle">
                    <i class="bx bx-id-card"></i>&nbsp;Member Information
                </div>
                <div class="subtitle">
                    Manage Profile Information 
                </div>
            </div>
            <hr style="color: black; margin-top: 10px; margin-bottom: 10px; opacity: 1;" />
            <div class="changeimg">
                <div class="profile-title">
                    Profile Photo
                </div>

                <div class="image-container">
                    <div class="img">
                        <asp:Image Style="border-radius: 100px; width: 100%; width: 120px; height: 120px;"
                            runat="server" ID="profileimg" />
                    </div>
                    <div class="btn-grouping">
                        <div class="img-change-btn">
                            <asp:FileUpload accept=".png,.jpg,.jpeg,.gif" ID="FileUpload1" Style="display: none" runat="server" onchange="upload()" />
                            <input type="button" value="Change Photo" class="btn border b1" onclick="showBrowseDialog()" />

                            <asp:LinkButton OnClientClick="return true;" CausesValidation="false" runat="server" ID="hideBtn" Style="display: none;" OnClick="hideButton_Click" />
                        </div>
                        <div class="img-delete-btn">
                            <asp:LinkButton ID="Delete" CausesValidation="false" OnClick="Delete_Click" CssClass="btn border b2" runat="server">
                    <i class="fa-solid fa-trash" style="color:red"></i>&nbsp;Delete
                            </asp:LinkButton>
                        </div>
                    </div>
                </div>



                <div class="suggestion-img">
                    Change member's photo. A photo of 120×120px and within 5MB is recommended.
                </div>
            </div>



            <asp:UpdatePanel runat="server" UpdateMode="Conditional">
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="edit" />
                </Triggers>
                <ContentTemplate>

                    <div class="edit-input">
                        <div class="profile-title">
                            Member Personal Information
                        </div>
                        <div class="edit-items">
                            <div class="form-floating username">
                                <asp:TextBox AutoPostBack="true" OnTextChanged="Change_TextChanged" runat="server" ID="txtName" class="form-control" placeholder="Username" />
                                <label for="txtUsername">Username</label>
                                <div class="msg">
                                    <asp:Label CssClass="lblMsg" runat="server" ID="modified1" />
                                    <asp:RequiredFieldValidator Display="Dynamic" runat="server" ControlToValidate="txtName" ForeColor="Red" ErrorMessage="*Please do not leave username empty." />
                                </div>
                            </div>
                            <div class="form-floating email">
                                <asp:TextBox AutoPostBack="true" OnTextChanged="Change_TextChanged" runat="server" ID="txtEmail" class="form-control" placeholder="Email" />
                                <label for="txtUsername">Email</label>
                                <div class="msg">
                                    <asp:Label CssClass="lblMsg" runat="server" ID="modified4" />
                                    <asp:RequiredFieldValidator Display="Dynamic" runat="server" ControlToValidate="txtEmail" ForeColor="Red" ErrorMessage="*Please do not leave email empty." />
                                </div>
                            </div>
                            <div class="form-floating phoneno">
                                <asp:TextBox AutoPostBack="true" OnTextChanged="Change_TextChanged" runat="server" ID="txtPhoneno" class="form-control" placeholder="Phone No." />
                                <label for="txtPhoneno">Phone No.</label>
                                <div class="msg">
                                    <asp:Label CssClass="lblMsg" runat="server" ID="modified2" />
                                    <asp:RequiredFieldValidator Display="Dynamic" runat="server" ControlToValidate="txtPhoneno" ForeColor="Red" ErrorMessage="*Please do not leave phone number empty." />
                                </div>
                            </div>
                            <div class="form-floating address">
                                <asp:TextBox AutoPostBack="true" OnTextChanged="Change_TextChanged" Style="height: 100px; resize: none;" TextMode="MultiLine" runat="server" ID="txtHomeAddress" class="form-control" placeholder="Home Address" />
                                <label for="txtHomeAddress">Home Address</label>
                                <div class="msg">
                                    <asp:Label CssClass="lblMsg" runat="server" ID="modified3" />
                                    <asp:RequiredFieldValidator Display="Dynamic" runat="server" ControlToValidate="txtHomeAddress" ForeColor="Red" ErrorMessage="*Please do not leave home address empty." />
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="edit-btn" style="display: flex; justify-content: space-between;">
                        <asp:Button runat="server" ID="btnBack" Text="Back" CssClass="form-button" PostBackUrl="~/Staff/Member.aspx" CausesValidation="False" Style="cursor: pointer; background-color: #ff7e29;" />
                        <asp:Button OnClick="edit_Click" Enabled="false" ID="edit" CssClass="border btn btn-edit" runat="server" Text="Edit Profile" />
                    </div>

                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>

    <script type="text/javascript">
        function showBrowseDialog() {
            var fileuploadctrl = document.getElementById('<%= FileUpload1.ClientID %>');
            fileuploadctrl.click();
        }

        function upload() {
            var btn = document.getElementById('<%= hideBtn.ClientID %>');
            btn.click();
        }

    </script>
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
</asp:Content>
