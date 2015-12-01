<cfsetting enablecfoutputonly="true">

<cfif not StructKeyExists(request, "_coldext_ux_gridrowexpander")>


<cfoutput>
<cfsavecontent variable="resources">
<script type="text/javascript" src="#Application.ColdExt.js#/ux/gridrowexpander/RowExpander.js"></script>
</cfsavecontent>
</cfoutput>

<cfset request._coldext_ux_gridrowexpander = true>
<cfset includeResources(resources)>


</cfif>

<cfsetting enablecfoutputonly="false">