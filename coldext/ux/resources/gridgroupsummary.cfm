<cfsetting enablecfoutputonly="true">

<cfif not StructKeyExists(request, "_coldext_ux_gridgroupsummary")>


<cfoutput>
<cfsavecontent variable="resources">
<script type="text/javascript" src="#Application.ColdExt.js#/ux/gridgroupsummary/GroupSummary.js"></script>
<link rel="stylesheet" type="text/css" href="#Application.ColdExt.js#/ux/gridgroupsummary/summary.css" />
</cfsavecontent>
</cfoutput>

<cfset request._coldext_ux_gridgroupsummary = true>
<cfset includeResources(resources)>


</cfif>

<cfsetting enablecfoutputonly="false">