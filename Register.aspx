<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="registerEncrept.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous" />
    <!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
       <div class="container my-3">
            <div class="row">
                <div class="col-md-6  mx-auto">
                    <div class="card" >
                        <div class="card-body">
                            <div class="row">
                                <div class="col">
                                    <center>
                                        <img src="Images/forgot%20(1).png" />
                                    </center>
                                </div>
                            </div>
                             <div class="row">
                                <div class="col">
                                    <center>
                                        <h2>Registration Form</h2>
                                    </center>
                                </div>
                            </div>
                             <div class="row">
                                <div class="col">
                                    <center>
                                        <hr />
                                    </center>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col">
                                    <div class="mb-3">
                                        <asp:TextBox ID="TextBox1" runat="server"  CssClass="form-control" placeholder="Name" ValidationGroup="regi"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="Enter your name" ForeColor="#FF3300" Display="Dynamic" ValidationGroup="regi"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="TextBox1" ErrorMessage="Only Alphabet" ValidationExpression="^[a-zA-Z]+$" ValidationGroup="regi" Display="Dynamic" ForeColor="Blue"></asp:RegularExpressionValidator>
                                    </div>
                                    <div class="mb-3">
                                        <asp:TextBox ID="TextBox3" runat="server" MaxLength="10" TextMode="Phone" CssClass="form-control" placeholder="Mobile Number" ValidationGroup="regi"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox3" Display="Dynamic" ErrorMessage="Enter your mobile number" ForeColor="#FF3300" ValidationGroup="regi"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox3" Display="Dynamic" ErrorMessage="The PhoneNumber field is not a valid phone number" ForeColor="Blue" ValidationExpression="[0-9]{10}" ValidationGroup="regi"></asp:RegularExpressionValidator>
                                    </div>
                                    <div class="mb-3">
                                        <asp:TextBox ID="TextBox4" runat="server" TextMode="Email" CssClass="form-control" placeholder="G-mail" ValidationGroup="regi"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox4" Display="Dynamic" ErrorMessage="Enter your gmail" ForeColor="#FF3300" ValidationGroup="regi"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextBox4" Display="Dynamic" ErrorMessage="Invalid gamil" ForeColor="Blue" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="regi"></asp:RegularExpressionValidator>
                                    </div>
                                    <div class="mb-3">
                                        <input id="Password1" type="password" runat="server" validationgroup="regi" class="form-control" placeholder="password" /><asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="Password1" Display="Dynamic" ErrorMessage="Enter password" ForeColor="#FF3300" ValidationGroup="regi"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="Password1" Display="Dynamic" ErrorMessage="8 characters including 1 uppercase letter, 1 special character" ForeColor="#0066FF" ValidationExpression="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[$@$!%*?&amp;amp;])[A-Za-z\d$@$!%*?&amp;amp;]{8,}"
                                            ValidationGroup="regi"></asp:RegularExpressionValidator>
                                    </div>
                                   <%-- <div class="mb-3">
                                        <input id="Password2" type="password" runat="server"  class="form-control" placeholder="re-password" validationgroup="regi"/><asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="Password2" ErrorMessage="Enter re-password" ForeColor="#FF3300" ValidationGroup="regi"></asp:RequiredFieldValidator>
                                        <asp:CompareValidator ID="CompareValidator1" runat="server" Display="Dynamic" ControlToCompare="Password1" ControlToValidate="Password2" ErrorMessage="password not match" ForeColor="#0066FF" ValidationGroup="regi"></asp:CompareValidator>
                                    </div>--%>
                                    <div class="mb-3 d-flex align-items-center">
                                        <asp:Label CssClass="me-4" ID="Label1" runat="server" Text="Select Gender"></asp:Label>
                                        <asp:RadioButtonList ID="RadioButtonList1" runat="server" CssClass="d-flex align-items-center" placeholder="Select Gender" ValidationGroup="regi" RepeatDirection="Horizontal">
                                            <asp:ListItem class="me-3">male</asp:ListItem>
                                            <asp:ListItem class="me-3">female</asp:ListItem>
                                        </asp:RadioButtonList>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" Display="Dynamic" ControlToValidate="RadioButtonList1" ErrorMessage="select your gender" ForeColor="#FF3300" ValidationGroup="regi"></asp:RequiredFieldValidator>
                                    </div>
                                    <div class="d-flex align-items-center justify-content-center">
                                        <div class="mb-3 d-grid gap-2 me-3">
                                            <asp:Button ID="Button3" runat="server" Text="Submit" CssClass="btn btn-primary px-3" OnClick="Button1_Click" ValidationGroup="regi" />
                                        </div>
                                        <div class="mb-3 d-grid gap-2">
                                            <asp:Button ID="Button2" runat="server" Text="Reset" CssClass="btn btn-dark px-3" OnClientClick="this.form.reset();return false;" CausesValidation="false" ValidationGroup="regi" />
                                        </div>
                                        <div class="mb-3 d-grid gap-2" style="margin-left:14px">
                                            <asp:Button ID="Button1" runat="server" Text="BackToLogin" CssClass="btn btn-dark px-3"  CausesValidation="false" ValidationGroup="regi"   />
                                        </div>
                                    </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        </div>
        </div>
    </form>
</body>
</html>
