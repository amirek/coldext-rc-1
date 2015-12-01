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
<cfparam name="attributes.allowOtherMenus" default=""><!--- @@type: Boolean @@help: True to allow multiple menus to be displayed at the same time (defaults to false) --->
<cfparam name="attributes.defaultAlign" default=""><!--- @@type: String @@help: The default Ext.Element.alignTo anchor position value for this menu relative to its element of origin (defaults to "tl-bl?") --->
<cfparam name="attributes.defaultAlignJS" default=""><!--- @@type: JS @@help: The default Ext.Element.alignTo anchor position value for this menu relative to its element of origin (defaults to "tl-bl?") --->
<cfparam name="attributes.defaults" default=""><!--- @@type: Object @@help: A config object that will be applied to all items added to this container either via the items config or via the add method. The defaults config can contain any number of name/value property pairs to be added to each item, and should be valid for the types of items being added to the menu. --->
<cfparam name="attributes.ignoreParentClicks" default=""><!--- @@type: Boolean @@help: True to ignore clicks on any item in this menu that is a parent item (displays a submenu) so that the submenu is not dismissed when clicking the parent item (defaults to false). --->
<cfparam name="attributes.items" default=""><!--- @@type: String @@help: An array of items to be added to this menu. See add for a list of valid item types. --->
<cfparam name="attributes.itemsJS" default=""><!--- @@type: Mixed @@help: An array of items to be added to this menu. See add for a list of valid item types. --->
<cfparam name="attributes.listeners" default=""><!--- @@type: Object @@help: (optional) A config object containing one or more event handlers to be added to this object during initialization. This should be a valid listeners config object as specified in the addListener example for attaching multiple handlers at once. --->
<cfparam name="attributes.minWidth" default=""><!--- @@type: Number @@help: The minimum width of the menu in pixels (defaults to 120) --->
<cfparam name="attributes.shadow" default=""><!--- @@type: String @@help: True or "sides" for the default effect, "frame" for 4-way shadow, and "drop" for bottom-right shadow (defaults to "sides") --->
<cfparam name="attributes.shadowJS" default=""><!--- @@type: Boolean/String @@help: True or "sides" for the default effect, "frame" for 4-way shadow, and "drop" for bottom-right shadow (defaults to "sides") --->
<cfparam name="attributes.subMenuAlign" default=""><!--- @@type: String @@help: The Ext.Element.alignTo anchor position value to use for submenus of this menu (defaults to "tl-tr?") --->
<cfparam name="attributes.subMenuAlignJS" default=""><!--- @@type: JS @@help: The Ext.Element.alignTo anchor position value to use for submenus of this menu (defaults to "tl-tr?") --->

<!--- custom attributes --->
<cfparam name="attributes.passThrough" default=""><!--- @@type: JS @@help: (ColdExt attribute) A comma separated list of JavaScript name:value pairs that will be written directly to the Ext component config. This is useful for storing custom properties in Ext components. --->
<cfparam name="attributes.var" default=""><!--- @@type: JS Variable Name @@help: (ColdExt attribute) The JavaScript variable name that this component will be assigned to. NOTE: You should only use the var attribute when this tags parent is the onReady tag. --->



<!--- arrays that may be populated by nested tags --->
<cfset thisTag.items = ArrayNew(1)>
<cfset thisTag.listeners = ArrayNew(1)>

<!--- process custom attributes --->
<!--- var --->
<cfset attributes.var = validateVarAttribute(parentTag)>



</cfif>


<cfif thisTag.executionMode eq "end" OR NOT thisTag.hasEndTag>



<cfsavecontent variable="attributes._out">
<cfprocessingdirective suppresswhitespace="true">
<cfoutput>
	<cfif AttributeNotEmpty("var")>var #attributes.var# = </cfif>new Ext.menu.DateMenu({
		<cfif AttributeNotEmpty("allowOtherMenus")>allowOtherMenus: #attributes.allowOtherMenus#,</cfif>
		<cfif AttributeNotEmpty("defaultAlign")>defaultAlign: "#JSStringFormat(attributes.defaultAlign)#",</cfif>
		<cfif AttributeNotEmpty("defaultAlignJS")>defaultAlign: #attributes.defaultAlignJS#,</cfif>
		<cfif AttributeNotEmpty("defaults")>defaults: #attributes.defaults#,</cfif>
		<cfif AttributeNotEmpty("ignoreParentClicks")>ignoreParentClicks: #attributes.ignoreParentClicks#,</cfif>
		<cfif AttributeNotEmpty("items")>items: "#JSStringFormat(attributes.items)#",</cfif>
		<cfif AttributeNotEmpty("itemsJS")>items: #attributes.itemsJS#,</cfif>
		<cfif AttributeNotEmpty("listeners")>listeners: #attributes.listeners#,</cfif>
		<cfif AttributeNotEmpty("minWidth")>minWidth: #attributes.minWidth#,</cfif>
		<cfif AttributeNotEmpty("shadow")>shadow: "#JSStringFormat(attributes.shadow)#",</cfif>
		<cfif AttributeNotEmpty("shadowJS")>shadow: #attributes.shadowJS#,</cfif>
		<cfif AttributeNotEmpty("subMenuAlign")>subMenuAlign: "#JSStringFormat(attributes.subMenuAlign)#",</cfif>
		<cfif AttributeNotEmpty("subMenuAlignJS")>subMenuAlign: #attributes.subMenuAlignJS#,</cfif>

		<cfif AttributeNotEmpty("passThrough")>#attributes.passThrough#,</cfif>

		<cfif arrayLen(thisTag.items)>items: [ #ArrayKeyToList(thisTag.items, "_out")# ],</cfif>
		<cfif arrayLen(thisTag.listeners)>listeners: { #ArrayKeyToList(thisTag.listeners, "_out")# },</cfif>


		dummy: true
	})<cfif AttributeNotEmpty("var")>;</cfif>
</cfoutput>
</cfprocessingdirective>
</cfsavecontent>

<cfassociate basetag="#parentTag#" datacollection="items">


</cfif>


<cfsetting enablecfoutputonly="false">