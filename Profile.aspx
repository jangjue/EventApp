<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="EventApp.Profile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="css/style.css">
    <link href="lib/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container light-style flex-grow-1 container-p-y">
            <h4 class="font-weight-bold py-3 mb-4">Profile settings
            </h4>
            <div class="card overflow-hidden">
                <div class="row no-gutters row-bordered row-border-light">
                    <div class="col-md-3 pt-0">
                        <div class="list-group list-group-flush account-settings-links">
                            <a class="list-group-item list-group-item-action active" data-toggle="list"
                                href="#account-general">General</a>
                            <a class="list-group-item list-group-item-action" data-toggle="list"
                                href="#account-change-password" style="left: 0px; top: 0px">Change password</a>
                            <a class="list-group-item list-group-item-action" data-toggle="list"
                                href="#account-info">Info</a>

                        </div>
                    </div>
                    <div class="auto-style2">
                        <div class="tab-content">
                            <div class="tab-pane fade active show" id="account-general">
                                <div class="card-body media align-items-center">
                                    <asp:Image ID="imgAvatar" runat="server" CssClass="d-block ui-w-80" />
                                    <div class="media-body ml-4">
                                        <asp:FileUpload ID="fileUpload" runat="server" CssClass="auto-style1" />
                                        <asp:Button ID="btnUpload" runat="server" CssClass="btn btn-outline-primary" Text="Upload new photo" OnClick="btnUpload_Click" CausesValidation="False" />
                                        <asp:Button ID="btnReset" runat="server" CssClass="btn btn-default md-btn-flat" Text="Reset" CausesValidation="False" />
                                        <div class="text-light small mt-1">Allowed JPG, GIF or PNG. Max size of 800K</div>
                                    </div>
                                </div>
                                <hr class="border-light m-0">
                                <div class="card-body">
                                    <div class="form-group">
                                        <asp:Label ID="lblUsername" runat="server" AssociatedControlID="txtUsername" CssClass="form-label">Username</asp:Label>
                                        <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control mb-1" Text=""></asp:TextBox>
                                    </div>
                                    <div class="form-group">
                                        <asp:Label ID="lblName" runat="server" AssociatedControlID="txtName" CssClass="form-label">Name</asp:Label>
                                        <asp:TextBox ID="txtName" runat="server" CssClass="form-control" Text=""></asp:TextBox>
                                    </div>
                                    <div class="form-group">
                                        <asp:Label ID="lblEmail" runat="server" AssociatedControlID="txtEmail" CssClass="form-label">E-mail</asp:Label>
                                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control mb-1" Text=""></asp:TextBox>
                                    </div>
                                    <asp:Button ID="btnVerify" runat="server" CssClass="" Text="Verify Email" OnClick="VerifyEmail_Click" CausesValidation="False" />
                                </div>
                            </div>
                            <div class="tab-pane fade" id="account-change-password">
                                <div class="card-body pb-2">
                                    <div class="form-group">
                                        <asp:Label runat="server" CssClass="form-label" Text="Current password"></asp:Label>
                                        <asp:TextBox runat="server" ID="txtCurrentPassword" TextMode="Password" CssClass="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtCurrentPassword" Text="Password is required." ErrorMessage="Password is required." CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>

                                    </div>
                                    <div class="form-group">
                                        <asp:Label runat="server" CssClass="form-label" Text="New password"></asp:Label>
                                        <asp:TextBox runat="server" ID="txtNewPassword" TextMode="Password" CssClass="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvNewPassword" runat="server" ControlToValidate="txtNewPassword" Text="New Password is required." ErrorMessage="New Password is required." CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>
                                    </div>
                                    <div class="form-group">
                                        <asp:Label runat="server" CssClass="form-label" Text="Repeat new password"></asp:Label>
                                        <asp:TextBox runat="server" ID="txtRepeatNewPassword" TextMode="Password" CssClass="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvRepeatNewPassword" runat="server" ControlToValidate="txtRepeatNewPassword" Text="Repeat New Password is required." ErrorMessage="Repeat New Password is required." CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>
                                        <asp:CompareValidator ID="cvRepeatNewPassword" runat="server" ControlToCompare="txtNewPassword" ControlToValidate="txtRepeatNewPassword" Operator="Equal" Type="String" Text="Passwords do not match." ErrorMessage="Passwords do not match." CssClass="text-danger" Display="Dynamic"></asp:CompareValidator>
                                        <asp:RegularExpressionValidator ID="revPassword" runat="server" ControlToValidate="txtNewPassword" ErrorMessage="Invalid password format. Password must include at least one uppercase letter, one lowercase letter, one digit, and one special character." Display="Dynamic" ValidationExpression="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$" CssClass="text-danger" />
                                    </div>
                                    <asp:Button runat="server" ID="btnChangePassword" Text="Change Password" CssClass="btn btn-primary" OnClick="btnChangePassword_Click" />
                                </div>
                            </div>
                            <div class="tab-pane fade" id="account-info">
                                <div class="card-body pb-2">
                                    <div class="form-group">
                                        <asp:Label runat="server" CssClass="form-label" Text="IC"></asp:Label>
                                        <asp:TextBox runat="server" ID="txtIC" CssClass="form-control" Text="111111-11-1111"></asp:TextBox>
                                    </div>
                                </div>
                                <hr class="border-light m-0">
                                <div class="card-body pb-2">
                                    <h6 class="mb-4">Contact Number</h6>
                                    <div class="form-group">
                                        <asp:Label runat="server" CssClass="form-label" Text="Phone"></asp:Label>
                                        <asp:TextBox runat="server" ID="txtContactNum" CssClass="form-control" Text="+60 111 0972 7778"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="text-right mt-3">
                <asp:Button ID="Button1" runat="server" class="btn btn-primary" Text="Save changes" OnClick="Sumbit_Click" CausesValidation="False" />

                <asp:Button ID="Button2" runat="server" class="btn btn-default" Text="Cancel" PostBackUrl="~/Profile.aspx" />
            </div>
        </div>
        <script data-cfasync="false" src="/cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script>
        <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
        <script src="lib/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script type="lib/jquery/jquery.min.js">

        </script>
    </form>
</body>
</html>
