<%--**************************************************************************
SUMMARY OF CHANGES
Date				 Author				Comments
------------------- ------------------- ----------------------------------
11/8/19				Zach Ahrendsen		Started a webapp to eventually connect
                                            to disk inventory db.
**************************************************************************--%>


<%@ Page Title="Borrower" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Borrower.aspx.cs" Inherits="project2.Borrower" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Borrower</h2>

    <p>
        First Name
        <asp:TextBox ID="fname" runat="server" CssClass="form-control">
        </asp:TextBox>
        <asp:RequiredFieldValidator ID="fnameValidator" runat="server"
            ErrorMessage="You must enter a first name." ControlToValidate="fname"
            CssClass="text-warning">

        </asp:RequiredFieldValidator>
    </p>

    <p>
        Last Name
        <asp:TextBox ID="lname" runat="server" CssClass="form-control">

        </asp:TextBox>
        <asp:RequiredFieldValidator ID="lnameValidator" runat="server" ErrorMessage="You must enter a last name."
            ControlToValidate="lname" CssClass="text-warning">
        </asp:RequiredFieldValidator>
    </p>

    <p>
        Phone Number
        <asp:TextBox ID="phone" runat="server" CssClass="form-control" TextMode="Phone">
        </asp:TextBox>
        <asp:RequiredFieldValidator ID="phoneValidator" runat="server" ErrorMessage="You must enter a valid phone number."
            ControlToValidate="phone" CssClass="text-warning">
        </asp:RequiredFieldValidator><br />
        <asp:RegularExpressionValidator ID="regPhone" runat="server" ControlToValidate="phone"
            Text="Use this format: 999-999-9999" Display="Dynamic" CssClass="text-warning"
            ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}">
        </asp:RegularExpressionValidator>
    </p>

    <asp:Button ID="submit" runat="server" Text="Submit" OnClick="submit_Click" />
    <br />
    <br />
    <asp:Label cssClass="text-success" ID="lblSubmit" runat="server" Text=""></asp:Label>

</asp:Content>
