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
<cfparam name="attributes.callback" default=""><!--- @@type: Function @@help: Optional. Function to call if the action icon is clicked. This function is called with same signature as action event and in its original scope. If you need to call it in different scope or with another signature use createCallback or createDelegate functions. Works for statically defined actions. Use callbacks configuration options for store bound actions. --->
<cfparam name="attributes.cb" default=""><!--- @@type: Function @@help: Shortcut for callback. --->
<cfparam name="attributes.iconIndex" default=""><!--- @@type: String @@help: Optional, however either iconIndex or iconCls must be configured. Field name of the field of the grid store record that contains css class of the icon to show. If configured, shown icons can vary depending of the value of this field. --->
<cfparam name="attributes.iconIndexJS" default=""><!--- @@type: JS @@help: Optional, however either iconIndex or iconCls must be configured. Field name of the field of the grid store record that contains css class of the icon to show. If configured, shown icons can vary depending of the value of this field. --->
<cfparam name="attributes.iconCls" default=""><!--- @@type: String @@help: css class of the icon to show. It is ignored if iconIndex is configured. Use this if you want static icons that are not base on the values in the record. --->
<cfparam name="attributes.iconClsJS" default=""><!--- @@type: JS @@help: css class of the icon to show. It is ignored if iconIndex is configured. Use this if you want static icons that are not base on the values in the record. --->
<cfparam name="attributes.hide" default=""><!--- @@type: Boolean @@help: Optional. True to hide this action while still have a space in  the grid column allocated to it. IMO, it doesn't make too much sense, use hideIndex instead. --->
<cfparam name="attributes.hideIndex" default=""><!--- @@type: String @@help: Optional. Field name of the field of the grid store record that contains hide flag (falsie [null, '', 0, false, undefined] to show, anything else to hide). --->
<cfparam name="attributes.hideIndexJS" default=""><!--- @@type: JS @@help: Optional. Field name of the field of the grid store record that contains hide flag (falsie [null, '', 0, false, undefined] to show, anything else to hide). --->
<cfparam name="attributes.qtipIndex" default=""><!--- @@type: String @@help: Optional. Field name of the field of the grid store record that contains tooltip text. If configured, the tooltip texts are taken from the store. --->
<cfparam name="attributes.qtipIndexJS" default=""><!--- @@type: JS @@help: Optional. Field name of the field of the grid store record that contains tooltip text. If configured, the tooltip texts are taken from the store. --->
<cfparam name="attributes.tooltip" default=""><!--- @@type: String @@help: Optional. Tooltip text to use as icon tooltip. It is ignored if qtipIndex is configured. Use this if you want static tooltips that are not taken from the store. --->
<cfparam name="attributes.tooltipJS" default=""><!--- @@type: JS @@help: Optional. Tooltip text to use as icon tooltip. It is ignored if qtipIndex is configured. Use this if you want static tooltips that are not taken from the store. --->
<cfparam name="attributes.qtip" default=""><!--- @@type: String @@help: Synonym for tooltip. --->
<cfparam name="attributes.qtipJS" default=""><!--- @@type: JS @@help: Synonym for tooltip. --->
<cfparam name="attributes.textIndex" default=""><!--- @@type: String @@help: Optional. Field name of the field of the grids store record that contains text to display on the right side of the icon. If configured, the text shown is taken from record. --->
<cfparam name="attributes.textIndexJS" default=""><!--- @@type: JS @@help: Optional. Field name of the field of the grids store record that contains text to display on the right side of the icon. If configured, the text shown is taken from record. --->
<cfparam name="attributes.text" default=""><!--- @@type: String @@help: Optional. Text to display on the right side of the icon. Use this if you want static text that are not taken from record. Ignored if textIndex is set. --->
<cfparam name="attributes.textJS" default=""><!--- @@type: JS @@help: Optional. Text to display on the right side of the icon. Use this if you want static text that are not taken from record. Ignored if textIndex is set. --->
<cfparam name="attributes.style" default=""><!--- @@type: String @@help: Optional. Style to apply to action icon container. --->
<cfparam name="attributes.styleJS" default=""><!--- @@type: JS @@help: Optional. Style to apply to action icon container. --->

<!--- custom attributes --->
<cfparam name="attributes.passThrough" default=""><!--- @@type: JS @@help: (ColdExt attribute) A comma separated list of JavaScript name:value pairs that will be written directly to the Ext component config. This is useful for storing custom properties in Ext components. --->
<cfparam name="attributes.var" default=""><!--- @@type: JS Variable Name @@help: (ColdExt attribute) The JavaScript variable name that this component will be assigned to. NOTE: You should only use the var attribute when this tags parent is the onReady tag. --->



