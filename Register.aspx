<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="OnlineShopping.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
        <asp:Label ID="lblTitle" runat="server" Text="Register"></asp:Label>
        <p>
            <asp:Label ID="S" runat="server" Text="Email"></asp:Label>
            <asp:TextBox ID="txtEmail" runat="server" Height="16px"></asp:TextBox>
                    <asp:RegularExpressionValidator 
    ID="revEmail" 
    runat="server"
    ControlToValidate="txtEmail"
    ErrorMessage="Incorrect Email Format"
    ForeColor="Red"
    ValidationExpression="^[^@\s]+@[^@\s]+\.[^@\s]+$">
</asp:RegularExpressionValidator>
        </p>
        <asp:Label ID="lblPassword" runat="server" Text="Passworde"></asp:Label>
        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
        <asp:RegularExpressionValidator 
    ID="revPassword" 
    runat="server"
    ControlToValidate="txtPassword"
    ErrorMessage="Password must contain 8 characters, uppercase, lowercase, number and special character"
    ForeColor="Red"
    ValidationExpression="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@#$%^&+=]).{8,}$">
</asp:RegularExpressionValidator>
        <p>
            <asp:Button ID="btnRegister" runat="server" OnClick="Button1_Click" Text="Register" />
            <asp:Button ID="btnCancel" runat="server" OnClick="btnCancel_Click" Text="Cancel" />
        </p>
        <asp:HyperLink ID="lnkLogin" runat="server" NavigateUrl="Login.aspx">
    Already Registered? Login Here
</asp:HyperLink>
     
    </form>
</body>
</html>
