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
<cfparam name="attributes.id" default=""><!--- @@type: String @@help: The DomQuery path relative from the record element to the element that contains a record identifier value. --->
<cfparam name="attributes.idJS" default=""><!--- @@type: JS @@help: The DomQuery path relative from the record element to the element that contains a record identifier value. --->
<cfparam name="attributes.record" default=""><!--- @@type: String @@help: The DomQuery path to the repeated element which contains record information. --->
<cfparam name="attributes.recordJS" default=""><!--- @@type: JS @@help: The DomQuery path to the repeated element which contains record information. --->
<cfparam name="attributes.success" default=""><!--- @@type: String @@help: The DomQuery path to the success attribute used by forms. --->
<cfparam name="attributes.successJS" default=""><!--- @@type: JS @@help: The DomQuery path to the success attribute used by forms. --->
<cfparam name="attributes.totalRecords" default=""><!--- @@type: String @@help: The DomQuery path from which to retrieve the total number of records in the dataset. This is only needed if the whole dataset is not passed in one go, but is being paged from the remote server. --->
<cfparam name="attributes.totalRecordsJS" default=""><!--- @@type: JS @@help: The DomQuery path from which to retrieve the total number of records in the dataset. This is only needed if the whole dataset is not passed in one go, but is being paged from the remote server. --->

<!--- custom attributes --->
<cfparam name="attributes.passThrough" default=""><!--- @@type: JS @@help: (ColdExt attribute) A comma separated list of JavaScript name:value pairs that will be written directly to the Ext component config. This is useful for storing custom properties in Ext components. --->
<cfparam name="attributes.var" default=""><!--- @@type: JS Variable Name @@help: (ColdExt attribute) The JavaScript variable name that this component will be assigned to. NOTE: You should only use the var attribute when this tags parent is the onReady tag. --->



<!--- arrays that may be populated by nested tags --->
<cfset thisTag.success = ArrayNew(1)>
<cfset thisTag.fields = ArrayNew(1)>

<!--- process custom attributes --->
<!--- var --->
<cfset attributes.var = validateVarAttribute(parentTag)>




<cfelseif thisTag.executionMode eq "end">

<!--- determine data collection to use for cfassociate --->
<cfset _collection = "reader">
<cfif ListFind("CF_ONREADY", parentTag)>
	<cfset _collection = "items">
</cfif>


<cfsavecontent variable="attributes._out">
<cfprocessingdirective suppresswhitespace="true">
<cfoutput>
	<cfif AttributeNotEmpty("var")>var #attributes.var# = </cfif>new Ext.data.XmlReader({
		<cfif AttributeNotEmpty("id")>id: "#JSStringFormat(attributes.id)#",</cfif>
		<cfif AttributeNotEmpty("idJS")>id: #attributes.idJS#,</cfif>
		<cfif AttributeNotEmpty("record")>record: "#JSStringFormat(attributes.record)#",</cfif>
		<cfif AttributeNotEmpty("recordJS")>record: #attributes.recordJS#,</cfif>
		<cfif AttributeNotEmpty("success")>success: "#JSStringFormat(attributes.success)#",</cfif>
		<cfif AttributeNotEmpty("successJS")>success: #attributes.successJS#,</cfif>
		<cfif AttributeNotEmpty("totalRecords")>totalRecords: "#JSStringFormat(attributes.totalRecords)#",</cfif>
		<cfif AttributeNotEmpty("totalRecordsJS")>totalRecords: #attributes.totalRecordsJS#,</cfif>

		<cfif AttributeNotEmpty("passThrough")>#attributes.passThrough#,</cfif>

		<cfif arrayLen(thisTag.success)>success: #thisTag.success[1]._out#,</cfif>
		<cfif arrayLen(thisTag.fields)>fields: [ #ArrayKeyToList(thisTag.fields, "_out")# ],</cfif>


		dummy: true
	},[
		<cfif arrayLen(thisTag.fields)>#ArrayKeyToList(thisTag.fields, "_out")#</cfif>
	])<cfif AttributeNotEmpty("var")>;</cfif>
</cfoutput>
</cfprocessingdirective>
</cfsavecontent>

<cfassociate basetag="#parentTag#" datacollection="#_collection#">


</cfif>


<cfsetting enablecfoutputonly="false">