<!--- arrays that may be populated by nested tags --->
<cfset thisTag.callback = ArrayNew(1)>
<cfset thisTag.tooltip = ArrayNew(1)>

<!--- process custom attributes --->
<!--- var --->
<cfset attributes.var = validateVarAttribute(parentTag)>




<cfelseif thisTag.executionMode eq "end">

<!--- determine data collection to use for cfassociate --->
<cfset _collection = "actions">
<cfif ListFind("CF_ONREADY", parentTag)>
	<cfset _collection = "items">
</cfif>
<cfset _script = trim(thisTag.GeneratedContent)>
<cfset thisTag.GeneratedContent = "">


<cfsavecontent variable="attributes._out">
<cfprocessingdirective suppresswhitespace="true">
<cfoutput>
	<cfif AttributeNotEmpty("var")>var #attributes.var# = new (</cfif>{
		<cfif AttributeNotEmpty("callback")>callback: #attributes.callback#,</cfif>
		<cfif AttributeNotEmpty("cb")>cb: #attributes.cb#,</cfif>
		<cfif AttributeNotEmpty("iconIndex")>iconIndex: "#JSStringFormat(attributes.iconIndex)#",</cfif>
		<cfif AttributeNotEmpty("iconIndexJS")>iconIndex: #attributes.iconIndexJS#,</cfif>
		<cfif AttributeNotEmpty("iconCls")>iconCls: "#JSStringFormat(attributes.iconCls)#",</cfif>
		<cfif AttributeNotEmpty("iconClsJS")>iconCls: #attributes.iconClsJS#,</cfif>
		<cfif AttributeNotEmpty("hide")>hide: #attributes.hide#,</cfif>
		<cfif AttributeNotEmpty("hideIndex")>hideIndex: "#JSStringFormat(attributes.hideIndex)#",</cfif>
		<cfif AttributeNotEmpty("hideIndexJS")>hideIndex: #attributes.hideIndexJS#,</cfif>
		<cfif AttributeNotEmpty("qtipIndex")>qtipIndex: "#JSStringFormat(attributes.qtipIndex)#",</cfif>
		<cfif AttributeNotEmpty("qtipIndexJS")>qtipIndex: #attributes.qtipIndexJS#,</cfif>
		<cfif AttributeNotEmpty("tooltip")>tooltip: "#JSStringFormat(attributes.tooltip)#",</cfif>
		<cfif AttributeNotEmpty("tooltipJS")>tooltip: #attributes.tooltipJS#,</cfif>
		<cfif AttributeNotEmpty("qtip")>qtip: "#JSStringFormat(attributes.qtip)#",</cfif>
		<cfif AttributeNotEmpty("qtipJS")>qtip: #attributes.qtipJS#,</cfif>
		<cfif AttributeNotEmpty("textIndex")>textIndex: "#JSStringFormat(attributes.textIndex)#",</cfif>
		<cfif AttributeNotEmpty("textIndexJS")>textIndex: #attributes.textIndexJS#,</cfif>
		<cfif AttributeNotEmpty("text")>text: "#JSStringFormat(attributes.text)#",</cfif>
		<cfif AttributeNotEmpty("textJS")>text: #attributes.textJS#,</cfif>
		<cfif AttributeNotEmpty("style")>style: "#JSStringFormat(attributes.style)#",</cfif>
		<cfif AttributeNotEmpty("styleJS")>style: #attributes.styleJS#,</cfif>

		<cfif AttributeNotEmpty("passThrough")>#attributes.passThrough#,</cfif>

		<cfif arrayLen(thisTag.callback)>callback: #thisTag.callback[1]._out#,</cfif>
		<cfif arrayLen(thisTag.tooltip)>tooltip: #thisTag.tooltip[1]._out#,</cfif>

		<cfif len(_script) AND AttributeEmpty("callback") AND NOT arrayLen(thisTag.callback)>
			callback: #_script#,
		</cfif>

		dummy: true
	}<cfif AttributeNotEmpty("var")>);</cfif>
</cfoutput>
</cfprocessingdirective>
</cfsavecontent>

<cfassociate basetag="#parentTag#" datacollection="#_collection#">


</cfif>


<cfsetting enablecfoutputonly="false">