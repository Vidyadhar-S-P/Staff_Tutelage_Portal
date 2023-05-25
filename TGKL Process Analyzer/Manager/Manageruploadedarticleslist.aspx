<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Manageruploadedarticleslist.aspx.cs" Inherits="TGKL_Process_Analyzer.Manager.Manageruploadedarticleslist" MasterPageFile="~/Admin/Adminpage.Master" %>


<asp:Content ContentPlaceHolderID="menucontent" runat="server">
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

<h2>Uploaded Articles</h2>

    <asp:Label ID="lblerror" runat="server" Text=""></asp:Label>

<asp:GridView ID="grdfiles" runat="server" AllowSorting="True" 
                     AutoGenerateColumns="False" Caption="Articles List" 
        AllowPaging="True" PageSize="20" CssClass="gridview" 
        onpageindexchanging="grdfiles_PageIndexChanging">
                           
             <Columns>
                   <asp:BoundField DataField="Title" HeaderText="Title" >
                   </asp:BoundField>
                   <asp:BoundField DataField="Tags" HeaderText="Tags" >
                   </asp:BoundField>
                   <asp:BoundField DataField="FileName" HeaderText="File Name" >
                   </asp:BoundField>
                   <asp:BoundField DataField="DateOfUpload" HeaderText="Upload Date" >
                   </asp:BoundField>
                   <asp:BoundField DataField="Downloads" HeaderText="# Downloads" >
                   </asp:BoundField>
            </Columns>
            <PagerStyle CssClass="footerstyle" HorizontalAlign="Center" />
            <HeaderStyle CssClass="headerstyle" />
        </asp:GridView>
<hr />
     <asp:Button ID="btnback" runat="server" Text="Back" onclick="btnback_Click"/>

</asp:Content>