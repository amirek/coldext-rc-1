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
	<cfinclude template="../_functions.cfm">
</cfif>

<cfset baseTagList = getBaseTagList()>
<cfset parentTag = getColdExtParentTag(baseTagList)>

<cfif StructKeyExists(attributes, "attributeCollection")>
	<cfset StructAppend(attributes, attributes.attributeCollection, false)>
</cfif>


<!--- defaults --->

<!--- attributes --->
<cfparam name="attributes.active" default=""><!--- @@type: Boolean @@help: Indicates the default status of the filter (defaults to false). --->
<cfparam name="attributes.dataIndex" default=""><!--- @@type: String @@help: The Ext.data.Store data index of the field this filter represents. The dataIndex does not actually have to exist in the store. --->
<cfparam name="attributes.dataIndexJS" default=""><!--- @@type: JS @@help: The Ext.data.Store data index of the field this filter represents. The dataIndex does not actually have to exist in the store. --->
<cfparam name="attributes.type" default=""><!--- @@type: String @@help: The type of field to use for filtering; boolean, date, list, numeric or string. @@options: boolean,date,list,numeric,string --->
<cfparam name="attributes.typeJS" default=""><!--- @@type: JS @@help: The type of field to use for filtering; boolean, date, list, numeric or string. @@options: boolean,date,list,numeric,string --->
<cfparam name="attributes.options" default=""><!--- @@type: Array @@help: An array of strings to use as options in the filter picklist when type="list" --->

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
<cfset _collection = "filters">
<cfif ListFind("CF_ONREADY", parentTag)>
	<cfset _collection = "items">
</cfif>


<cfsavecontent variable="attributes._out">
<cfprocessingdirective suppresswhitespace="true">
<cfoutput>
	<cfif AttributeNotEmpty("var")>var #attributes.var# = new Ext.ux.grid.filter.Filter(</cfif>{
		<cfif AttributeNotEmpty("active")>active: #attributes.active#,</cfif>
		<cfif AttributeNotEmpty("dataIndex")>dataIndex: "#JSStringFormat(attributes.dataIndex)#",</cfif>
		<cfif AttributeNotEmpty("dataIndexJS")>dataIndex: #attributes.dataIndexJS#,</cfif>
		<cfif AttributeNotEmpty("type")>type: "#JSStringFormat(attributes.type)#",</cfif>
		<cfif AttributeNotEmpty("typeJS")>type: #attributes.typeJS#,</cfif>
		<cfif AttributeNotEmpty("options")>options: #attributes.options#,</cfif>

		<cfif AttributeNotEmpty("passThrough")>#attributes.passThrough#,</cfif>



		dummy: true
	}<cfif AttributeNotEmpty("var")>);</cfif>
</cfoutput>
</cfprocessingdirective>
</cfsavecontent>

<cfassociate basetag="#parentTag#" datacollection="#_collection#">


</cfif>


<cfsetting enablecfoutputonly="false">