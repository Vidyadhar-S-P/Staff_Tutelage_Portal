using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;
using System.Net.Mail;

namespace TGKL_Process_Analyzer.Admin
{
    public partial class Adminaddemployees : System.Web.UI.Page
    {
        readyclass obj = new readyclass();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                lblid.Text = Request.QueryString["empid"];
                obj.filllist(drplstdepartment, "select department from tbldepartment");

                if (lblid.Text.Trim() != "")
                {
                    pagerefresh();
                    obj.makereadonly(Page.Controls);
                    btnsave.Visible = false;
                    btnupdate.Visible = false;
                    btnedit.Visible = true;
                    btncancel.Visible = true;
                    btndelete.Visible = true;
                }
                else
                {
                    obj.makeeditable(Page.Controls);
                    btnsave.Visible = true;
                    btnupdate.Visible = false;
                    btnedit.Visible = false;
                    btncancel.Visible = true;
                    btndelete.Visible = false;
                }

                btndelete.Attributes.Add("onclick", "return confirm();");
            }
        }

        private void pagerefresh()
        {
            SqlConnection con = Database.getConnection();
            SqlCommand cmd = new SqlCommand("select * from tblemployees where empid='" + lblid.Text.Trim() + "'", con);
            SqlDataReader dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
            if (dr.Read())
            {
                lblid.Text = dr[0].ToString().Trim();
                txtfname.Text = dr[1].ToString().Trim();
                txtmname.Text = dr[2].ToString().Trim();
                txtlname.Text = dr[3].ToString().Trim();
                drplstgender.SelectedValue = dr[4].ToString().Trim();
                txtqualification.Text = dr[5].ToString().Trim();
                drplstdepartment.SelectedValue = dr[6].ToString().Trim();
                drplstemprole.SelectedValue = dr[7].ToString().Trim();
                txtmobileno.Text = dr[8].ToString().Trim();
                txtphoneno.Text = dr[9].ToString().Trim();
                txtpersonalemailid.Text = dr[10].ToString().Trim();
                txtuserid.Text = dr[11].ToString().Trim();
                txtperaddress.Text = dr[12].ToString().Trim();
                txtpercity.Text = dr[13].ToString().Trim();
                txtperstate.Text = dr[14].ToString().Trim();
                txtperpincode.Text = dr[15].ToString().Trim();
            }
            dr.Close();
            cmd.Dispose();
            con.Close();

            con = Database.getConnection();
            cmd = new SqlCommand("select * from tblpreempaddress where empid='" + lblid.Text.Trim() + "'", con);
            dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
            if (dr.Read())
            {
                txtpreaddress.Text = dr[1].ToString().Trim();
                txtprecity.Text = dr[2].ToString().Trim();
                txtprestate.Text = dr[3].ToString().Trim();
                txtprepincode.Text = dr[4].ToString().Trim();
            }
            dr.Close();
            cmd.Dispose();
            con.Close();
        }

        protected void btnsave_Click(object sender, EventArgs e)
        {
            string sql1 = "select * from tblemployees where userid='" + txtuserid.Text.Trim() + "'";
            bool falg = obj.checkduplicate(sql1);

            if (falg == true)
                readyclass.errormessage(lblerror, "This employee already exist");
            else
            {
                int id = obj.autoid("tblemployees", "empid");
                string sql = "insert into tblemployees(empid,fname,mname,lname,gender,qualification,department,emprole, ";
                sql = sql + "mobileno,phoneno,personalemailid,userid,peraddress,percity,perstate,perpincode) ";
                sql = sql + "Values(" + id + ",'" + txtfname.Text.Trim() + "','" + txtmname.Text.Trim() + "',";
                sql = sql + "'" + txtlname.Text.Trim() + "','" + drplstgender.SelectedValue + "','" + txtqualification.Text.Trim() + "',";
                sql = sql + "'" + drplstdepartment.SelectedValue + "','" + drplstemprole.SelectedValue + "', '" + txtmobileno.Text.Trim() + "', ";
                sql = sql + "'" + txtphoneno.Text.Trim() + "','" + txtpersonalemailid.Text.Trim() + "', '" + txtuserid.Text.Trim() + "', ";
                sql = sql + "'" + txtperaddress.Text.Trim() + "','" + txtpercity.Text.Trim() + "', '" + txtperstate.Text.Trim() + "', ";
                sql = sql + "'" + txtperpincode.Text.Trim() + "')";
                Database.executeQuery(sql);

                sql = "insert into tblpreempaddress(empid,preaddress,precity,prestate,prepincode) ";
                sql = sql + "Values(" + id + " , '" + txtpreaddress.Text.Trim() + "','" + txtprecity.Text.Trim() + "', '" + txtprestate.Text.Trim() + "', ";
                sql = sql + "'" + txtprepincode.Text.Trim() + "')";
                Database.executeQuery(sql);

                Random rand = new Random((int)DateTime.Now.Ticks);
                int numIterations = 0;
                numIterations = rand.Next(1, 10000);
                String str = "TG" + numIterations + "KL";

                sql = "insert into tbllogin(userid,password,usertype) ";
                sql = sql + "Values('" + txtuserid.Text.Trim() + "','" + str + "', '" + drplstemprole.SelectedValue + "')";

                Database.executeQuery(sql);
                str = str + " is Password ";
                str = str + " and User id is " + txtuserid.Text.Trim();
                try
                {
                    MailMessage mail = new MailMessage();
                    SmtpClient SmtpServer = new SmtpClient("smtp.gmail.com");
                    mail.From = new MailAddress("hrudayainproblem@gmail.com");
                    mail.To.Add(txtuserid.Text.Trim());
                    mail.Subject = "Login Credentials for Login ";
                    mail.Body = "Login Credentails : " + str;
                    SmtpServer.Port = 25;
                    SmtpServer.Credentials = new System.Net.NetworkCredential("hrudayainproblem@gmail.com", "91649763679164976367");
                    SmtpServer.EnableSsl = true;
                    SmtpServer.Send(mail);
                }
                catch (Exception ex)
                {
                    readyclass.errormessage(lblerror, ex.Message);
                }

                Show("Saved Successfully"+str, "Adminemployeeslist.aspx");
            }
        }

        protected void btnedit_Click(object sender, EventArgs e)
        {
            obj.makeeditable(Page.Controls);

            txtuserid.ReadOnly = true;

            btnedit.Visible = false;
            btnupdate.Visible = true;
            btncancel.Visible = true;
            btnsave.Visible = false;
        }

        protected void btnupdate_Click(object sender, EventArgs e)
        {
            string sql = "Update tblemployees SET ";
            sql = sql + "fname='" + txtfname.Text.Trim() + "', mname='" + txtmname.Text.Trim() + "',";
            sql = sql + "lname='" + txtlname.Text.Trim() + "', gender = '" + drplstgender.SelectedValue + "', ";
            sql = sql + "qualification='" + txtqualification.Text.Trim() + "',department='" + drplstdepartment.SelectedValue + "', ";
            sql = sql + "emprole='" + drplstemprole.SelectedValue + "',mobileno='" + txtmobileno.Text.Trim() + "',phoneno='" + txtphoneno.Text.Trim() + "', ";
            sql = sql + "personalemailid='" + txtpersonalemailid.Text.Trim() + "',peraddress='" + txtperaddress.Text.Trim() + "', ";
            sql = sql + "percity='" + txtpercity.Text.Trim() + "',perstate='" + txtperstate.Text.Trim() + "',perpincode='" + txtperpincode.Text.Trim() + "' Where empid = " + lblid.Text.Trim() + "";

            Database.executeQuery(sql);

            Show("Updated Successfully", "Adminemployeeslist.aspx");
        }

        protected void btncancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Adminemployeeslist.aspx");
        }

        protected void btndelete_Click(object sender, EventArgs e)
        {
            if (lblid.Text.Trim() == "")
                readyclass.errormessage(lblerror, "Select Employee to delete");
            else
            {
                string sql = "delete from tblemployees where empid = '" + lblid.Text.Trim() + "'";
                Database.executeQuery(sql);

                sql = "delete from tblpreempaddress where empid = '" + lblid.Text.Trim() + "'";
                Database.executeQuery(sql);

                sql = "delete from tbllogin where userid = '" + txtuserid.Text.Trim() + "'";
                Database.executeQuery(sql);

                Show("Deleted Successfully", "Adminemployeeslist.aspx");
            }
        }

        public void Show(string message, string url)
        {
            string script = "window.onload = function(){ alert('";
            script += message;
            script += "');";
            script += "window.location = '";
            script += url;
            script += "'; }";
            ClientScript.RegisterStartupScript(this.GetType(), "Redirect", script, true);
        }

        protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
        {
            txtpreaddress.Text = txtperaddress.Text.Trim();
            txtprecity.Text = txtpercity.Text.Trim();
            txtprestate.Text = txtperstate.Text.Trim();
            txtprepincode.Text = txtperpincode.Text.Trim();
        }
    }
}