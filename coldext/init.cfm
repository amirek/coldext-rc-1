<cfsetting enablecfoutputonly="true">
<!---

	ColdExt RC 1, Copyright (c) 2008, Justin Carter

	You may use ColdExt under any terms that satisfy the Ext JS license
	http://extjs.com/license

	Additionally you may modify the ColdExt CFML source code to suit
	your needs, as long as you do not modify this copyright notice.

 --->

<cfif thisTag.executionMode eq "start">

<cfset request._coldext_init = true>


<cfif not StructKeyExists(Application, "ColdExt")>
	<cfinclude template="_config.cfm">
</cfif>


<cfif not isDefined("_coldext_functions")>
	<cfinclude template="_functions.cfm">
</cfif>

<cfif StructKeyExists(attributes, "attributeCollection")>
	<cfset StructAppend(attributes, attributes.attributeCollection, false)>
</cfif>



<!--- defaults --->
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


<!--- set up loading indicator --->
<cfsavecontent variable="loadingIndicator">
<cfprocessingdirective suppresswhitespace="true">
<cfoutput>
<div id="loading-mask"></div>
<div id="loading">
<div class="loading-indicator"><img src="#attributes.js#/loading/extanim32.gif" width="32" height="32" align="absmiddle"/>Loading...</div>
</div>
</cfoutput>
</cfprocessingdirective>
</cfsavecontent>


<!--- set up ext css resources --->
<cfsavecontent variable="cssResources">
<cfprocessingdirective suppresswhitespace="true">
<cfoutput>
<link type="text/css" rel="stylesheet" href="#attributes.css#/ext-all.css">
<cfif attributes.loadingMask><link type="text/css" rel="stylesheet" href="#attributes.js#/loading/ext-loading.css"></cfif>
</cfoutput>
</cfprocessingdirective>
</cfsavecontent>


<!--- if using a loading mask, js resources will be inserted inline rather than into the html head --->
<!--- user extension resources use this request variable to determine where their output goes --->
<cfif attributes.loadingMask>
	<cfset request._coldext_loadingMask = true>
</cfif>


<!--- set up ext js resources --->
<cfsavecontent variable="jsResources">
<cfprocessingdirective suppresswhitespace="true">
<cfoutput>
<cfif len(attributes.theme)><link type="text/css" rel="stylesheet" href="#attributes.css#/#attributes.theme#.css" /></cfif>
<script type="text/javascript" src="#attributes.js#/ext-base.js"></script>
<cfif not attributes.debug><script type="text/javascript" src="#attributes.js#/ext-all.js"></script>
<cfelse><script type="text/javascript" src="#attributes.js#/ext-all-debug.js"></script></cfif>
</cfoutput>

<!--- user extension resources --->
<cfif attributes.uxLoad eq "all">
	<cfset attributes.uxLoad = Application.ColdExt.uxAll>
</cfif>
<cfif ListLen(attributes.uxLoad)>
	<cfloop list="#attributes.uxLoad#" index="resource">
		<cfif fileExists("#GetDirectoryFromPath(GetCurrentTemplatePath())#ux/resources/#resource#.cfm")>
			<cfoutput><cfinclude template="ux/resources/#resource#.cfm"></cfoutput>
		</cfif>
	</cfloop>
</cfif>

<!--- output --->
<cfoutput>
<script type="text/javascript">
Ext.onReady(function(){
	<cfif attributes.loadingMask>setTimeout(function(){
        Ext.get('loading').remove();
        Ext.get('loading-mask').fadeOut({remove:true});
    }, 250);</cfif>
	Ext.BLANK_IMAGE_URL = "#attributes.images#/default/s.gif";
	<cfif attributes.quickTips>Ext.QuickTips.init();</cfif>
	Ext.form.Field.prototype.msgTarget = "#attributes.validationTarget#";
});
</script>
</cfoutput>
</cfprocessingdirective>
</cfsavecontent>


<!--- insert into document body if not loaded via XMLHTTPRequest --->
<cfif NOT StructKeyEquals(GetHttpRequestData().headers, "X-Requested-With", "XMLHTTPRequest")>
	<!--- output to body if using mask --->
	<cfif attributes.loadingMask>
		<cfhtmlhead text="#cssResources#">
		<cfoutput>#loadingIndicator##jsResources#</cfoutput>
	<!--- otherwise insert into html head element --->
	<cfelse>
		<cfhtmlhead text="#cssResources##jsResources#">
	</cfif>
</cfif>


<!--- set up request.ColdExtConfig --->
<!--- TODO: tag specific config settings should be copied from application scope to request.ColdExtConfig.* --->
<!--- this is desirable to allow config settings to be modified mid-request? --->
<!--- do this in the same style as ext:init tag config options above --->


</cfif>


<cfsetting enablecfoutputonly="false">