<%@ Page Title="Student Assignment" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Student_assignment_details.aspx.cs" Inherits="coursework.Student_assignment_details" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <center>
        <br />
        <br />
        <br />
        <h2><%: Title %></h2>
        <br />
        <br />
        <div>
            <br />
            Search by student ID:&nbsp;&nbsp;
            <asp:DropDownList ID="DropDownList7" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="STUDENT_ID" DataValueField="STUDENT_ID">
            </asp:DropDownList>
            <br />
            <br />
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;STUDENT_ID&quot; FROM &quot;STUDENT&quot;"></asp:SqlDataSource>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" Height="229px" Width="942px">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="STUDENT_NAME" HeaderText="Student" SortExpression="STUDENT_NAME">
                    <HeaderStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                    </asp:BoundField>
                    <asp:BoundField DataField="MODULE" HeaderText="Module Code" SortExpression="MODULE" >
                    <HeaderStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                    <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                    </asp:BoundField>
                    <asp:BoundField DataField="MODULE_NAME" HeaderText="Module" SortExpression="MODULE_NAME" >
                    <HeaderStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                    <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                    </asp:BoundField>
                    <asp:BoundField DataField="ASSINGMENT_TYPE" HeaderText="Assignment" SortExpression="ASSINGMENT_TYPE">
                    <HeaderStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                    <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                    </asp:BoundField>
                    <asp:BoundField DataField="GRADE" HeaderText="Grade" SortExpression="GRADE">
                    <HeaderStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                    <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                    </asp:BoundField>
                    <asp:BoundField DataField="STATUS" HeaderText="Status" SortExpression="STATUS">
                    <HeaderStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                    <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
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
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="select r.module, r.grade, m.module_name, a.assingment_type, s.student_name, g.status from results r join module m on r.module=m.module_code join assignment a on r.assignment=a.assignment_id join student s on r.student = s.student_id join grade g on r.grade = g.grade where r.student=:student">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList7" Name="student" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
    </center>
</asp:Content>
