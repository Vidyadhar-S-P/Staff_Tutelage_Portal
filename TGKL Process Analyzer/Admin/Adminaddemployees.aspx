<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Adminaddemployees.aspx.cs" Inherits="TGKL_Process_Analyzer.Admin.Adminaddemployees" MasterPageFile="~/Admin/Adminpage.Master" %>

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


<table class="fulltable">
<tr>
<td colspan="3">
<h2>Employees Info</h2>
</td>
</tr>
<tr>
<td>
First Name
</td>
<td>
Middle Name
</td>
<td>
Last Name
</td>
</tr>

<tr>
<td>
<asp:TextBox ID="txtfname" runat="server" MaxLength="50"></asp:TextBox>

<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter First Name" ControlToValidate="txtfname"  Display="Dynamic" ValidationGroup="test">*</asp:RequiredFieldValidator>
</td>
<td>
<asp:TextBox ID="txtmname" runat="server" MaxLength="50"></asp:TextBox>

<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Enter Middle Name" ControlToValidate="txtmname"  Display="Dynamic" ValidationGroup="test">*</asp:RequiredFieldValidator>
</td>
<td>
<asp:TextBox ID="txtlname" runat="server" MaxLength="50"></asp:TextBox>

<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Enter Last Name" ControlToValidate="txtlname"  Display="Dynamic" ValidationGroup="test">*</asp:RequiredFieldValidator>
</td>
</tr>

<tr>
<td>
Gender
</td>
<td>
Qualification
</td>
<td>
Department
</td>
</tr>

<tr>
<td>
    <asp:DropDownList ID="drplstgender" runat="server">
    <asp:ListItem>Select</asp:ListItem>
    <asp:ListItem>Male</asp:ListItem>
    <asp:ListItem>Female</asp:ListItem>
    </asp:DropDownList>

<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Select Gender" ControlToValidate="drplstgender" Display="Dynamic" ValidationGroup="test" InitialValue="Select">*</asp:RequiredFieldValidator>
</td>
<td>
<asp:TextBox ID="txtqualification" runat="server" MaxLength="100"></asp:TextBox>

<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Enter Qualification" ControlToValidate="txtqualification" Display="Dynamic" ValidationGroup="test">*</asp:RequiredFieldValidator>
</td>
<td>
 <asp:DropDownList ID="drplstdepartment" runat="server">
 </asp:DropDownList>

<asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Select Department" ControlToValidate="drplstdepartment" Display="Dynamic" ValidationGroup="test" InitialValue="Select">*</asp:RequiredFieldValidator>
</td>
</tr>

<tr>
<td>
Role
</td>
<td>
Mobile#
</td>
<td>
Phone#
</td>
</tr>

<tr>
<td>
    <asp:DropDownList ID="drplstemprole" runat="server">
    <asp:ListItem>Select</asp:ListItem>
    <asp:ListItem>Manager</asp:ListItem>
    <asp:ListItem>Trainee</asp:ListItem>
    <asp:ListItem>Employee</asp:ListItem>
 </asp:DropDownList>

<asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Select Role" ControlToValidate="drplstemprole" Display="Dynamic" ValidationGroup="test" InitialValue="Select">*</asp:RequiredFieldValidator>
</td>
<td>
 <asp:TextBox ID="txtmobileno" runat="server" MaxLength="20"></asp:TextBox>
 
 <asp:RequiredFieldValidator ID="RequiredFieldValidator8" Display="Dynamic" runat="server" ErrorMessage="Enter Mobile number" ControlToValidate="txtmobileno" ValidationGroup="test">*</asp:RequiredFieldValidator>
 <asp:RegularExpressionValidator Display = "Dynamic" ControlToValidate = "txtmobileno" ID="RegularExpressionValidator5" ValidationExpression = "^\d{10}$" runat="server" ErrorMessage="Enter 10 digits number." ValidationGroup="test">*</asp:RegularExpressionValidator>
</td>
<td>
 <asp:TextBox ID="txtphoneno" runat="server" MaxLength="20"></asp:TextBox>
 
 <asp:RequiredFieldValidator ID="RequiredFieldValidator9" Display="Dynamic" runat="server" ErrorMessage="Enter Phone number" ControlToValidate="txtphoneno" ValidationGroup="test">*</asp:RequiredFieldValidator>
 <asp:RegularExpressionValidator Display = "Dynamic" ControlToValidate = "txtphoneno" ID="RegularExpressionValidator1" ValidationExpression = "^\d{12}$" runat="server" ErrorMessage="Enter 12 digits number." ValidationGroup="test">*</asp:RegularExpressionValidator>
</td>
</tr>

<tr>
<td>
Email Id
</td>
<td>
User Id(Office Email)
</td>
</tr>
<tr>
<td>
  <asp:TextBox ID="txtpersonalemailid" runat="server" MaxLength="100"></asp:TextBox>
                
 <asp:RequiredFieldValidator ID="RequiredFieldValidator10" Display="Dynamic" runat="server" ErrorMessage="Enter Email Id" ControlToValidate="txtpersonalemailid" ValidationGroup="test">*</asp:RequiredFieldValidator>
 <asp:RegularExpressionValidator ID="RegularExpressionValidator3" Display = "Dynamic" runat="server" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"  ControlToValidate="txtpersonalemailid" ErrorMessage="Input valid email address!" ValidationGroup="test">*</asp:RegularExpressionValidator>
