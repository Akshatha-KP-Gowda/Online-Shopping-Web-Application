<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="OnlineShopping.Home" %>

<!DOCTYPE html>

<html>
<head runat="server">

<title>Online Shopping</title>

<style>

body{
    font-family:Arial;
    margin:0;
}


.header{
    background:#2874f0;
    padding:15px;
    display:flex;
    align-items:center;
}


.logo{
    color:white;
    font-size:25px;
    font-weight:bold;
}



.search{
    margin-left:40px;
    width:350px;
    height:35px;
}



.menu{
    margin-left:auto;
}



.menu a{
    color:white;
    text-decoration:none;
    margin:15px;
    font-size:18px;
}



.product{
    border:1px solid #ddd;
    width:220px;
    padding:15px;
    margin:15px;
    text-align:center;
    border-radius:10px;
}



</style>


</head>


<body>


<form id="form1" runat="server">


<!-- TOP MENU -->

<div class="header">


<div class="logo">
Online Shopping
</div>



<asp:TextBox ID="txtSearch"
runat="server"
CssClass="search"
placeholder="Search Product or Category">
</asp:TextBox>



<asp:Button ID="btnSearch"
runat="server"
Text="Search"
OnClick="btnSearch_Click"/>



<div class="menu">


<a href="Home.aspx">
Home
</a>



<a href="Cart.aspx">
🛒 Cart
</a>



<asp:HyperLink ID="lnkLogin"
runat="server"
NavigateUrl="Login.aspx">
Login
</asp:HyperLink>



<asp:Label ID="lblUser"
runat="server"
ForeColor="White"
Font-Size="18px">
</asp:Label>



</div>


</div>





<h2 align="center">
Products
</h2>





<asp:DataList ID="DataList1"
runat="server"
RepeatColumns="4"
OnItemCommand="DataList1_ItemCommand">



<ItemTemplate>



<div class="product">



<asp:Image ID="imgProduct"
runat="server"
ImageUrl='<%# Eval("ImagePath1") %>'
Width="150px"
Height="150px"/>



<h3>
<%# Eval("ProductName") %>
</h3>



<p>
Category :
<%# Eval("Category") %>
</p>



<h4>
₹ <%# Eval("Price") %>
</h4>



<asp:Button ID="btnAddCart"
runat="server"
Text="Add To Cart"
CommandName="AddCart"
CommandArgument='<%# Eval("Id") %>'/>


</div>


</ItemTemplate>


</asp:DataList>




</form>


</body>

</html>