using DayPilot.Web.Ui.Enums;
using DayPilot.Web.Ui.Events;
using OpenPop.Pop3;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;
using TelkomNotification;

public partial class _Default : System.Web.UI.Page
{

    Circuit circuit;
    Notification notify;
    DataTable dt;
    DataTable data;
    List<Notification> notifyList = new List<Notification>();
    List<Circuit> circuitList = new List<Circuit>();

    protected void Page_Load(object sender, EventArgs e)
    {

        notify = new Notification();

        if (!Page.IsPostBack)
        {
            try
            {
                notifyList = notify.GetAllNotification();
                dayCalender.DataSource = notifyList;


                dayCalender.EventBackColor = System.Drawing.Color.Yellow;
                dayCalender.DataStartField = "Start_Date";
                dayCalender.DataTextField = "NatureOfRef";
                dayCalender.DataEndField = "Ecd_Date";
                dayCalender.DataValueField = "NotifyID";
                dayCalender.DataValueField = "CCTID";
                dayCalender.DataBind();
            }
            catch (Exception)
            { }   

            try
            {
                GetEmailAttachments();
            }
            catch (Exception)
            {
            }

        }

        ReadingFromCSV();

        dayCalender.EventClickHandling = EventClickHandlingEnum.PostBack;
        dayCalender.TimeRangeSelectedHandling = TimeRangeSelectedHandling.PostBack;

    }
    protected void dayCalender_EventClick(object sender, EventClickEventArgs e)
    {
        

        string cctid = e.Value.ToString();
        
        circuit = new Circuit();
        notify = new Notification();
        dt = new DataTable();
        data = new DataTable();
        string CCTID;
        bool found = false;

        try
        {

        circuitList = circuit.GetAllCircuit();

        for (int i = 0; i < circuitList.Count; i++)
        {
            if (cctid == circuitList[i].CCTID)
            {
                found = true;
                CCTID = cctid;
                break;
            }
        }
        
        if (!found)
        {
            ModalPopupExtender2.Show();

            data = notify.GetNotificationCategoryByCCTID(cctid);

            foreach (DataRow rows in data.Rows)
            {
                LablblHeader1.Text = rows["CategoryName"].ToString();
                lblCCTID1.Text = rows["CCTID"].ToString();
                lblSSCNM1.Text = rows["SSCNMRef"].ToString();
                lblNOC1.Text = rows["NOCRef"].ToString();
                lblNature.Text = rows["NatureOfRef"].ToString();
                lblService1.Text = rows["ServiceImpact"].ToString();
                lblFailure.Text = rows["Start_Date"].ToString();
                lblFinish.Text = rows["Ecd_Date"].ToString();
            }
        }
        else
        {
            ModalPopupExtender1.Show();

            dt = circuit.GetNotificationInfoByCCTID(cctid);

            foreach (DataRow row in dt.Rows)
            {
                lblHeader.Text = row["CategoryName"].ToString();
                lblCCTID.Text = row["CCTID"].ToString();
                lblSSCNM.Text = row["SSCNMRef"].ToString();
                lblNOC.Text = row["NOCRef"].ToString();
                lblNatureWork.Text = row["NatureOfRef"].ToString();
                lblService.Text = row["ServiceImpact"].ToString();

                lblStartDate.Text = row["Start_Date"].ToString();
                lblEcdDate.Text = row["Clear_Date"].ToString();
                lblAAddLine1.Text = row["SiteAAddLine1"].ToString();
                lblAAddLine2.Text = row["SiteAAddLine2"].ToString();
                lblAAddLine3.Text = row["SiteAAddLine3"].ToString();
                lblAAddLine4.Text = row["SiteAAddLine4"].ToString();
                lblAAddLine5.Text = row["SiteAPostalCode"].ToString();

                lblBAddLine1.Text = row["SiteBAddLine1"].ToString();
                lblBAddLine2.Text = row["SiteBAddLine2"].ToString();
                lblBAddLine3.Text = row["SiteBAddLine3"].ToString();
                lblBAddLine4.Text = row["SiteBAddLine4"].ToString();
                lblBAddLine5.Text = row["SiteBPostalCode"].ToString();

                lblHostnameA.Text = row["HostnameA"].ToString();
                lblHostnameB.Text = row["HostnameB"].ToString();
                lblAIPAddress.Text = row["SiteAIPAddress"].ToString();
                lblBIPAddress.Text = row["SiteBIPAddress"].ToString();

                lblAssociatedLineTags.Text = row["AssociatedLineTags"].ToString();
                lblSpeed.Text = row["Speed"].ToString();
            }
        }
        }
        catch (Exception)
        {

        } 
    }
    //READING FROM THE CSV FILE AND SAVE NOTIFICATION DATA INTO DATABASE
    #region
    public void ReadingFromCSV()
    {
        string appPath = Request.PhysicalApplicationPath;
        string filePathReader = appPath + "App\\TelkomNotificationProcessing\\CSVFiles/Reminder.csv";
        string filePathReader1 = appPath + "App\\TelkomNotificationProcessing\\CSVFiles/Initial.csv";
        string filePathReader2 = appPath + "App\\TelkomNotificationProcessing\\CSVFiles/Update.csv";
        string filePathReader3 = appPath + "App\\TelkomNotificationProcessing\\CSVFiles/Emergency.csv";
        string filePathReader4 = appPath + "App\\TelkomNotificationProcessing\\CSVFiles/Final.csv";

        string fileName = "";
        int categoryID = 0;

        if (File.Exists(filePathReader))
        {
            fileName = filePathReader;
            categoryID = 4;
        }
        else
        {
            if (File.Exists(filePathReader1))
            {
                fileName = filePathReader1;
                categoryID = 2;
            }

            else
            {
                if (File.Exists(filePathReader2))
                {
                    fileName = filePathReader2;
                    categoryID = 1;
                }
                else
                {
                    if (File.Exists(filePathReader3))
                    {
                        fileName = filePathReader3;
                        categoryID = 3;
                    }
                    else
                    {
                        if (File.Exists(filePathReader4))
                        {
                            fileName = filePathReader4;
                            categoryID = 5;
                        }
                    }
                }
            }
        }

        //If CSVFile folder is empty we don't anything
        //Extracting data from csv file
        //Reading CSV file and extracting values
        if (fileName != "")
        {
            StreamReader sr = new StreamReader(fileName);
            string[,] data = null;
            int Row = 0;

            string line = string.Empty;

            while ((line = sr.ReadLine()) != null)
            {
                string[] value = line.Split(',').Select(x => x.Trim('\"')).ToArray();

                if (Row == 0)
                {
                    data = new string[value.Length, value.Length];
                }
                for (int column = 0; column < value.Length; column++)
                {
                    data[Row, column] = value[column];
                }
                Row++;
            }
            sr.Close();
           
            //FUNCTION SaveNotificationInfo is called
           SaveNotificationInfo(data, categoryID);

            //Delete CSV File from the folder
        File.Delete(fileName);
        }
    }
    #endregion
    //SAVING NOIFICATION DATA INTO DATABASE
    #region
    public void SaveNotificationInfo(string[,] data, int categoryID)
    {
       string CCTID;
        bool found = false;
        circuit = new Circuit();



        string sccnmref = data[1, 0].ToString();
        string noc = data[1, 1].ToString();
        string nature = data[1, 2].ToString();
        string type = data[1, 3].ToString();
        string service = data[1, 4].ToString();
        string cctid = data[1, 5].ToString();
        string sla = data[1, 6].ToString();
        string startDate = data[1, 7].ToString();
        string ecdDate = data[1, 8].ToString();
        string clearDate = data[1, 9].ToString();

        //not sure what this does
        if (ecdDate == "")
            ecdDate = DateTime.Parse(startDate.ToString()).AddHours(2).ToString();

        string custName = data[1, 10].ToString();
        string a_end = data[1, 11].ToString();
        string z_end = data[1, 12].ToString();

       circuitList = circuit.GetAllCircuit();

       for (int i = 0; i < circuitList.Count; i++)
      {
      if (cctid == circuitList[i].CCTID)
      {
        found = true;
             CCTID = cctid;
             break;
          }
      }

    //Checking whether incoming notification circuit identity does exist. If it does save notification info and if not ignore it.
       if (found)
      {
            //Save notification into database
            notify = new Notification(sccnmref, noc, nature, type, service, cctid, sla, startDate, ecdDate, clearDate, custName, a_end, z_end, categoryID);
            notify.AddNotification(notify);
       
      }

    }
    #endregion
    //GETTING TELKOM NOTIFICATION ATTACHMENTS FROM SCCM@TELKOM.NET
    /********************************************************************************************
     *   Url: https://mimeparser.codeplex.com/                                                    *                                                                                       *
     ********************************************************************************************/
    #region
    public void GetEmailAttachments()
    {
        MailMessage mail = new MailMessage();
        string address;
        string subject="";
        string subEmergency;
        string subUpdate;
        string subReminder;
        string subFinal;
        string subInitial;

        // The client disconnects from the server when being disposed
        using (Pop3Client client = new Pop3Client())
        {
            // Connect to the server
            client.Connect("pop.gmail.com", 995, true);

            // Authenticate ourselves towards the server
            client.Authenticate("telkomnotification@gmail.com", "notific@tion");

            // Get the number of messages in the inbox
                int messageCount = client.GetMessageCount();


            for (int i = messageCount; i >= 1; i--)
            {
                //Get the all email messages
                OpenPop.Mime.Message msg = client.GetMessage(i);
                address = msg.Headers.From.Address;

                //Extracting the word "emergency" notification from email subject
                subEmergency = msg.Headers.Subject;

                //Extracting the word "Reminder" notification from email subject
                subReminder = msg.Headers.Subject;

                //Extracting the word "Update" notification from email subject
                subUpdate = msg.Headers.Subject;

                //Extracting the word "Initial" notification from email subject
                subInitial = msg.Headers.Subject;

                //Extracting the word "Final" notification from email subject
                subFinal = msg.Headers.Subject;

                if (subEmergency.Contains("Emergency") == true)
                    subject = "Emergency";
                else if (subFinal.Contains("Final") == true)
                    subject = "Final";
                else if (subInitial.Contains("Initial")== true)
                    subject = "Initial";
                else if (subReminder.Contains("Reminder") == true)
                    subject = "Reminder";
                else if (subUpdate.Contains("Update") == true)
                    subject = "Update";



                List<OpenPop.Mime.MessagePart> attachments = msg.FindAllAttachments();

                foreach (OpenPop.Mime.MessagePart attachment in attachments)
                {
                    if (attachment != null && address == "sscnm@telkom.co.za")
                    {
                        string ext = attachment.FileName.Split('.')[1];

                        FileInfo file;

                        switch (subject)
                        {
                            case "Emergency": file = new FileInfo(Server.MapPath("CSVFiles\\Emergency." + ext));
                                attachment.Save(file);
                                break;
                            case "Reminder": file = new FileInfo(Server.MapPath("CSVFiles\\Reminder." + ext));
                                attachment.Save(file);
                                break;
                            case "Update": file = new FileInfo(Server.MapPath("CSVFiles\\Update." + ext));
                                attachment.Save(file);
                                break;
                            case "Initial": file = new FileInfo(Server.MapPath("CSVFiles\\Initial." + ext));
                                attachment.Save(file);
                                break;
                            case "Final": file = new FileInfo(Server.MapPath("CSVFiles\\Final." + ext));
                                attachment.Save(file);
                                break;

                        }

                  client.DeleteMessage(i);
                    }
                }

            }
        }
    }
}
    #endregion