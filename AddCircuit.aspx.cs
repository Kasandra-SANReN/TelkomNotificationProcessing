using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Windows.Forms;
using TelkomNotification;

public partial class AddCircuit : System.Web.UI.Page
{
    Circuit circuit;
    List<Circuit> circuitList = new List<Circuit>();
    public string SuggestionList = "";
    public DataTable dt;
    string AAddLine1;
    string BAddLine1;

    protected void Page_Load(object sender, EventArgs e)
    {
        circuit = new Circuit();
        dt = new DataTable();

        if (!Page.IsPostBack)
        {
            try
            {
                dt = circuit.GetAddressLineOne();

                drpBAddLine1.DataSource = dt;
                drpBAddLine1.DataTextField = "SiteBAddLine1";
                drpBAddLine1.DataBind();
                drpBAddLine1.Items.Add("Other");
                drpBAddLine1.Items.Insert(0, new ListItem("--Select Address Line 1--", "0"));

                drpAAddLine1.DataSource = dt;
                drpAAddLine1.DataTextField = "SiteBAddLine1";
                drpAAddLine1.DataBind();
                drpAAddLine1.Items.Add("Other");
                drpAAddLine1.Items.Insert(0, new ListItem("--Select Address Line 1--", "0"));
            }
            catch (Exception)
            {

            }

        }
    }
    //protected void Button2_Click(object sender, EventArgs e)
    //{
    //    circuit = new Circuit(txtCctid.Text, txtSiteAHost.Text, txtSiteBHost.Text, txtLineTags.Text, txtSpeed.Text, txtAIPAddress.Text, txtBIPAddress.Text, txtAAddLine1.Text, txtAAddLine2.Text, txtAAddLine3.Text, txtAAddLine4.Text, txtAAddLine5.Text, txtBAddLine1.Text, txtBAddLine2.Text, txtBAddLine3.Text, txtBAddLine4.Text, txtBAddLine5.Text);
    //    circuit.InsertCircuit(circuit);

    //}
    protected void drpAAddLine1_SelectedIndexChanged(object sender, EventArgs e)
    {

        circuit = new Circuit();
        dt = new DataTable();

        if (drpAAddLine1.Text == "Other")
        {
            lblErrorAdddLine.Visible = false;
            panelAAddLine1.Visible = true;
            txtAAddLine1.Focus();
            AAddLine1 = txtAAddLine1.Text;
        }
        else
        {
            lblErrorAdddLine.Visible = false;
            dt = circuit.GetPhysicalAddressLine1(drpAAddLine1.SelectedItem.ToString());

            panelAAddLine1.Visible = false;
            AAddLine1 = drpAAddLine1.SelectedItem.ToString();

            foreach (DataRow row in dt.Rows)
            {
                txtAAddLine2.Text = row["SiteBAddLine2"].ToString();
                txtAAddLine3.Text = row["SiteBAddLine3"].ToString();
                txtAAddLine4.Text = row["SiteBAddLine4"].ToString();
                txtAAddLine5.Text = row["SiteBPostalCode"].ToString();
            }

        }
    }
    protected void drpBAddLine1_SelectedIndexChanged(object sender, EventArgs e)
    {
        circuit = new Circuit();
        dt = new DataTable();

        if (drpBAddLine1.Text == "Other")
        {
            panelBAddLine1.Visible = true;
            txtBAddLine1.Focus();
            BAddLine1 = txtBAddLine1.Text;
            lblErrorAdddLine.Visible = false;
        }
        else
        {
            if (drpBAddLine1.SelectedItem.ToString() == drpAAddLine1.SelectedItem.ToString())
            {
                    lblErrorAdddLine.Visible = true;
                    lblErrorAdddLine.InnerText = "The sites physical addresses cannot be the same";
                    txtBAddLine2.Text = string.Empty;
                    txtBAddLine3.Text = string.Empty;
                    txtBAddLine4.Text = string.Empty;
                    txtBAddLine5.Text = string.Empty;
            }
            else
            {
                dt = circuit.GetPhysicalAddressLine1(drpBAddLine1.SelectedItem.ToString());

                lblErrorAdddLine.Visible = false;
                panelBAddLine1.Visible = false;
                BAddLine1 = drpBAddLine1.SelectedItem.ToString();

                foreach (DataRow row in dt.Rows)
                {
                    txtBAddLine2.Text = row["SiteBAddLine2"].ToString();
                    txtBAddLine3.Text = row["SiteBAddLine3"].ToString();
                    txtBAddLine4.Text = row["SiteBAddLine4"].ToString();
                    txtBAddLine5.Text = row["SiteBPostalCode"].ToString();
                }

            }
        }
    }
    protected void txtAIPAddress_TextChanged(object sender, EventArgs e)
    {
        try
        {
            string BIPAddress = txtAIPAddress.Text;
            string firstNumbers = BIPAddress.Substring(0, 12);
            int lastNumbers = int.Parse(BIPAddress.Substring(12, 3)) + 1;
            txtBIPAddress.Text = firstNumbers + lastNumbers.ToString();
        }
        catch (Exception)
        {
        }
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("AllCircuit.aspx");
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (AAddLine1 == null)
            AAddLine1 = drpAAddLine1.Text;

        if (BAddLine1 == null)
            BAddLine1 = drpBAddLine1.Text;

        try
        {
            circuit = new Circuit(txtCctid.Text, txtSiteAHost.Text, txtSiteBHost.Text, txtLineTags.Text, txtSpeed.Text, txtAIPAddress.Text, txtBIPAddress.Text, AAddLine1, txtAAddLine2.Text, txtAAddLine3.Text, txtAAddLine4.Text, txtAAddLine5.Text, BAddLine1, txtBAddLine2.Text, txtBAddLine3.Text, txtBAddLine4.Text, txtBAddLine5.Text);
            circuit.InsertCircuit(circuit);

            MessageBox messageA = new MessageBox();

            MessageBoxButton YesButton = new MessageBoxButton("OK");
            YesButton.SetLocation("AllCircuit.aspx");
            YesButton.SetClass("btn btn-primary");
            messageA.SetTitle("Successfully added...");
            messageA.SetIcon();
            messageA.SetMessage("Circuit identity " + txtCctid.Text + " was successfully added " + "<br/>");
            messageA.AddButton(YesButton.ReturnObject());
            ((HtmlGenericControl)this.Page.Master.FindControl("msgboxpanel")).InnerHtml = messageA.ReturnObject();
        }
        catch (Exception)
        {

        }
    }
    protected void txtCctid_TextChanged(object sender, EventArgs e)
    {
        circuit = new Circuit();
        lblCCTIDError.Visible = false;
        try
        {
            circuitList = circuit.GetAllCircuit();

            for (int i = 0; i < circuitList.Count; i++)
            {
                if (txtCctid.Text == circuitList[i].CCTID)
                {
                    lblCCTIDError.Visible = true;
                    txtCctid.Text = string.Empty;
                    lblCCTIDError.InnerText = "Circuit identity does exists";
                    break;
                }

            }
        }
        catch (Exception)
        {

        }
    }
}