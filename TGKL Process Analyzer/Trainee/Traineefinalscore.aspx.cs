using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;

namespace TGKL_Process_Analyzer.Trainee
{
    public partial class Traineefinalscore : System.Web.UI.Page
    {
        SqlConnection con;
        SqlDataAdapter dsa;
        DataSet ds;
        SqlCommand cmd;

        int examid = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            con = Database.getConnection();

            lblAuthor.Text = Request.Params["Author"].ToString();
            lblAuthor.Font.Size = FontUnit.XLarge;
            lblScore.Text = Request.Params["Score"].ToString() + "/" + Request.Params["TotalMarks"].ToString();
            lblScore.Font.Size = FontUnit.XLarge;
            lblExamination.Text = Request.Params["Exam"].ToString();
            lblExamination.Font.Size = FontUnit.XLarge;

            examid = Convert.ToInt32(Request.Params["examid"].ToString());

            double percentage = (Convert.ToDouble(Request.Params["score"].ToString()) / Convert.ToDouble(Request.Params["TotalMarks"].ToString())) * 100;

            lblOtherInformation.Text = "Percentage: " + percentage.ToString();

            lblOtherInformation.Font.Size = FontUnit.XXLarge;

            if (percentage >= Convert.ToDouble(Request.Params["PassPercentage"].ToString()))
                lblFinalResult.Text = ", Your Result: Pass";
            else
                lblFinalResult.Text = "Fail";

            lblFinalResult.Font.Size = FontUnit.XXLarge;

            //Storing or Updating Marks for an Exam

            dsa = new SqlDataAdapter("Select * from tblmarks where examid=" + examid + " and traineeemailid='" + Session["userid"].ToString() + "'", con);
            ds = new DataSet();
            dsa.Fill(ds);

            if (ds.Tables[0].Rows.Count > 0)
            {
                con = Database.getConnection();
                cmd = new SqlCommand("Update tblmarks Set marksscored=" + Convert.ToInt32(Request.Params["Score"].ToString()) + ", finalresult='" + lblFinalResult.Text + "',  percentage=" + percentage + " where examid=" + examid + " and traineeemailid ='" + Session["userid"].ToString() + "'", con);
                cmd.ExecuteNonQuery();
                con.Close();
            }
            else
            {
                con = Database.getConnection();
                cmd = new SqlCommand("Insert into tblmarks(examId,traineeemailid,marksscored,finalresult,percentage) Values (" + examid + ",'" + Session["userid"].ToString() + "'," + Convert.ToInt32(Request.Params["Score"].ToString()) + ",'" + lblFinalResult.Text + "'," + percentage + ")", con);
                cmd.ExecuteNonQuery();
                con.Close();
            }
        }
    }
}