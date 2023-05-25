using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TGKL_Process_Analyzer.Manager
{
    public partial class Manageruploadedarticleslist : System.Web.UI.Page
    {
        readyclass obj = new readyclass();
        string sql;
        bool flag;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                fill();
            }
        }
        private void fill()
        {
            sql = "Select * from tblfiles where uploader='" + Session["userid"] + "'";
            flag=obj.BindGrid(grdfiles, sql);
            if (flag == false)
                readyclass.errormessage(lblerror, "Records Not Found");
            else
                lblerror.Visible = false;
        }

        protected void grdfiles_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdfiles.PageIndex = e.NewPageIndex;
            fill();
        }

        protected void btnback_Click(object sender, EventArgs e)
        {
            Response.Redirect("Manageruploadarticles.aspx");
        }
    }
}