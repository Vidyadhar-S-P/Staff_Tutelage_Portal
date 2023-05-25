using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data.SqlClient;
using System.Data;
using System.Data.Sql;

namespace TGKL_Process_Analyzer.Trainee
{
    public partial class Traineetakeexam : System.Web.UI.Page
    {
        SqlConnection con;
        SqlDataAdapter dsa;
        DataSet ds;
        string[] result;

        string currentExam = null;
        string currentAuthor = null;
        int currentTotal = 0;
        int currentPercent = 0;
        int examid = 0;
        int takeexam = 0;

        static Dictionary<int, int> dictAnswers;
        static Dictionary<int, int> dictMyAnswers;

        static int currentQuestion;

        protected void Page_Load(object sender, EventArgs e)
        {
            btnReTake.Visible = false;
            btnCancel.Visible = false;

            con = Database.getConnection();

            if (Request.Params["id"] == null)
            {
                btnNextQuestion.Visible = false;
                //btnPreviousQuestion.Visible = false;
                btnEndExam.Visible = false;

                dsa = new SqlDataAdapter("Select * from tblexam", con);
                ds = new DataSet();

                dsa.Fill(ds);

                TableRow tr;
                TableCell tc1;
                TableCell tc2;
                HyperLink hy;
                int index = 0;

                for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                {
                    if (ds.Tables[0].Rows[i]["examtitle"].ToString() != "")
                    {
                        index = index + 1;
                        tr = new TableRow();
                        tc1 = new TableCell();
                        tc2 = new TableCell();
                        hy = new HyperLink();

                        if (ds.Tables[0].Rows[i]["examtitle"].ToString().Length > 8)
                            hy.Text = ds.Tables[0].Rows[i]["examtitle"].ToString().Substring(0, 7) + "..";
                        else
                            hy.Text = ds.Tables[0].Rows[i]["examtitle"].ToString();
                        hy.ToolTip = ds.Tables[0].Rows[i]["examtitle"].ToString();
                        hy.NavigateUrl = "Traineetakeexam.aspx?id=" + ds.Tables[0].Rows[i]["examid"].ToString();

                        tc1.Controls.Add(hy);

                        tc2.Text = index.ToString() + ". ";

                        tr.Cells.Add(tc2);
                        tr.Cells.Add(tc1);

                        tblExamChoice.Rows.Add(tr);
                    }
                }

            }
            else
            {

                examid = Convert.ToInt32(Request.Params["id"].ToString());

                btnNextQuestion.Visible = true;
                //btnPreviousQuestion.Visible = true;
                btnEndExam.Visible = true;

                dsa = new SqlDataAdapter("Select * from tblexam where examid=" + Request.Params["id"], con);
                ds = new DataSet();

                dsa.Fill(ds);

                tblExamChoice.HorizontalAlign = HorizontalAlign.Center;

                TableRow tr1;
                TableCell tc1;
                TableCell tc2;

                tr1 = new TableRow();
                tc1 = new TableCell();
                tc1.Text = "Exam Title";
                tc1.ForeColor = System.Drawing.Color.Maroon;
                tr1.Cells.Add(tc1);
                tblExamChoice.Rows.Add(tr1);

                tr1 = new TableRow();
                tc1 = new TableCell();
                tc1.Text = ds.Tables[0].Rows[0]["examtitle"].ToString();
                currentExam = ds.Tables[0].Rows[0]["examtitle"].ToString();
                tr1.Cells.Add(tc1);
                tblExamChoice.Rows.Add(tr1);

                tr1 = new TableRow();
                tc1 = new TableCell();
                tc1.Text = "Author";
                tc1.ForeColor = System.Drawing.Color.White;
                tr1.Cells.Add(tc1);
                tblExamChoice.Rows.Add(tr1);

                tr1 = new TableRow();
                tc1 = new TableCell();
                tc1.Text = ds.Tables[0].Rows[0]["manageremailid"].ToString();
                currentAuthor = ds.Tables[0].Rows[0]["manageremailid"].ToString();
                tr1.Cells.Add(tc1);
                tblExamChoice.Rows.Add(tr1);

                tr1 = new TableRow();
                tc1 = new TableCell();
                tc1.Text = "Total Marks: " + ds.Tables[0].Rows[0]["totalmarks"].ToString();
                currentTotal = Convert.ToInt32(ds.Tables[0].Rows[0]["totalmarks"].ToString());
                tc1.ForeColor = System.Drawing.Color.White;
                tr1.Cells.Add(tc1);
                tblExamChoice.Rows.Add(tr1);

                tr1 = new TableRow();
                tc1 = new TableCell();
                tc1.Text = "Pass Percentage: " + ds.Tables[0].Rows[0]["passpercentage"].ToString();
                currentPercent = Convert.ToInt32(ds.Tables[0].Rows[0]["passpercentage"].ToString());
                tc1.ForeColor = System.Drawing.Color.White;
                tr1.Cells.Add(tc1);
                tblExamChoice.Rows.Add(tr1);

                if (Request.Params["ReTake"] == null)
                {
                    dsa = new SqlDataAdapter("Select * from tblmarks where examid=" + examid + " and traineeemailid='" + Session["userid"].ToString() + "'", con);
                    ds = new DataSet();
                    dsa.Fill(ds);

                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        lblConfirm.Text = "<h3>You have already Attended this Exam and Scored " + ds.Tables[0].Rows[0]["marksscored"].ToString() + "<br> Are You Sure to Retake it?</h3>";
                        btnCancel.Visible = true;
                        btnReTake.Visible = true;
                    }
                    else
                    {
                        takeexam = 1;
                        lblConfirm.Text = "<h1>All the Best for Your Exam</h1>";
                    }
                }
                else
                    LoadQuestions();

                if (takeexam == 1)
                    LoadQuestions();
            }
        }

