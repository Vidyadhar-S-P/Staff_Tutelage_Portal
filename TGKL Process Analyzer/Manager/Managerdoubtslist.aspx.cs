using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TGKL_Process_Analyzer.Manager
{
    public partial class Managerdoubtslist : System.Web.UI.Page
    {
        readyclass obj = new readyclass();
        string str;
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
            str = "select id,topic,doubt from tbldoubts where managerid='" + Session["userid"] + "' and Replied is Null";
            flag = obj.BindGrid(grddoubts, str);
            if (flag == false)
            {
                readyclass.errormessage(lblerror, "Records not found");
            }
            else
            {
                lblerror.Visible = false;
            }
        }
    }
}