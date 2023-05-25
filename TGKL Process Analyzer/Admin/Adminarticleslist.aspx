<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Adminarticleslist.aspx.cs" Inherits="TGKL_Process_Analyzer.Admin.Adminarticleslist" MasterPageFile="~/Admin/Adminpage.Master" %>


<asp:Content ID="Content1" ContentPlaceHolderID="menucontent" runat="server">
<div id="menu">
        <ul>
            <li><a href="Adminarticleslist.aspx" class="current">Articles</a></li>
            <li><a href="Adminreport.aspx">Report</a></li>
            <li><a href="Adminemployeeslist.aspx">Employees</a></li>
            <li><a href="../User/Logout.aspx">Log Out</a></li>
        </ul>  
    </div><!-- end of templatemo_menu -->
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="bodycontent" runat="server">

<h2>Uploaded Articles</h2>

<table id="admintable">
<tr>
<td style="width:50%; vertical-align:top;">

<asp:GridView ID="grdfiles" runat="server" AllowSorting="True" 
                     AutoGenerateColumns="False" Caption="Articles List" 
               CellPadding="3" CellSpacing="2" AllowPaging="True" PageSize="10" 
        Width="100%" CssClass="gridview1" 
        onpageindexchanging="grdfiles_PageIndexChanging">
                           
             <Columns>
                  <asp:HyperLinkField DataNavigateUrlFields="fileid" 
                    DataNavigateUrlFormatString="Adminarticleslist.aspx?fileid={0}" DataTextField="title"  
                    HeaderText="Title">
                </asp:HyperLinkField>
                   <asp:BoundField DataField="department" HeaderText="Department" >
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:BoundField>
            </Columns>
            <PagerStyle CssClass="footerstyle" HorizontalAlign="Center" />
            <HeaderStyle CssClass="headerstyle" />
        </asp:GridView>
</td>
<td valign="top" style="width:70%">

<table id="displaytable">

<tr>
<td style="width:30%;">
    <asp:Label ID="Label3" runat="server" Text="Department" ></asp:Label>
</td>
<td>
    <asp:Label ID="lbldepartment" runat="server" Text="" ></asp:Label>
</td>
</tr>

<tr>
<td>
    <asp:Label ID="Label1" runat="server" Text="Title" ></asp:Label>
</td>
<td>
      <asp:Label ID="lbltitle" runat="server" Text=""></asp:Label>
</td>
</tr>

<tr>
<td>
    <asp:Label ID="Label6" runat="server" Text="Description" ></asp:Label>
</td>
<td>
      <asp:Label ID="lbldescription" runat="server" Text=""></asp:Label>
</td>
</tr>

<tr>
<td>
    <asp:Label ID="Label2" runat="server" Text="File Name" ></asp:Label>
</td>
<td>
      <asp:Label ID="lblfilename" runat="server" Text=""></asp:Label>
</td>
</tr>

<tr>
<td>
    <asp:Label ID="Label7" runat="server" Text="Uploader" ></asp:Label>
</td>
<td>
      <asp:Label ID="lbluploader" runat="server" Text=""></asp:Label>
</td>
</tr>

<tr>
<td>
    <asp:Label ID="Label4" runat="server" Text="Date Of Upload" ></asp:Label>
</td>
<td>
      <asp:Label ID="lbldateofupload" runat="server" Text=""></asp:Label>
</td>
</tr>

<tr>
<td>
    <asp:Label ID="Label5" runat="server" Text="Number of Downloads" ></asp:Label>
</td>
<td>
      <asp:Label ID="lblnoofdownloads" runat="server" Text=""></asp:Label>
</td>
</tr>


                    
<tr>
<td colspan="2" align="center">
  <asp:Button ID="btndownload" runat="server" Text="Download" 
        CssClass="button_style" onclick="btndownload_Click"/>    
 
 <asp:Button ID="btndelete" runat="server" Text="Delete" CssClass="button_style" 
       onclick="btndelete_Click" OnClientClick="javascript:return confirm('Are you sure you want Delete?');"/> 
</td>

</tr>

 <tr>
    <td colspan="2" align="center">
       <asp:Label ID="lblerror" runat="server" Text="" Visible="False" ></asp:Label>
    </td>
 </tr>

</table>
</td>
</tr>
</table>

 <asp:Label ID="lblid" runat="server" Text="" Visible="false"></asp:Label>
</asp:Content>