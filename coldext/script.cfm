<cfsetting enablecfoutputonly="true">
<!---

	ColdExt RC 1, Copyright (c) 2008, Justin Carter

	You may use ColdExt under any terms that satisfy the Ext JS license
	http://extjs.com/license

	Additionally you may modify the ColdExt CFML source code to suit
	your needs, as long as you do not modify this copyright notice.

 --->

<cfif thisTag.executionMode eq "start">


<cfif not isDefined("_coldext_functions")>
	<cfinclude template="_functions.cfm">
</cfif>

<cfset baseTagList = getBaseTagList()>
<cfset parentTag = getColdExtParentTag(baseTagList)>


<!--- attributes --->
<cfparam name="attributes.collection" default="items"><!--- @@type: String @@help: The data collection to use when assigning the data for this tag to it's parent tag. Defaults to "items". --->
<!--- TODO: list of options for collection --->


<cfelseif thisTag.executionMode eq "end">

<cfsavecontent variable="attributes._out">
<cfprocessingdirective suppresswhitespace="true">
<cfoutput>
			#thisTag.generatedContent#</cfoutput>
</cfprocessingdirective>
</cfsavecontent>

<cfset thisTag.generatedContent = "">

<cfassociate basetag="#parentTag#" datacollection="#attributes.collection#">


</cfif>


<cfsetting enablecfoutputonly="false">