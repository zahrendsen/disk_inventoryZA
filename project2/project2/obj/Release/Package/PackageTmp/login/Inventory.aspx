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


<%@ Page Title="Inventory" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Inventory.aspx.cs" Inherits="project2.Inventory" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Store</h2>
    <p class="text-danger">&nbsp;</p>

    <h4 class="text-info">Select a Borrower, Select a Title, and then Select a Check Out Date</h4>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:disk_inventoryZAConnectionString %>" SelectCommand="SELECT [borrower_id], CONCAT ([lname], ', ', [fname]) as [fullname] FROM [borrower] ORDER BY [lname], [fname]"></asp:SqlDataSource>
    <asp:DropDownList  ID="DropDownBorrower" runat="server" DataSourceID="SqlDataSource1" DataTextField="fullname" DataValueField="borrower_id" OnDataBound="DropDownBorrower_DataBound" OnSelectedIndexChanged="DropDownBorrower_SelectedIndexChanged" AutoPostBack="true" CssClass="btn btn-info dropdown-toggle">
    </asp:DropDownList>
    <asp:Button CssClass="btn" ID="ddlClear" runat="server" Text="Clear" OnClick="ddlClear_Click" />
       <asp:CustomValidator ID="Validator1" runat="server" ErrorMessage="Please select a borrower." CssClass="text-danger" ValidationGroup="CheckOut"></asp:CustomValidator>
   
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:disk_inventoryZAConnectionString %>" SelectCommand="" ></asp:SqlDataSource>

    <asp:ListView ID="listViewByBorrower" runat="server" DataSourceID="SqlDataSource3">

        <ItemTemplate>
             <span>
                <br />
                <br />
                <h4>
                Borrower Name:
            <asp:Label ID="fullnameLabel" runat="server" Text='<%# Eval("fullname") %>' />
                </h4>
                <h4>
                Borrower ID:
            <asp:Label ID="borrower_idLabel" runat="server" Text='<%# Eval("borrower_id") %>' />
                <br />
                </h4>
                <br />
                <br />
            </span>
            <div class="form-group">
                <div class="col-sm-12">
                    <asp:Button ID="btnAddBorrower" runat="server" Text="Select Borrower"
                        OnClick="btnAddBorrower_Click" CssClass="btn" />
        
                </div>
            </div>

        </ItemTemplate>
        <LayoutTemplate>
            <div id="itemPlaceholderContainer" runat="server" style="">
                <span runat="server" id="itemPlaceholder" />
            </div>
            <div style="">
            </div>
        </LayoutTemplate>
        <EmptyDataTemplate>
            <br />
            <br />
            <asp:Label ID="label" CssClass="text-warning" runat="server" Text="No Inventory Was Found For This Artist"></asp:Label>
        </EmptyDataTemplate>

    </asp:ListView>
    <br />
    <br />
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:disk_inventoryZAConnectionString %>" SelectCommand="select * from disk where (status_id = 2)"></asp:SqlDataSource>
    <asp:DropDownList ID="DropDownTitle" runat="server" DataSourceID="SqlDataSource2" DataTextField="disk_name" DataValueField="disk_id" OnDataBound="DropDownTitle_DataBound" AutoPostBack="True" OnSelectedIndexChanged="DropDownTitle_SelectedIndexChanged" CssClass="btn btn-info dropdown-toggle">
    </asp:DropDownList>
        <asp:Button CssClass="btn" ID="btnClear2" runat="server" Text="Clear" OnClick="ddlClear_Click" />
    <asp:CustomValidator ID="Validator2" runat="server" ErrorMessage="Please select a disk title." CssClass="text-danger" ValidationGroup="CheckOut"></asp:CustomValidator>
    <asp:ListView ID="listViewByDisk" runat="server" DataSourceID="SqlDataSource3">

        <ItemTemplate>
            <span>
                <br />
                <br />
                <h4>
                Title:
            <asp:Label ID="disk_nameLabel" runat="server" Text='<%# Eval("disk_name") %>' />
                <br />
                </h4>
                 <h4>
                Disk ID:
            <asp:Label ID="disk_idLabel" runat="server" Text='<%# Eval("disk_id") %>' />
                <br />
                </h4>
                <br />
                <br />
            </span>
            <div class="form-group">
                <div class="col-sm-12">
                    <asp:Button ID="btnAdd" runat="server" Text="Add to Cart"
                        OnClick="btnAdd_Click" CssClass="btn" />
            
                </div>
            </div>
        </ItemTemplate>
        <LayoutTemplate>
            <div id="itemPlaceholderContainer" runat="server" style="">
                <span runat="server" id="itemPlaceholder" />
            </div>
            <div style="">
            </div>
        </LayoutTemplate>
        <EmptyDataTemplate>
            <br />
            <br />
            <asp:Label ID="label2" CssClass="text-warning" runat="server" Text="No Inventory Was Found For This Title"></asp:Label>
        </EmptyDataTemplate>

    </asp:ListView>
          <br />
    <br />
    <asp:TextBox ID="txtDate" runat="server" TextMode="Date"></asp:TextBox>
    
    <asp:Button CssClass="btn" ID="SelectDate" runat="server" Text="Select Check Out Date" OnClick="BtnSelectDate_Click" />
    <asp:CustomValidator ID="Validator3" runat="server" ErrorMessage="Please select a check out date." CssClass="text-danger" ValidationGroup="CheckOut"></asp:CustomValidator>
    
    <br />
    <br />
    <br />
    <div class="bg-info h4" style="width: 400px;">
        <span>&nbsp;<u>Cart</u></span>
        <br />
        <br />
        &nbsp;Borrower:
        <asp:Label runat="server" ID="selectedBorrowerLabel"></asp:Label>
        <br />
        &nbsp;Borrower ID:
        <asp:Label runat="server" ID="selectedBorrowerIDLabel"></asp:Label>
        <br />
        <br />
        &nbsp;Disk Title:
         <asp:Label runat="server" ID="selectedDiskLabel"></asp:Label>
        <br />
        &nbsp;Disk ID:
         <asp:Label runat="server" ID="selectedDiskIDLabel"></asp:Label>
        <br />
        <br />
       &nbsp;Check Out Date:
        <asp:Label runat="server" ID="selectedDateLabel"></asp:Label>


    </div>
    <br />
     <asp:Button CausesValidation="true" ValidationGroup="CheckOut" ID="btnCheckOut" runat="server" CommandName="Insert" Text="Check Out"
                        OnClick="btnCheckOut_Click" CssClass="btn" />
    <asp:Button ID="btnEmptyCart" runat="server" Text="Empty Cart"
                        OnClick="btnEmptyCart_Click" CssClass="btn" />
    <br />
     <asp:Label runat="server" ID="errorLabel"></asp:Label>
     <asp:Label runat="server" ID="checkOutComplete" ></asp:Label>

     


</asp:Content>
