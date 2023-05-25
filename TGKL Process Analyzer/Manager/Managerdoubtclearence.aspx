<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Managerdoubtclearence.aspx.cs" Inherits="TGKL_Process_Analyzer.Manager.Managerdoubtclearence" MasterPageFile="~/Admin/Adminpage.Master" %>


<asp:Content ID="Content1" ContentPlaceHolderID="menucontent" runat="server">
<div id="menu">
        <ul>
            <li><a href="Managerdoubtslist.aspx" class="current">Doubts List</a></li>
            <li><a href="Manageruploadarticles.aspx">Articles</a></li>
            <li><a href="Managerpostexam.aspx">Post Exam</a></li>
            <li><a href="../User/Logout.aspx">Log Out</a></li>
        </ul>  
    </div><!-- end of templatemo_menu -->
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="bodycontent" runat="server">

<h2>Reply For Doubts</h2>
<asp:Label ID="lblid" runat="server" Text=""></asp:Label>

<table class="minitable">

<tr>
<td style="width:30%">
    <asp:Label ID="Label1" runat="server" Text="Topic"></asp:Label>
</td>

<td>
    <asp:Label ID="lbltopic" runat="server" Text=""></asp:Label>
</td>
</tr>


<tr>
<td>
    <asp:Label ID="Label2" runat="server" Text="Question"></asp:Label>
</td>

<td>
    <asp:Label ID="lblquestion" runat="server" Text=""></asp:Label>
</td>
</tr>

<tr>
<td>
    <asp:Label ID="Label3" runat="server" Text="Answer"></asp:Label>
</td>

<td>
    <asp:TextBox ID="txtreply" runat="server" TextMode="MultiLine"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter Your Answer" Display="Dynamic" ValidationGroup="test" ControlToValidate="txtreply">*</asp:RequiredFieldValidator>
</td>
</tr>

<tr>
<td colspan="2" style="text-align:center;">
    <asp:Button ID="btnreply" runat="server" Text="Reply" ValidationGroup="test" 
        onclick="btnreply_Click"/>
</td>
</tr>
<tr>
<td colspan="2">
  <asp:validationsummary  runat="server" id="validationSummary" ValidationGroup="test" CssClass="errorlist">
   </asp:validationsummary>
</td>
</tr>
</table>


</asp:Content>