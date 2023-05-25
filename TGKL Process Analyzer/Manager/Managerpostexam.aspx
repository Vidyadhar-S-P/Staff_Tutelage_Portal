<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Managerpostexam.aspx.cs" Inherits="TGKL_Process_Analyzer.Manager.Managerpostexam" MasterPageFile="~/Admin/Adminpage.Master" %>

<asp:Content ContentPlaceHolderID="menucontent" runat="server">

<div id="menu">
        <ul>
            <li><a href="Managerdoubtslist.aspx">Doubts List</a></li>
            <li><a href="Manageruploadarticles.aspx">Articles</a></li>
            <li><a href="Managerpostexam.aspx" class="current">Post Exam</a></li>
            <li><a href="../User/Logout.aspx">Log Out</a></li>
        </ul>  
    </div><!-- end of templatemo_menu -->
</asp:Content>

<asp:Content ContentPlaceHolderID="bodycontent" runat="server">

<h2>Post Exam</h2>

<table id="admintable">
<tr>
<td style="width:50%; vertical-align:top;">

 <table>

    <tr>
    <td>Question No</td>
    <td><asp:Label ID="lblQuestionNo" runat="server" Text=""></asp:Label></td>
    <td width="50"></td>
    <td>Author</td>
    <td><asp:Label ID="lblAuthor" runat="server" Text="" Width="300"></asp:Label></td>
    </tr>
        
    </table>

    <table>

    <tr>
    <td>Question: </td>
    <td colspan="2"><asp:TextBox ID="txtQuestion" runat="server" Width="500" TextMode=MultiLine Height="50"></asp:TextBox></td>    
    </tr>

    <tr>
    <td colspan="2" align="center">Options</td>
    <td align="center">Select</td>
    </tr>

    <tr>
    <td>A: </td>
    <td><asp:TextBox ID="txtOption1" runat="server" Width="450"></asp:TextBox></td>
    <td align="center"><asp:RadioButton ID="rdOption1" GroupName="Answer" runat="server" Text="" Checked /></td>
    </tr>

    <tr>
    <td>B: </td>
    <td><asp:TextBox ID="txtOption2" runat="server" Width="450"></asp:TextBox></td>
    <td align="center"><asp:RadioButton ID="rdOption2" GroupName="Answer" runat="server" Text=""/></td>
    </tr>

    <tr>
    <td>C: </td>
    <td><asp:TextBox ID="txtOption3" runat="server" Width="450"></asp:TextBox></td>
    <td align="center"><asp:RadioButton ID="rdOption3" GroupName="Answer" runat="server" Text=""/></td>
    </tr>

    <tr>
    <td>D: </td>
    <td><asp:TextBox ID="txtOption4" runat="server" Width="450"></asp:TextBox></td>
    <td align="center"><asp:RadioButton ID="rdOption4" GroupName="Answer" runat="server" Text=""/></td>    
    </tr>
    
    <tr>
    <td colspan="3" align="center"><asp:Button ID="btnSaveQuestion" runat="server" 
            Text="Save Question" CssClass="button_style" onclick="btnSaveQuestion_Click" />
        <asp:Button ID="btnSaveExam" runat="server" Text="Save Exam" CssClass="button_style" 
            onclick="btnSaveExam_Click" /></td>    
    </tr>
    
    <tr>
    <td colspan="3" align="center"><asp:Label ID="lblInformation" runat="server" Text=""></asp:Label></td>
    </tr>    

    </table>

</td>

<td valign="top" style="width:70%">
    
    <div id="right" style="width: 206px; height: 450px;">
    
    <table align="center">
    <tr><td><asp:Button ID="btnAddQuestion" runat="server" Text="New Question" 
            CssClass="button_style" onclick="btnAddQuestion_Click" /></td></tr>
    <tr style="visibility: hidden"><td><asp:Button ID="btnPreviousQuestion" runat="server" Text="<<" 
            CssClass="button_style" onclick="btnPreviousQuestion_Click" /></td></tr>
    <tr style="visibility: hidden"><td><asp:Button ID="bntNextQuestion" runat="server" Text=">>" CssClass="button_style" /></td></tr>   
    <tr><td><img src="../images/exam.png" /></td></tr>

    </table>   
    
    </div>    

</td>
</tr>

<tr>
<td colspan="2">

 <div id="divSaveExam" runat="server" class="leftdiv" style="width: 550px; height: 300px; padding-left: 30px; padding-top: 20px; display: none;">
    
    <table align="center">
    
    <tr>
    <td colspan="2" align="center"><font size="5"><b>Examination Details</b></font></td>
    </tr>

    <Tr>
    <td>Exam Title</td>
    <td><asp:TextBox ID="txtExamTitle" runat="server" CssClass="textbox_style" Width="400"></asp:TextBox></td>
    </Tr>

    <tr>
    <td>Total Marks</td>
    <td><asp:TextBox ID="txtTotalMarks" runat="server" CssClass="textbox_style"></asp:TextBox></td>
    </tr>

    <tr>
    <td>Pass Percentage</td>
    <td><asp:TextBox ID="txtPassPercentage" runat="server" CssClass="textbox_style"></asp:TextBox></td>
    </tr>

    <tr>
    <td colspan="2" align="center"><asp:Button ID="btnSave" runat="server" Text="Save" 
            CssClass="button_style" onclick="btnSave_Click" />
    <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="button_style" 
            onclick="btnCancel_Click" /></td>
    </tr>
    
    </table> 

    
    </div>
</td>
</tr>
</table>

</asp:Content>