<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Managerdoubtslist.aspx.cs" Inherits="TGKL_Process_Analyzer.Manager.Managerdoubtslist" MasterPageFile="~/Admin/Adminpage.Master" %>

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

<h2>Trainee Doubts List</h2>

    <asp:Label ID="lblerror" runat="server" Text=""></asp:Label>

<asp:GridView ID="grddoubts" runat="server" AllowSorting="True" 
                     AutoGenerateColumns="False" Caption="Doubts List" 
        CssClass="gridview" AllowPaging="True" PageSize="5">
             <Columns>
                <asp:BoundField DataField="topic" HeaderText="Topic">
                </asp:BoundField>
                 <asp:BoundField DataField="doubt" HeaderText="Doubt">
                </asp:BoundField>
                 <asp:HyperLinkField DataNavigateUrlFields="id" 
                    DataNavigateUrlFormatString="Managerdoubtclearence.aspx?id={0}" Text="Reply" 
                    HeaderText="Reply" ItemStyle-CssClass="link">
                </asp:HyperLinkField>
            </Columns>
          <PagerStyle CssClass="footerstyle" HorizontalAlign="Center" />
            <HeaderStyle CssClass="headerstyle" />
        </asp:GridView>


</asp:Content>