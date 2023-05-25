<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Manageruploadarticles.aspx.cs" Inherits="TGKL_Process_Analyzer.Manager.Manageruploadarticles" MasterPageFile="~/Admin/Adminpage.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="menucontent" runat="server">
<div id="menu">
        <ul>
            <li><a href="Managerdoubtslist.aspx">Doubts List</a></li>
            <li><a href="Manageruploadarticles.aspx" class="current">Articles</a></li>
            <li><a href="Managerpostexam.aspx">Post Exam</a></li>
            <li><a href="../User/Logout.aspx">Log Out</a></li>
        </ul>  
    </div><!-- end of templatemo_menu -->
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="bodycontent" runat="server">

<h2>Upload Articles</h2>

<table class="fulltable">
<tr>
<td style="vertical-align:top;">

<center><img src="../images/upload.png" width="100" alt="Upload"/></center>

<h4>Upload Tips</h4>

<ul>

<li>Upload only Relevent Materials</li>
<li>File-Size should be lesser than 5 MB</li>
</ul>
 <asp:Button ID="btnuploadedarticles" runat="server" Text="Uploaded Files" 
        onclick="btnuploadedarticles_Click"/>
</td>

<td valign="top">

<table class="minitable">

<tr>

<td colspan="2" align="center"><h4>Upload Files</h4></td>

</tr>

<tr>
<td>Title</td>
<td><asp:TextBox ID="txttitle" runat="server" MaxLength="50"></asp:TextBox>
 <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter Title" ControlToValidate="txtTitle" ValidationGroup="test" Display="Dynamic">*</asp:RequiredFieldValidator>
</td>
</tr>

<tr>

<td>Tags</td>
<td><asp:TextBox ID="txttags" runat="server" MaxLength="100"></asp:TextBox>
 <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Enter Tags" ControlToValidate="txtTags" ValidationGroup="test" Display="Dynamic">*</asp:RequiredFieldValidator>
 </td>
</tr>

<tr>

<td>Description</td>
<td><asp:TextBox ID="txtdescription" runat="server" TextMode="MultiLine" MaxLength="200"></asp:TextBox>
</td>

</tr>

<tr>

<td>Upload</td>
<td><asp:FileUpload ID="FileUpload1" runat="server" />
 <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Upload File" ControlToValidate="FileUpload1" ValidationGroup="test" Display="Dynamic">*</asp:RequiredFieldValidator>
 </td>
</tr>

<tr>

<td colspan="3" align="center">
    <asp:Label ID="lblerror" runat="server" Text=""></asp:Label></td>

</tr>

<tr>

<td colspan="2" align="center">
    <asp:Button ID="btnupload" runat="server" Text="Upload Files" 
        ValidationGroup="test" onclick="btnupload_Click"/></td>
</tr>

<tr>
<td colspan="2">
  <asp:validationsummary  runat="server" id="validationSummary" ValidationGroup="test" CssClass="errorlist">

  </asp:validationsummary>
</td>
</tr>
</table>
</td>
</tr>
</table>

 <asp:Label ID="lblid" runat="server" Text=""></asp:Label>
 
 <asp:Label ID="lbldepartment" runat="server" Text=""></asp:Label>
</asp:Content>