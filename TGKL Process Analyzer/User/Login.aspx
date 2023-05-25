<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="TGKL_Process_Analyzer.User.Login" MasterPageFile="~/User/User.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="menucontent" runat="server">
<div id="menu">
        <ul>
            <li><a href="Index.aspx">Home</a></li>
            <li><a href="Login.aspx" class="current">Login</a></li>
            <li><a href="Aboutus.aspx">About Us</a></li>
            <li><a href="Contactus.aspx">Contact Us</a></li>
        </ul>  
    </div><!-- end of templatemo_menu -->
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="bodycontent" runat="server">

<h4>Login Page</h4>
					
<table class="minitable">

                    <tr>
                        <td style="width:30%">
                            <asp:Label ID="uname" runat="server" Text="User ID" CssClass="label"></asp:Label>
                        </td>
                         <td>
                           <asp:TextBox ID="txtuserid" runat="server" CssClass="text_style"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter User ID" ControlToValidate="txtuserid"  Display="Dynamic" ValidationGroup="test">*</asp:RequiredFieldValidator>
                        </td>
                     </tr>
                        
                    <tr>
                        <td>

                            <asp:Label ID="pwd" runat="server" Text="Password" CssClass="label"></asp:Label>
                          </td>
                        <td>
                            <asp:TextBox ID="txtpassword" runat="server" TextMode="Password" 
                                CssClass="text_style"></asp:TextBox>
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Enter Password" ControlToValidate="txtpassword"  Display="Dynamic" ValidationGroup="test">*</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                   
                    <tr>
                      <td colspan="2" style="text-align:center;">
                          <asp:Button ID="btnlogin" runat="server" Text="Login" ValidationGroup="test" 
                              onclick="btnlogin_Click"/>
                      </td>
                    </tr>
                    
                       <tr>
                        <td colspan="2"">
                           <asp:Label ID="lblerror" runat="server" Text="---" Visible="false" ></asp:Label>
                            <asp:validationsummary  runat="server" id="validationSummary" ValidationGroup="test" CssClass="errorlist">

                            </asp:validationsummary>
                        </td>
                    </tr>
            </table>

</asp:Content>