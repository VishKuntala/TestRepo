﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="BYOC.aspx.cs" Inherits="sales_Engineering_BYOC_BYOC" %>

<!DOCTYPE html>

<html>
<head runat="server">
	<title>Engineering</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <asp:Literal id="ltlHeaderLinks" runat="server"></asp:Literal>
 </head>
  <body>
    <form id="formbyoc" runat="server">
        <asp:HiddenField id="hdnViewerAttId" runat="server"></asp:HiddenField>
        <asp:HiddenField id="hdnBaseSearchApiUrl" runat="server"></asp:HiddenField>
        <asp:HiddenField id="hdnViewerGroupMembership" runat="server"></asp:HiddenField>
        <asp:HiddenField id="hdnToken" runat="server"></asp:HiddenField>
        <asp:Literal id="ltlModulesJsTag" runat="server"></asp:Literal>
    </form>
      <ponder-app></ponder-app>
  </body>
     
    
</html>
