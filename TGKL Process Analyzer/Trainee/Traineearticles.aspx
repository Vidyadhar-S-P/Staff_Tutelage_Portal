<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Traineearticles.aspx.cs" Inherits="TGKL_Process_Analyzer.Trainee.Traineearticles" MasterPageFile="~/Admin/Adminpage.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="menucontent" runat="server">
<div id="menu">
        <ul>
            <li><a href="Traineeinbox.aspx">Inbox</a></li>
            <li><a href="Traineearticles.aspx" class="current">Articles</a></li>
            <li><a href="Traineetakeexam.aspx">Take Exam</a></li>
            <li><a href="../User/Logout.aspx">Log Out</a></li>
        </ul>  
    </div><!-- end of templatemo_menu -->
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="bodycontent" runat="server">


<table class="fulltable">
    
    <tr>
    <td style="text-align:center;">
    <img src="../images/search.png" width="150" alt="Search"/>
    </td>
    </tr>
  
    <tr>    
    <td style="text-align:center;"><asp:TextBox ID="txtsearch" runat="server" Width="700"></asp:TextBox></td>
    </tr>
    
    <tr>    
    <td style="text-align:center;"><asp:Button ID="btnsearch" runat="server" Text="Search" onclick="btnsearch_Click"/></td>
    </tr>
    
    <tr>    
    <td style="text-align:center;"><asp:Label ID="lblerror" runat="server" Text=""></asp:Label></td>
    </tr>

 </table>
       
       <asp:GridView ID="grdfiles" runat="server"
                     AutoGenerateColumns="False" Caption="Articles List" CssClass="gridview">  
             <Columns>
                   <asp:BoundField DataField="title" HeaderText="Title" >
                   </asp:BoundField>
                   <asp:BoundField DataField="filename" HeaderText="File Name" >
                   </asp:BoundField>
                   <asp:BoundField DataField="dateofupload" HeaderText="Upload Date" >
                   </asp:BoundField>
                   <asp:BoundField DataField="downloads" HeaderText="# Downloads" >
                   </asp:BoundField>
                   <asp:HyperLinkField DataNavigateUrlFields="filename" DataNavigateUrlFormatString="Traineedownloadarticles.aspx?filename={0}" Text="Download" HeaderText="Download">
                   </asp:HyperLinkField>
            </Columns>
            <PagerStyle CssClass="footerstyle" HorizontalAlign="Center" />
            <HeaderStyle CssClass="headerstyle" />
        </asp:GridView>


    <asp:Label ID="lblid" runat="server" Text="" Visible="false"></asp:Label>
    <asp:Label ID="lbldepartment" runat="server" Text="" Visible="false"></asp:Label>
</asp:Content>