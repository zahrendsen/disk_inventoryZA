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


<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="project2._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h1>Disk Rental Application</h1>
        <p>
           Z to A Creation Hub is creating a disk rental application to sell to your company. This application will be an employee side program.
            At the moment you can create, modify, and delete borrower accounts, artist, and cd/dvd disc inventory. More features can be customized
            if needed.
        </p>
    </div>



</asp:Content>
