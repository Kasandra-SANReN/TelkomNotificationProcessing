<%@ Page Title="" Language="C#" MaintainScrollPositionOnPostback="true"  MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="AllCircuit.aspx.cs" Inherits="AllCircuit" %>

<asp:Content ID="Content3" ContentPlaceHolderID="title" runat="Server">
    Circuit Information
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="CurrentProcess" Runat="Server">
    <label style="text-align:center; font-size:14pt; font-weight:bold">
       Message Board
    </label>
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentBody" Runat="Server">
    <script src="js/jquery-1.8.3.js" type="text/javascript"></script>
    <script type="text/javascript" src="js/jquery-ui-1.9.2.custom.min.js"></script>
    <link rel="stylesheet" type="text/css" href="css/jquery-ui.css" />
    <script type="text/javascript">
        $('#tCircuit').addClass('tabActive');
        $('#myModal').modal(options);
    </script>
    <hr />
    <asp:GridView ID="gvCircuit"   AllowPaging="True"  emptydatatext="No data available." AllowSorting="True" OnPageIndexChanging="gvCircuit_PageIndexChanging" DataKeyNames="CCTID"
        runat="server" AutoGenerateColumns="False" OnSorting="gvCircuit_Sorting"
         Width="100%" CellPadding="4">
        
         <RowStyle CssClass="personGridRow" />
        <HeaderStyle ForeColor="Black"  />
        <AlternatingRowStyle CssClass="personGridAlternateRow" />
        <PagerSettings FirstPageImageUrl="~/Images/next.png" NextPageImageUrl="~/Images/next.png" LastPageImageUrl="~/Images/Previous.png" PreviousPageImageUrl="~/Images/Previous.png" Mode="NextPrevious" />
       
        <PagerStyle HorizontalAlign="Center" ForeColor="Black" Font-Size="14pt" />
    </asp:GridView>
    <div class="navArea">
        <asp:Button ID="btnAddCircuit" runat="server" CausesValidation="false" OnClick="btnAddCircuit_Click" Text="Add New Circuit" />
    </div>
</asp:Content>

