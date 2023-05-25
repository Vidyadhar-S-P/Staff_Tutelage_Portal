<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Traineepostnewdoubt.aspx.cs" Inherits="TGKL_Process_Analyzer.Trainee.Traineepostnewdoubt" MasterPageFile="~/Admin/Adminpage.Master" %>

<asp:Content ContentPlaceHolderID="menucontent" runat="server">

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

<h2>Post Your Doubt</h2>

<table class="fulltable">
<tr>
<td style="vertical-align:top;">

<table class="minitable">

<tr><td colspan="2"><h4>Ask Your Doubts..</h4></td></tr>

<tr>
<td>Topic: </td>
<td><asp:TextBox ID="txtTopic" runat="server"></asp:TextBox>
<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter Topic" ControlToValidate="txtTopic" ForeColor="Red" Display="Dynamic" ValidationGroup="test">*</asp:RequiredFieldValidator>
</td>
</tr>

<tr>
<td>Your Doubt: </td>
<td><asp:TextBox ID="txtDoubt" runat="server" TextMode="MultiLine"></asp:TextBox>
<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Enter Doubt" ControlToValidate="txtDoubt" ForeColor="Red" Display="Dynamic" ValidationGroup="test">*</asp:RequiredFieldValidator>

        </td>
</tr>


<tr>
<td colspan="2" align="center">
    <asp:Button ID="btnsend" runat="server" Text="Send" ValidationGroup="test" 
        onclick="btnsend_Click"/>
<asp:Button ID="btnnewdoubt" runat="server" Text="New Doubt"/></td>
</tr>
   <tr>
   <td colspan="2">
       <asp:Label ID="lblerror" runat="server" Text=""></asp:Label>

       <asp:validationsummary  runat="server" id="validationSummary" ValidationGroup="test" CssClass="errorlist">

        </asp:validationsummary>
   </td>
   </tr>
   
    
</table>
</td>
<td valign="top">

<center><img src="../images/doubt.gif" width="200"/></center>

<p align="center">Got any Doubt??<br /> No Worries.. Post Your Doubt Here and Get Reply from Our Staffs. </p>

</td>
</tr>
</table>
<asp:Label ID="lbldepartment" runat="server" Visible="false" Text=""></asp:Label>
<asp:Label ID="lblid" runat="server" Visible="false" Text=""></asp:Label>
</asp:Content>