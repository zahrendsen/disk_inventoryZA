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
                    <asp:Label ID="release_dateLabel" runat="server" Text='<%# Eval("release_date") %>' />
                </td>
                <td>
                    <asp:Label ID="status_idLabel" runat="server" Text='<%# Eval("status_id") %>' />
                </td>
                <td>
                    <asp:Label ID="disk_type_idLabel" runat="server" Text='<%# Eval("disk_type_id") %>' />
                </td>
                <td>
                    <asp:Label ID="genre_idLabel" runat="server" Text='<%# Eval("genre_id") %>' />
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
                    <asp:RequiredFieldValidator CssClass="text-danger" ID="RequiredFieldValidator1" runat="server" ErrorMessage="<br />Required" 
                        ControlToValidate="disk_nameTextBox" Display="Dynamic" ValidationGroup="Edit"></asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:TextBox ID="release_dateTextBox" runat="server" Text='<%# Bind("release_date") %>' ValidationGroup="Edit" />
                     <asp:RequiredFieldValidator CssClass="text-danger" ID="RequiredFieldValidator2" runat="server" ErrorMessage="<br />Required" 
                        ControlToValidate="release_dateTextBox" Display="Dynamic" ValidationGroup="Edit"></asp:RequiredFieldValidator>
                    <asp:RangeValidator CssClass="text-danger" ID="RangeValidator1" runat="server" ControlToValidate="release_dateTextBox"
                        ErrorMessage="<br />Must be a valid date" Type="Date" Display="Dynamic" MaximumValue="12/31/9999" MinimumValue="01/01/0001" ValidationGroup="Edit">
                    </asp:RangeValidator>
                </td>
                <td>
                    <asp:TextBox ID="status_idTextBox" runat="server" Text='<%# Bind("status_id") %>' ValidationGroup="Edit"/>
                     <asp:RequiredFieldValidator CssClass="text-danger" ID="RequiredFieldValidator3" runat="server" ErrorMessage="<br />Required" 
                        ControlToValidate="status_idTextBox" Display="Dynamic" ValidationGroup="Edit"></asp:RequiredFieldValidator>
                    <asp:RangeValidator ControlToValidate="status_idTextBox" ID="RangeValidator3" runat="server" ErrorMessage="<br />Status ID must be 1 or 2" Type="Integer" ValidationGroup="Edit"
                           CssClass="text-warning" Display="dynamic" MaximumValue="2" MinimumValue="1"></asp:RangeValidator>
                </td>
                <td>
                    <asp:TextBox ID="disk_type_idTextBox" runat="server" Text='<%# Bind("disk_type_id") %>' ValidationGroup="Edit"/>
                    <asp:RequiredFieldValidator CssClass="text-danger" ID="RequiredFieldValidator4" runat="server" ErrorMessage="<br />Required" 
                        ControlToValidate="disk_type_idTextBox" Display="Dynamic" ValidationGroup="Edit"></asp:RequiredFieldValidator>
                    <asp:RangeValidator ControlToValidate="disk_type_idTextBox" ID="RangeValidator4" runat="server" ErrorMessage="<br />Type ID must be 1 or 2" Type="Integer" ValidationGroup="Edit"
                           CssClass="text-warning" Display="dynamic" MaximumValue="2" MinimumValue="1"></asp:RangeValidator>
                </td>
                <td>
                    <asp:TextBox ID="genre_idTextBox" runat="server" Text='<%# Bind("genre_id") %>' ValidationGroup="Edit"/>
                    <asp:RequiredFieldValidator CssClass="text-danger" ID="RequiredFieldValidator5" runat="server" ErrorMessage="<br />Required" 
                        ControlToValidate="genre_idTextBox" Display="Dynamic" ValidationGroup="Edit"></asp:RequiredFieldValidator>
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
                      <asp:RequiredFieldValidator CssClass="text-danger" ID="RequiredFieldValidator6" runat="server" ErrorMessage="<br />Required" 
                        ControlToValidate="disk_nameTextBox" Display="Dynamic" ValidationGroup="Insert"></asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:TextBox ID="release_dateTextBox" runat="server" Text='<%# Bind("release_date") %>' ValidationGroup="Insert"/>
                    <asp:RequiredFieldValidator CssClass="text-danger" ID="RequiredFieldValidator7" runat="server" ErrorMessage="<br />Required" 
                        ControlToValidate="release_dateTextBox" Display="Dynamic" ValidationGroup="Insert"></asp:RequiredFieldValidator>
                     <asp:RangeValidator CssClass="text-danger" ID="RangeValidator2" runat="server" ControlToValidate="release_dateTextBox"
                        ErrorMessage="<br />Must be a valid date" Type="Date" Display="Dynamic" MaximumValue="12/31/9999" MinimumValue="01/01/0001" ValidationGroup="Insert">
                    </asp:RangeValidator>
                </td>
                <td>
                    <asp:TextBox ID="status_idTextBox" runat="server" Text='<%# Bind("status_id") %>' ValidationGroup="Insert"/>
                    <asp:RequiredFieldValidator CssClass="text-danger" ID="RequiredFieldValidator8" runat="server" ErrorMessage="<br />Required" 
                        ControlToValidate="status_idTextBox" Display="Dynamic" ValidationGroup="Insert"></asp:RequiredFieldValidator>
                    <asp:RangeValidator ControlToValidate="status_idTextBox" ID="RangeValidator3" runat="server" ErrorMessage="<br />Status ID must be 1 or 2" Type="Integer" ValidationGroup="Insert"
                           CssClass="text-warning" Display="dynamic" MaximumValue="2" MinimumValue="1"></asp:RangeValidator>
                </td>
                <td>
                    <asp:TextBox ID="disk_type_idTextBox" runat="server" Text='<%# Bind("disk_type_id") %>' ValidationGroup="Insert"/>
                    <asp:RequiredFieldValidator CssClass="text-danger" ID="RequiredFieldValidator9" runat="server" ErrorMessage="<br />Required" 
                        ControlToValidate="disk_type_idTextBox" Display="Dynamic" ValidationGroup="Insert"></asp:RequiredFieldValidator>
                    <asp:RangeValidator ControlToValidate="disk_type_idTextBox" ID="RangeValidator4" runat="server" ErrorMessage="<br />Type ID must be 1 or 2" Type="Integer" ValidationGroup="Insert"
                           CssClass="text-warning" Display="dynamic" MaximumValue="2" MinimumValue="1"></asp:RangeValidator>
                </td>
                <td>
                    <asp:TextBox ID="genre_idTextBox" runat="server" Text='<%# Bind("genre_id") %>' ValidationGroup="Insert"/>
                    <asp:RequiredFieldValidator CssClass="text-danger" ID="RequiredFieldValidator10" runat="server" ErrorMessage="<br />Required" 
                        ControlToValidate="genre_idTextBox" Display="Dynamic" ValidationGroup="Insert"></asp:RequiredFieldValidator>
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
                    <asp:Label ID="release_dateLabel" runat="server" Text='<%# Eval("release_date") %>' />
                </td>
                <td>
                    <asp:Label ID="status_idLabel" runat="server" Text='<%# Eval("status_id") %>' />
                </td>
                <td>
                    <asp:Label ID="disk_type_idLabel" runat="server" Text='<%# Eval("disk_type_id") %>' />
                </td>
                <td>
                    <asp:Label ID="genre_idLabel" runat="server" Text='<%# Eval("genre_id") %>' />
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
                    <asp:Label ID="release_dateLabel" runat="server" Text='<%# Eval("release_date") %>' />
                </td>
                <td>
                    <asp:Label ID="status_idLabel" runat="server" Text='<%# Eval("status_id") %>' />
                </td>
                <td>
                    <asp:Label ID="disk_type_idLabel" runat="server" Text='<%# Eval("disk_type_id") %>' />
                </td>
                <td>
                    <asp:Label ID="genre_idLabel" runat="server" Text='<%# Eval("genre_id") %>' />
                </td>
                <td>
                    <asp:Label ID="disk_idLabel" runat="server" Text='<%# Eval("disk_id") %>' />
                </td>
            </tr>
        </SelectedItemTemplate>
    </asp:ListView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:disk_inventoryZAConnectionString %>" 
        DeleteCommand="execute sp_DelDisk @disk_id" 
        InsertCommand="execute sp_InsDisk @disk_name, @release_date, @status_id, @disk_type_id, @genre_id "
        SelectCommand="SELECT [disk_name], [release_date], [status_id], [disk_type_id], [genre_id], [disk_id] FROM [disk] ORDER BY [disk_name]" 
        UpdateCommand="execute sp_UpdDisk @disk_id, @disk_name, @release_date, @status_id, @disk_type_id, @genre_id">
        <DeleteParameters>
            <asp:Parameter Name="disk_id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="disk_name" Type="String" />
            <asp:Parameter DbType="Date" Name="release_date" />
            <asp:Parameter Name="status_id" Type="Int32" />
            <asp:Parameter Name="disk_type_id" Type="Int32" />
            <asp:Parameter Name="genre_id" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="disk_name" Type="String" />
            <asp:Parameter DbType="Date" Name="release_date" />
            <asp:Parameter Name="status_id" Type="Int32" />
            <asp:Parameter Name="disk_type_id" Type="Int32" />
            <asp:Parameter Name="genre_id" Type="Int32" />
            <asp:Parameter Name="disk_id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
