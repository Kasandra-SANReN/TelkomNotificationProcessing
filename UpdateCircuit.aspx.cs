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

public partial class UpdateCircuit : System.Web.UI.Page
{
    Circuit circuit;
    List<Circuit> circuitList = new List<Circuit>();
    string CCTID="";
    DataTable dt;
    DataTable dtDropDown;
    string AAddLine1;
    string BAddLine1;

    protected void Page_Load(object sender, EventArgs e)
    {
        circuit = new Circuit();
        dt = new DataTable();
        dtDropDown = new DataTable();

        

        //GETTING CCTID FROM ALL CIRCUIT FORM
        CCTID = Request.QueryString["id"];

        lblName.Text = CCTID;

        if (CCTID == null)
        {
            Response.Redirect("AllCircuit.aspx");
        }
        else
        {

            if (!Page.IsPostBack)
            {
                try
                {
                    dtDropDown = circuit.GetAddressLineOne();
                    dt = circuit.GetCircuitByCCTID(CCTID);

                    drpBAddLine1.DataSource = dtDropDown;
                    drpBAddLine1.DataTextField = "SiteBAddLine1";
                    drpBAddLine1.DataBind();
                    drpBAddLine1.Items.Add("Other");
                    drpBAddLine1.Items.Insert(0, new ListItem("--Select Address Line 1--", "0"));

                    drpAAddLine1.DataSource = dtDropDown;
                    drpAAddLine1.DataTextField = "SiteBAddLine1";
                    drpAAddLine1.DataBind();
                    drpAAddLine1.Items.Add("Other");
                    drpAAddLine1.Items.Insert(0, new ListItem("--Select Address Line 1--", "0"));

                    foreach (DataRow row in dt.Rows)
                    {
                        txtCctid.Text = row["CCTID"].ToString();
                        txtSiteAHost.Text = row["HostnameA"].ToString();
                        txtSiteBHost.Text = row["HostnameB"].ToString();
                        txtLineTags.Text = row["AssociatedLineTags"].ToString();
                        txtSpeed.Text = row["Speed"].ToString();
                        txtAIPAddress.Text = row["SiteAIPAddress"].ToString();
                        txtBIPAddress.Text = row["SiteBIPAddress"].ToString();

                        drpAAddLine1.SelectedValue = row["SiteAAddLine1"].ToString();
                        txtAAddLine2.Text = row["SiteAAddLine2"].ToString();
                        txtAAddLine3.Text = row["SiteAAddLine3"].ToString();
                        txtAAddLine4.Text = row["SiteAAddLine4"].ToString();
                        txtAAddLine5.Text = row["SiteAPostalCode"].ToString();

                        drpBAddLine1.SelectedValue = row["SiteBAddLine1"].ToString();
                        txtBAddLine2.Text = row["SiteBAddLine2"].ToString();
                        txtBAddLine3.Text = row["SiteBAddLine3"].ToString();
                        txtBAddLine4.Text = row["SiteBAddLine4"].ToString();
                        txtBAddLine5.Text = row["SiteBPostalCode"].ToString();
                    }
                }
                catch (Exception)
                {

                }
            }
        }
        
    }
    protected void txtAIPAddress_TextChanged(object sender, EventArgs e)
    {
        try
        {
            string BIPAddress = txtAIPAddress.Text;
            string firstNumbers = BIPAddress.Substring(0, 11);
            int lastNumbers = int.Parse(BIPAddress.Substring(12, 3)) + 1;
            txtBIPAddress.Text = firstNumbers + lastNumbers.ToString();
        }
        catch (Exception)
        {

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
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (AAddLine1 == null)
            AAddLine1 = drpAAddLine1.Text;

        if (BAddLine1 == null)
            BAddLine1 = drpBAddLine1.Text;
        

        try
        {
            circuit = new Circuit(CCTID, txtSiteAHost.Text, txtSiteBHost.Text, txtLineTags.Text, txtSpeed.Text, txtAIPAddress.Text, txtBIPAddress.Text, AAddLine1, txtAAddLine2.Text, txtAAddLine3.Text, txtAAddLine4.Text, txtAAddLine5.Text, BAddLine1, txtBAddLine2.Text, txtBAddLine3.Text, txtBAddLine4.Text, txtBAddLine5.Text);
            circuit.UpdateCircuit(circuit);

            MessageBox messageA = new MessageBox();
            MessageBoxButton YesButton = new MessageBoxButton("OK");
            YesButton.SetLocation("AllCircuit.aspx");
            YesButton.SetClass("btn btn-primary");
            messageA.SetTitle("Successfully updated...");
            messageA.SetIcon();
            messageA.SetMessage("Circuit identity: " + CCTID + " was successfully updated " + "<br/>");
            messageA.AddButton(YesButton.ReturnObject());
            ((HtmlGenericControl)this.Page.Master.FindControl("msgboxpanel")).InnerHtml = messageA.ReturnObject();
        }
        catch (Exception)
        {

        }

    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("AllCircuit.aspx");
    }
}