<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="AddVenue.aspx.cs" Inherits="EventApp.Admin.AddVenue" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" type="text/css" href="../css/AdminCategory.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2 class="form-header">Add Venue</h2>
    <hr class="form-divider" />
    <div class="form-container">
        <form id="categoryForm">
            <div class="form-section">
                <asp:Label runat="server" CssClass="form-label" Text="Venue"></asp:Label>
                <br />
                <asp:TextBox runat="server" CssClass="form-input" ID="txtVenue" placeholder="Enter venue name"></asp:TextBox>
            </div>
            <br />
            <asp:Label runat="server" ID="lblVenueMessage"></asp:Label>
            <br />
            <asp:Label runat="server" CssClass="form-label" Text="State"></asp:Label>
            <asp:DropDownList runat="server" ID="ddlState">
                <asp:ListItem>-- Select State --</asp:ListItem>
                <asp:ListItem>Kuala Lumpur</asp:ListItem>
                <asp:ListItem>Johor</asp:ListItem>
                <asp:ListItem>Kedah</asp:ListItem>
                <asp:ListItem>Kelantan</asp:ListItem>
                <asp:ListItem>Malacca</asp:ListItem>
                <asp:ListItem>Negeri Sembilan</asp:ListItem>
                <asp:ListItem>Pahang</asp:ListItem>
                <asp:ListItem>Penang</asp:ListItem>
                <asp:ListItem>Perak</asp:ListItem>
                <asp:ListItem>Perlis</asp:ListItem>
                <asp:ListItem>Sabah</asp:ListItem>
                <asp:ListItem>Sarawak</asp:ListItem>
                <asp:ListItem>Selangor</asp:ListItem>
                <asp:ListItem>Terengganu</asp:ListItem>
            </asp:DropDownList>
            <br />
            <asp:Label runat="server" ID="ddlMessage"></asp:Label>
            <br />
            <div id="map" style="height: 400px; width: 100%;"></div>
            <input id="autocomplete" type="text" placeholder="Enter your address">
            <asp:HiddenField ID="hdnSelectedLocation" runat="server" />
        </form>
        <div class="form-section">
            <asp:Button runat="server" Text="Submit" CssClass="form-button" OnClick="Submit_Click" />
        </div>
    </div>
    <asp:Label runat="server" ID="lblMessage"></asp:Label>
    <script>
        let map;
        let autocomplete;

        function initMap() {
            map = new google.maps.Map(document.getElementById('map'), {
                center: { lat: -34.397, lng: 150.644 },
                zoom: 8
            });

            autocomplete = new google.maps.places.Autocomplete(document.getElementById('autocomplete'));
            autocomplete.bindTo('bounds', map);

            autocomplete.addListener('place_changed', function () {
                const place = autocomplete.getPlace();
                if (place.geometry) {
                    // Access place details, including address: place.formatted_address
                    console.log('Selected Address:', place.formatted_address);

                    // Update the hidden field with the selected place's address
                    document.getElementById('<%= hdnSelectedLocation.ClientID %>').value = place.formatted_address;

                // Update the map's center to the selected place
                map.setCenter(place.geometry.location);
            }
        });
        }
    </script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDFDJaKUuaI482d-rYPu_787qlRIRMhT_0&libraries=places&callback=initMap" async defer></script>
</asp:Content>