        protected void LoadQuestions()
        {
            lblConfirm.Text = "<h1>All the Best for Your Exam</h1>";
            con = Database.getConnection();
            dsa = new SqlDataAdapter("Select * from tblquestions where examid=" + Request.Params["id"].ToString() + "", con);
            ds = new DataSet();
            dsa.Fill(ds);


            if (lblQuestionNo.Text != "")
            {
                if (ds.Tables[0].Rows.Count == Convert.ToInt32(lblQuestionNo.Text) + 1)
                    btnNextQuestion.Visible = false;
            }

            if (ds.Tables[0].Rows.Count == 1)
                btnNextQuestion.Visible = false;


            //btnPreviousQuestion.Visible = false;

            if (Page.IsPostBack)
            {

                result = hidMyOption.Value.Split('-');

                dictMyAnswers[Convert.ToInt32(result[0]) - 1] = Convert.ToInt32(result[1]);

                lblAnswerChosen.Text = "";

                foreach (KeyValuePair<int, int> p in dictMyAnswers)
                {
                    lblAnswerChosen.Text = lblAnswerChosen.Text + p.Key + "=" + p.Value + "\n";
                }

                rdOption1.Checked = false;
                rdOption2.Checked = false;
                rdOption3.Checked = false;
                rdOption4.Checked = false;

            }


            if (!Page.IsPostBack)
            {

                dictAnswers = new Dictionary<int, int>();
                dictMyAnswers = new Dictionary<int, int>();

                currentQuestion = 1;

                for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                {
                    dictAnswers.Add(i, Convert.ToInt32(ds.Tables[0].Rows[i]["answer"].ToString()));
                    dictMyAnswers.Add(i, 0);
                }

                if (lblQuestionNo.Text == "")
                    lblQuestionNo.Text = "1";

                txtQuestion.Text = ds.Tables[0].Rows[0]["question"].ToString();

                txtOption1.Text = ds.Tables[0].Rows[0]["option1"].ToString();
                txtOption2.Text = ds.Tables[0].Rows[0]["option2"].ToString();
                txtOption3.Text = ds.Tables[0].Rows[0]["option3"].ToString();
                txtOption4.Text = ds.Tables[0].Rows[0]["option4"].ToString();
            }
        }

        protected void btnNextQuestion_Click(object sender, EventArgs e)
        {
            lblAuthor.Text = hidMyOption.Value;


            lblQuestionNo.Text = (Convert.ToInt32(lblQuestionNo.Text) + 1).ToString();

            txtQuestion.Text = ds.Tables[0].Rows[Convert.ToInt32(lblQuestionNo.Text) - 1]["question"].ToString();

            txtOption1.Text = ds.Tables[0].Rows[Convert.ToInt32(lblQuestionNo.Text) - 1]["option1"].ToString();
            txtOption2.Text = ds.Tables[0].Rows[Convert.ToInt32(lblQuestionNo.Text) - 1]["option2"].ToString();
            txtOption3.Text = ds.Tables[0].Rows[Convert.ToInt32(lblQuestionNo.Text) - 1]["option3"].ToString();
            txtOption4.Text = ds.Tables[0].Rows[Convert.ToInt32(lblQuestionNo.Text) - 1]["option4"].ToString();

            int selected = 0;

            if (rdOption1.Checked)
                selected = 1;
            else if (rdOption2.Checked)
                selected = 2;
            else if (rdOption3.Checked)
                selected = 3;
            else
                selected = 4;      
        }

        protected void btnPreviousQuestion_Click(object sender, EventArgs e)
        {
            lblAuthor.Text = hidMyOption.Value;

            lblQuestionNo.Text = (Convert.ToInt32(lblQuestionNo.Text) - 1).ToString();

            txtQuestion.Text = ds.Tables[0].Rows[Convert.ToInt32(lblQuestionNo.Text) - 1]["question"].ToString();

            txtOption1.Text = ds.Tables[0].Rows[Convert.ToInt32(lblQuestionNo.Text) - 1]["option1"].ToString();
            txtOption2.Text = ds.Tables[0].Rows[Convert.ToInt32(lblQuestionNo.Text) - 1]["option2"].ToString();
            txtOption3.Text = ds.Tables[0].Rows[Convert.ToInt32(lblQuestionNo.Text) - 1]["option3"].ToString();
            txtOption4.Text = ds.Tables[0].Rows[Convert.ToInt32(lblQuestionNo.Text) - 1]["option4"].ToString();

            int selected = 0;

            if (rdOption1.Checked)
                selected = 1;
            else if (rdOption2.Checked)
                selected = 2;
            else if (rdOption3.Checked)
                selected = 3;
            else
                selected = 4;  
        }

        protected void btnEndExam_Click(object sender, EventArgs e)
        {
            int score = 0;
            lblAuthor.Text = hidMyOption.Value;

            int marksPerQuestion = currentTotal / dictAnswers.Count;

            for (int i = 0; i < dictAnswers.Count; i++)
            {
                if (dictAnswers[i] == dictMyAnswers[i])
                    score = score + marksPerQuestion;
            }

            Response.Redirect("Traineefinalscore.aspx?Score=" + score + "&Exam=" + currentExam + "&Author=" + currentAuthor + "&PassPercentage=" + currentPercent + "&TotalMarks=" + currentTotal + "&ExamId=" + examid);

        }

        protected void btnReTake_Click(object sender, EventArgs e)
        {
            Response.Redirect("Traineetakeexam.aspx?id=" + examid + "&Retake=1");
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Traineetakeexam.aspx");
        }

    }
}