<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Traineetakeexam.aspx.cs" Inherits="TGKL_Process_Analyzer.Trainee.Traineetakeexam" MasterPageFile="~/Admin/Adminpage.Master" %>


<asp:Content ID="Content3" ContentPlaceHolderID="head" Runat="Server">

<script type = "text/javascript">

    function SetSource(SourceID) {

        var hidSourceID =

        document.getElementById("<%=hidSourceID.ClientID%>");

        hidSourceID.value = SourceID;
    }

    function StoreValue(value) {
        var alertMessage;
        alertMessage = document.getElementById("<%=lblQuestionNo.ClientID %>").innerHTML + "-" + value; ;
        document.getElementById('<%=hidMyOption.ClientID %>').value = alertMessage;
        //document.getElementById('<%=lblAuthor.ClientID %>').value = alertMessage;
        //         alert(alertMessage);
    }

    //     function alertValues() {
    //         alert(document.getElementById('hidMyOption').value);
    //     }

</script>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="menucontent" runat="server">
<div id="menu">
        <ul>
            <li><a href="Traineeinbox.aspx">Inbox</a></li>
            <li><a href="Traineearticles.aspx">Articles</a></li>
            <li><a href="Traineetakeexam.aspx" class="current">Take Exam</a></li>
            <li><a href="../User/Logout.aspx">Log Out</a></li>
        </ul>  
    </div><!-- end of templatemo_menu -->
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="bodycontent" runat="server">

 <center>
    <asp:Label ID="lblConfirm" runat="server" Text=""></asp:Label>
        <asp:Button ID="btnReTake" runat="server" Text="Re-Take" CssClass="button_style" 
            onclick="btnReTake_Click" />
        <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="button_style" 
            onclick="btnCancel_Click"/>
    </center>




<table id="admintable">
<tr>
<td style="width:40%; vertical-align:top;">

    <table>

    <tr>
    <td>Question No</td>
    <td><asp:Label ID="lblQuestionNo" runat="server" Text="" Width="50"></asp:Label></td>
    <td width="50"></td>
    <td style="visibility:hidden">Author</td>
    <td style="visibility:hidden"><asp:Label ID="lblAuthor" runat="server" Text="" Width="300"></asp:Label></td>
    </tr>
        
    </table>

    <table>
    <tr>
    <td>Question: </td>
    <td colspan="2"><asp:TextBox ID="txtQuestion" runat="server" Width="500" TextMode=MultiLine Height="50" BackColor=LightGray Enabled=false ReadOnly></asp:TextBox></td>    
    </tr>

    <tr>
    <td colspan="2" align="center">Options</td>
    <td align="center">Select</td>
    </tr>

    <tr>
    <td>A: </td>
    <td><asp:TextBox ID="txtOption1" runat="server" Width="450"  BackColor=LightGray Enabled=false ReadOnly></asp:TextBox></td>
    <td align="center"><asp:RadioButton ID="rdOption1" GroupName="Answer" runat="server" Text=""  onclick="StoreValue(1)"/></td></tr>

    <tr>
    <td>B: </td>
    <td><asp:TextBox ID="txtOption2" runat="server" Width="450" BackColor=LightGray Enabled=false ReadOnly></asp:TextBox></td>
    <td align="center"><asp:RadioButton ID="rdOption2" GroupName="Answer" runat="server" Text=""  onclick="StoreValue(2)"/></td></tr>
    </tr>

    <tr>
    <td>C: </td>
    <td><asp:TextBox ID="txtOption3" runat="server" Width="450" BackColor=LightGray Enabled=false ReadOnly></asp:TextBox></td>
    <td align="center"><asp:RadioButton ID="rdOption3" GroupName="Answer" runat="server" Text=""  onclick="StoreValue(3)"/></td></tr>


    <tr>
    <td>D: </td>
    <td><asp:TextBox ID="txtOption4" runat="server" Width="450" BackColor=LightGray Enabled=false ReadOnly></asp:TextBox></td>
    <td align="center"><asp:RadioButton ID="rdOption4" GroupName="Answer" runat="server" Text="" onClick="StoreValue(4)"/></td></tr>

    <tr>
    <td colspan="3" align="center">
        <asp:Button ID="btnPreviousQuestion" runat="server" 
            Text="<<" CssClass="button_style" onclick="btnPreviousQuestion_Click" OnClientClick = "SetSource(this.id)" Visible="false"/>
        <asp:Button ID="btnNextQuestion" runat="server" Text=">>" CssClass="button_style" 
            onclick="btnNextQuestion_Click" />
            <asp:Button ID="btnEndExam" runat="server" Text="End Exam" 
            CssClass="button_style" OnClientClick = "SetSource(this.id)" 
            onclick="btnEndExam_Click" /></td>    
    </tr>
    
    <tr>
    <td colspan="3" align="center"><asp:Label ID="lblInformation" runat="server" Text=""></asp:Label></td>
    </tr>    
    
    <tr>
    <td colspan="3" align="center">

    <input type="hidden" id="hidMyOption" name="myOption" runat="server" />
    
    <asp:Label ID="lblAnswerChosen" runat="server" Text="" Visible="false"></asp:Label>
    </td>
  </tr>
</table>

<td vertical-align:top;">
<table>  

 <td valign="top">

        <asp:Table ID="tblExamChoice" runat="server" CssClass="gridview1">
        </asp:Table>
   </td>
   </tr>

   </table>

    <asp:HiddenField ID="hidSourceID" runat="server" />
</td>
</tr>
</table>

</asp:Content>