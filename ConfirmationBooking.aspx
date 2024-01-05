<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ConfirmationBooking.aspx.cs" Inherits="EventApp.ConfirmationBooking" %>

<!DOCTYPE html>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Confirmation Booking</title>
    <link rel="stylesheet" href="css/payment.css" />
</head>
<body>
    <div class="container">
        <form id="form1" runat="server">
            <div class="row">
                <div class="col">
                    <h3 class="title">Confirmation</h3>
                    <div class="inputBox">
                        <span>Qunatity: </span>
                        <asp:Label ID="qunatityLabel" runat="server" Text="0"></asp:Label>
                    </div>
                    <div class="inputBox">
                        <span>Total Price :</span>
                        <asp:Label ID="totalPriceLabel" runat="server" Text="0"></asp:Label>
                    </div>
                    <div class="inputBox">
                        <span>Payment Type :</span>
                        <asp:Label ID="typeLabel" runat="server" Text="0"></asp:Label>
                    </div>
                    <asp:Button ID="ButtonCheckOut" runat="server" Text="Confirm" OnClick="Confirm_Checkout" CssClass="submit-btn" />
                </div>
            </div>
        </form>
    </div>
</body>
</html>
