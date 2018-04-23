using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web.ASPxGridView;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Init(object sender, EventArgs e)
    {
        if (Session["ProdNameExpanded"] != null)
        {
            bool isExpanded = (bool)Session["ProdNameExpanded"];
            gridView.Columns["ProdNameBand"].Visible = isExpanded;
            gridView.Columns["ProdName"].Visible = !isExpanded;
        }
        if (Session["ProdPriceExpanded"] != null)
        {
            bool isExpanded = (bool)Session["ProdPriceExpanded"];
            gridView.Columns["ProdPriceBand"].Visible = isExpanded;
            gridView.Columns["ProdPrice"].Visible = !isExpanded;
        }
    }
    protected void gridView_CustomCallback(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewCustomCallbackEventArgs e)
    {
        string[] param = e.Parameters.Split('|');
        ASPxGridView grid = sender as ASPxGridView;

        string colName = param[1];
        if (param[0] == "collapse")
        {
            grid.Columns[colName + "Band"].Visible = false;
            grid.Columns[colName].Visible = true;
            Session[colName + "Expanded"] = false;
        }
        else if (param[0] == "expand")
        {
            grid.Columns[colName + "Band"].Visible = true;
            grid.Columns[colName].Visible = false;
            Session[colName + "Expanded"] = true;
        }
    }


}