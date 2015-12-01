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
<cfparam name="attributes.align" default=""><!--- @@type: String @@help: (optional) Set the CSS text-align property of the column. Defaults to undefined. --->
<cfparam name="attributes.alignJS" default=""><!--- @@type: JS @@help: (optional) Set the CSS text-align property of the column. Defaults to undefined. --->
<cfparam name="attributes.css" default=""><!--- @@type: String @@help: (optional) Set custom CSS for all table cells in the column (excluding headers). Defaults to undefined. --->
<cfparam name="attributes.cssJS" default=""><!--- @@type: JS @@help: (optional) Set custom CSS for all table cells in the column (excluding headers). Defaults to undefined. --->
<cfparam name="attributes.dataIndex" default=""><!--- @@type: String @@help: (optional) The name of the field in the grid's Ext.data.Store's Ext.data.Record definition from which to draw the column's value. If not specified, the column's index is used as an index into the Record's data Array. --->
<cfparam name="attributes.dataIndexJS" default=""><!--- @@type: JS @@help: (optional) The name of the field in the grid's Ext.data.Store's Ext.data.Record definition from which to draw the column's value. If not specified, the column's index is used as an index into the Record's data Array. --->
<cfparam name="attributes.editor" default=""><!--- @@type: Ext.form.Field @@help: (optional) The Ext.form.Field to use when editing values in this column if editing is supported by the grid. --->
<cfparam name="attributes.fixed" default=""><!--- @@type: Boolean @@help: (optional) True if the column width cannot be changed. Defaults to false. --->
<cfparam name="attributes.header" default=""><!--- @@type: String @@help: The header text to display in the Grid view. --->
<cfparam name="attributes.headerJS" default=""><!--- @@type: JS @@help: The header text to display in the Grid view. --->
<cfparam name="attributes.hidden" default=""><!--- @@type: Boolean @@help: (optional) True to hide the column. Defaults to false. --->
<cfparam name="attributes.hideable" default=""><!--- @@type: Boolean @@help: (optional) Specify as false to prevent the user from hiding this column (defaults to true). To disallow column hiding globally for all columns in the grid, use Ext.grid.GridPanel.enableColumnHide instead. --->
<cfparam name="attributes.id" default=""><!--- @@type: String @@help: (optional) Defaults to the column's initial ordinal position. A name which identifies this column. The id is used to create a CSS class name which is applied to all table cells (including headers) in that column. The class name takes the form of x-grid3-td-id  Header cells will also recieve this class name, but will also have the class x-grid3-hd, so to target header cells, use CSS selectors such as:.x-grid3-hd.x-grid3-td-id The Ext.grid.GridPanel.autoExpandColumn grid config option references the column via this identifier. --->
<cfparam name="attributes.idJS" default=""><!--- @@type: JS @@help: (optional) Defaults to the column's initial ordinal position. A name which identifies this column. The id is used to create a CSS class name which is applied to all table cells (including headers) in that column. The class name takes the form of x-grid3-td-id  Header cells will also recieve this class name, but will also have the class x-grid3-hd, so to target header cells, use CSS selectors such as:.x-grid3-hd.x-grid3-td-id The Ext.grid.GridPanel.autoExpandColumn grid config option references the column via this identifier. --->
<cfparam name="attributes.listeners" default=""><!--- @@type: Object @@help: (optional) A config object containing one or more event handlers to be added to this object during initialization. This should be a valid listeners config object as specified in the addListener example for attaching multiple handlers at once. --->
<cfparam name="attributes.menuDisabled" default=""><!--- @@type: Boolean @@help: (optional) True to disable the column menu. Defaults to false. --->
<cfparam name="attributes.renderer" default=""><!--- @@type: Function @@help: (optional) A function used to generate HTML markup for a cell given the cell's data value. See setRenderer. If not specified, the default renderer uses the raw data value. --->
<cfparam name="attributes.resizable" default=""><!--- @@type: Boolean @@help: (optional) False to disable column resizing. Defaults to true. --->
<cfparam name="attributes.sortable" default=""><!--- @@type: Boolean @@help: (optional) True if sorting is to be allowed on this column. Defaults to the value of the defaultSortable property. Whether local/remote sorting is used is specified in Ext.data.Store.remoteSort. --->
<cfparam name="attributes.tooltip" default=""><!--- @@type: String @@help: (optional) A text string to use as the column header's tooltip. If Quicktips are enabled, this value will be used as the text of the quick tip, otherwise it will be set as the header's HTML title attribute. Defaults to ''. --->
<cfparam name="attributes.tooltipJS" default=""><!--- @@type: JS @@help: (optional) A text string to use as the column header's tooltip. If Quicktips are enabled, this value will be used as the text of the quick tip, otherwise it will be set as the header's HTML title attribute. Defaults to ''. --->
<cfparam name="attributes.width" default=""><!--- @@type: Number @@help: (optional) The initial width in pixels of the column. This is ignored if the Grid's view is configured with forceFit true. --->

