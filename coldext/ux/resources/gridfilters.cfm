<cfsetting enablecfoutputonly="true">

<cfif not StructKeyExists(request, "_coldext_ux_gridfilters")>


<cfoutput>
<cfsavecontent variable="resources">
<script type="text/javascript" src="#Application.ColdExt.js#/ux/gridfilters/menu/EditableItem.js"></script>
<script type="text/javascript" src="#Application.ColdExt.js#/ux/gridfilters/menu/ListMenu.js"></script>
<script type="text/javascript" src="#Application.ColdExt.js#/ux/gridfilters/menu/RangeMenu.js"></script>
<script type="text/javascript" src="#Application.ColdExt.js#/ux/gridfilters/menu/TreeMenu.js"></script>
<script type="text/javascript" src="#Application.ColdExt.js#/ux/gridfilters/grid/GridFilters.js"></script>
<script type="text/javascript" src="#Application.ColdExt.js#/ux/gridfilters/grid/filter/Filter.js"></script>
<script type="text/javascript" src="#Application.ColdExt.js#/ux/gridfilters/grid/filter/StringFilter.js"></script>
<script type="text/javascript" src="#Application.ColdExt.js#/ux/gridfilters/grid/filter/DateFilter.js"></script>
<script type="text/javascript" src="#Application.ColdExt.js#/ux/gridfilters/grid/filter/ListFilter.js"></script>
<script type="text/javascript" src="#Application.ColdExt.js#/ux/gridfilters/grid/filter/NumericFilter.js"></script>
<script type="text/javascript" src="#Application.ColdExt.js#/ux/gridfilters/grid/filter/BooleanFilter.js"></script>
<link rel="stylesheet" type="text/css" href="#Application.ColdExt.js#/ux/gridfilters/resources/style.css" />
<style type="text/css">
.x-grid3-hd-row td.ux-filtered-column {	font-style: italic;	font-weight: bold; }
</style>
</cfsavecontent>
</cfoutput>

<cfset request._coldext_ux_gridfilters = true>
<cfset includeResources(resources)>


</cfif>

<cfsetting enablecfoutputonly="false">