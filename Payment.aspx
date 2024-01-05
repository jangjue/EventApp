<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Payment.aspx.cs" Inherits="EventApp.Payment" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="css/payment.css" />
</head>
<body>
    <div class="container">
        <form id="form1" runat="server">
            <div class="row">
                <div class="col">
                    <h3 class="title">Quantity Selection</h3>
                    <div class="inputBox">
                        <span>Quantity :</span>
                        <asp:TextBox ID="txtQuantity" runat="server" TextMode="Number" Text="1" AutoPostBack="True" OnTextChanged="txtQuantity_TextChanged"></asp:TextBox>

                    </div>
                    <div class="inputBox">
                        <span>Total Price :</span>
                        <asp:Label ID="totalPriceLabel" runat="server" Text="0"></asp:Label>
                    </div>

                    <h3 class="title">Payment</h3>
                    <div class="inputBox">
                        <span>Cards accepted :</span>
                        <asp:Image ID="imgMasterCard" runat="server" ImageUrl="img/MasterCard.png" Width="64" />
                        <asp:Image ID="imgVisa" runat="server" ImageUrl="img/VISA.png" Width="64" />
                    </div>
                    <div class="inputBox">
                        <span>Name on card :</span>
                        <asp:TextBox ID="TxtName" runat="server" Text=""></asp:TextBox>
                    </div>
                    <div class="inputBox">
                        <span>Card number :</span>
                        <asp:TextBox ID="txtCardNumber" runat="server" Text="" oninput="formatCardNumber(this, event)" MaxLength="19" placeholder="0000 0000 0000 0000"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="revCardNumber" runat="server" ControlToValidate="txtCardNumber"
                            ValidationExpression="^\d{4}\s\d{4}\s\d{4}\s\d{4}$" ErrorMessage="Invalid Card Number" Display="Dynamic"></asp:RegularExpressionValidator>
                    </div>
                    <div class="inputBox">
                        <span>Exp date :</span>
                        <asp:TextBox ID="expDate" runat="server" Text="" oninput="formatExpDate(this)" placeholder="mm/yy"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="revExpDate" runat="server" ControlToValidate="expDate"
                            ValidationExpression="^(0[1-9]|1[0-2])\/\d{2}$" ErrorMessage="Invalid Expiration Date" Display="Dynamic"></asp:RegularExpressionValidator>
                    </div>
                    <div class="inputBox">
                        <span>CVV :</span>
                        <asp:TextBox ID="cvv" runat="server" TextMode="Password" placeholder="123"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="revCVV" runat="server" ControlToValidate="cvv"
                            ValidationExpression="^\d{3}$" ErrorMessage="Invalid CVV" Display="Dynamic"></asp:RegularExpressionValidator>
                    </div>
                    <asp:Button ID="ButtonCheckOut" OnClientClick="showAlert();" runat="server" Text="Proceed to Checkout" OnClick="Btn_Checkout" CssClass="submit-btn" />
                </div>
            </div>
        </form>
    </div>
</body>
</html>

<script type="text/javascript">
    var hiddenCardType; // Declare hiddenCardType outside of any function

    function formatCardNumber(sender, e) {
        var cardNumber = sender.value.replace(/\D/g, ''); // Remove non-numeric characters
        var formattedCardNumber = '';

        for (var i = 0; i < cardNumber.length; i++) {
            if (i > 0 && i % 4 === 0) {
                formattedCardNumber += ' ';
            }
            formattedCardNumber += cardNumber[i];
        }

        sender.value = formattedCardNumber.substring(0, 19); // Limit to 19 characters

        // Extract the first digit of the card number
        var firstDigit = cardNumber.charAt(0);
    }

    function formatExpDate(sender) {
        var expDate = sender.value.replace(/\D/g, ''); // Remove non-numeric characters
        var formattedExpDate = '';

        for (var i = 0; i < expDate.length; i++) {
            if (i === 2) {
                formattedExpDate += '/';
            }
            formattedExpDate += expDate[i];
        }

        sender.value = formattedExpDate.substring(0, 5); // Limit to 7 characters (MM/YYYY)
    }

</script>
