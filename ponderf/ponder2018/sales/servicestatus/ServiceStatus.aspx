<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ServiceStatus.aspx.cs" Inherits="sales_servicestatus_ServiceStatus" %>
<!DOCTYPE html>
<html>
<head runat="server">
	<title>Ponder - Direct</title>
     <meta name="viewport" content="width=device-width, initial-scale=1">
     <asp:Literal id="ltlHeaderLinks" runat="server"></asp:Literal>
 </head>
  <body>
      <form id="formscoring" runat="server">
        <asp:HiddenField id="hdnViewerAttId" runat="server"></asp:HiddenField>
        <asp:HiddenField id="hdnToken" runat="server"></asp:HiddenField>
        <asp:HiddenField id="hdnBaseSearchApiUrl" runat="server"></asp:HiddenField>
        <asp:HiddenField id="hdnRootUrl" runat="server"></asp:HiddenField>
        <asp:HiddenField id="hdnViewerGroupMembership" runat="server"></asp:HiddenField>
      </form>

      <ponder-app></ponder-app>
   <asp:Literal id="ltlModulesJsTag" runat="server"></asp:Literal>
        
  </body>
     
    
</html>





