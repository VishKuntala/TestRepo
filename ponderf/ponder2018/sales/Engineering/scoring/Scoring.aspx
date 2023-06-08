<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Scoring.aspx.cs" Inherits="sales_Engineering_scoring_Scoring" %>

<!DOCTYPE html>
<html>
<head runat="server">
	<title>Engineering - Scoring</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <asp:Literal id="ltlHeaderLinks" runat="server"></asp:Literal>
</head>
<body>
<form id="formscoring" runat="server">
      <asp:HiddenField id="hdnViewerGroupMembership" runat="server"></asp:HiddenField>
	  <asp:HiddenField id="hdnViewerAttId" runat="server"></asp:HiddenField>
      <asp:HiddenField id="hdnBaseSearchApiUrl" runat="server"></asp:HiddenField>
      <asp:HiddenField id="hdnToken" runat="server"></asp:HiddenField>
<asp:Literal id="ltlModulesJsTag" runat="server"></asp:Literal>
</form>
      <ponder-app></ponder-app>
      
</body>
</html>


