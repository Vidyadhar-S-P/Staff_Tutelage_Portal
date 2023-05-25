<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Adminemployeeslist.aspx.cs" Inherits="TGKL_Process_Analyzer.Admin.Adminemployeeslist" MasterPageFile="~/Admin/Adminpage.Master" %>


<asp:Content ID="Content1" ContentPlaceHolderID="menucontent" runat="server">
<div id="menu">
        <ul>
            <li><a href="Adminarticleslist.aspx">Articles</a></li>
            <li><a href="Adminreport.aspx">Report</a></li>
            <li><a href="Adminemployeeslist.aspx" class="current">Employees</a></li>
            <li><a href="../User/Logout.aspx">Log Out</a></li>
        </ul>  
    </div><!-- end of templatemo_menu -->
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="bodycontent" runat="server">

<h2>Employees List</h2>


<table class="minitable">

 <tr>
       <td>
          <asp:Label ID="Label4" runat="server" Text="Department"></asp:Label>
       </td>
      <td>
        <asp:DropDownList ID="drplstdepartments" runat="server">
        </asp:DropDownList>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Select Department" ControlToValidate="drplstdepartments" ValidationGroup="test" InitialValue="Select">*</asp:RequiredFieldValidator>

       </td>
</tr>

 <tr>
       
        <td>
       <asp:Label ID="Label1" runat="server" Text="Employee First Name"></asp:Label>
       </td>
       <td>
           <asp:TextBox ID="txtemployeename" runat="server"></asp:TextBox>
       </td>
</tr>

<tr>
    <td colspan="2" style="text-align:center;"> 
    <asp:Button ID="btnsearch" runat="server" Text="Search" ValidationGroup="test" onclick="btnsearch_Click"/>

    <asp:Button ID="btnaddnew" runat="server" Text="Add New" onclick="btnaddnew_Click"/>
        <br />
<asp:Label ID="lblerror" runat="server" Text="Label" Visible="False"  ></asp:Label>
    </td>
</tr>
</table>

<asp:GridView ID="grdemployee" runat="server" AllowSorting="True" 
                     AutoGenerateColumns="False" Caption="Employees List"  
        CssClass="gridview" AllowPaging="True" PageSize="20" 
        onpageindexchanging="grdemployee_PageIndexChanging">
             <Columns>
                 <asp:HyperLinkField DataNavigateUrlFields="empid" DataNavigateUrlFormatString="Adminaddemployees.aspx?empid={0}" DataTextField="empname" HeaderText="Employee Name">
                </asp:HyperLinkField>
                 <asp:BoundField DataField="department" HeaderText="Department">
                </asp:BoundField>
                 <asp:BoundField DataField="emprole" HeaderText="Role">
                </asp:BoundField>
                <asp:BoundField DataField="mobileno" HeaderText="Mobile #">
                </asp:BoundField>
            </Columns>
            <PagerStyle CssClass="footerstyle" HorizontalAlign="Center" />
            <HeaderStyle CssClass="headerstyle" />
        </asp:GridView>

</asp:Content>