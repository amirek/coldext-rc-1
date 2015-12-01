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

<cfif StructKeyExists(attributes, "attributeCollection")>
	<cfset StructAppend(attributes, attributes.attributeCollection, false)>
</cfif>


<!--- attributes --->
<cfparam name="attributes.value" default="">


</cfif>


<cfif thisTag.executionMode eq "end" OR NOT thisTag.hasEndTag>

<cfset text = thisTag.generatedContent>
<cfset thisTag.generatedContent = "">

<!--- process attributes --->
<cfif AttributeEmpty("value")>
	<cfset attributes.value = text>
</cfif>
<cfif text eq "">
	<cfset text = attributes.value>
</cfif>


<cfsavecontent variable="attributes._out">
<cfprocessingdirective suppresswhitespace="true">
<cfoutput>
					["#attributes.value#", "#text#"]</cfoutput>
</cfprocessingdirective>
</cfsavecontent>

<cfassociate basetag="#parentTag#" datacollection="options">


</cfif>


<cfsetting enablecfoutputonly="false">