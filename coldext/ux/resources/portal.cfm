<cfsetting enablecfoutputonly="true">

<cfif not StructKeyExists(request, "_coldext_ux_portal")>


<cfoutput>
<cfsavecontent variable="resources">
<script type="text/javascript" src="#Application.ColdExt.js#/ux/portal/Portal.js"></script>
<script type="text/javascript" src="#Application.ColdExt.js#/ux/portal/PortalColumn.js"></script>
<script type="text/javascript" src="#Application.ColdExt.js#/ux/portal/Portlet.js"></script>
<link rel="stylesheet" type="text/css" href="#Application.ColdExt.js#/ux/portal/portal.css" />
</cfsavecontent>
</cfoutput>

<cfset request._coldext_ux_portal = true>
<cfset includeResources(resources)>


</cfif>

<cfsetting enablecfoutputonly="false">