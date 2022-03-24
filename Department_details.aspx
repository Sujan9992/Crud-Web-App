<%@ Page Title="Department Details" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Department_details.aspx.cs" Inherits="coursework.Department_details" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <center>
        <br />
        <br />
        <br />
        <h2><%: Title %></h2>
        <br />
        <br />
        <div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;DEPARTMENT&quot; WHERE &quot;DEP_ID&quot; = :DEP_ID" InsertCommand="INSERT INTO &quot;COURSEWORK&quot;.&quot;DEPARTMENT&quot; (DEP_ID, DEP_NAME) select (to_number(:dep_id), to_char(:dep_name) from dual where not exists (select 1 from &quot;COURSEWORK&quot;.&quot;DEPARTMENT&quot; where dep_id=:dep_id)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM &quot;DEPARTMENT&quot;" UpdateCommand="UPDATE &quot;DEPARTMENT&quot; SET &quot;DEP_NAME&quot; = :DEP_NAME WHERE &quot;DEP_ID&quot; = :DEP_ID">
            <DeleteParameters>
                <asp:Parameter Name="DEP_ID" Type="Decimal" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="DEP_ID" Type="Decimal" />
                <asp:Parameter Name="dep_name" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="DEP_NAME" Type="String" />
                <asp:Parameter Name="DEP_ID" Type="Decimal" />
            </UpdateParameters>
        </asp:SqlDataSource>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="DEP_ID" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" Height="269px" Width="670px" AllowSorting="True">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" HeaderText="Operations" />
                    <asp:BoundField DataField="DEP_ID" HeaderText="ID" ReadOnly="True" SortExpression="DEP_ID" />
                    <asp:BoundField DataField="DEP_NAME" HeaderText="Name" SortExpression="DEP_NAME" />
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
        <asp:FormView ID="FormView1" runat="server" DataKeyNames="DEP_ID" DataSourceID="SqlDataSource1" Height="20px" style="margin-top: 11px" Width="664px">
            <EditItemTemplate>
                DEP_ID:
                <asp:Label ID="DEP_IDLabel1" runat="server" Text='<%# Eval("DEP_ID") %>' />
                <br />
                DEP_NAME:
                <asp:TextBox ID="DEP_NAMETextBox" runat="server" Text='<%# Bind("DEP_NAME") %>' />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </EditItemTemplate>
            <InsertItemTemplate>
                DEP_ID:
                <br />
                <asp:TextBox ID="DEP_IDTextBox" runat="server" Text='<%# Bind("DEP_ID") %>' />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="DEP_IDTextBox" ErrorMessage="Please enter the ID" ForeColor="Red"></asp:RequiredFieldValidator>
                <br />
                <br />
                DEP_NAME:
                <br />
                <asp:TextBox ID="DEP_NAMETextBox" runat="server" Text='<%# Bind("DEP_NAME") %>' />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="DEP_NAMETextBox" ErrorMessage="Please enter the name" ForeColor="Red"></asp:RequiredFieldValidator>
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
