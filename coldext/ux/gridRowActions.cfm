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


<!--- ux resources --->
<cfinclude template="resources/gridrowactions.cfm">


<!--- defaults --->

<!--- attributes --->
<cfparam name="attributes.actions" default=""><!--- @@type: Array @@help: Array of action configuration objects. --->
<cfparam name="attributes.actionEvent" default=""><!--- @@type: String @@help: Event to trigger actions, e.g. click, dblclick, mouseover (defaults to 'click'). --->
<cfparam name="attributes.actionEventJS" default=""><!--- @@type: JS @@help: Event to trigger actions, e.g. click, dblclick, mouseover (defaults to 'click'). --->
<cfparam name="attributes.autoWidth" default=""><!--- @@type: Boolean @@help: true to calculate field width for iconic actions only (defaults to true). --->
<cfparam name="attributes.callbacks" default=""><!--- @@type: Object @@help: iconCls keyed object that contains callback functions. For example: callbacks:{ 'icon-open':function(...) {...}, 'icon-save':function(...) {...} } --->
<cfparam name="attributes.groupActions" default=""><!--- @@type: Array @@help: Array of action to use for group headers of grouping grids. These actions support static icons, texts and tooltips same way as actions. --->
<cfparam name="attributes.header" default=""><!--- @@type: String @@help: Text to be displayed in the Actions column header. --->
<cfparam name="attributes.headerJS" default=""><!--- @@type: JS @@help: Text to be displayed in the Actions column header. --->
<cfparam name="attributes.menuDisabled" default=""><!--- @@type: Boolean @@help: No sense to display header menu for this column. --->
<cfparam name="attributes.sortable" default=""><!--- @@type: Boolean @@help: Usually it has no sense to sort by this column. --->
<cfparam name="attributes.tplGroup" default=""><!--- @@type: Template @@help: Template for group actions. --->
<cfparam name="attributes.tplRow" default=""><!--- @@type: Template @@help: Template for row actions. --->
<cfparam name="attributes.width" default=""><!--- @@type: Number @@help: Width of the actions column in pixels. --->

<!--- custom attributes --->
<cfparam name="attributes.passThrough" default=""><!--- @@type: JS @@help: (ColdExt attribute) A comma separated list of JavaScript name:value pairs that will be written directly to the Ext component config. This is useful for storing custom properties in Ext components. --->
<cfparam name="attributes.var" default=""><!--- @@type: JS Variable Name @@help: (ColdExt attribute) The JavaScript variable name that this component will be assigned to. NOTE: You should only use the var attribute when this tags parent is the onReady tag. --->



<!--- arrays that may be populated by nested tags --->
<cfset thisTag.actions = ArrayNew(1)>
<cfset thisTag.callbacks = ArrayNew(1)>
<cfset thisTag.groupActions = ArrayNew(1)>
<cfset thisTag.tplGroup = ArrayNew(1)>
<cfset thisTag.tplRow = ArrayNew(1)>
<cfset thisTag.listeners = ArrayNew(1)>

<!--- process custom attributes --->
<!--- var --->
<cfset attributes.var = validateVarAttribute(parentTag)>




<cfelseif thisTag.executionMode eq "end">

<!--- determine data collection to use for cfassociate --->
<cfset _collection = "columns">
<cfif ListFind("CF_ONREADY", parentTag)>
	<cfset _collection = "items">
</cfif>


<!--- set callbacks array to point to listeners --->
<cfset thisTag.callbacks = thisTag.listeners>

<cfsavecontent variable="attributes._out">
<cfprocessingdirective suppresswhitespace="true">
<cfoutput>
	<cfif AttributeNotEmpty("var")>var #attributes.var# = </cfif>new Ext.ux.grid.RowActions({
		<cfif AttributeNotEmpty("actions")>actions: #attributes.actions#,</cfif>
		<cfif AttributeNotEmpty("actionEvent")>actionEvent: "#JSStringFormat(attributes.actionEvent)#",</cfif>
		<cfif AttributeNotEmpty("actionEventJS")>actionEvent: #attributes.actionEventJS#,</cfif>
		<cfif AttributeNotEmpty("autoWidth")>autoWidth: #attributes.autoWidth#,</cfif>
		<cfif AttributeNotEmpty("callbacks")>callbacks: #attributes.callbacks#,</cfif>
		<cfif AttributeNotEmpty("groupActions")>groupActions: #attributes.groupActions#,</cfif>
		<cfif AttributeNotEmpty("header")>header: "#JSStringFormat(attributes.header)#",</cfif>
		<cfif AttributeNotEmpty("headerJS")>header: #attributes.headerJS#,</cfif>
		<cfif AttributeNotEmpty("menuDisabled")>menuDisabled: #attributes.menuDisabled#,</cfif>
		<cfif AttributeNotEmpty("sortable")>sortable: #attributes.sortable#,</cfif>
		<cfif AttributeNotEmpty("tplGroup")>tplGroup: #attributes.tplGroup#,</cfif>
		<cfif AttributeNotEmpty("tplRow")>tplRow: #attributes.tplRow#,</cfif>
		<cfif AttributeNotEmpty("width")>width: #attributes.width#,</cfif>

		<cfif AttributeNotEmpty("passThrough")>#attributes.passThrough#,</cfif>

		<cfif arrayLen(thisTag.actions)>actions: [ #ArrayKeyToList(thisTag.actions, "_out")# ],</cfif>
		<cfif arrayLen(thisTag.callbacks)>callbacks: { #ArrayKeyToList(thisTag.callbacks, "_out")# },</cfif>
		<cfif arrayLen(thisTag.groupActions)>groupActions: [ #ArrayKeyToList(thisTag.groupActions, "_out")# ],</cfif>
		<cfif arrayLen(thisTag.tplGroup)>tplGroup: #thisTag.tplGroup[1]._out#,</cfif>
		<cfif arrayLen(thisTag.tplRow)>tplRow: #thisTag.tplRow[1]._out#,</cfif>


		dummy: true
	})<cfif AttributeNotEmpty("var")>;</cfif>
</cfoutput>
</cfprocessingdirective>
</cfsavecontent>

<cfassociate basetag="#parentTag#" datacollection="#_collection#">


</cfif>


<cfsetting enablecfoutputonly="false">