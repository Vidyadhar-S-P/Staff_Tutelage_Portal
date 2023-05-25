<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Traineeinbox.aspx.cs" Inherits="TGKL_Process_Analyzer.Trainee.Traineeinbox" MasterPageFile="~/Admin/Adminpage.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="menucontent" runat="server">
<div id="menu">
        <ul>
            <li><a href="Traineeinbox.aspx" class="current">Inbox</a></li>
            <li><a href="Traineearticles.aspx">Articles</a></li>
            <li><a href="Traineetakeexam.aspx">Take Exam</a></li>
            <li><a href="../User/Logout.aspx">Log Out</a></li>
        </ul>  
    </div><!-- end of templatemo_menu -->
</asp:Content>

<asp:Content ContentPlaceHolderID="bodycontent" runat="server">

 <h2>Doubts List</h2>

    <asp:Button ID="btnpostdoubt" runat="server" Text="Post Doubt" 
        onclick="btnpostdoubt_Click" />

<table id="admintable">
<tr>
<td style="width:50%; vertical-align:top;">


<asp:Table ID="Table1" runat="server" BorderStyle="Double" BorderWidth="5px" 
        GridLines="Horizontal">
    </asp:Table>

</td>
<td valign="top" style="width:70%">

 <table border="1" id="mytable" align="center" style="width: 400px; border:1px solid;">
    
    <tr>
    
    <td align="center" bgcolor="#c1c1c1">
        <b><asp:Label ID="Label3" runat="server" Text="Question" style="font-size: x-large; color: #000000;"></asp:Label></b></td>
    
    </tr>
    
    <tr>
    
    <td align="left">
        <b><asp:Label ID="Label1" runat="server" Text=""></asp:Label></b></td>
    
    </tr>
    
        <tr>
    
    <td align="center" bgcolor="#c1c1c1">
        <b><asp:Label ID="Label4" runat="server" Text="Answer" style="font-size: x-large; color: #000000;"></asp:Label></b></td>
    
    </tr>

    
    <tr>
    <td align="left">
        <b><asp:Label ID="Label2" runat="server" Text=""></asp:Label></b></td>
    </tr>
    </table>

</td>
</tr>
</table>


</asp:Content>