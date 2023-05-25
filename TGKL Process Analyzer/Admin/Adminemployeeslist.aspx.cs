using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TGKL_Process_Analyzer.Admin
{
    public partial class Adminemployeeslist : System.Web.UI.Page
    {
        string sql;
        bool flag;
        readyclass obj = new readyclass();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                obj.filllist(drplstdepartments, "Select department from tbldepartment");
            }
        }

        protected void btnsearch_Click(object sender, EventArgs e)
        {
            fill(txtemployeename.Text.Trim());
        }

        private void fill(string empname)
        {
            sql = "select empid,(fname + SPACE(1) + mname + SPACE(1) + lname) AS empname,department,emprole,mobileno from tblemployees where department='" + drplstdepartments.SelectedValue + "' and fname LIKE '%" + txtemployeename.Text.Trim() + "%'";
            flag = obj.BindGrid(grdemployee, sql);
            if (flag == false)
            {
                readyclass.errormessage(lblerror, "Records not found");
            }
            else
            {
                lblerror.Visible = false;
            }
        }

        protected void btnaddnew_Click(object sender, EventArgs e)
        {
            Response.Redirect("Adminaddemployees.aspx");
        }

        protected void grdemployee_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdemployee.PageIndex = e.NewPageIndex;
            btnsearch_Click(this, new EventArgs());
        }
    }
}