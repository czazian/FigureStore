<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AccessDenied.aspx.cs" Inherits="Assignment.Staff.AccessDenied" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="~/style/style.css" rel="stylesheet" />
    <style>
    @import url('https://fonts.googleapis.com/css?family=Lato');

    * {
        position: relative;
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        font-family: 'Lato', sans-serif;
    }

    body {
        height: 100vh;
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        //background: linear-gradient(to bottom right, #EEE, #AAA);
        background-color: #212121;
    }

    .header {
        position: absolute;
        top: 50px;
        left: 50px;
    }

    .footer{
        position:absolute;
        bottom:20px;
        font-size:smaller;
        color:darkgray;
    }

    p {
        font-size:17px;
        text-align: center;
        color:white;
    }

    #form {
        display: flex;
        justify-content: center;
    }

    .form-button {
        background-color:#fc893d;
    }

    .form-button:hover {
    background-color:#fa9e61;
}

    .logo_name {
        color: #fff;
        font-size: 28px;
        font-weight: 500;
    }

    i {
        font-size: 28px;
        font-weight: 500;
        color: white;
        min-width: 60px;
        text-align: center;
    }

    h1 {
        margin: 40px 0 20px;
        color:#fc893d;
    }

    .lock {
    border-radius: 5px;
    width: 55px;
    height: 45px;
    background-color: #fc893d;
    animation: dip 1s;
    animation-delay: 0.5s; /* Provide a delay value directly */
}

.lock::before,
.lock::after {
    content: '';
    position: absolute;
    border-left: 5px solid #fc893d;
    height: 20px;
    width: 15px;
    left: calc(50% - 12.5px);
}

.lock::before {
    top: -30px;
    border: 5px solid #fc893d;
    border-bottom-color: transparent;
    border-radius: 15px 15px 0 0;
    height: 30px;
    animation: lock 1s, spin 1s;
}

.lock::after {
    top: -10px;
    border-right: 5px solid transparent;
    animation: spin 1s;
}

@keyframes lock {
    0% {
        top: -45px;
    }
    65% {
        top: -45px;
    }
    100% {
        top: -30px;
    }
}

@keyframes spin {
    0% {
        transform: scaleX(-1);
        left: calc(50% - 30px);
    }
    65% {
        transform: scaleX(1);
        left: calc(50% - 12.5px);
    }
}

@keyframes dip {
    0% {
        transform: translateY(0px);
    }
    50% {
        transform: translateY(10px);
    }
    100% {
        transform: translateY(0px);
    }
}

    }
</style>

</head>
<body>

    <div class="logo-details header">
        <i class='bx bx-book-open'></i>
        <span class="logo_name">Apex Online Shop</span>
    </div>


    <div class="lock"></div>
    <div class="message">
        <h1>Access to this page is restricted !</h1>
        <p>You do not have permission to view this page.</p>
        <p style="padding-bottom:20px;">Please check your role permission and try again.</p>
        <form id="form" runat="server">
            <asp:Button runat="server" ID="btnBack" Text="Back to dashboard" CssClass="form-button" PostBackUrl="~/Staff/Dashboard.aspx" />
        </form>

    </div>

    <div class="footer">
        <p style="color:white;">&#169 2022 - 2023 Nitro-Books Online Store</p>
    </div>
</body>
</html>
