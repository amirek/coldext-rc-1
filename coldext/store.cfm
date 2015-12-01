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
<cfparam name="attributes.autoLoad" default=""><!--- @@type: Boolean/Object @@help: If passed, this store's load method is automatically called after creation with the autoLoad object --->
<cfparam name="attributes.baseParams" default=""><!--- @@type: Object @@help: An object containing properties which are to be sent as parameters on any HTTP request --->
<cfparam name="attributes.data" default=""><!--- @@type: Array @@help: Inline data to be loaded when the store is initialized. --->
<cfparam name="attributes.listeners" default=""><!--- @@type: Object @@help: (optional) A config object containing one or more event handlers to be added to this object during initialization. This should be a valid listeners config object as specified in the addListener example for attaching multiple handlers at once. --->
<cfparam name="attributes.proxy" default=""><!--- @@type: Ext.data.DataProxy @@help: The Proxy object which provides access to a data object. --->
<cfparam name="attributes.pruneModifiedRecords" default=""><!--- @@type: boolean @@help: True to clear all modified record information each time the store is loaded or when a record is removed. (defaults to false). --->
<cfparam name="attributes.reader" default=""><!--- @@type: Ext.data.DataReader @@help: The DataReader object which processes the data object and returns an Array of Ext.data.Record objects which are cached keyed by their id property. --->
<cfparam name="attributes.remoteSort" default=""><!--- @@type: boolean @@help: True if sorting is to be handled by requesting the Proxy to provide a refreshed version of the data object in sorted order, as opposed to sorting the Record cache in place (defaults to false). If remote sorting is specified, then clicking on a column header causes the current page to be requested from the server with the addition of the following two parameters:  sort : StringThe name (as specified in the Record's Field definition) of the field to sort on. dir : StringThe direction of the sort, "ASC" or "DESC" (case-sensitive). --->
<cfparam name="attributes.sortInfo" default=""><!--- @@type: Object @@help: A config object in the format: {field: "fieldName", direction: "ASC|DESC"} to specify the sort order in the request of a remote Store's load operation. Note that for local sorting, the direction property is case-sensitive. --->
<cfparam name="attributes.storeId" default=""><!--- @@type: String @@help: If passed, the id to use to register with the StoreMgr --->
<cfparam name="attributes.storeIdJS" default=""><!--- @@type: JS @@help: If passed, the id to use to register with the StoreMgr --->
<cfparam name="attributes.url" default=""><!--- @@type: String @@help: If passed, an HttpProxy is created for the passed URL --->
<cfparam name="attributes.urlJS" default=""><!--- @@type: JS @@help: If passed, an HttpProxy is created for the passed URL --->

<!--- custom attributes --->
<cfparam name="attributes.passThrough" default=""><!--- @@type: JS @@help: (ColdExt attribute) A comma separated list of JavaScript name:value pairs that will be written directly to the Ext component config. This is useful for storing custom properties in Ext components. --->
<cfparam name="attributes.var" default=""><!--- @@type: JS Variable Name @@help: (ColdExt attribute) The JavaScript variable name that this component will be assigned to. NOTE: You should only use the var attribute when this tags parent is the onReady tag. --->



<!--- arrays that may be populated by nested tags --->
<cfset thisTag.baseParams = ArrayNew(1)>
<cfset thisTag.listeners = ArrayNew(1)>
<cfset thisTag.reader = ArrayNew(1)>

<!--- process custom attributes --->
<!--- var --->
<cfset attributes.var = validateVarAttribute(parentTag)>




<cfelseif thisTag.executionMode eq "end">



<cfsavecontent variable="attributes._out">
<cfprocessingdirective suppresswhitespace="true">
<cfoutput>
	<cfif AttributeNotEmpty("var")>var #attributes.var# = </cfif>new Ext.data.Store({
		<cfif AttributeNotEmpty("autoLoad")>autoLoad: #attributes.autoLoad#,</cfif>
		<cfif AttributeNotEmpty("baseParams")>baseParams: #attributes.baseParams#,</cfif>
		<cfif AttributeNotEmpty("data")>data: #attributes.data#,</cfif>
		<cfif AttributeNotEmpty("listeners")>listeners: #attributes.listeners#,</cfif>
		<cfif AttributeNotEmpty("proxy")>proxy: #attributes.proxy#,</cfif>
		<cfif AttributeNotEmpty("pruneModifiedRecords")>pruneModifiedRecords: #attributes.pruneModifiedRecords#,</cfif>
		<cfif AttributeNotEmpty("reader")>reader: #attributes.reader#,</cfif>
		<cfif AttributeNotEmpty("remoteSort")>remoteSort: #attributes.remoteSort#,</cfif>
		<cfif AttributeNotEmpty("sortInfo")>sortInfo: #attributes.sortInfo#,</cfif>
		<cfif AttributeNotEmpty("storeId")>storeId: "#JSStringFormat(attributes.storeId)#",</cfif>
		<cfif AttributeNotEmpty("storeIdJS")>storeId: #attributes.storeIdJS#,</cfif>
		<cfif AttributeNotEmpty("url")>url: "#JSStringFormat(attributes.url)#",</cfif>
		<cfif AttributeNotEmpty("urlJS")>url: #attributes.urlJS#,</cfif>

		<cfif AttributeNotEmpty("passThrough")>#attributes.passThrough#,</cfif>

		<cfif arrayLen(thisTag.baseParams)>baseParams: { #ArrayKeyToList(thisTag.baseParams, "_out")# },</cfif>
		<cfif arrayLen(thisTag.listeners)>listeners: { #ArrayKeyToList(thisTag.listeners, "_out")# },</cfif>
		<cfif arrayLen(thisTag.reader)>reader: #thisTag.reader[1]._out#,</cfif>


		dummy: true
	})<cfif AttributeNotEmpty("var")>;</cfif>
</cfoutput>
</cfprocessingdirective>
</cfsavecontent>

<cfassociate basetag="#parentTag#" datacollection="items">


</cfif>


<cfsetting enablecfoutputonly="false">