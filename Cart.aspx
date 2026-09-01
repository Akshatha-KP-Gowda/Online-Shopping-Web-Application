<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="OnlineShopping.Cart" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>My Cart</title>
</head>
<body>
    <form id="form1" runat="server">

        <h2 align="center">🛒 My Cart</h2>

        <asp:DataList ID="DataList1"
            runat="server"
            Width="900px"
            OnItemCommand="DataList1_ItemCommand">

            <ItemTemplate>

                <div style="border:1px solid gray;padding:15px;margin:10px;overflow:hidden;">

                    <!-- Product Image -->
                    <div style="float:left;width:170px;">

                        <asp:Image ID="imgProduct"
                            runat="server"
                            ImageUrl='<%# Eval("ImagePath") %>'
                            Width="150px"
                            Height="150px" />

                    </div>

                    <!-- Product Details -->
                    <div style="float:left;width:450px;">

                        <h3>
                            <%# Eval("ProductName") %>
                        </h3>

                        <p>
                            <b>Category :</b>
                            <%# Eval("Category") %>
                        </p>

                        <p>
                            <b>Price :</b>
                            ₹ <%# Eval("Price") %>
                        </p>

                        <p>

                            <asp:Button ID="btnMinus"
                                runat="server"
                                Text="-"
                                CommandName="Minus"
                                CommandArgument='<%# Eval("CartId") %>' />

                            &nbsp;

                            <asp:Label ID="lblQty"
                                runat="server"
                                Text='<%# Eval("Quantity") %>'>
                            </asp:Label>

                            &nbsp;

                            <asp:Button ID="btnPlus"
                                runat="server"
                                Text="+"
                                CommandName="Plus"
                                CommandArgument='<%# Eval("CartId") %>' />

                        </p>

                    </div>

                    <!-- Delete -->
                    <div style="float:right;">

                        <asp:Button ID="btnDelete"
                            runat="server"
                            Text="Delete"
                            BackColor="Red"
                            ForeColor="White"
                            CommandName="DeleteItem"
                            CommandArgument='<%# Eval("CartId") %>' />

                    </div>

                    <div style="clear:both;"></div>

                </div>

            </ItemTemplate>

        </asp:DataList>

        <br />

        <h3>
            Total :
            ₹
            <asp:Label ID="lblTotal" runat="server"></asp:Label>
        </h3>

    </form>
</body>
</html>