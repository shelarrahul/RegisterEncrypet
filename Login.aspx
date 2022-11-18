<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="registerEncrept.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="Ds/log.css" rel="stylesheet" />
    <!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous"/>
    <title></title>
</head>
<body>


    <div class="background"></div>
    <div class="card">
        <img src="Images/login%20(1).png" class="logo" />
        <h2>LogIn</h2>
        <form class="form" runat="server" id="form2">
            <asp:TextBox ID="TextBox1" runat="server" CssClass="input" placeholder="UserName"></asp:TextBox>
            <asp:TextBox ID="TextBox2" runat="server" TextMode="Password" CssClass="input" placeholder="password"></asp:TextBox>
            <asp:Button ID="Button1" runat="server" Text="Login" OnClick="Button1_Click" ValidationGroup="Send" OnClientClick="return uservalid();" CssClass="button btn btn-primary" />
            <asp:LinkButton ID="LinkButton1" runat="server" href="forgetpass.aspx">ForgetPassword</asp:LinkButton>
            <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
        </form>
        <footer>
            For Register,
        <a href="register.aspx">Click here</a>
        </footer>
    </div>

</body>
</html>
