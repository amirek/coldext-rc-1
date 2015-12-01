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


<!--- defaults --->

<!--- attributes --->
<cfparam name="attributes.header" default=""><!--- @@type: String @@help: Any valid text or HTML fragment to display in the header cell for the row number column (defaults to ''). --->
<cfparam name="attributes.headerJS" default=""><!--- @@type: JS @@help: Any valid text or HTML fragment to display in the header cell for the row number column (defaults to ''). --->
<cfparam name="attributes.width" default=""><!--- @@type: Number @@help: The default width in pixels of the row number column (defaults to 23). --->

<!--- custom attributes --->
<cfparam name="attributes.passThrough" default=""><!--- @@type: JS @@help: (ColdExt attribute) A comma separated list of JavaScript name:value pairs that will be written directly to the Ext component config. This is useful for storing custom properties in Ext components. --->
<cfparam name="attributes.var" default=""><!--- @@type: JS Variable Name @@help: (ColdExt attribute) The JavaScript variable name that this component will be assigned to. NOTE: You should only use the var attribute when this tags parent is the onReady tag. --->



<!--- arrays that may be populated by nested tags --->

<!--- process custom attributes --->
<!--- var --->
<cfset attributes.var = validateVarAttribute(parentTag)>



</cfif>


<cfif thisTag.executionMode eq "end" OR NOT thisTag.hasEndTag>

<!--- determine data collection to use for cfassociate --->
<cfset _collection = "columns">
<cfif ListFind("CF_ONREADY", parentTag)>
	<cfset _collection = "items">
</cfif>


<cfsavecontent variable="attributes._out">
<cfprocessingdirective suppresswhitespace="true">
<cfoutput>
	<cfif AttributeNotEmpty("var")>var #attributes.var# = </cfif>new Ext.grid.RowNumberer({
		<cfif AttributeNotEmpty("header")>header: "#JSStringFormat(attributes.header)#",</cfif>
		<cfif AttributeNotEmpty("headerJS")>header: #attributes.headerJS#,</cfif>
		<cfif AttributeNotEmpty("width")>width: #attributes.width#,</cfif>

		<cfif AttributeNotEmpty("passThrough")>#attributes.passThrough#,</cfif>



		dummy: true
	})<cfif AttributeNotEmpty("var")>;</cfif>
</cfoutput>
</cfprocessingdirective>
</cfsavecontent>

<cfassociate basetag="#parentTag#" datacollection="#_collection#">


</cfif>


<cfsetting enablecfoutputonly="false">