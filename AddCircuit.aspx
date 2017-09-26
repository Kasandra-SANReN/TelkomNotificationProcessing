<%@ Page Title="" Language="C#" MaintainScrollPositionOnPostback="true" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="AddCircuit.aspx.cs" Inherits="AddCircuit" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content3" ContentPlaceHolderID="title" runat="Server">
    Insert Circuit Information
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="CurrentProcess" Runat="Server">
    <label style="text-align:center; font-size:14pt; font-weight:bold">
        Insert Circuit Information
    </label>
    
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentBody" runat="Server">

    <script src="../Scripts/bootstrap-modal.js"></script>
    <link href="../CSS/bootstrap.css" rel="stylesheet" />
    <link href="../CSS/OurMasterStyleSheet.css" rel="stylesheet" />
    <link href="../CSS/jquery-ui.css" rel="stylesheet" />
    <script src="../Scripts/jquery-1.7.1.js"></script>
    <script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>

    <!-----AUTOCOMPLETE ----->

    <script src="js/jquery-1.8.3.js" type="text/javascript"></script>
    <script type="text/javascript" src="js/jquery-ui-1.9.2.custom.min.js"></script>
    <link rel="stylesheet" type="text/css" href="css/jquery-ui.css" />
    <script type="text/javascript">
        $('#tCircuit').addClass('tabActive');
        $('#myModal').modal(options);
    </script>

    <!----- END AUTOCOMPLETE ----->

    <asp:ScriptManager runat="server" ID="sm1" />
    <hr />
    <asp:MultiView ID="multiAddEmp" runat="server" ActiveViewIndex="0">

        <asp:View ID="siteHostnameView" runat="server">
            <asp:Panel ID="panelNavigationView1" runat="server" CssClass="TabContainer">

                <div class="nv">
                    <ul>
                        <li class="active"><a href="#panel1">Site Hostname</a></li>
                        <li><a href="#">***Site IP Address</a></li>
                        <li><a href="#">***Site A Physical Address</a></li>
                        <li><a href="#">***Site B Physical Address</a></li>
                    </ul>
                </div>


                <asp:Label ID="lblOne" runat="server" Visible="false" Text="Site Hostname" CssClass="TabItemActive" />
                <asp:LinkButton ID="lnkBContact" runat="server" Visible="false" Text="Site IP Address" CssClass="TabItemInactive" CommandName="ipAddress" />
                <asp:LinkButton ID="LinkButton1" runat="server" Visible="false" Text="Site A Physical Address" CssClass="TabItemInactive" CommandName="siteAphysicalAddress" />
                <asp:LinkButton ID="LinkButton4" runat="server" Visible="false" Text="Site B Physical Address" CssClass="TabItemInactive" CommandName="siteBphysicalAddress" />
            </asp:Panel>

            <asp:Panel ID="panelView1" runat="server" CssClass="contentPanel">
                <h5>Site Hostname</h5>
                <label class="alert alert-info">
                    <i>Fields marked in asterisk(*) are required fields<br />
                        Fill in your information below and press <strong>Next</strong>
                    </i>
                </label>
                <hr />
                <table>
                    <tr>
                        <td></td>
                        <td>
                            <label id="lblCCTIDError" visible="false" runat="server" class="error"></label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label><strong>CCTID:</strong></label></td>
                        <td>

                            <asp:TextBox ID="txtCctid" runat="server" Width="250" CssClass="field required" AutoPostBack="true" OnTextChanged="txtCctid_TextChanged" />
                            <asp:RequiredFieldValidator ID="reg1" SetFocusOnError="true" Display="Dynamic" CssClass=""
                                runat="server" ControlToValidate="txtCctid" ForeColor="White" Text="Enter a circuit identity">
                            </asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="reg24" Display="Dynamic" ForeColor="White" SetFocusOnError="true" CssClass="error" runat="server"
                                ControlToValidate="txtCctid" Text="Enter 9 digits of circuit identity"
                                ValidationExpression="[0-9]{9}">
                            </asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label><strong>Site A Hostname:</strong></label></td>
                        <td>
                            <asp:TextBox ID="txtSiteAHost" runat="server" Width="250" />
                            <asp:RequiredFieldValidator ID="reg2" SetFocusOnError="true" CssClass="error" Display="Dynamic"
                                runat="server" ControlToValidate="txtSiteAHost" ForeColor="White" Text="Enter a Site A Hostname">
                            </asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label><strong>Site B Hostname:</strong></label></td>
                        <td>
                            <asp:TextBox ID="txtSiteBHost" runat="server" Width="250" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" SetFocusOnError="true" CssClass="error" Display="Dynamic"
                                runat="server" ControlToValidate="txtSiteBHost" ForeColor="White" Text="Enter a Site B Hostname">
                            </asp:RequiredFieldValidator>
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <label><strong>Associated LineTags:</strong></label></td>
                        <td>
                            <asp:TextBox ID="txtLineTags" runat="server" Width="250" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" SetFocusOnError="true" CssClass="error" Display="Dynamic"
                                runat="server" ControlToValidate="txtLineTags" ForeColor="White" Text="Enter Associated LineTags">
                            </asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <input type="button" id="Button4" data-toggle="modal" data-target="#CancelForm" class="cancel" value="Cancel" />
                            <asp:Button ID="Button5" CausesValidation="true" UseSubmitBehavior="true" runat="server" Text="Next" CommandName="NextView" />
                        </td>
                    </tr>
                </table>
            </asp:Panel>
        </asp:View>
        <asp:View ID="ipAddress" runat="server">
            <asp:Panel ID="panel1" runat="server" CssClass="TabContainer">

                <div class="nv">
                    <ul>

                        <li><a href="#">Site Hostname</a></li>
                        <li class="active"><a href="#panel1">***Site IP Address</a></li>
                        <li><a href="#">***Site A Physical Address</a></li>
                        <li><a href="#">***Site B Physical Address</a></li>
                    </ul>
                </div>
                <asp:LinkButton ID="LinkButton2" runat="server" Visible="false" Text="Site Hostname" CssClass="TabItemInactive" CommandName="siteHostName" />
                <asp:Label ID="Label1" runat="server" Visible="false" Text="Site IP Address" CssClass="TabItemActive" />
                <asp:LinkButton ID="LinkButton3" runat="server" Visible="false" Text="Site A Physical Address" CssClass="TabItemInactive" CommandName="siteAphysicalAddress" />
                <asp:LinkButton ID="LinkButton5" runat="server" Visible="false" Text="Site B Physical Address" CssClass="TabItemInactive" CommandName="siteBphysicalAddress" />
            </asp:Panel>

            <asp:Panel ID="panel2" runat="server" CssClass="contentPanel">
                <h5>Site IP Address</h5>
                <label class="alert alert-info">
                    <i>Fields marked in asterisk(*) are required fields<br />
                        Fill in your information below and press <strong>Next</strong>
                    </i>
                </label>
                <hr />
                <table>
                    <tr>
                        <td>
                            <label><strong>Site A IP Address:</strong></label></td>
                        <td>
                            <asp:TextBox ID="txtAIPAddress" AutoPostBack="true" OnTextChanged="txtAIPAddress_TextChanged" runat="server" Width="180" />
                            <asp:MaskedEditExtender ID="MaskedEditExtender1" ErrorTooltipCssClass="error" runat="server" TargetControlID="txtAIPAddress" Mask="999\.999\.999\.999" MaskType="Number" ClearMaskOnLostFocus="false" Filtered="*" AutoComplete="false" InputDirection="LeftToRight" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" SetFocusOnError="true" CssClass="error" Display="Dynamic"
                                runat="server" ControlToValidate="txtAIPAddress" ForeColor="White" Text="Enter Site A IP Address">
                            </asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label><strong>Site B IP Address:</strong></label></td>
                        <td>

                            <asp:TextBox ID="txtBIPAddress" ReadOnly="true" runat="server" Width="180" />
                            <asp:MaskedEditExtender ID="MaskedEditExtender2" ErrorTooltipCssClass="error" runat="server" TargetControlID="txtBIPAddress" Mask="999\.999\.999\.999" MaskType="Number" ClearMaskOnLostFocus="false" Filtered="*" AutoComplete="false" InputDirection="LeftToRight" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label><strong>Speed:</strong></label></td>
                        <td>
                            <asp:TextBox ID="txtSpeed" runat="server" Width="80" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" SetFocusOnError="true" CssClass="error" Display="Dynamic"
                                runat="server" ControlToValidate="txtSpeed" ForeColor="White" Text="Enter a Speed">
                            </asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <input type="button" id="Button6" data-toggle="modal" data-target="#CancelForm" class="cancel" value="Cancel" />
                            <asp:Button ID="Button11" runat="server" CommandName="PrevView" Text="Previous" />
                            <asp:Button ID="Button7" CausesValidation="true" UseSubmitBehavior="true" runat="server" Text="Next" CommandName="NextView" />
                        </td>
                    </tr>
                </table>
            </asp:Panel>
        </asp:View>
        <asp:View ID="siteAPhysicalAddressView" runat="server">
            <asp:Panel ID="panel3" runat="server" CssClass="TabContainer">

                <div class="nv">
                    <ul>

                        <li><a href="#">Site Hostname</a></li>

                        <li><a href="#">***Site IP Address</a></li>
                        <li class="active"><a href="#panel1">***Site A Physical Address</a></li>
                        <li><a href="#">***Site B Physical Address</a></li>
                    </ul>
                </div>
                <asp:LinkButton ID="LinkButton6" runat="server" Visible="false" Text="Site Hostname" CssClass="TabItemInactive" CommandName="siteHostName" />
                <asp:LinkButton ID="LinkButton7" runat="server" Visible="false" Text="Site IP Address" CssClass="TabItemInactive" CommandName="ipAddress" />
                <asp:Label ID="Label2" runat="server" Visible="false" Text="Site A Physical Address" CssClass="TabItemActive" />
                <asp:LinkButton ID="LinkButton8" runat="server" Visible="false" Text="Site B Physical Address" CssClass="TabItemInactive" CommandName="siteBphysicalAddress" />
            </asp:Panel>

            <asp:Panel ID="panel4" runat="server" CssClass="contentPanel">
                <h5>Site A Physical Address</h5>
                <label class="alert alert-info">
                    <i>Fields marked in asterisk(*) are required fields<br />
                        Fill in your information below and press <strong>Next</strong>
                    </i>
                </label>
                <hr />
                <table>

                    <tr>
                        <td>
                            <label><strong>Address Line 1:</strong></label></td>
                        <td>
                            <asp:DropDownList ID="drpAAddLine1" ToolTip="Select Address Line 1" runat="server" AutoPostBack="true" OnSelectedIndexChanged="drpAAddLine1_SelectedIndexChanged" />
                            <br />
                            <asp:Panel ID="panelAAddLine1" Visible="false" runat="server">
                                <asp:TextBox ID="txtAAddLine1" runat="server" Width="250" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" SetFocusOnError="true" CssClass="error" Display="Dynamic"
                                    runat="server" ControlToValidate="txtAAddLine1" ForeColor="White" Text="Enter Address Line 1">
                                </asp:RequiredFieldValidator>
                            </asp:Panel>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label><strong>Address Line 2:</strong></label></td>
                        <td>
                            <asp:TextBox ID="txtAAddLine2" runat="server" Width="250" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" SetFocusOnError="true" CssClass="error" Display="Dynamic"
                                runat="server" ControlToValidate="txtAAddLine2" ForeColor="White" Text="Enter Address Line 2">
                            </asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label><strong>Address Line 3:</strong></label></td>
                        <td>
                            <asp:TextBox ID="txtAAddLine3" runat="server" Width="250" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" SetFocusOnError="true" CssClass="error" Display="Dynamic"
                                runat="server" ControlToValidate="txtAAddLine3" ForeColor="White" Text="Enter Address Line 3">
                            </asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label><strong>Address Line 4:</strong></label></td>
                        <td>
                            <asp:TextBox ID="txtAAddLine4" runat="server" Width="250" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" SetFocusOnError="true" CssClass="error" Display="Dynamic"
                                runat="server" ControlToValidate="txtAAddLine4" ForeColor="White" Text="Enter Address Line 4">
                            </asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label><strong>Postal Code:</strong></label></td>
                        <td>
                            <asp:TextBox ID="txtAAddLine5" runat="server" Width="60" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" SetFocusOnError="true" CssClass="error" Display="Dynamic"
                                runat="server" ControlToValidate="txtAAddLine5" ForeColor="White" Text="Enter Postal Code">
                            </asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" Display="Dynamic" ForeColor="White" SetFocusOnError="true" CssClass="error" runat="server"
                                ControlToValidate="txtAAddLine5" Text="Enter 4 digits of postal code"
                                ValidationExpression="[0-9]{4}">
                            </asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <input type="button" id="Button8" data-toggle="modal" data-target="#CancelForm" class="cancel" value="Cancel" />
                            <asp:Button ID="Button10" runat="server" CommandName="PrevView" Text="Previous" />
                            <asp:Button ID="Button9" CausesValidation="true" UseSubmitBehavior="true" runat="server" Text="Next" CommandName="NextView" />
                        </td>
                    </tr>
                </table>
            </asp:Panel>
        </asp:View>
        <asp:View ID="siteBPhysicalAddressView" runat="server">
            <asp:Panel ID="panelNavigation2" runat="server" CssClass="TabContainer">
                <div class="nv">
                    <ul>
                        <li><a href="#panel1">Site Hostname</a></li>
                        <li><a href="#">***Site IP Address</a></li>
                        <li><a href="#">***Site A Physical Address</a></li>
                        <li class="active"><a href="#">***Site B Physical Address</a></li>
                    </ul>
                </div>
                <asp:LinkButton ID="lnkB_Personal" Visible="false" runat="server" CssClass="TabItemInactive" Text="" CommandName="siteHostname" />
                <asp:Label ID="lbl3" runat="server" Visible="false" CssClass="TabItemActive" Text="" />
                <asp:LinkButton ID="lnkB_bank" Visible="false" CssClass="TabItemInactive" runat="server" Text="" CommandName="siteAphysicalAddress" />
                <asp:LinkButton ID="LinkButton9" Visible="false" CssClass="TabItemInactive" runat="server" Text="" CommandName="siteBphysicalAddress" />
            </asp:Panel>
            <asp:Panel ID="panelView2" CssClass="contentPanel" runat="server">
                <label id="lblHeader" runat="server" style="font-weight: bold; font-size: 13pt;"></label>
                <h5>Site B Physical Address</h5>
                <label class="alert alert-info">
                    <i>Fields marked in asterisk(*) are required fields<br />
                        Fill in your information below and press <strong>Next</strong>
                    </i>
                </label>
                <hr />
                <table>
                    <tr>
                        <td></td>
                        <td>
                            <label id="lblErrorAdddLine" visible="false" runat="server" class="error"></label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label><strong>Address Line 1:</strong></label></td>
                        <td>
                            <asp:DropDownList ID="drpBAddLine1" ToolTip="Select Address Line 1" runat="server" AutoPostBack="true" OnSelectedIndexChanged="drpBAddLine1_SelectedIndexChanged" />
                            <br />
                            <asp:Panel ID="panelBAddLine1" Visible="false" runat="server">
                                <asp:TextBox ID="txtBAddLine1" runat="server" Width="250" />
                                <asp:RequiredFieldValidator ID="regSiteBAddLine1" SetFocusOnError="true" CssClass="error" Display="Dynamic"
                                    runat="server" ControlToValidate="txtBAddLine1" ForeColor="White" Text="Enter Address Line 1">
                                </asp:RequiredFieldValidator>
                            </asp:Panel>
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <label><strong>Address Line 2:</strong></label></td>
                        <td>
                            <asp:TextBox ID="txtBAddLine2" runat="server" Width="250" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator10" SetFocusOnError="true" CssClass="error" Display="Dynamic"
                                runat="server" ControlToValidate="txtBAddLine2" ForeColor="White" Text="Enter Address Line 2">
                            </asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label><strong>Address Line 3:</strong></label></td>
                        <td>
                            <asp:TextBox ID="txtBAddLine3" runat="server" Width="250" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator11" SetFocusOnError="true" CssClass="error" Display="Dynamic"
                                runat="server" ControlToValidate="txtBAddLine3" ForeColor="White" Text="Enter Address Line 3">
                            </asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label><strong>Address Line 4:</strong></label></td>
                        <td>
                            <asp:TextBox ID="txtBAddLine4" runat="server" Width="250" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator12" SetFocusOnError="true" CssClass="error" Display="Dynamic"
                                runat="server" ControlToValidate="txtBAddLine4" ForeColor="White" Text="Enter Address Line 4">
                            </asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label><strong>Postal Code:</strong></label></td>
                        <td>
                            <asp:TextBox ID="txtBAddLine5" runat="server" Width="60" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator13" SetFocusOnError="true" CssClass="error" Display="Dynamic"
                                runat="server" ControlToValidate="txtBAddLine5" ForeColor="White" Text="Enter Postal Code">
                            </asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" Display="Dynamic" ForeColor="White" SetFocusOnError="true" CssClass="error" runat="server"
                                ControlToValidate="txtBAddLine5" Text="Enter 4 digits of postal code"
                                ValidationExpression="[0-9]{4}">
                            </asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>

                            <input type="button" id="Button1" data-toggle="modal" data-target="#CancelForm" class="cancel" value="Cancel" />
                            <asp:Button ID="Button3" runat="server" CommandName="PrevView" Text="Previous" />
                            <input type="button" runat="server" id="Button12" data-toggle="modal" value="Save" causesvalidation="true" class="cancel" data-target="#SubmitForm" />
                        </td>
                    </tr>
                </table>
            </asp:Panel>

        </asp:View>
    </asp:MultiView>
    <div id="submit">
        <div id="SubmitForm" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-header">
                <button type="submit" id="Button26" runat="server" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h3 id="H9">Confirmation Message</h3>
            </div>
            <div class="modal-body">
                <p>
                    Are you sure you want to save circuit identity
                                <asp:Label ID="lblName" runat="server" />
                    Record
                </p>
            </div>
            <div class="modal-footer">
                <asp:Button ID="btnSubmit" CssClass="btn btn-primary" CausesValidation="true" UseSubmitBehavior="true" OnClick="btnSubmit_Click" runat="server" Text="Yes" />

                <%-- <button class="btn btn-primary">Submit</button>--%>
                <button class="btn" data-dismiss="modal" aria-hidden="true">No</button>
            </div>
        </div>
    </div>
    <!-- Modal -->
    <div id="CancelForm" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-header">
            <button type="submit" id="Button2" runat="server" class="close" data-dismiss="modal" aria-hidden="true">×</button>
            <h3 id="H2">Warning Message</h3>
        </div>
        <div class="modal-body">
            <p>Are you sure you want to cancel</p>
        </div>
        <div class="modal-footer">
            <asp:Button ID="btnCancel" CssClass="btn btn-primary" CausesValidation="false" UseSubmitBehavior="false" OnClick="btnCancel_Click" runat="server" Text="Yes" />

            <%-- <button class="btn btn-primary">Submit</button>--%>
            <button class="btn" data-dismiss="modal" aria-hidden="true">No</button>
        </div>
    </div>
</asp:Content>

