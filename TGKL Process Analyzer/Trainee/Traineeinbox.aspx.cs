using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data.SqlClient;
using System.Data;

namespace TGKL_Process_Analyzer.Trainee
{
    public partial class Traineeinbox : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                con = Database.getConnection();

                Table1.Width = 400;
                //Table1.BorderWidth=3;
                //Table1.BorderStyle = BorderStyle.Solid;
                TableHeaderRow th = new TableHeaderRow();
                TableHeaderCell thc;
                //Table1.Rows.Add(th);
                thc = new TableHeaderCell();
                thc.Text = "Replied By";
                thc.Width = 100;
                th.Cells.Add(thc);
                thc = new TableHeaderCell();
                thc.Text = "Topic";
                thc.Width = 250;
                th.Cells.Add(thc);
                Table1.Rows.Add(th);
                Table1.BorderColor = System.Drawing.Color.White;
                SqlDataAdapter dsa = new SqlDataAdapter("select id, managerid, topic, doubt, replied, viewed, reply from tbldoubts where empid='" + Session["userid"] + "' and replied=1 ORDER BY viewed", con);
                DataSet ds = new DataSet();
                dsa.Fill(ds);

                int i;

                SqlCommand cmd;

                String query;
                String name;

                for (i = 0; i < ds.Tables[0].Rows.Count; i++)
                {

                    con = Database.getConnection();

                    query = "Select fname from tblemployees where userid='" + ds.Tables[0].Rows[i][1].ToString() + "'";

                    cmd = new SqlCommand(query, con);
                    name = cmd.ExecuteScalar().ToString();

                    con.Close();

                    TableRow tr;
                    TableCell tc;
                    HyperLink hy;

                    tr = new TableRow();

                    if (ds.Tables[0].Rows[i][5].ToString() == "1")
                    {
                        tr.BackColor = System.Drawing.Color.Gray ;
                        tr.ForeColor = System.Drawing.Color.White;
                    }

                    tc = new TableCell();
                    tc.Text = name;
                    tc.Width = 50;
                    tr.Cells.Add(tc);


                    hy = new HyperLink();
                    tc = new TableCell();
                    hy.Text = ds.Tables[0].Rows[i][2].ToString();
                    hy.NavigateUrl = "Traineeinbox.aspx?id=" + ds.Tables[0].Rows[i][0].ToString();
                    tc.Controls.Add(hy);
                    tc.Width = 300;
                    tc.HorizontalAlign = HorizontalAlign.Center;
                    tr.Cells.Add(tc);

                    Table1.Rows.Add(tr);
                }

                String sid;
                int id;

                sid = Request.Params["id"];

                if (sid != null)
                {
                    id = Convert.ToInt32(sid);

                    con = Database.getConnection();

                    cmd = new SqlCommand("Select doubt from tbldoubts where id=" + id, con);
                    Label1.Text = cmd.ExecuteScalar().ToString();

                    con.Close();

                    con = Database.getConnection();

                    cmd = new SqlCommand("Select reply from tbldoubts where id=" + id, con);
                    Label2.Text = cmd.ExecuteScalar().ToString();

                    con.Close();

                    con = Database.getConnection();

                    cmd = new SqlCommand("Update tbldoubts set viewed=1 where id=" + id, con);
                    cmd.ExecuteNonQuery();

                    con.Close();
                }
            }
        }

        protected void btnpostdoubt_Click(object sender, EventArgs e)
        {
            Response.Redirect("Traineepostnewdoubt.aspx");
        }
    }
}