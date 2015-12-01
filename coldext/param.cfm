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
<cfparam name="attributes.name" default="">
<cfparam name="attributes.value" default="">
<cfparam name="attributes.valueJS" default="">


</cfif>


<cfif thisTag.executionMode eq "end" OR NOT thisTag.hasEndTag>

<!--- determine data collection to use for cfassociate --->
<cfset _collection = "baseParams">
<cfif ListFind("CF_HANDLER", parentTag)>
	<cfset _collection = "params">
</cfif>


<cfsavecontent variable="attributes._out">
<cfoutput>
			<cfif AttributeNotEmpty("valueJS")>#attributes.name#: #attributes.valueJS#
			<cfelse>#attributes.name#: "#attributes.value#"</cfif></cfoutput>
</cfsavecontent>

<cfassociate basetag="#parentTag#" datacollection="#_collection#">


</cfif>


<cfsetting enablecfoutputonly="false">