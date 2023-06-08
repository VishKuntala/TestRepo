<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Scoring.aspx.cs" Inherits="sales_scoring_Scoring" %>

<!DOCTYPE html>
<html>
<head runat="server">
	<title>PONDER - Fusion</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <asp:Literal id="ltlHeaderLinks" runat="server"></asp:Literal>
</head>
<body>
<form id="formscoring" runat="server">
        <asp:HiddenField id="hdnViewerGroupMembership" runat="server"></asp:HiddenField>
	    <asp:HiddenField id="hdnViewerAttId" runat="server"></asp:HiddenField>
        <asp:HiddenField id="hdnToken" runat="server"></asp:HiddenField>
        <asp:HiddenField id="hdnBaseApiUrl" runat="server"></asp:HiddenField>
        <asp:HiddenField id="hdnRootUrl" runat="server"></asp:HiddenField>
        <asp:HiddenField id="hdnBaseSearchApiUrl" runat="server"></asp:HiddenField>
        <asp:HiddenField id="hdnMapTilerKey" runat="server"></asp:HiddenField>
        <asp:HiddenField id="hdnMapBoxKey" runat="server"></asp:HiddenField>
        <asp:HiddenField id="hdnAppName" runat="server"></asp:HiddenField>
        <asp:Literal id="ltlModulesJsTag" runat="server"></asp:Literal>
        <asp:HiddenField id="hdnClusterLayer" runat="server"></asp:HiddenField>
        <asp:HiddenField id="hdnSatelliteLayerStyleUrl" runat="server"></asp:HiddenField>
</form>
      <ponder-app></ponder-app>
      
</body>
</html>


