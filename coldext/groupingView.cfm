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
<cfparam name="attributes.autoFill" default=""><!--- @@type: Boolean @@help: True to auto expand the columns to fit the grid when the grid is created. --->
<cfparam name="attributes.cellSelector" default=""><!--- @@type: String @@help: The selector used to find cells internally --->
<cfparam name="attributes.cellSelectorJS" default=""><!--- @@type: JS @@help: The selector used to find cells internally --->
<cfparam name="attributes.cellSelectorDepth" default=""><!--- @@type: Number @@help: The number of levels to search for cells in event delegation (defaults to 4) --->
<cfparam name="attributes.deferEmptyText" default=""><!--- @@type: Boolean @@help: True to defer emptyText being applied until the store's first load --->
<cfparam name="attributes.emptyGroupText" default=""><!--- @@type: String @@help: The text to display when there is an empty group value --->
<cfparam name="attributes.emptyGroupTextJS" default=""><!--- @@type: JS @@help: The text to display when there is an empty group value --->
<cfparam name="attributes.emptyText" default=""><!--- @@type: String @@help: Default text to display in the grid body when no rows are available (defaults to ''). --->
<cfparam name="attributes.emptyTextJS" default=""><!--- @@type: JS @@help: Default text to display in the grid body when no rows are available (defaults to ''). --->
<cfparam name="attributes.enableGrouping" default=""><!--- @@type: Boolean @@help: False to disable grouping functionality (defaults to true) --->
<cfparam name="attributes.enableGroupingMenu" default=""><!--- @@type: Boolean @@help: True to enable the grouping control in the column menu --->
<cfparam name="attributes.enableNoGroups" default=""><!--- @@type: Boolean @@help: True to allow the user to turn off grouping --->
<cfparam name="attributes.enableRowBody" default=""><!--- @@type: Boolean @@help: True to add a second TR element per row that can be used to provide a row body that spans beneath the data row. Use the getRowClass method's rowParams config to customize the row body. --->
<cfparam name="attributes.forceFit" default=""><!--- @@type: Boolean @@help: True to auto expand/contract the size of the columns to fit the grid width and prevent horizontal scrolling. This option overrides any (@link Ext.grid.ColumnModel#width width} settings in the ColumnModel. --->
<cfparam name="attributes.groupByText" default=""><!--- @@type: String @@help: Text displayed in the grid header menu for grouping by a column (defaults to 'Group By This Field'). --->
<cfparam name="attributes.groupByTextJS" default=""><!--- @@type: JS @@help: Text displayed in the grid header menu for grouping by a column (defaults to 'Group By This Field'). --->
<cfparam name="attributes.groupRenderer" default=""><!--- @@type: Function @@help: The function used to format the grouping field value for display in the group header. Should return a string value. This takes the following parameters:  v : ObjectThe new value of the group field. unused : undefinedUnused parameter. r : Ext.data.RecordThe Record providing the data for the row which caused group change. rowIndex : NumberThe row index of the Record which caused group change. colIndex : NumberThe column index of the group field. ds : Ext.data.StoreThe Store which is providing the data Model. --->
<cfparam name="attributes.groupTextTpl" default=""><!--- @@type: String @@help: The template used to render the group header. This is used to format an object which contains the following properties:  group : StringThe rendered value of the group field. By default this is the unchanged value of the group field. If a groupRenderer is specified, it is the result of a call to that. gvalue : ObjectThe raw value of the group field. text : StringThe configured header (If showGroupName is true) plus the renderedgroup field value. groupId : StringA unique, generated ID which is applied to the View Element which contains the group. startRow : NumberThe row index of the Record which caused group change. rs : Array.Contains a single element: The Record providing the data for the row which caused group change. cls : StringThe generated class name string to apply to the group header Element. style : StringThe inline style rules to apply to the group header Element.  See Ext.XTemplate for information on how to format data using a template. --->
<cfparam name="attributes.groupTextTplJS" default=""><!--- @@type: JS @@help: The template used to render the group header. This is used to format an object which contains the following properties:  group : StringThe rendered value of the group field. By default this is the unchanged value of the group field. If a groupRenderer is specified, it is the result of a call to that. gvalue : ObjectThe raw value of the group field. text : StringThe configured header (If showGroupName is true) plus the renderedgroup field value. groupId : StringA unique, generated ID which is applied to the View Element which contains the group. startRow : NumberThe row index of the Record which caused group change. rs : Array.Contains a single element: The Record providing the data for the row which caused group change. cls : StringThe generated class name string to apply to the group header Element. style : StringThe inline style rules to apply to the group header Element.  See Ext.XTemplate for information on how to format data using a template. --->
<cfparam name="attributes.header" default=""><!--- @@type: String @@help: The text with which to prefix the group field value in the group header line. --->
<cfparam name="attributes.headerJS" default=""><!--- @@type: JS @@help: The text with which to prefix the group field value in the group header line. --->
<cfparam name="attributes.hideGroupedColumn" default=""><!--- @@type: Boolean @@help: True to hide the column that is currently grouped --->
<cfparam name="attributes.ignoreAdd" default=""><!--- @@type: Boolean @@help: True to skip refreshing the view when new rows are added (defaults to false) --->
<cfparam name="attributes.listeners" default=""><!--- @@type: Object @@help: (optional) A config object containing one or more event handlers to be added to this object during initialization. This should be a valid listeners config object as specified in the addListener example for attaching multiple handlers at once. --->
<cfparam name="attributes.rowSelector" default=""><!--- @@type: String @@help: The selector used to find rows internally --->
<cfparam name="attributes.rowSelectorJS" default=""><!--- @@type: JS @@help: The selector used to find rows internally --->
<cfparam name="attributes.rowSelectorDepth" default=""><!--- @@type: Number @@help: The number of levels to search for rows in event delegation (defaults to 10) --->
<cfparam name="attributes.showGroupName" default=""><!--- @@type: Boolean @@help: True to display the name for each set of grouped rows (defaults to true) --->
<cfparam name="attributes.showGroupsText" default=""><!--- @@type: String @@help: Text displayed in the grid header for enabling/disabling grouping (defaults to 'Show in Groups'). --->
<cfparam name="attributes.showGroupsTextJS" default=""><!--- @@type: JS @@help: Text displayed in the grid header for enabling/disabling grouping (defaults to 'Show in Groups'). --->
<cfparam name="attributes.startCollapsed" default=""><!--- @@type: Boolean @@help: True to start all groups collapsed --->

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
<cfset _collection = "view">
<cfif ListFind("CF_ONREADY", parentTag)>
	<cfset _collection = "items">
</cfif>


<cfsavecontent variable="attributes._out">
<cfprocessingdirective suppresswhitespace="true">
<cfoutput>
	<cfif AttributeNotEmpty("var")>var #attributes.var# = </cfif>new Ext.grid.GroupingView({
		<cfif AttributeNotEmpty("autoFill")>autoFill: #attributes.autoFill#,</cfif>
		<cfif AttributeNotEmpty("cellSelector")>cellSelector: "#JSStringFormat(attributes.cellSelector)#",</cfif>
		<cfif AttributeNotEmpty("cellSelectorJS")>cellSelector: #attributes.cellSelectorJS#,</cfif>
		<cfif AttributeNotEmpty("cellSelectorDepth")>cellSelectorDepth: #attributes.cellSelectorDepth#,</cfif>
		<cfif AttributeNotEmpty("deferEmptyText")>deferEmptyText: #attributes.deferEmptyText#,</cfif>
		<cfif AttributeNotEmpty("emptyGroupText")>emptyGroupText: "#JSStringFormat(attributes.emptyGroupText)#",</cfif>
		<cfif AttributeNotEmpty("emptyGroupTextJS")>emptyGroupText: #attributes.emptyGroupTextJS#,</cfif>
		<cfif AttributeNotEmpty("emptyText")>emptyText: "#JSStringFormat(attributes.emptyText)#",</cfif>
		<cfif AttributeNotEmpty("emptyTextJS")>emptyText: #attributes.emptyTextJS#,</cfif>
		<cfif AttributeNotEmpty("enableGrouping")>enableGrouping: #attributes.enableGrouping#,</cfif>
		<cfif AttributeNotEmpty("enableGroupingMenu")>enableGroupingMenu: #attributes.enableGroupingMenu#,</cfif>
		<cfif AttributeNotEmpty("enableNoGroups")>enableNoGroups: #attributes.enableNoGroups#,</cfif>
		<cfif AttributeNotEmpty("enableRowBody")>enableRowBody: #attributes.enableRowBody#,</cfif>
		<cfif AttributeNotEmpty("forceFit")>forceFit: #attributes.forceFit#,</cfif>
		<cfif AttributeNotEmpty("groupByText")>groupByText: "#JSStringFormat(attributes.groupByText)#",</cfif>
		<cfif AttributeNotEmpty("groupByTextJS")>groupByText: #attributes.groupByTextJS#,</cfif>
		<cfif AttributeNotEmpty("groupRenderer")>groupRenderer: #attributes.groupRenderer#,</cfif>
		<cfif AttributeNotEmpty("groupTextTpl")>groupTextTpl: "#JSStringFormat(attributes.groupTextTpl)#",</cfif>
		<cfif AttributeNotEmpty("groupTextTplJS")>groupTextTpl: #attributes.groupTextTplJS#,</cfif>
		<cfif AttributeNotEmpty("header")>header: "#JSStringFormat(attributes.header)#",</cfif>
		<cfif AttributeNotEmpty("headerJS")>header: #attributes.headerJS#,</cfif>
		<cfif AttributeNotEmpty("hideGroupedColumn")>hideGroupedColumn: #attributes.hideGroupedColumn#,</cfif>
		<cfif AttributeNotEmpty("ignoreAdd")>ignoreAdd: #attributes.ignoreAdd#,</cfif>
		<cfif AttributeNotEmpty("listeners")>listeners: #attributes.listeners#,</cfif>
		<cfif AttributeNotEmpty("rowSelector")>rowSelector: "#JSStringFormat(attributes.rowSelector)#",</cfif>
		<cfif AttributeNotEmpty("rowSelectorJS")>rowSelector: #attributes.rowSelectorJS#,</cfif>
		<cfif AttributeNotEmpty("rowSelectorDepth")>rowSelectorDepth: #attributes.rowSelectorDepth#,</cfif>
		<cfif AttributeNotEmpty("showGroupName")>showGroupName: #attributes.showGroupName#,</cfif>
		<cfif AttributeNotEmpty("showGroupsText")>showGroupsText: "#JSStringFormat(attributes.showGroupsText)#",</cfif>
		<cfif AttributeNotEmpty("showGroupsTextJS")>showGroupsText: #attributes.showGroupsTextJS#,</cfif>
		<cfif AttributeNotEmpty("startCollapsed")>startCollapsed: #attributes.startCollapsed#,</cfif>

		<cfif AttributeNotEmpty("passThrough")>#attributes.passThrough#,</cfif>

		<cfif arrayLen(thisTag.listeners)>listeners: { #ArrayKeyToList(thisTag.listeners, "_out")# },</cfif>


		dummy: true
	})<cfif AttributeNotEmpty("var")>;</cfif>
</cfoutput>
</cfprocessingdirective>
</cfsavecontent>

<cfassociate basetag="#parentTag#" datacollection="#_collection#">


</cfif>


<cfsetting enablecfoutputonly="false">