</td>
<td>
  <asp:TextBox ID="txtuserid" runat="server" MaxLength="100"></asp:TextBox>
                
 <asp:RequiredFieldValidator ID="RequiredFieldValidator11" Display="Dynamic" runat="server" ErrorMessage="Enter Office Email Id" ControlToValidate="txtuserid" ValidationGroup="test">*</asp:RequiredFieldValidator>
 <asp:RegularExpressionValidator ID="RegularExpressionValidator2" Display = "Dynamic" runat="server" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"  ControlToValidate="txtuserid" ErrorMessage="Input valid email address!" ValidationGroup="test">*</asp:RegularExpressionValidator>
</td>
</tr>

<tr>
<td colspan="3">
<h2>Permanent Address</h2>
</td>
</tr>

<tr>
<td>
Address
</td>
<td>
City
</td>
<td>
State
</td>
<tr>
<td>
<asp:TextBox ID="txtperaddress" runat="server" MaxLength="150"></asp:TextBox>

 <asp:RequiredFieldValidator ID="RequiredFieldValidator12" Display="Dynamic" runat="server" ErrorMessage="Enter Address" ControlToValidate="txtperaddress" ValidationGroup="test">*</asp:RequiredFieldValidator>   
</td>
<td>
<asp:TextBox ID="txtpercity" runat="server" MaxLength="100"></asp:TextBox>

 <asp:RequiredFieldValidator ID="RequiredFieldValidator13" Display="Dynamic" runat="server" ErrorMessage="Enter City" ControlToValidate="txtpercity" ValidationGroup="test">*</asp:RequiredFieldValidator>
</td>
<td>
<asp:TextBox ID="txtperstate" runat="server" MaxLength="100"></asp:TextBox>

 <asp:RequiredFieldValidator ID="RequiredFieldValidator14" Display="Dynamic" runat="server" ErrorMessage="Enter State" ControlToValidate="txtperstate" ValidationGroup="test">*</asp:RequiredFieldValidator>
</td>
</tr>

<tr>

<td>
Pin Code
</td>
</tr>

<tr>

<td>
<asp:TextBox ID="txtperpincode" runat="server" MaxLength="10"></asp:TextBox>

 <asp:RequiredFieldValidator ID="RequiredFieldValidator15" Display="Dynamic" runat="server" ErrorMessage="Enter Pin Code" ControlToValidate="txtperpincode" ValidationGroup="test">*</asp:RequiredFieldValidator>
</td>

<td colspan="2">
    <asp:CheckBox ID="CheckBox1" runat="server" Text="Present Address is Same" 
        AutoPostBack="true" oncheckedchanged="CheckBox1_CheckedChanged" />
</td>
</tr>


<tr>
<td colspan="3">
<h2>Present Address</h2>
</td>
</tr>

<tr>
<td>
Address
</td>
<td>
City
</td>
<td>
State
</td>
</tr>

<tr>
<td>
<asp:TextBox ID="txtpreaddress" runat="server" MaxLength="150"></asp:TextBox>

 <asp:RequiredFieldValidator ID="RequiredFieldValidator16" Display="Dynamic" runat="server" ErrorMessage="Enter Address" ControlToValidate="txtpreaddress" ValidationGroup="test">*</asp:RequiredFieldValidator>   
</td>
<td>
<asp:TextBox ID="txtprecity" runat="server" MaxLength="100"></asp:TextBox>

 <asp:RequiredFieldValidator ID="RequiredFieldValidator17" Display="Dynamic" runat="server" ErrorMessage="Enter City" ControlToValidate="txtprecity" ValidationGroup="test">*</asp:RequiredFieldValidator>
</td>
<td>
<asp:TextBox ID="txtprestate" runat="server" MaxLength="100"></asp:TextBox>

 <asp:RequiredFieldValidator ID="RequiredFieldValidator18" Display="Dynamic" runat="server" ErrorMessage="Enter State" ControlToValidate="txtprestate" ValidationGroup="test">*</asp:RequiredFieldValidator>
</td>
</tr>

<tr>

<td>
Pin Code
</td>
</tr>

<tr>

<td>
<asp:TextBox ID="txtprepincode" runat="server" MaxLength="10"></asp:TextBox>

 <asp:RequiredFieldValidator ID="RequiredFieldValidator19" Display="Dynamic" runat="server" ErrorMessage="Enter Pin Code" ControlToValidate="txtprepincode" ValidationGroup="test">*</asp:RequiredFieldValidator>
</td>

                <td colspan="2" style="text-align:center;"> 
                    <asp:Button ID="btnsave" runat="server" Text="Save" ValidationGroup="test" 
                        onclick="btnsave_Click"/>

                    <asp:Button ID="btnedit" runat="server" Text="Edit" onclick="btnedit_Click"/>

                    <asp:Button ID="btnupdate" runat="server" Text="Update" ValidationGroup="test" 
                        onclick="btnupdate_Click"/>
             
                    <asp:Button ID="btncancel" runat="server" Text="Cancel" 
                        onclick="btncancel_Click"/>

                    <asp:Button ID="btndelete" runat="server" Text="Delete" 
                        OnClientClick="javascript:return confirm('Are you sure you want Delete?');" 
                        onclick="btndelete_Click"/>

                    <br />
                    <asp:Label ID="lblerror" runat="server" Text="Label" Visible="False"  ></asp:Label>
                </td>
           </tr>

              <tr>
                        <td colspan="3">
                            <asp:validationsummary  runat="server" id="validationSummary" ValidationGroup="test" CssClass="errorlist">

                            </asp:validationsummary>
                        </td>
                    </tr>
</table>
 <asp:Label ID="lblid" runat="server" Text="" Visible="False"></asp:Label>
</asp:Content>