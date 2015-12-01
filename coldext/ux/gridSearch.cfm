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
<cfinclude template="resources/gridsearch.cfm">


<!--- defaults --->
<cfparam name="attributes.iconCls" default="">

<!--- attributes --->
<cfparam name="attributes.autoFocus" default=""><!--- @@type: Boolean @@help: true to try to focus the input field on each store load (defaults to undefined) --->
<cfparam name="attributes.searchText" default=""><!--- @@type: String @@help: Text to display on menu button --->
<cfparam name="attributes.searchTextJS" default=""><!--- @@type: JS @@help: Text to display on menu button --->
<cfparam name="attributes.searchTipText" default=""><!--- @@type: String @@help: Text to display as input tooltip. Set to '' for no tooltip --->
<cfparam name="attributes.searchTipTextJS" default=""><!--- @@type: JS @@help: Text to display as input tooltip. Set to '' for no tooltip --->
<cfparam name="attributes.selectAllText" default=""><!--- @@type: String @@help: Text to display on menu item that selects all fields --->
<cfparam name="attributes.selectAllTextJS" default=""><!--- @@type: JS @@help: Text to display on menu item that selects all fields --->
<cfparam name="attributes.position" default=""><!--- @@type: String @@help: Where to display the search controls. Valid values are top and bottom (defaults to bottom). Corresponding toolbar has to exist at least with mimimum configuration tbar:[] for position:top or bbar:[] for position bottom. Plugin does NOT create any toolbar. --->
<cfparam name="attributes.positionJS" default=""><!--- @@type: JS @@help: Where to display the search controls. Valid values are top and bottom (defaults to bottom). Corresponding toolbar has to exist at least with mimimum configuration tbar:[] for position:top or bbar:[] for position bottom. Plugin does NOT create any toolbar. --->
<cfparam name="attributes.iconCls" default=""><!--- @@type: String @@help: Icon class for menu button (defaults to icon-magnifier) --->
<cfparam name="attributes.iconClsJS" default=""><!--- @@type: JS @@help: Icon class for menu button (defaults to icon-magnifier) --->
<cfparam name="attributes.checkIndexes" default=""><!--- @@type: String @@help: Which indexes to check by default. Can be either 'all' for all indexes or array of dataIndex names, e.g. ['persFirstName', 'persLastName'] --->
<cfparam name="attributes.checkIndexesJS" default=""><!--- @@type: String/Array @@help: Which indexes to check by default. Can be either 'all' for all indexes or array of dataIndex names, e.g. ['persFirstName', 'persLastName'] --->
<cfparam name="attributes.disableIndexes" default=""><!--- @@type: Array @@help: Array of index names to disable (not show in the menu), e.g. ['persTitle', 'persTitle2'] --->
<cfparam name="attributes.dateFormat" default=""><!--- @@type: String @@help: how to format date values. If undefined (the default) date is formatted as configured in colummn model --->
<cfparam name="attributes.dateFormatJS" default=""><!--- @@type: JS @@help: how to format date values. If undefined (the default) date is formatted as configured in colummn model --->
<cfparam name="attributes.showSelectAll" default=""><!--- @@type: Boolean @@help: Select All item is shown in menu if true (defaults to true) --->
<cfparam name="attributes.menuStyle" default=""><!--- @@type: String @@help: Valid values are 'checkbox' and 'radio'. If menuStyle is radio then only one field can be searched at a time and selectAll is automatically switched off. --->
<cfparam name="attributes.menuStyleJS" default=""><!--- @@type: JS @@help: Valid values are 'checkbox' and 'radio'. If menuStyle is radio then only one field can be searched at a time and selectAll is automatically switched off. --->
<cfparam name="attributes.minChars" default=""><!--- @@type: Number @@help: minimum characters to type before the request is made. If undefined (the default) the trigger field shows magnifier icon and you need to click it or press enter for search to start. If it is defined and greater than 0 then maginfier is not shown and search starts after minChars are typed. --->
<cfparam name="attributes.minCharsTipText" default=""><!--- @@type: String @@help: Tooltip to display if minChars is > 0 --->
<cfparam name="attributes.minCharsTipTextJS" default=""><!--- @@type: JS @@help: Tooltip to display if minChars is > 0 --->
<cfparam name="attributes.mode" default=""><!--- @@type: String @@help: Use 'remote' for remote stores or 'local' for local stores. If mode is local no data requests are sent to server the grid's store is filtered instead (defaults to 'remote') --->
<cfparam name="attributes.modeJS" default=""><!--- @@type: JS @@help: Use 'remote' for remote stores or 'local' for local stores. If mode is local no data requests are sent to server the grid's store is filtered instead (defaults to 'remote') --->
<cfparam name="attributes.readonlyIndexes" default=""><!--- @@type: Array @@help: Array of index names to disable (show in menu disabled), e.g. ['persTitle', 'persTitle2'] --->
<cfparam name="attributes.width" default=""><!--- @@type: Number @@help: Width of input field in pixels (defaults to 100) --->
<cfparam name="attributes.xtype" default=""><!--- @@type: String @@help: xtype is usually not used to instantiate this plugin but you have a chance to identify it --->
<cfparam name="attributes.xtypeJS" default=""><!--- @@type: JS @@help: xtype is usually not used to instantiate this plugin but you have a chance to identify it --->
<cfparam name="attributes.paramNames" default=""><!--- @@type: Object @@help: Params name map (defaults to {fields:'fields', query:'query'} --->

<!--- custom attributes --->
<cfparam name="attributes.passThrough" default=""><!--- @@type: JS @@help: (ColdExt attribute) A comma separated list of JavaScript name:value pairs that will be written directly to the Ext component config. This is useful for storing custom properties in Ext components. --->
<cfparam name="attributes.var" default=""><!--- @@type: JS Variable Name @@help: (ColdExt attribute) The JavaScript variable name that this component will be assigned to. NOTE: You should only use the var attribute when this tags parent is the onReady tag. --->



<!--- arrays that may be populated by nested tags --->

<!--- process custom attributes --->
<!--- var --->
<cfset attributes.var = validateVarAttribute(parentTag)>




<cfelseif thisTag.executionMode eq "end">



<cfsavecontent variable="attributes._out">
<cfprocessingdirective suppresswhitespace="true">
<cfoutput>
	<cfif AttributeNotEmpty("var")>var #attributes.var# = </cfif>new Ext.ux.grid.Search({
		<cfif AttributeNotEmpty("autoFocus")>autoFocus: #attributes.autoFocus#,</cfif>
		<cfif AttributeNotEmpty("searchText")>searchText: "#JSStringFormat(attributes.searchText)#",</cfif>
		<cfif AttributeNotEmpty("searchTextJS")>searchText: #attributes.searchTextJS#,</cfif>
		<cfif AttributeNotEmpty("searchTipText")>searchTipText: "#JSStringFormat(attributes.searchTipText)#",</cfif>
		<cfif AttributeNotEmpty("searchTipTextJS")>searchTipText: #attributes.searchTipTextJS#,</cfif>
		<cfif AttributeNotEmpty("selectAllText")>selectAllText: "#JSStringFormat(attributes.selectAllText)#",</cfif>
		<cfif AttributeNotEmpty("selectAllTextJS")>selectAllText: #attributes.selectAllTextJS#,</cfif>
		<cfif AttributeNotEmpty("position")>position: "#JSStringFormat(attributes.position)#",</cfif>
		<cfif AttributeNotEmpty("positionJS")>position: #attributes.positionJS#,</cfif>
		<cfif AttributeNotEmpty("iconCls")>iconCls: "#JSStringFormat(attributes.iconCls)#",</cfif>
		<cfif AttributeNotEmpty("iconClsJS")>iconCls: #attributes.iconClsJS#,</cfif>
		<cfif AttributeNotEmpty("checkIndexes")>checkIndexes: "#JSStringFormat(attributes.checkIndexes)#",</cfif>
		<cfif AttributeNotEmpty("checkIndexesJS")>checkIndexes: #attributes.checkIndexesJS#,</cfif>
		<cfif AttributeNotEmpty("disableIndexes")>disableIndexes: #attributes.disableIndexes#,</cfif>
		<cfif AttributeNotEmpty("dateFormat")>dateFormat: "#JSStringFormat(attributes.dateFormat)#",</cfif>
		<cfif AttributeNotEmpty("dateFormatJS")>dateFormat: #attributes.dateFormatJS#,</cfif>
		<cfif AttributeNotEmpty("showSelectAll")>showSelectAll: #attributes.showSelectAll#,</cfif>
		<cfif AttributeNotEmpty("menuStyle")>menuStyle: "#JSStringFormat(attributes.menuStyle)#",</cfif>
		<cfif AttributeNotEmpty("menuStyleJS")>menuStyle: #attributes.menuStyleJS#,</cfif>
		<cfif AttributeNotEmpty("minChars")>minChars: #attributes.minChars#,</cfif>
		<cfif AttributeNotEmpty("minCharsTipText")>minCharsTipText: "#JSStringFormat(attributes.minCharsTipText)#",</cfif>
		<cfif AttributeNotEmpty("minCharsTipTextJS")>minCharsTipText: #attributes.minCharsTipTextJS#,</cfif>
		<cfif AttributeNotEmpty("mode")>mode: "#JSStringFormat(attributes.mode)#",</cfif>
		<cfif AttributeNotEmpty("modeJS")>mode: #attributes.modeJS#,</cfif>
		<cfif AttributeNotEmpty("readonlyIndexes")>readonlyIndexes: #attributes.readonlyIndexes#,</cfif>
		<cfif AttributeNotEmpty("width")>width: #attributes.width#,</cfif>
		<cfif AttributeNotEmpty("xtype")>xtype: "#JSStringFormat(attributes.xtype)#",</cfif>
		<cfif AttributeNotEmpty("xtypeJS")>xtype: #attributes.xtypeJS#,</cfif>
		<cfif AttributeNotEmpty("paramNames")>paramNames: #attributes.paramNames#,</cfif>

		<cfif AttributeNotEmpty("passThrough")>#attributes.passThrough#,</cfif>



		dummy: true
	})<cfif AttributeNotEmpty("var")>;</cfif>
</cfoutput>
</cfprocessingdirective>
</cfsavecontent>

<cfassociate basetag="#parentTag#" datacollection="items">


</cfif>


<cfsetting enablecfoutputonly="false">