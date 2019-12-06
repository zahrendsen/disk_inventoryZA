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


<%@ Page Title="Artist" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Artist.aspx.cs" Inherits="project2.Artist" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Artist </h2>
    <p class="text-danger">&nbsp;</p>
    <br />
    <asp:ListView ID="ListView1" runat="server" DataKeyNames="artist_id" DataSourceID="SqlDataSource1" InsertItemPosition="LastItem">
        <AlternatingItemTemplate>
            <tr class="bg-info">
                <td>
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" CausesValidation="false" />
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                </td>
                <td>
                    <asp:Label ID="fnameLabel" runat="server" Text='<%# Eval("fname") %>' />
                </td>
                <td>
                    <asp:Label ID="lnameLabel" runat="server" Text='<%# Eval("lname") %>' />
                </td>
                <td>
                    <asp:Label ID="artist_type_idLabel" runat="server" Text='<%# Eval("artist_type_desc") %>' />
                </td>
                <td>
                    <asp:Label ID="artist_idLabel" runat="server" Text='<%# Eval("artist_id") %>' />
                </td>
            </tr>
        </AlternatingItemTemplate>
        <EditItemTemplate>
            <tr style="">
                <td>
                    <asp:Button ID="UpdateButton" ValidationGroup="Edit" runat="server" CommandName="Update" Text="Update" />
                    <asp:Button ID="CancelButton" ValidationGroup="Edit" runat="server" CommandName="Cancel" Text="Cancel" CausesValidation="False" />
                </td>

                <td>
                    <asp:TextBox ID="fnameTextBox" runat="server" Text='<%# Bind("fname") %>' ValidationGroup="Edit" />
                    <asp:RequiredFieldValidator ID="fnameValidator" runat="server"
                        ErrorMessage="<br />You must enter a first name." ControlToValidate="fnameTextBox"
                        CssClass="text-warning" Display="dynamic" ValidationGroup="Edit">
                    </asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:TextBox ID="lnameTextBox" runat="server" Text='<%# Bind("lname") %>' ValidationGroup="Edit" />
                </td>
                <td>
                    <asp:DropDownList ID="artist_type_descDropDown" runat="server" Text='<%# Bind("artist_type_id") %>'>
                        <asp:ListItem Value="1" Selected="True">Solo Artist</asp:ListItem>
                        <asp:ListItem Value="2">Group</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
        </EditItemTemplate>
        <EmptyDataTemplate>
            <table runat="server" style="">
                <tr>
                    <td>No data was returned.</td>
                </tr>
            </table>
        </EmptyDataTemplate>
        <InsertItemTemplate>
            <tr class="">
                <td>
                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" ValidationGroup="Insert" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" CausesValidation="False" ValidationGroup="Insert" />
                </td>

                <td>
                    <asp:TextBox ID="fnameTextBox" runat="server" Text='<%# Bind("fname") %>' ValidationGroup="Insert" />
                    <asp:RequiredFieldValidator ID="fnameValidator" runat="server"
                        ErrorMessage="<br />You must enter a first name." ControlToValidate="fnameTextBox"
                        CssClass="text-warning" Display="dynamic" ValidationGroup="Insert">
                    </asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:TextBox ID="lnameTextBox" runat="server" Text='<%# Bind("lname") %>' ValidationGroup="Insert" />
                </td>
                <td>
                    <asp:DropDownList ID="artist_type_descDropDown" runat="server" Text='<%# Bind("artist_type_id") %>'>
                        <asp:ListItem Value="1" Selected="True">Solo Artist</asp:ListItem>
                        <asp:ListItem Value="2">Group</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td>&nbsp;</td>
            </tr>
        </InsertItemTemplate>
        <ItemTemplate>
            <tr style="">
                <td>
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" CausesValidation="false" />
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                </td>

                <td>
                    <asp:Label ID="fnameLabel" runat="server" Text='<%# Eval("fname") %>' />
                </td>
                <td>
                    <asp:Label ID="lnameLabel" runat="server" Text='<%# Eval("lname") %>' />
                </td>
                <td>
                    <asp:Label ID="artist_type_idLabel" runat="server" Text='<%# Eval("artist_type_desc") %>' />
                </td>
                <td>
                    <asp:Label ID="artist_idLabel" runat="server" Text='<%# Eval("artist_id") %>' />
                </td>
            </tr>
        </ItemTemplate>
        <LayoutTemplate>
            <table runat="server">
                <tr runat="server">
                    <td runat="server">
                        <table id="itemPlaceholderContainer" runat="server" border="0" style="">
                            <tr runat="server" class="bg-info">
                                <th runat="server"></th>
                                <th runat="server">First Name</th>
                                <th runat="server">Last Name</th>
                                <th runat="server">Artist Type</th>
                                <th runat="server">Artist ID</th>
                            </tr>
                            <tr id="itemPlaceholder" runat="server">
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr runat="server">
                    <td runat="server" style="">
                        <asp:DataPager ID="DataPager1" runat="server">
                            <Fields>
                                <asp:NumericPagerField ButtonType="Link" />
                            </Fields>
                        </asp:DataPager>
                    </td>
                </tr>
            </table>
        </LayoutTemplate>
        <SelectedItemTemplate>
            <tr style="">
                <td>
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                </td>
                <td>
                    <asp:Label ID="fnameLabel" runat="server" Text='<%# Eval("fname") %>' />
                </td>
                <td>
                    <asp:Label ID="lnameLabel" runat="server" Text='<%# Eval("lname") %>' />
                </td>
                <td>
                    <asp:Label ID="artist_type_idLabel" runat="server" Text='<%# Eval("artist_type_desc") %>' />
                </td>
                <td>
                    <asp:Label ID="artist_idLabel" runat="server" Text='<%# Eval("artist_id") %>' />
                </td>
            </tr>
        </SelectedItemTemplate>
    </asp:ListView>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:disk_inventoryZAConnectionString %>"
        DeleteCommand="execute sp_DelArtist @artist_id"
        InsertCommand="execute sp_InsArtist @fname, @artist_type_id, @lname"
        SelectCommand="SELECT * FROM [artistPage] ORDER BY [fname]"
        UpdateCommand="execute sp_UpdArtist  @artist_id, @fname, @artist_type_id, @lname"></asp:SqlDataSource>

</asp:Content>
