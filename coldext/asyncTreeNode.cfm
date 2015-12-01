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
<cfparam name="attributes.allowChildren" default=""><!--- @@type: Boolean @@help: False to not allow this node to have child nodes (defaults to true) --->
<cfparam name="attributes.allowDrag" default=""><!--- @@type: Boolean @@help: False to make this node undraggable if draggable = true (defaults to true) --->
<cfparam name="attributes.allowDrop" default=""><!--- @@type: Boolean @@help: False if this node cannot have child nodes dropped on it (defaults to true) --->
<cfparam name="attributes.checked" default=""><!--- @@type: Boolean @@help: True to render a checked checkbox for this node, false to render an unchecked checkbox (defaults to undefined with no checkbox rendered) --->
<cfparam name="attributes.cls" default=""><!--- @@type: String @@help: A css class to be added to the node --->
<cfparam name="attributes.clsJS" default=""><!--- @@type: JS @@help: A css class to be added to the node --->
<cfparam name="attributes.disabled" default=""><!--- @@type: Boolean @@help: true to start the node disabled --->
<cfparam name="attributes.draggable" default=""><!--- @@type: Boolean @@help: True to make this node draggable (defaults to false) --->
<cfparam name="attributes.expandable" default=""><!--- @@type: Boolean @@help: If set to true, the node will always show a plus/minus icon, even when empty --->
<cfparam name="attributes.expanded" default=""><!--- @@type: Boolean @@help: true to start the node expanded --->
<cfparam name="attributes.href" default=""><!--- @@type: String @@help: URL of the link used for the node (defaults to #) --->
<cfparam name="attributes.hrefJS" default=""><!--- @@type: JS @@help: URL of the link used for the node (defaults to #) --->
<cfparam name="attributes.hrefTarget" default=""><!--- @@type: String @@help: target frame for the link --->
<cfparam name="attributes.hrefTargetJS" default=""><!--- @@type: JS @@help: target frame for the link --->
<cfparam name="attributes.icon" default=""><!--- @@type: String @@help: The path to an icon for the node. The preferred way to do this is to use the cls or iconCls attributes and add the icon via a CSS background image. --->
<cfparam name="attributes.iconJS" default=""><!--- @@type: JS @@help: The path to an icon for the node. The preferred way to do this is to use the cls or iconCls attributes and add the icon via a CSS background image. --->
<cfparam name="attributes.iconCls" default=""><!--- @@type: String @@help: A css class to be added to the nodes icon element for applying css background images --->
<cfparam name="attributes.iconClsJS" default=""><!--- @@type: JS @@help: A css class to be added to the nodes icon element for applying css background images --->
<cfparam name="attributes.id" default=""><!--- @@type: String @@help: The id for this node. If one is not specified, one is generated. --->
<cfparam name="attributes.idJS" default=""><!--- @@type: JS @@help: The id for this node. If one is not specified, one is generated. --->
<cfparam name="attributes.isTarget" default=""><!--- @@type: Boolean @@help: False to not allow this node to act as a drop target (defaults to true) --->
<cfparam name="attributes.leaf" default=""><!--- @@type: Boolean @@help: true if this node is a leaf and does not have children --->
<cfparam name="attributes.listeners" default=""><!--- @@type: Object @@help: (optional) A config object containing one or more event handlers to be added to this object during initialization. This should be a valid listeners config object as specified in the addListener example for attaching multiple handlers at once. --->
<cfparam name="attributes.loader" default=""><!--- @@type: TreeLoader @@help: A TreeLoader to be used by this node (defaults to the loader defined on the tree) --->
<cfparam name="attributes.qtip" default=""><!--- @@type: String @@help: An Ext QuickTip for the node --->
<cfparam name="attributes.qtipJS" default=""><!--- @@type: JS @@help: An Ext QuickTip for the node --->
<cfparam name="attributes.qtipCfg" default=""><!--- @@type: String @@help: An Ext QuickTip config for the node (used instead of qtip) --->
<cfparam name="attributes.qtipCfgJS" default=""><!--- @@type: JS @@help: An Ext QuickTip config for the node (used instead of qtip) --->
<cfparam name="attributes.singleClickExpand" default=""><!--- @@type: Boolean @@help: True for single click expand on this node --->
<cfparam name="attributes.text" default=""><!--- @@type: String @@help: The text for this node --->
<cfparam name="attributes.textJS" default=""><!--- @@type: JS @@help: The text for this node --->
<cfparam name="attributes.uiProvider" default=""><!--- @@type: Function @@help: A UI class to use for this node (defaults to Ext.tree.TreeNodeUI) --->

<!--- custom attributes --->
<cfparam name="attributes.passThrough" default=""><!--- @@type: JS @@help: (ColdExt attribute) A comma separated list of JavaScript name:value pairs that will be written directly to the Ext component config. This is useful for storing custom properties in Ext components. --->
<cfparam name="attributes.var" default=""><!--- @@type: JS Variable Name @@help: (ColdExt attribute) The JavaScript variable name that this component will be assigned to. NOTE: You should only use the var attribute when this tags parent is the onReady tag. --->



<!--- arrays that may be populated by nested tags --->
<cfset thisTag.listeners = ArrayNew(1)>
<cfset thisTag.loader = ArrayNew(1)>

<!--- process custom attributes --->
<!--- var --->
<cfset attributes.var = validateVarAttribute(parentTag)>




<cfelseif thisTag.executionMode eq "end">



<cfsavecontent variable="attributes._out">
<cfprocessingdirective suppresswhitespace="true">
<cfoutput>
	<cfif AttributeNotEmpty("var")>var #attributes.var# = </cfif>new Ext.tree.AsyncTreeNode({
		<cfif AttributeNotEmpty("allowChildren")>allowChildren: #attributes.allowChildren#,</cfif>
		<cfif AttributeNotEmpty("allowDrag")>allowDrag: #attributes.allowDrag#,</cfif>
		<cfif AttributeNotEmpty("allowDrop")>allowDrop: #attributes.allowDrop#,</cfif>
		<cfif AttributeNotEmpty("checked")>checked: #attributes.checked#,</cfif>
		<cfif AttributeNotEmpty("cls")>cls: "#JSStringFormat(attributes.cls)#",</cfif>
		<cfif AttributeNotEmpty("clsJS")>cls: #attributes.clsJS#,</cfif>
		<cfif AttributeNotEmpty("disabled")>disabled: #attributes.disabled#,</cfif>
		<cfif AttributeNotEmpty("draggable")>draggable: #attributes.draggable#,</cfif>
		<cfif AttributeNotEmpty("expandable")>expandable: #attributes.expandable#,</cfif>
		<cfif AttributeNotEmpty("expanded")>expanded: #attributes.expanded#,</cfif>
		<cfif AttributeNotEmpty("href")>href: "#JSStringFormat(attributes.href)#",</cfif>
		<cfif AttributeNotEmpty("hrefJS")>href: #attributes.hrefJS#,</cfif>
		<cfif AttributeNotEmpty("hrefTarget")>hrefTarget: "#JSStringFormat(attributes.hrefTarget)#",</cfif>
		<cfif AttributeNotEmpty("hrefTargetJS")>hrefTarget: #attributes.hrefTargetJS#,</cfif>
		<cfif AttributeNotEmpty("icon")>icon: "#JSStringFormat(attributes.icon)#",</cfif>
		<cfif AttributeNotEmpty("iconJS")>icon: #attributes.iconJS#,</cfif>
		<cfif AttributeNotEmpty("iconCls")>iconCls: "#JSStringFormat(attributes.iconCls)#",</cfif>
		<cfif AttributeNotEmpty("iconClsJS")>iconCls: #attributes.iconClsJS#,</cfif>
		<cfif AttributeNotEmpty("id")>id: "#JSStringFormat(attributes.id)#",</cfif>
		<cfif AttributeNotEmpty("idJS")>id: #attributes.idJS#,</cfif>
		<cfif AttributeNotEmpty("isTarget")>isTarget: #attributes.isTarget#,</cfif>
		<cfif AttributeNotEmpty("leaf")>leaf: #attributes.leaf#,</cfif>
		<cfif AttributeNotEmpty("listeners")>listeners: #attributes.listeners#,</cfif>
		<cfif AttributeNotEmpty("loader")>loader: #attributes.loader#,</cfif>
		<cfif AttributeNotEmpty("qtip")>qtip: "#JSStringFormat(attributes.qtip)#",</cfif>
		<cfif AttributeNotEmpty("qtipJS")>qtip: #attributes.qtipJS#,</cfif>
		<cfif AttributeNotEmpty("qtipCfg")>qtipCfg: "#JSStringFormat(attributes.qtipCfg)#",</cfif>
		<cfif AttributeNotEmpty("qtipCfgJS")>qtipCfg: #attributes.qtipCfgJS#,</cfif>
		<cfif AttributeNotEmpty("singleClickExpand")>singleClickExpand: #attributes.singleClickExpand#,</cfif>
		<cfif AttributeNotEmpty("text")>text: "#JSStringFormat(attributes.text)#",</cfif>
		<cfif AttributeNotEmpty("textJS")>text: #attributes.textJS#,</cfif>
		<cfif AttributeNotEmpty("uiProvider")>uiProvider: #attributes.uiProvider#,</cfif>

		<cfif AttributeNotEmpty("passThrough")>#attributes.passThrough#,</cfif>

		<cfif arrayLen(thisTag.listeners)>listeners: { #ArrayKeyToList(thisTag.listeners, "_out")# },</cfif>

			<cfif arrayLen(thisTag.loader)>
				loader: #thisTag.loader[1]._out#,
				expandable: true,<!--- TODO: review whether to force this property when child items exist? --->
			<cfelseif AttributeNotEmpty("loader")>
				loader: #attributes.loader#,
				expandable: true,<!--- TODO: review whether to force this property when child items exist? --->
			<cfelse>

<!--- TODO: !consider whether items array is needed, whether treeNodes inside asyncTreeNodes work,
		whether asyncTreeNodes should always be expandable and always set as non-leaf nodes --->

				loader: new Ext.tree.TreeLoader(),

			</cfif>

		dummy: true
	})<cfif AttributeNotEmpty("var")>;</cfif>
</cfoutput>
</cfprocessingdirective>
</cfsavecontent>

<cfassociate basetag="#parentTag#" datacollection="items">


</cfif>


<cfsetting enablecfoutputonly="false">