<!--- custom attributes --->
<cfparam name="attributes.passThrough" default=""><!--- @@type: JS @@help: (ColdExt attribute) A comma separated list of JavaScript name:value pairs that will be written directly to the Ext component config. This is useful for storing custom properties in Ext components. --->
<cfparam name="attributes.var" default=""><!--- @@type: JS Variable Name @@help: (ColdExt attribute) The JavaScript variable name that this component will be assigned to. NOTE: You should only use the var attribute when this tags parent is the onReady tag. --->
<cfparam name="attributes.plugin" default=""><!--- @@type: String @@help: (ColdExt attribute) The JavaScript variable which holds the plugin component that will be used at the source of this grid column --->
<cfparam name="attributes.summaryRenderer" default=""><!--- @@type: Function @@help: (ux Group Summary) Renderer function to return output for the summary field. --->
<cfparam name="attributes.summaryType" default=""><!--- @@type: String @@options: average,count,max,min,sum @@help: (ux Group Summary) The type of operation to perform to calculate the column summary value. Custom functions can be added to the Ext.grid.GroupSummary.Calculations[] array. --->



<!--- arrays that may be populated by nested tags --->
<cfset thisTag.editor = ArrayNew(1)>
<cfset thisTag.listeners = ArrayNew(1)>
<cfset thisTag.tooltip = ArrayNew(1)>

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


<!--- grid column plugin special case --->
<cfif AttributeNotEmpty("plugin")>

	<cfsavecontent variable="attributes._out">
	<cfprocessingdirective suppresswhitespace="true">
	<cfoutput>
				#attributes.plugin#</cfoutput>
	</cfprocessingdirective>
	</cfsavecontent>

	<cfassociate basetag="#parentTag#" datacollection="columns">
	<cfexit method="exittag">

</cfif>


<cfsavecontent variable="attributes._out">
<cfprocessingdirective suppresswhitespace="true">
<cfoutput>
	<cfif AttributeNotEmpty("var")>var #attributes.var# = new Ext.grid.ColumnModel(</cfif>{
		<cfif AttributeNotEmpty("align")>align: "#JSStringFormat(attributes.align)#",</cfif>
		<cfif AttributeNotEmpty("alignJS")>align: #attributes.alignJS#,</cfif>
		<cfif AttributeNotEmpty("css")>css: "#JSStringFormat(attributes.css)#",</cfif>
		<cfif AttributeNotEmpty("cssJS")>css: #attributes.cssJS#,</cfif>
		<cfif AttributeNotEmpty("dataIndex")>dataIndex: "#JSStringFormat(attributes.dataIndex)#",</cfif>
		<cfif AttributeNotEmpty("dataIndexJS")>dataIndex: #attributes.dataIndexJS#,</cfif>
		<cfif AttributeNotEmpty("editor")>editor: #attributes.editor#,</cfif>
		<cfif AttributeNotEmpty("fixed")>fixed: #attributes.fixed#,</cfif>
		<cfif AttributeNotEmpty("header")>header: "#JSStringFormat(attributes.header)#",</cfif>
		<cfif AttributeNotEmpty("headerJS")>header: #attributes.headerJS#,</cfif>
		<cfif AttributeNotEmpty("hidden")>hidden: #attributes.hidden#,</cfif>
		<cfif AttributeNotEmpty("hideable")>hideable: #attributes.hideable#,</cfif>
		<cfif AttributeNotEmpty("id")>id: "#JSStringFormat(attributes.id)#",</cfif>
		<cfif AttributeNotEmpty("idJS")>id: #attributes.idJS#,</cfif>
		<cfif AttributeNotEmpty("listeners")>listeners: #attributes.listeners#,</cfif>
		<cfif AttributeNotEmpty("menuDisabled")>menuDisabled: #attributes.menuDisabled#,</cfif>
		<cfif AttributeNotEmpty("renderer")>renderer: #attributes.renderer#,</cfif>
		<cfif AttributeNotEmpty("resizable")>resizable: #attributes.resizable#,</cfif>
		<cfif AttributeNotEmpty("sortable")>sortable: #attributes.sortable#,</cfif>
		<cfif AttributeNotEmpty("tooltip")>tooltip: "#JSStringFormat(attributes.tooltip)#",</cfif>
		<cfif AttributeNotEmpty("tooltipJS")>tooltip: #attributes.tooltipJS#,</cfif>
		<cfif AttributeNotEmpty("width")>width: #attributes.width#,</cfif>

		<cfif AttributeNotEmpty("passThrough")>#attributes.passThrough#,</cfif>

		<cfif arrayLen(thisTag.editor)>editor: #thisTag.editor[1]._out#,</cfif>
		<cfif arrayLen(thisTag.listeners)>listeners: { #ArrayKeyToList(thisTag.listeners, "_out")# },</cfif>
		<cfif arrayLen(thisTag.tooltip)>tooltip: #thisTag.tooltip[1]._out#,</cfif>

		<cfif AttributeNotEmpty("summaryRenderer")>summaryRenderer: #attributes.summaryRenderer#,</cfif>
		<cfif AttributeNotEmpty("summaryType")>summaryType: "#JSStringFormat(attributes.summaryType)#",</cfif>
		<cfif AttributeNotEmpty("summaryTypeJS")>summaryType: #attributes.summaryTypeJS#,</cfif>

		dummy: true
	}<cfif AttributeNotEmpty("var")>);</cfif>
</cfoutput>
</cfprocessingdirective>
</cfsavecontent>

<cfassociate basetag="#parentTag#" datacollection="#_collection#">


</cfif>


<cfsetting enablecfoutputonly="false">