<%@ Page Title="Fees" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Student_fee.aspx.cs" Inherits="coursework.Student_fee" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <center>
        <br />
        <br />
        <br />
        <h2><%: Title %></h2>
        <br />
        <br />
        <div>
            Search by Student ID:&nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="DropDownList3" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="STUDENT_ID" DataValueField="STUDENT_ID">
            </asp:DropDownList>
            <br />
            <br />
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" Height="173px" Width="549px">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="STUDENT_NAME" HeaderText="Name" SortExpression="STUDENT_NAME" >
                    <HeaderStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                    <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                    </asp:BoundField>
                    <asp:BoundField DataField="FEES_AMT" HeaderText="Total Fees" SortExpression="FEES_AMT" >
                    <HeaderStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                    <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                    </asp:BoundField>
                    <asp:BoundField DataField="TOTAL_PAID" HeaderText="Total Paid" SortExpression="TOTAL_PAID" >
                    <HeaderStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                    <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                    </asp:BoundField>
                    <asp:BoundField DataField="PAYMENT_DUE_DATE" HeaderText="Payment Date" SortExpression="PAYMENT_DUE_DATE" >
                    <HeaderStyle HorizontalAlign="Left" VerticalAlign="Middle" Wrap="False" />
                    <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" Wrap="False" />
                    </asp:BoundField>
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
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="select f.fees_amt, f.total_paid, f.payment_due_date, s.student_name from fees f join student s on f.student=s.student_id where f.student=:student">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList3" Name="student" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM &quot;STUDENT&quot;"></asp:SqlDataSource>
        </center>
</asp:Content>
