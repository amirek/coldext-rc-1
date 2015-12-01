<cfsetting enablecfoutputonly="true">

<cfif not StructKeyExists(request, "_coldext_ux_gridrowactions")>


<cfoutput>
<cfsavecontent variable="resources">
<script type="text/javascript" src="#Application.ColdExt.js#/ux/gridrowactions/Ext.ux.grid.RowActions.js"></script>
<link rel="stylesheet" type="text/css" href="#Application.ColdExt.js#/ux/gridrowactions/Ext.ux.grid.RowActions.css" />
</cfsavecontent>
</cfoutput>

<cfset request._coldext_ux_gridrowactions = true>
<cfset includeResources(resources)>


</cfif>

<cfsetting enablecfoutputonly="false">