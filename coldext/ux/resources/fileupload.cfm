<cfsetting enablecfoutputonly="true">

<cfif not StructKeyExists(request, "_coldext_ux_fileupload")>


<cfoutput>
<cfsavecontent variable="resources">
<script type="text/javascript" src="#Application.ColdExt.js#/ux/fileupload/FileUploadField.js"></script>
<link rel="stylesheet" type="text/css" href="#Application.ColdExt.js#/ux/fileupload/file-upload.css" />
</cfsavecontent>
</cfoutput>

<cfset request._coldext_ux_fileupload = true>
<cfset includeResources(resources)>


</cfif>

<cfsetting enablecfoutputonly="false">