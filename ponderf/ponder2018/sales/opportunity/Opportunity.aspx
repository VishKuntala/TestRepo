<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Opportunity.aspx.cs" Inherits="sales_scoring_Opportunity" %>

<!DOCTYPE html>
<html>
    <head runat="server">
	    <title>Sales Opportunity</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <asp:Literal id="ltlHeaderLinks" runat="server"></asp:Literal>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
    </head>
    <body>
        <form id="formscoring" runat="server">
            <asp:HiddenField id="hdnViewerGroupMembership" runat="server"></asp:HiddenField>
	        <asp:HiddenField id="hdnViewerAttId" runat="server"></asp:HiddenField>
            <asp:HiddenField id="hdnBaseApiUrl" runat="server"></asp:HiddenField>
            <asp:HiddenField id="hdnRootUrl" runat="server"></asp:HiddenField>
            <asp:HiddenField id="hdnBaseSearchApiUrl" runat="server"></asp:HiddenField>
            <asp:HiddenField id="hdnToken" runat="server"></asp:HiddenField>
            <asp:Literal id="ltlModulesJsTag" runat="server"></asp:Literal>
            <asp:HiddenField ID="hdnUser" runat="server" ClientIDMode="Static" />
            <asp:HiddenField ID="hdnAccess" runat="server" ClientIDMode="Static" />
            <asp:HiddenField ID="hdnArAccess" runat="server" ClientIDMode="Static" />
            <asp:HiddenField ID="hdnAceAccess" runat="server" ClientIDMode="Static" />
            <asp:HiddenField ID="hdnIsACCUser" runat="server" ClientIDMode="Static" />
            <asp:Literal id="ltlAcknowledgeConfidentialityFlag" runat="server"></asp:Literal>
            <asp:HiddenField ID="hdnMapTilerKey" runat="server" ClientIDMode="Static" />
            <asp:HiddenField ID="hdnMapBoxKey" runat="server" ClientIDMode="Static" />  
            <asp:HiddenField id="hdnSatelliteLayerStyleUrl" runat="server"></asp:HiddenField>
            <asp:HiddenField id="hdnAzureMapKey" runat="server"></asp:HiddenField>
        </form>
        <ponder-app></ponder-app>
    </body>
</html>






