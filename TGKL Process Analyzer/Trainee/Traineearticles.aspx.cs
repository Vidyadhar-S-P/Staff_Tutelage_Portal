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
    public partial class Traineearticles : System.Web.UI.Page
    {
        readyclass obj = new readyclass();
        string sql;
        bool flag;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                lblid.Text = Session["userid"].ToString();

                SqlConnection con = Database.getConnection();
                SqlCommand cmd = new SqlCommand("select department from tblemployees where userid='" + lblid.Text.Trim() + "'", con);
                SqlDataReader dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
                if (dr.Read())
                {
                    lbldepartment.Text = dr[0].ToString().Trim();
                }
                dr.Close();
                cmd.Dispose();
                con.Close();
            }
        }

        private void fill()
        {
            sql = "Select title,filename,dateofupload,downloads from tblfiles where (title like '%" + txtsearch.Text.Trim() + "%' or tags like '%" + txtsearch.Text.Trim() + "%' or description like '%" + txtsearch.Text.Trim() + "%') and department='" + lbldepartment.Text.Trim() + "'";
            flag = obj.BindGrid(grdfiles, sql);
            if (flag == false)
                readyclass.errormessage(lblerror, "Records Not Found");
            else
                lblerror.Visible = false;
        }

        protected void btnsearch_Click(object sender, EventArgs e)
        {
            fill();
        }
    }
}