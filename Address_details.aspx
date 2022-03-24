<%@ Page Title="Address Details" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Address_details.aspx.cs" Inherits="coursework.Address_details" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <center>
        <br />
        <br />
        <br />
        <h2><%: Title %></h2>
        <br />
        <br />
        <div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;TEACHERADDRESS&quot; WHERE &quot;ADDRESS_ID&quot; = :ADDRESS_ID" InsertCommand="insert into teacheraddress(address_id, address_name, teacher)
select (to_number(:address_id), to_char(:address_name), to_number(:teacher)
from dual where not exists (select 1 from teacheraddress where address_id=:address_id)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM &quot;TEACHERADDRESS&quot;" UpdateCommand="UPDATE &quot;TEACHERADDRESS&quot; SET &quot;ADDRESS_NAME&quot; = :ADDRESS_NAME, &quot;TEACHER&quot; = :TEACHER WHERE &quot;ADDRESS_ID&quot; = :ADDRESS_ID">
            <DeleteParameters>
                <asp:Parameter Name="ADDRESS_ID" Type="Decimal" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="ADDRESS_ID" Type="Decimal" />
                <asp:Parameter Name="ADDRESS_NAME" Type="String" />
                <asp:Parameter Name="TEACHER" Type="Decimal" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="ADDRESS_NAME" Type="String" />
                <asp:Parameter Name="TEACHER" Type="Decimal" />
                <asp:Parameter Name="ADDRESS_ID" Type="Decimal" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;TEACHER_ID&quot; FROM &quot;TEACHER&quot;"></asp:SqlDataSource>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ADDRESS_ID" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" Height="301px" Width="718px" AllowSorting="True">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:CommandField HeaderText="Operations" ShowDeleteButton="True" ShowEditButton="True" />
                    <asp:BoundField DataField="ADDRESS_ID" HeaderText="ID" ReadOnly="True" SortExpression="ADDRESS_ID" />
                    <asp:BoundField DataField="ADDRESS_NAME" HeaderText="Address" SortExpression="ADDRESS_NAME" />
                    <asp:BoundField DataField="TEACHER" HeaderText="Teacher" SortExpression="TEACHER" />
                </Columns>
                <EditRowStyle BackColor="#7C6F57" />
                <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#E3EAEB" />
                <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F8FAFA" />
                <SortedAscendingHeaderStyle BackColor="#246B61" />
                <SortedDescendingCellStyle BackColor="#D4DFE1" />
                <SortedDescendingHeaderStyle BackColor="#15524A" />
            </asp:GridView>
        </div>
        <asp:FormView ID="FormView1" runat="server" DataKeyNames="ADDRESS_ID" DataSourceID="SqlDataSource1" Height="34px" Width="719px">
            <EditItemTemplate>
                ADDRESS_ID:
                <asp:Label ID="ADDRESS_IDLabel1" runat="server" Text='<%# Eval("ADDRESS_ID") %>' />
                <br />
                ADDRESS_NAME:
                <asp:TextBox ID="ADDRESS_NAMETextBox" runat="server" Text='<%# Bind("ADDRESS_NAME") %>' />
                <br />
                TEACHER:
                <asp:TextBox ID="TEACHERTextBox" runat="server" Text='<%# Bind("TEACHER") %>' />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </EditItemTemplate>
            <InsertItemTemplate>
                ADDRESS_ID:
                <br />
                <asp:TextBox ID="ADDRESS_IDTextBox" runat="server" Text='<%# Bind("ADDRESS_ID") %>' />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ADDRESS_IDTextBox" ErrorMessage="Please enter the ID" ForeColor="Red"></asp:RequiredFieldValidator>
                <br />
                <br />
                ADDRESS_NAME:
                <br />
                <asp:TextBox ID="ADDRESS_NAMETextBox" runat="server" Text='<%# Bind("ADDRESS_NAME") %>' />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="ADDRESS_NAMETextBox" ErrorMessage="Please enter the address" ForeColor="Red"></asp:RequiredFieldValidator>
                <br />
                <br />
                TEACHER:
                <br />
                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="TEACHER_ID" DataValueField="TEACHER_ID" SelectedValue='<%# Bind("TEACHER") %>'>
                </asp:DropDownList>
                <br />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </InsertItemTemplate>
            <ItemTemplate>
                <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="Insert" />
            </ItemTemplate>
        </asp:FormView>
    </center>
</asp:Content>
