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


<%@ Page Title="Borrower" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Borrower.aspx.cs" Inherits="project2.Borrower" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Borrower</h2>
    <p class="text-danger">&nbsp;</p>
    <br />
    <asp:ListView ID="ListView1" runat="server" DataKeyNames="borrower_id" DataSourceID="SqlDataSource1" InsertItemPosition="LastItem">
        <AlternatingItemTemplate>
            <tr class="bg-info">
                <td>
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" CausesValidation="false" />
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                </td>
                <td>
                    <asp:Label ID="lnameLabel" runat="server" Text='<%# Eval("lname") %>' />
                </td>
                <td>
                    <asp:Label ID="fnameLabel" runat="server" Text='<%# Eval("fname") %>' />
                </td>
                <td>
                    <asp:Label ID="phonenumberLabel" runat="server" Text='<%# Eval("phonenumber") %>' />
                </td>
                <td>
                    <asp:Label ID="borrower_idLabel" runat="server" Text='<%# Eval("borrower_id") %>' />
                </td>
            </tr>
        </AlternatingItemTemplate>
        <EditItemTemplate>
            <tr style="">
                <td>
                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" ValidationGroup="Edit" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" CausesValidation="False" />
                </td>
                <td>
                    <asp:TextBox ID="lnameTextBox" runat="server" Text='<%# Bind("lname") %>' ValidationGroup="Edit" />
                    <asp:RequiredFieldValidator ID="lnameValidator" runat="server" ErrorMessage="<br />You must enter a last name."
                        ControlToValidate="lnameTextBox" CssClass="text-warning" Display="dynamic" ValidationGroup="Edit">
                    </asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:TextBox ID="fnameTextBox" runat="server" Text='<%# Bind("fname") %>' ValidationGroup="Edit" />
                    <asp:RequiredFieldValidator ID="fnameValidator" runat="server"
                        ErrorMessage="<br />You must enter a first name." ControlToValidate="fnameTextBox"
                        CssClass="text-warning" Display="dynamic" ValidationGroup="Edit">
                    </asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:TextBox ID="phonenumberTextBox" runat="server" Text='<%# Bind("phonenumber") %>' ValidationGroup="Edit" />
                    <asp:RequiredFieldValidator ID="phoneValidator" runat="server" ErrorMessage="<br />You must enter a valid phone number."
                        ControlToValidate="phonenumberTextBox" CssClass="text-warning" Display="dynamic" ValidationGroup="Edit">
                    </asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="regPhone" runat="server" ControlToValidate="phonenumberTextBox" Display="dynamic"
                        Text="<br />Use this format: 999-999-9999" CssClass="text-warning"
                        ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}" ValidationGroup="Edit">
                    </asp:RegularExpressionValidator>
                </td>
                <td>
                    <asp:Label ID="borrower_idLabel1" runat="server" Text='<%# Eval("borrower_id") %>' />
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
                    <asp:TextBox ID="lnameTextBox" runat="server" Text='<%# Bind("lname") %>' ValidationGroup="Insert" />
                    <asp:RequiredFieldValidator ID="lnameValidator" runat="server" ErrorMessage="<br />You must enter a last name."
                        ControlToValidate="lnameTextBox" CssClass="text-warning" Display="dynamic" ValidationGroup="Insert">
                    </asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:TextBox ID="fnameTextBox" runat="server" Text='<%# Bind("fname") %>' ValidationGroup="Insert" />
                    <asp:RequiredFieldValidator ID="fnameValidator" runat="server"
                        ErrorMessage="<br />You must enter a first name." ControlToValidate="fnameTextBox"
                        CssClass="text-warning" Display="dynamic" ValidationGroup="Insert">
                    </asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:TextBox ID="phonenumberTextBox" runat="server" Text='<%# Bind("phonenumber") %>' ValidationGroup="Insert" />
                    <asp:RequiredFieldValidator ID="phoneValidator" runat="server" ErrorMessage="<br />You must enter a valid phone number."
                        ControlToValidate="phonenumberTextBox" CssClass="text-warning" Display="dynamic" ValidationGroup="Insert">
                    </asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="regPhone" runat="server" ControlToValidate="phonenumberTextBox" Display="dynamic"
                        Text="<br />Use this format: 999-999-9999" CssClass="text-warning"
                        ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}" ValidationGroup="Insert">
                    </asp:RegularExpressionValidator>
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
                    <asp:Label ID="lnameLabel" runat="server" Text='<%# Eval("lname") %>' />
                </td>
                <td>
                    <asp:Label ID="fnameLabel" runat="server" Text='<%# Eval("fname") %>' />
                </td>
                <td>
                    <asp:Label ID="phonenumberLabel" runat="server" Text='<%# Eval("phonenumber") %>' />
                </td>
                <td>
                    <asp:Label ID="borrower_idLabel" runat="server" Text='<%# Eval("borrower_id") %>' />
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
                                <th runat="server">Last Name</th>
                                <th runat="server">First Name</th>
                                <th runat="server">Phone Number</th>
                                <th runat="server">Borrower ID</th>
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
                    <asp:Label ID="lnameLabel" runat="server" Text='<%# Eval("lname") %>' />
                </td>
                <td>
                    <asp:Label ID="fnameLabel" runat="server" Text='<%# Eval("fname") %>' />
                </td>
                <td>
                    <asp:Label ID="phonenumberLabel" runat="server" Text='<%# Eval("phonenumber") %>' />
                </td>
                <td>
                    <asp:Label ID="borrower_idLabel" runat="server" Text='<%# Eval("borrower_id") %>' />
                </td>
            </tr>
        </SelectedItemTemplate>
    </asp:ListView>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:disk_inventoryZAConnectionString %>"
        DeleteCommand="execute sp_DelBorrower @borrower_id"
        InsertCommand="execute sp_InsBorrower @fname, @lname, @phonenumber"
        SelectCommand="SELECT [lname], [fname], [phonenumber], [borrower_id] FROM [borrower] ORDER BY [lname], [fname]"
        UpdateCommand="execute sp_UpdBorrower @borrower_id, @fname, @lname, @phonenumber">
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
