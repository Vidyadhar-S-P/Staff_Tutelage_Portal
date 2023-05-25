using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data.SqlClient;
using System.Data;
using System.Web.Configuration;

namespace TGKL_Process_Analyzer.Manager
{
    public partial class Managerpostexam : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter dsa;
        DataSet ds;

        int max = 0;

        static string PBControl = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection con = Database.getConnection();

            int count = 0;
            int exists = 0;

            cmd = new SqlCommand("Select count(*) from tblexam where manageremailid='" + Session["userid"].ToString() + "'", con);
            exists = Convert.ToInt32(cmd.ExecuteScalar());
            con.Close();

            con = Database.getConnection();
            cmd = new SqlCommand("Select max(examid) from tblexam", con);
            string maximum = cmd.ExecuteScalar().ToString();

            if (maximum == "")
                max = 0;
            else
                max = Convert.ToInt32(cmd.ExecuteScalar());

            con.Close();

            if (exists == 0)
            {
                con = Database.getConnection();
                cmd = new SqlCommand("Insert into tblexam(examid,manageremailid) values (" + (max + 1) + ",'" + Session["userid"].ToString() + "')", con);
                cmd.ExecuteNonQuery();
                con.Close();
            }

            con = Database.getConnection();
            cmd = new SqlCommand("Select count(*) from tblquestions where examid=(Select examid from tblexam Where manageremailid='" + Session["userid"].ToString() + "')", con);
            count = Convert.ToInt32(cmd.ExecuteScalar());
            con.Close();

            if (count == 0)
                lblQuestionNo.Text = "1";
            else
                lblQuestionNo.Text = (count + 1).ToString();

            lblQuestionNo.ForeColor = System.Drawing.Color.Maroon;

            lblAuthor.Text = Session["userid"].ToString();
            lblAuthor.ForeColor = System.Drawing.Color.Maroon;    
        }

        protected void btnSaveQuestion_Click(object sender, EventArgs e)
        {
            int selected = 0;

            if (rdOption1.Checked)
                selected = 1;
            else if (rdOption2.Checked)
                selected = 2;
            else if (rdOption3.Checked)
                selected = 3;
            else
                selected = 4;

            if (PBControl == "btnPreviousQuestion" || PBControl == "btnNextQuestion")
            {
                con = Database.getConnection();
                cmd = new SqlCommand("Update tblquestions Set question='" + txtQuestion.Text + "',option1='" + txtOption1.Text + "',option2='" + txtOption2.Text + "',option3='" + txtOption3.Text + "',option4='" + txtOption4.Text + "',answer=" + selected + " Where qno=" + Convert.ToInt32(lblQuestionNo.Text) + " and examid= " + max + "", con);
                cmd.ExecuteNonQuery();
                con.Close();
            }
            else
            {
                con = Database.getConnection();
                cmd = new SqlCommand("Insert into tblquestions(examid,qno,question,option1,option2,option3,option4,answer) values (" + max + "," + Convert.ToInt32(lblQuestionNo.Text) + ",'" + txtQuestion.Text + "','" + txtOption1.Text + "','" + txtOption2.Text + "','" + txtOption3.Text + "','" + txtOption4.Text + "'," + selected + ")", con);
                cmd.ExecuteNonQuery();
                con.Close();
            }

            lblInformation.Text = "Question Saved Successfully";
        }

        protected void btnAddQuestion_Click(object sender, EventArgs e)
        {
            PBControl = "btnAddQuestion";
            Response.Redirect(Request.RawUrl);
            lblInformation.Text = "";
        }

        protected void btnPreviousQuestion_Click(object sender, EventArgs e)
        {
            PBControl = "btnPreviousQuestion";
        }

        protected void btnSaveExam_Click(object sender, EventArgs e)
        {
            int exists = 0;
            divSaveExam.Style["Display"] = "Block";

            con = Database.getConnection();
            SqlDataAdapter dsa = new SqlDataAdapter("Select * from tblexam where manageremailid='" + Session["userid"].ToString() + "'", con);
            ds = new DataSet();
            dsa.Fill(ds);

            if (ds.Tables[0].Rows.Count >= 1)
                exists = 1;

            if (exists == 1)
            {
                txtExamTitle.Text = ds.Tables[0].Rows[0]["examtitle"].ToString();
                txtTotalMarks.Text = ds.Tables[0].Rows[0]["totalmarks"].ToString();
                txtPassPercentage.Text = ds.Tables[0].Rows[0]["passpercentage"].ToString();
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            divSaveExam.Style["Display"] = "None";
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            con = Database.getConnection();
            cmd = new SqlCommand("Select examid from tblexam where manageremailid='" + Session["userid"].ToString() + "'", con);
            int examId = Convert.ToInt32(cmd.ExecuteScalar());
            con.Close();


            con = Database.getConnection();
            cmd = new SqlCommand("Update tblexam Set examtitle='" + txtExamTitle.Text + "', totalmarks=" + Convert.ToInt32(txtTotalMarks.Text) + ", passpercentage=" + Convert.ToDouble(txtPassPercentage.Text) + " Where examid = " + examId + "", con);
            cmd.ExecuteNonQuery();
            con.Close();

            divSaveExam.Style["Display"] = "None";
        }
    }
}