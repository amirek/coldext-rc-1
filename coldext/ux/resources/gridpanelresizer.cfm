<cfsetting enablecfoutputonly="true">

<cfif not StructKeyExists(request, "_coldext_ux_gridpanelresizer")>


<cfoutput>
<cfsavecontent variable="resources">
<script type="text/javascript" src="#Application.ColdExt.js#/ux/gridpanelresizer/PanelResizer.js"></script>
<link rel="stylesheet" type="text/css" href="#Application.ColdExt.js#/ux/gridpanelresizer/PanelResizer.css" />
</cfsavecontent>
</cfoutput>

<cfset request._coldext_ux_gridpanelresizer = true>
<cfset includeResources(resources)>


</cfif>

<cfsetting enablecfoutputonly="false">