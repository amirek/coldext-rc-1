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
<cfparam name="attributes.header" default=""><!--- @@type: String @@help: Any valid text or HTML fragment to display in the header cell for the checkbox column (defaults to '[div class="x-grid3-hd-checker"] [/div]'). The default CSS class of 'x-grid3-hd-checker' displays a checkbox in the header and provides support for automatic check all/none behavior on header click. This string can be replaced by any valid HTML fragment, including a simple text string (e.g., 'Select Rows'), but the automatic check all/none behavior will only work if the 'x-grid3-hd-checker' class is supplied. --->
<cfparam name="attributes.headerJS" default=""><!--- @@type: JS @@help: Any valid text or HTML fragment to display in the header cell for the checkbox column (defaults to '[div class="x-grid3-hd-checker"] [/div]'). The default CSS class of 'x-grid3-hd-checker' displays a checkbox in the header and provides support for automatic check all/none behavior on header click. This string can be replaced by any valid HTML fragment, including a simple text string (e.g., 'Select Rows'), but the automatic check all/none behavior will only work if the 'x-grid3-hd-checker' class is supplied. --->
<cfparam name="attributes.listeners" default=""><!--- @@type: Object @@help: (optional) A config object containing one or more event handlers to be added to this object during initialization. This should be a valid listeners config object as specified in the addListener example for attaching multiple handlers at once. --->
<cfparam name="attributes.moveEditorOnEnter" default=""><!--- @@type: Boolean @@help: False to turn off moving the editor to the next cell when the enter key is pressed --->
<cfparam name="attributes.singleSelect" default=""><!--- @@type: Boolean @@help: True to allow selection of only one row at a time (defaults to false) --->
<cfparam name="attributes.sortable" default=""><!--- @@type: Boolean @@help: True if the checkbox column is sortable (defaults to false). --->
<cfparam name="attributes.width" default=""><!--- @@type: Number @@help: The default width in pixels of the checkbox column (defaults to 20). --->

<!--- custom attributes --->
<cfparam name="attributes.passThrough" default=""><!--- @@type: JS @@help: (ColdExt attribute) A comma separated list of JavaScript name:value pairs that will be written directly to the Ext component config. This is useful for storing custom properties in Ext components. --->
<cfparam name="attributes.var" default=""><!--- @@type: JS Variable Name @@help: (ColdExt attribute) The JavaScript variable name that this component will be assigned to. NOTE: You should only use the var attribute when this tags parent is the onReady tag. --->



<!--- arrays that may be populated by nested tags --->
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


<cfsavecontent variable="attributes._out">
<cfprocessingdirective suppresswhitespace="true">
<cfoutput>
	<cfif AttributeNotEmpty("var")>var #attributes.var# = </cfif>new Ext.grid.CheckboxSelectionModel({
		<cfif AttributeNotEmpty("header")>header: "#JSStringFormat(attributes.header)#",</cfif>
		<cfif AttributeNotEmpty("headerJS")>header: #attributes.headerJS#,</cfif>
		<cfif AttributeNotEmpty("listeners")>listeners: #attributes.listeners#,</cfif>
		<cfif AttributeNotEmpty("moveEditorOnEnter")>moveEditorOnEnter: #attributes.moveEditorOnEnter#,</cfif>
		<cfif AttributeNotEmpty("singleSelect")>singleSelect: #attributes.singleSelect#,</cfif>
		<cfif AttributeNotEmpty("sortable")>sortable: #attributes.sortable#,</cfif>
		<cfif AttributeNotEmpty("width")>width: #attributes.width#,</cfif>

		<cfif AttributeNotEmpty("passThrough")>#attributes.passThrough#,</cfif>

		<cfif arrayLen(thisTag.listeners)>listeners: { #ArrayKeyToList(thisTag.listeners, "_out")# },</cfif>


		dummy: true
	})<cfif AttributeNotEmpty("var")>;</cfif>
</cfoutput>
</cfprocessingdirective>
</cfsavecontent>

<cfassociate basetag="#parentTag#" datacollection="#_collection#">
<cfassociate basetag="#parentTag#" datacollection="sm">


</cfif>


<cfsetting enablecfoutputonly="false">