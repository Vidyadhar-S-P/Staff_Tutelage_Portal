<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Adminreport.aspx.cs" Inherits="TGKL_Process_Analyzer.Admin.Adminreport" MasterPageFile="~/Admin/Adminpage.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="menucontent" runat="server">
<div id="menu">
        <ul>
            <li><a href="Adminarticleslist.aspx">Articles</a></li>
            <li><a href="Adminreport.aspx" class="current">Report</a></li>
            <li><a href="Adminemployeeslist.aspx">Employees</a></li>
            <li><a href="../User/Logout.aspx">Log Out</a></li>
        </ul>  
    </div><!-- end of templatemo_menu -->
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="bodycontent" runat="server">

<h2>Report</h2>
<table id="admintable">
<tr>
<td style="width:30%; vertical-align:top;">


<center>
<h2>Student and Staff Toppers</h2>

    <asp:RadioButtonList ID="rblStudentToppers" runat="server" AutoPostBack="True" 
        onselectedindexchanged="rblStudentToppers_SelectedIndexChanged">
        <asp:ListItem Value="2">Top Thinkers (Student)</asp:ListItem>                
    
        <asp:ListItem Value="5">Top Motivators (Staff)</asp:ListItem>        
        <asp:ListItem Value="6">Top Uploaders (Staff)</asp:ListItem>        
    </asp:RadioButtonList>
    </center>

</td>
<td valign="top" style="width:70%">

 <center>
        <asp:Label ID="lblTitle" runat="server" Text=""></asp:Label>
        <asp:GridView ID="GridView1" runat="server" CellPadding="4" 
            EnableModelValidation="True"  GridLines="None">
            <PagerStyle CssClass="footerstyle" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#330000" Font-Bold="True" ForeColor="White" />
            <HeaderStyle CssClass="headerstyle" />
        </asp:GridView>
    </center>

</td>
</tr>
</table>

</asp:Content>