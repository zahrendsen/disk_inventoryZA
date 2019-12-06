<%--**************************************************************************
SUMMARY OF CHANGES
Date				 Author				Comments
------------------- ------------------- ----------------------------------
11/8/19				Zach Ahrendsen		Started a webapp to eventually connect
                                            to disk inventory db.
11/15/19			Zach Ahrendsen		Connected db. Created listviews per
                                            category of table needed.
                                            sps to access functions
                                            for delete, update, and insert
11/21/19            Zach Ahrendsen      Created dropdowns for certain categories
                                            on artist, disk, borrower. Current
                                             bug on insert for disk page will
                                             notate when corrected. 
11/22/19            Zach Ahrendsen      Created login and registration page
                                            to visit any of the pages other than
                                            home the user must be logged in or
                                            they will be redirected to log in
12/2/19             Zach Ahrendsen      Corrected insert and update on Disk Page
                                            features work correctly.
12/4/19             Zach Ahrendsen      Created inventory/store page to allow
                                            transactions for borrowers to 
                                            rent disks. 
12/5/19             Zach Ahrendsen      Created validation for store page.
                                            Also created custom error and custom
                                            404 error pages.
**************************************************************************--%>

<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="GenericErrorPage.aspx.cs" Inherits="project2.Error.GenericErrorPage" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
     <h1>Oops Something Went Wrong</h1>
    <asp:BulletedList ID="BulletedList1" runat="server">
        <asp:ListItem>Please try again later.</asp:ListItem>
        <asp:ListItem>This feature may currently be going through a sytem update.</asp:ListItem>
        <asp:ListItem>If the problem persists please contact support.</asp:ListItem>
    </asp:BulletedList>
</asp:Content>

