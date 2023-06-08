<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Scoring.aspx.cs" Inherits="sales_AWB_scoring_Scoring" %>

<!DOCTYPE html>
<html>
<head runat="server">
	<title>PONDER - WBB Scoring</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <asp:Literal id="ltlHeaderLinks" runat="server"></asp:Literal>
</head>
<body>
<form id="formscoring" runat="server">
	  <asp:HiddenField id="hdnViewerAttId" runat="server"></asp:HiddenField>
<asp:Literal id="ltlModulesJsTag" runat="server"></asp:Literal>
</form>
      <ponder-app></ponder-app>
      
</body>
</html>


