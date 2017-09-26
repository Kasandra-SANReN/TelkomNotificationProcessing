using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TelkomNotification;

public partial class AllCircuit : System.Web.UI.Page
{
    Circuit circuit;
    List<Circuit> circuitList = new List<Circuit>();

    protected void Page_Load(object sender, EventArgs e)
    {
        circuit = new Circuit();

        if (!Page.IsPostBack)
        {
            try
            {
                circuitList = circuit.GetAllCircuit();
                gvCircuit.DataSource = circuitList;
                gvCircuit.DataBind();
            }
            catch (Exception)
            {

            }
        }
    }
    protected void gvCircuit_Sorting(object sender, GridViewSortEventArgs e)
    {

    }
    protected void gvCircuit_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        circuit = new Circuit();
        circuitList = circuit.GetAllCircuit();

        gvCircuit.DataSource = circuitList;
        gvCircuit.PageIndex = e.NewPageIndex;
        gvCircuit.DataBind();
    }
    protected void btnAddCircuit_Click(object sender, EventArgs e)
    {
        Response.Redirect("AddCircuit.aspx");
    }
}