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
**************************************************************************--%>

<%@ Page Title="Disk" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Disk.aspx.cs" Inherits="project2.Disk" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2> Disk </h2>
    <p class="text-danger">&nbsp;</p>
    <br />
    <asp:ListView ID="ListView1" runat="server" DataKeyNames="disk_id" DataSourceID="SqlDataSource1" InsertItemPosition="LastItem">
        <AlternatingItemTemplate>
            <tr class="bg-info">
                <td>
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" CausesValidation="false" />
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                </td>
                <td>
                    <asp:Label ID="disk_nameLabel" runat="server" Text='<%# Eval("disk_name") %>' />
                </td>
                <td>
                    <asp:Label ID="release_dateLabel" runat="server" Text='<%# Eval("release_date", "{0:MM/dd/yyyy}") %>' />
                </td>
                <td>
                    <asp:Label ID="status_idLabel" runat="server" Text='<%# Eval("status_desc") %>' />
                </td>
                <td>
                    <asp:Label ID="disk_type_idLabel" runat="server" Text='<%# Eval("disk_type_desc") %>' />
                </td>
                <td>
                    <asp:Label ID="genre_idLabel" runat="server" Text='<%# Eval("genre_desc") %>' />
                </td>
                <td>
                    <asp:Label ID="disk_idLabel" runat="server" Text='<%# Eval("disk_id") %>' />
                </td>
            </tr>
        </AlternatingItemTemplate>
        <EditItemTemplate>
            <tr style="">
                <td>
                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" ValidationGroup="Edit"/>
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" CausesValidation="False" ValidationGroup="Edit"/>
                </td>
                <td>
                    <asp:TextBox ID="disk_nameTextBox" runat="server" Text='<%# Bind("disk_name") %>' ValidationGroup="Edit" />
                    <asp:RequiredFieldValidator CssClass="text-danger" ID="RequiredFieldValidator1" runat="server" ErrorMessage="<br />Disk name is Required" 
                        ControlToValidate="disk_nameTextBox" Display="Dynamic" ValidationGroup="Edit"></asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:TextBox ID="release_dateTextBox" runat="server" Text='<%# Bind("release_date", "{0:MM/dd/yyyy}") %>' ValidationGroup="Edit" />
                     <asp:RequiredFieldValidator CssClass="text-danger" ID="RequiredFieldValidator2" runat="server" ErrorMessage="<br />Release date is Required" 
                        ControlToValidate="release_dateTextBox" Display="Dynamic" ValidationGroup="Edit"></asp:RequiredFieldValidator>
                    <asp:RangeValidator CssClass="text-danger" ID="RangeValidator1" runat="server" ControlToValidate="release_dateTextBox"
                        ErrorMessage="<br />Must be a valid date" Type="Date" Display="Dynamic" MaximumValue="12/31/9999" MinimumValue="01/01/0001" ValidationGroup="Edit">
                    </asp:RangeValidator>
                </td>
                <td>
                     <asp:DropDownList ID="status_descDropDown" runat="server" DataTextField='<%# Bind("status_id") %>'>
                         <asp:ListItem Value="1" >Borrowed</asp:ListItem>
                        <asp:ListItem Value="2" Selected="True">In Stock</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td>
                    <asp:DropDownList ID="Disk_typeDropDown" runat="server" DataTextField='<%# Bind("disk_type_id") %>'>
                        <asp:ListItem Value="1" Selected="True">CD</asp:ListItem>
                        <asp:ListItem Value="2">DVD</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td>

                    <asp:DropDownList ID="genre_descDropDown" runat="server" DataSourceID="SqlDataSource2" DataTextField="genre_desc" DataValueField="genre_id" SelectedValue='<%# Bind("genre_id") %>'>
                    </asp:DropDownList>

                </td>
                <td>
                    <asp:Label ID="disk_idLabel1" runat="server" Text='<%# Eval("disk_id") %>' ValidationGroup="Edit" />

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
                    <asp:TextBox ID="disk_nameTextBox" runat="server" Text='<%# Bind("disk_name") %>' ValidationGroup="Insert"/>
                      <asp:RequiredFieldValidator CssClass="text-warning" ID="RequiredFieldValidator6" runat="server" ErrorMessage="<br />Disk name is Required" 
                        ControlToValidate="disk_nameTextBox" Display="Dynamic" ValidationGroup="Insert"></asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:TextBox ID="release_dateTextBox" runat="server" Text='<%# Bind("release_date", "{0:MM/dd/yyyy}") %>' ValidationGroup="Insert"/>
                    <asp:RequiredFieldValidator CssClass="text-warning" ID="RequiredFieldValidator7" runat="server" ErrorMessage="<br />Release date Required" 
                        ControlToValidate="release_dateTextBox" Display="Dynamic" ValidationGroup="Insert"></asp:RequiredFieldValidator>
                     <asp:RangeValidator CssClass="text-danger" ID="RangeValidator2" runat="server" ControlToValidate="release_dateTextBox"
                         ErrorMessage="<br />Must be a valid date" Type="Date" Display="Dynamic" MaximumValue="12/31/9999" MinimumValue="01/01/0001" ValidationGroup="Insert">
                     </asp:RangeValidator>
                </td>
                </td>
                <td>
                     <asp:DropDownList ID="status_descDropDown" runat="server" DataTextField='<%# Bind("status_id") %>'>
                         <asp:ListItem Value="1" >Borrowed</asp:ListItem>
                        <asp:ListItem Value="2" Selected="True">In Stock</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td>
                    <asp:DropDownList ID="Disk_typeDropDown" runat="server" DataTextField='<%# Bind("disk_type_id") %>'>
                        <asp:ListItem Value="1" Selected="True">CD</asp:ListItem>
                        <asp:ListItem Value="2">DVD</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td>

                    <asp:DropDownList ID="genre_descDropDown" runat="server" DataSourceID="SqlDataSource2" DataTextField="genre_desc" DataValueField="genre_id" SelectedValue='<%# Bind("genre_id") %>'>
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
                    <asp:Label ID="disk_nameLabel" runat="server" Text='<%# Eval("disk_name") %>' />
                </td>
                <td>
                    <asp:Label ID="release_dateLabel" runat="server" Text='<%# Eval("release_date", "{0:MM/dd/yyyy}") %>' />
                </td>
                <td>
                    <asp:Label ID="status_idLabel" runat="server" Text='<%# Eval("status_desc") %>' />
                </td>
                <td>
                    <asp:Label ID="disk_type_idLabel" runat="server" Text='<%# Eval("disk_type_desc") %>' />
                </td>
                <td>
                    <asp:Label ID="genre_idLabel" runat="server" Text='<%# Eval("genre_desc") %>' />
                </td>
                <td>
                    <asp:Label ID="disk_idLabel" runat="server" Text='<%# Eval("disk_id") %>' />
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
                                <th runat="server">Disk Name</th>
                                <th runat="server">Release Date</th>
                                <th runat="server">Status</th>
                                <th runat="server">Disk Type</th>
                                <th runat="server">Genre</th>
                                <th runat="server">Disk ID</th>
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
                                <asp:NumericPagerField ButtonType="Link"/>
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
                    <asp:Label ID="disk_nameLabel" runat="server" Text='<%# Eval("disk_name") %>' />
                </td>
                <td>
                    <asp:Label ID="release_dateLabel" runat="server" Text='<%# Eval("release_date", "{0:MM/dd/yyyy}") %>' />
                </td>
                <td>
                    <asp:Label ID="status_idLabel" runat="server" Text='<%# Eval("status_desc") %>' />
                </td>
                <td>
                    <asp:Label ID="disk_type_idLabel" runat="server" Text='<%# Eval("disk_type_desc") %>' />
                </td>
                <td>
                    <asp:Label ID="genre_idLabel" runat="server" Text='<%# Eval("genre_desc") %>' />
                </td>
                <td>
                    <asp:Label ID="disk_idLabel" runat="server" Text='<%# Eval("disk_id") %>' />
                </td>
            </tr>
        </SelectedItemTemplate>
    </asp:ListView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:disk_inventoryZAConnectionString %>" 
        DeleteCommand="execute sp_DelDisk @disk_id" 
        InsertCommand="execute sp_InsDisk @disk_name, @release_date, @status_id, @disk_type_id, @genre_id"
        SelectCommand="SELECT * FROM [diskPage] ORDER BY [disk_name]" 
        UpdateCommand="execute sp_UpdDisk @disk_id, @disk_name, @release_date, @status_id, @disk_type_id, @genre_id">
       
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:disk_inventoryZAConnectionString %>" 
        SelectCommand="SELECT [genre_id], [genre_desc] FROM [genre] ORDER BY [genre_desc]">

    </asp:SqlDataSource>
</asp:Content>
