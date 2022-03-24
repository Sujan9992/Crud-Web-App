<%@ Page Title="Teacher Details" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Teacher_details.aspx.cs" Inherits="coursework.Teacher_details" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <center>
        <br />
        <br />
        <br />
        <h2><%: Title %></h2>
        <br />
        <br />
        <div>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM &quot;DEPARTMENT&quot;"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;TEACHER&quot; WHERE &quot;TEACHER_ID&quot; = :TEACHER_ID" InsertCommand="insert into teacher(teacher_id,teacher_name, email, department)
select to_number(:teacher_id), to_char(:teacher_name),to_char(:email), to_number(:department)
from dual where not exists (select 1 from teacher where teacher_id=:teacher_id)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM &quot;TEACHER&quot;" UpdateCommand="UPDATE &quot;TEACHER&quot; SET &quot;TEACHER_NAME&quot; = :TEACHER_NAME, &quot;DEPARTMENT&quot; = :DEPARTMENT, &quot;EMAIL&quot; = :EMAIL WHERE &quot;TEACHER_ID&quot; = :TEACHER_ID">
                <DeleteParameters>
                    <asp:Parameter Name="TEACHER_ID" Type="Decimal" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="TEACHER_ID" Type="Decimal" />
                    <asp:Parameter Name="TEACHER_NAME" Type="String" />
                    <asp:Parameter Name="EMAIL" Type="String" />
                    <asp:Parameter Name="DEPARTMENT" Type="Decimal" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="TEACHER_NAME" Type="String" />
                    <asp:Parameter Name="DEPARTMENT" Type="Decimal" />
                    <asp:Parameter Name="EMAIL" Type="String" />
                    <asp:Parameter Name="TEACHER_ID" Type="Decimal" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="TEACHER_ID" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" Height="356px" Width="822px" AllowSorting="True">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" HeaderText="Operations" />
                    <asp:BoundField DataField="TEACHER_ID" HeaderText="ID" ReadOnly="True" SortExpression="TEACHER_ID" >
                    <HeaderStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                    <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                    </asp:BoundField>
                    <asp:BoundField DataField="TEACHER_NAME" HeaderText="Name" SortExpression="TEACHER_NAME" />
                    <asp:BoundField DataField="DEPARTMENT" HeaderText="Department" SortExpression="DEPARTMENT" />
                    <asp:BoundField DataField="EMAIL" HeaderText="Email" SortExpression="EMAIL" />
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
        <asp:FormView ID="FormView1" runat="server" DataKeyNames="TEACHER_ID" DataSourceID="SqlDataSource1" Height="38px" Width="816px">
            <EditItemTemplate>
                TEACHER_ID:
                <asp:Label ID="TEACHER_IDLabel1" runat="server" Text='<%# Eval("TEACHER_ID") %>' />
                <br />
                TEACHER_NAME:
                <asp:TextBox ID="TEACHER_NAMETextBox" runat="server" Text='<%# Bind("TEACHER_NAME") %>' />
                <br />
                DEPARTMENT:
                <asp:TextBox ID="DEPARTMENTTextBox" runat="server" Text='<%# Bind("DEPARTMENT") %>' />
                <br />
                EMAIL:
                <asp:TextBox ID="EMAILTextBox" runat="server" Text='<%# Bind("EMAIL") %>' />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </EditItemTemplate>
            <InsertItemTemplate>
                <br />
                TEACHER_ID:
                <br />
                <asp:TextBox ID="TEACHER_IDTextBox" runat="server" Text='<%# Bind("TEACHER_ID") %>' />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TEACHER_IDTextBox" ErrorMessage="Please enter the ID" ForeColor="Red"></asp:RequiredFieldValidator>
                <br />
                <br />
                TEACHER_NAME:
                <br />
                <asp:TextBox ID="TEACHER_NAMETextBox" runat="server" Text='<%# Bind("TEACHER_NAME") %>' />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TEACHER_NAMETextBox" ErrorMessage="Please enter the name" ForeColor="Red"></asp:RequiredFieldValidator>
                <br />
                <br />
                DEPARTMENT:
                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="DEP_ID" DataValueField="DEP_ID" SelectedValue='<%# Bind("DEPARTMENT") %>'>
                </asp:DropDownList>
                <br />
                <br />
                EMAIL:
                <br />
                <asp:TextBox ID="EMAILTextBox" runat="server" Text='<%# Bind("EMAIL") %>' />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="EMAILTextBox" ErrorMessage="Please enter the email" ForeColor="Red"></asp:RequiredFieldValidator>
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