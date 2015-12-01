<cfsetting enablecfoutputonly="true">

<cfif not StructKeyExists(request, "_coldext_ux_gridsearch")>


<cfoutput>
<cfsavecontent variable="resources">
<script type="text/javascript" src="#Application.ColdExt.js#/ux/gridsearch/Ext.ux.grid.Search.js"></script>
<link rel="stylesheet" type="text/css" href="#Application.ColdExt.js#/ux/gridsearch/gridsearch.css" />
</cfsavecontent>
</cfoutput>

<cfset request._coldext_ux_gridsearch = true>
<cfset includeResources(resources)>


</cfif>

<cfsetting enablecfoutputonly="false">