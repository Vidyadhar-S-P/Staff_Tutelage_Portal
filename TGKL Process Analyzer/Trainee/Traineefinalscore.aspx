<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Traineefinalscore.aspx.cs" Inherits="TGKL_Process_Analyzer.Trainee.Traineefinalscore" MasterPageFile="~/Admin/Adminpage.Master" %>


<asp:Content ID="Content1" ContentPlaceHolderID="menucontent" runat="server">
<div id="menu">
        <ul>
            <li><a href="Traineeinbox.aspx">Inbox</a></li>
            <li><a href="Traineearticles.aspx">Articles</a></li>
            <li><a href="Traineetakeexam.aspx" class="current">Take Exam</a></li>
            <li><a href="../User/Logout.aspx">Log Out</a></li>
        </ul>  
    </div><!-- end of templatemo_menu -->
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="bodycontent" runat="server">

<table id="admintable">
<tr>
<td style="width:70%; vertical-align:top;">

<h4>Your Final Score for the Examination</h4>
    <asp:Label ID="lblExamination" runat="server" Text=""></asp:Label>
<h2 align=center>Conducted By</h2>
    <asp:Label ID="lblAuthor" runat="server" Text=""></asp:Label>
<h2 align=center>Is</h2>
    <asp:Label ID="lblScore" runat="server" Text=""></asp:Label>
    <hr />
    <asp:Label ID="lblOtherInformation" runat="server" Text=""></asp:Label>    
    <asp:Label ID="lblFinalResult" runat="server" Text=""></asp:Label>    
    <hr />

</td>

<td valign="top" style="width:30%">


<center><img src="../images/score.png" width="150"/></center>
</td>
</tr>
</table>

</asp:Content>