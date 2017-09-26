<%@ Page Title="" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<%@ Register Assembly="DayPilot" Namespace="DayPilot.Web.Ui" TagPrefix="DayPilot" %>

<asp:Content ID="Content3" ContentPlaceHolderID="title" runat="Server">
    Telkom Notification
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="CurrentProcess" Runat="Server">
    <label style="text-align:center; font-size:14pt; font-weight:bold">
        Telkom Notification
    </label>
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentBody" runat="Server">
    <script src="js/jquery-1.8.3.js" type="text/javascript"></script>
    <script type="text/javascript" src="js/jquery-ui-1.9.2.custom.min.js"></script>
    <link rel="stylesheet" type="text/css" href="css/jquery-ui.css" />
    <script type="text/javascript">
        $('#tHome').addClass('tabActive');
        $('#myModal').modal(options);
    </script>
    <hr />
    <!-- HeaderDateFormat="D" e.g 10 July 2014 -->
    <div style="width:90%; margin:auto;">
        <DayPilot:DayPilotCalendar ID="dayCalender"
            runat="server" 
            DurationBarColor="#3333CC" 
            
            HeaderDateFormat="D" Days="5"
            eventheight="20"
            EventFontSize="11px"
            cellduration="1440"
            HeightSpec="BusinessHoursNoScroll"
            Width="80%"
            eventmovehandling="CallBack" 
            BackColor="WhiteSmoke" 
            BusinessBeginsHour="0"
            BusinessEndsHour="24" 
            CssOnly="False" 
            EventBackColor="#66FF99"
            HourBorderColor="Lime" 
            HourHalfBorderColor="#0066FF"
            HourNameBackColor="#6699FF" 
            HourNameBorderColor="#0066FF" 
            HoverColor="#33CCFF"
            NonBusinessBackColor="#0066FF"
            Style="top: -1px; left: 8px; margin-right: 6px;" dayendshour="6"
            TimeFormat="Clock12Hours" 
            OnEventClick="dayCalender_EventClick" />

        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>

        <!-- Testing purpose -->
        <asp:Label ID="lblTest" runat="server"></asp:Label>

        <button id="btnTest" runat="server" style="display: none"></button>
        <button id="btnTest1" runat="server" style="display: none"></button>

        <asp:ModalPopupExtender ID="ModalPopupExtender1" runat="server" CancelControlID="btnOk"
            PopupControlID="Panel1" TargetControlID="btnTest"
            PopupDragHandleControlID="PopupHeader" Drag="true"
            BackgroundCssClass="ModalPopup">
        </asp:ModalPopupExtender>
        <asp:Panel ID="Panel1" Style="display: none;" runat="server">

            <div class="Popup" style="background-color: wheat">
                <div class="Controls" style="float: right;">
                    <input id="btnOk" type="button" style="color: black; background-color: red; font-size: 18pt; font-weight: bold;" value="X" />
                </div>
                <h4 style="text-align: center;"><asp:Label Id="lblHeader" runat="server"></asp:Label> Notification of Potential Service Interruption
                </h4>
                <div class="PopupBody">
                    <table>
                        <tr>
                            <td><strong>Circuit Identity:</strong> </td>
                            <td>
                                <asp:Label ID="lblCCTID" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td><strong>Reference for</strong> </td>
                            <td><strong>SSCNM:</strong></td>
                            <td>
                                <asp:Label ID="lblSSCNM" runat="server"></asp:Label></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td><strong>NOC:</strong></td>
                            <td>
                                <asp:Label ID="lblNOC" runat="server"></asp:Label></td>
                        </tr>
                        <tr>
                            <td><strong>Nature of Work or Fault:</strong></td>
                            <td>
                                <asp:Label ID="lblNatureWork" runat="server"></asp:Label></td>
                        </tr>
                        <tr>
                            <td><strong>Service Impact:</strong></td>
                            <td>
                                <asp:Label ID="lblService" runat="server"></asp:Label></td>
                        </tr>
                         <tr>
                            <td><strong>Failure Date:</strong></td>
                            <td>
                                <asp:Label ID="lblStartDate" runat="server"></asp:Label></td>
                        </tr>
                        <tr>
                            <td><strong>Finish Date:</strong></td>
                            <td>
                                <asp:Label ID="lblEcdDate" runat="server"></asp:Label></td>
                        </tr>
                        <tr>
                            <td><strong>Site A Address:</strong></td>
                            <td>
                                <asp:Label ID="lblAAddLine1" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td>
                                <asp:Label ID="lblAAddLine2" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td>
                                <asp:Label ID="lblAAddLine3" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td>
                                <asp:Label ID="lblAAddLine4" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td>
                                <asp:Label ID="lblAAddLine5" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td><strong>Site B Address:</strong></td>
                            <td>
                                <asp:Label ID="lblBAddLine1" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td>
                                <asp:Label ID="lblBAddLine2" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td>
                                <asp:Label ID="lblBAddLine3" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td>
                                <asp:Label ID="lblBAddLine4" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td>
                                <asp:Label ID="lblBAddLine5" runat="server"></asp:Label>
                            </td>

                        </tr>
                        <tr>
                            <td><strong>Site A:</strong></td>
                            <td><strong>Hostname:</strong></td>
                            <td>
                                <asp:Label ID="lblHostnameA" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td><strong>IP Address:</strong></td>
                            <td>
                                <asp:Label ID="lblAIPAddress" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td><strong>Site B:</strong></td>
                            <td><strong>Hostname:</strong></td>
                            <td>
                                <asp:Label ID="lblHostnameB" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td><strong>IP Address:</strong></td>
                            <td>
                                <asp:Label ID="lblBIPAddress" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td><strong>Associated LineTags:</strong></td>
                            <td>
                                <asp:Label ID="lblAssociatedLineTags" runat="server"></asp:Label></td>
                        </tr>
                        <tr>
                            <td><strong>Speed:</strong></td>
                            <td>
                                <asp:Label ID="lblSpeed" runat="server"></asp:Label></td>
                        </tr>
                    </table>
                </div>

            </div>
        </asp:Panel>

        <asp:ModalPopupExtender ID="ModalPopupExtender2" runat="server" CancelControlID="btnOk1"
            PopupControlID="Panel2" TargetControlID="btnTest1"
            PopupDragHandleControlID="PopupHeader" Drag="true"
            BackgroundCssClass="ModalPopup">
        </asp:ModalPopupExtender>
        <asp:Panel ID="Panel2" Style="display: none;" runat="server">

            <div class="Popup" style="background-color: wheat">
                <div class="Controls" style="float: right;">
                    <input id="btnOk1" type="button" style="color: black; background-color: red; font-size: 18pt; font-weight: bold;" value="X" />
                </div>
                <h4 style="text-align: center;"><asp:Label Id="LablblHeader1" runat="server"></asp:Label> Notification of Potential Service Interruption
                </h4>
                <div class="PopupBody">
                    <table>
                        <tr>
                            <td><strong>Circuit Identity:</strong> </td>
                            <td>
                                <asp:Label ID="lblCCTID1" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td><strong>Reference for</strong> </td>
                            <td><strong>SSCNM:</strong></td>
                            <td>
                                <asp:Label ID="lblSSCNM1" runat="server"></asp:Label></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td><strong>NOC:</strong></td>
                            <td>
                                <asp:Label ID="lblNOC1" runat="server"></asp:Label></td>
                        </tr>
                        <tr>
                            <td><strong>Nature of Work or Fault:</strong></td>
                            <td>
                                <asp:Label ID="lblNature" runat="server"></asp:Label></td>
                        </tr>
                        <tr>
                            <td><strong>Service Impact:</strong></td>
                            <td>
                                <asp:Label ID="lblService1" runat="server"></asp:Label></td>
                        </tr>
                         <tr>
                            <td><strong>Failure Date:</strong></td>
                            <td>
                                <asp:Label ID="lblFailure" runat="server"></asp:Label></td>
                        </tr>
                        <tr>
                            <td><strong>Finish Date:</strong></td>
                            <td>
                                <asp:Label ID="lblFinish" runat="server"></asp:Label></td>
                        </tr>
                    </table>
                </div>

            </div>
        </asp:Panel>

    </div>
    <hr />
    <%--<asp:XmlDataSource ID="XmlDataSource1" runat="server" XPath="/Faults/Fault" DataFile="~/App_Data/Maintenance.xml"></asp:XmlDataSource>--%>
</asp:Content>

