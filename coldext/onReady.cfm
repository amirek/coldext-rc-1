<cfsetting enablecfoutputonly="true">
<!---

	ColdExt RC 1, Copyright (c) 2008, Justin Carter

	You may use ColdExt under any terms that satisfy the Ext JS license
	http://extjs.com/license

	Additionally you may modify the ColdExt CFML source code to suit
	your needs, as long as you do not modify this copyright notice.

 --->

<cfif thisTag.executionMode eq "start">


<cfif not isDefined("request._coldext_init")>
	<cfinclude template="init.cfm">
</cfif>


<!--- dummy defaults --->
<!--- NOTE: these defaults never get used because the init tag is included above --->
<!--- they are included here for generated documentation purposes only --->
<cfparam name="attributes.debug" default="#Application.ColdExt.debug#"><!--- @@type: Boolean @@help: True to enable the use of the debugging version of Ext JavaScript resources for easier troubleshooting --->
<cfparam name="attributes.js" default="#Application.ColdExt.js#"><!--- @@type: String @@help: (Optional) Path to the Ext JavaScript resources --->
<cfparam name="attributes.css" default="#Application.ColdExt.css#"><!--- @@type: String @@help: (Optional) Path to the Ext CSS resources --->
<cfparam name="attributes.images" default="#Application.ColdExt.images#"><!--- @@type: String @@help: (Optional) Path to the Ext image resources --->
<cfparam name="attributes.theme" default="#Application.ColdExt.theme#"><!--- @@type: String @@help: (Optional) Path to an Ext CSS Theme resource --->
<cfparam name="attributes.blankImageURL" default="#Application.ColdExt.blankImageURL#"><!--- @@type: String @@help: (Optional) Path to the Ext 1x1 blank pixel image --->
<cfparam name="attributes.quickTips" default="#Application.ColdExt.quickTips#"><!--- @@type: String @@help: (Optional) True to enable quick tips --->
<cfparam name="attributes.validationTarget" default="#Application.ColdExt.validationTarget#"><!--- @@type: String @@help: (Optional) Specify the target for validation error quick tips --->
<cfparam name="attributes.loadingMask" default="#Application.ColdExt.loadingMask#"><!--- @@type: Boolean @@help: (Optional) True to use a full screen mask with a loading indicator while resources are loading (defaults to false) --->
<cfparam name="attributes.uxLoad" default="#Application.ColdExt.uxLoad#"><!--- @@type: List @@help: (Optional) A comma separated list of User Extensions to be loaded up front. Use this attribute to load the resources for extensions which may be loaded via Ajax, e.g. ux="portal,gridfilters". The extension name is the folder name in the /ext/ux folder. --->


<!--- arrays that may be populated by nested tags --->
<cfset thisTag.items = ArrayNew(1)>


<!--- check for closing tag --->
<cfif not thisTag.hasEndTag>
	<cfthrow message="onReady missing closing tag">
</cfif>



<cfelseif thisTag.executionMode eq "end">

<cfset thisTag.generatedContent = trim(thisTag.generatedContent)>


<cfprocessingdirective suppresswhitespace="true">
<cfoutput>
<script type="text/javascript">
Ext.onReady(function(){

	<!--- process items array --->
	<cfif arrayLen(thisTag.items)>
	<cfloop index="i" from="1" to="#arrayLen(thisTag.items)#">
		#thisTag.items[i]._out#
	</cfloop>
	</cfif>

});
</script>
</cfoutput>
</cfprocessingdirective>


</cfif>


<cfsetting enablecfoutputonly="false">