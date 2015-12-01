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
<cfparam name="attributes.baseAttrs" default=""><!--- @@type: Object @@help: (optional) An object containing attributes to be added to all nodes created by this loader. If the attributes sent by the server have an attribute in this object, they take priority. --->
<cfparam name="attributes.baseParams" default=""><!--- @@type: Object @@help: (optional) An object containing properties which specify HTTP parameters to be passed to each request for child nodes. --->
<cfparam name="attributes.clearOnLoad" default=""><!--- @@type: Boolean @@help: (optional) Default to true. Remove previously existing child nodes before loading. --->
<cfparam name="attributes.dataUrl" default=""><!--- @@type: String @@help: The URL from which to request a Json string which specifies an array of node definition objects representing the child nodes to be loaded. --->
<cfparam name="attributes.dataUrlJS" default=""><!--- @@type: JS @@help: The URL from which to request a Json string which specifies an array of node definition objects representing the child nodes to be loaded. --->
<cfparam name="attributes.listeners" default=""><!--- @@type: Object @@help: (optional) A config object containing one or more event handlers to be added to this object during initialization. This should be a valid listeners config object as specified in the addListener example for attaching multiple handlers at once. --->
<cfparam name="attributes.preloadChildren" default=""><!--- @@type: Boolean @@help: If set to true, the loader recursively loads "children" attributes when doing the first load on nodes. --->
<cfparam name="attributes.requestMethod" default=""><!--- @@type: String @@help: The HTTP request method for loading data (defaults to the value of Ext.Ajax.method). --->
<cfparam name="attributes.requestMethodJS" default=""><!--- @@type: JS @@help: The HTTP request method for loading data (defaults to the value of Ext.Ajax.method). --->
<cfparam name="attributes.uiProviders" default=""><!--- @@type: Object @@help: (optional) An object containing properties which specify custom Ext.tree.TreeNodeUI implementations. If the optional uiProvider attribute of a returned child node is a string rather than a reference to a TreeNodeUI implementation, then that string value is used as a property name in the uiProviders object. --->
<cfparam name="attributes.url" default=""><!--- @@type: String @@help: Equivalent to dataUrl. --->
<cfparam name="attributes.urlJS" default=""><!--- @@type: JS @@help: Equivalent to dataUrl. --->

<!--- custom attributes --->
<cfparam name="attributes.passThrough" default=""><!--- @@type: JS @@help: (ColdExt attribute) A comma separated list of JavaScript name:value pairs that will be written directly to the Ext component config. This is useful for storing custom properties in Ext components. --->
<cfparam name="attributes.var" default=""><!--- @@type: JS Variable Name @@help: (ColdExt attribute) The JavaScript variable name that this component will be assigned to. NOTE: You should only use the var attribute when this tags parent is the onReady tag. --->



<!--- arrays that may be populated by nested tags --->
<cfset thisTag.baseParams = ArrayNew(1)>
<cfset thisTag.listeners = ArrayNew(1)>

<!--- process custom attributes --->
<!--- var --->
<cfset attributes.var = validateVarAttribute(parentTag)>



</cfif>


<cfif thisTag.executionMode eq "end" OR NOT thisTag.hasEndTag>

<!--- determine data collection to use for cfassociate --->
<cfset _collection = "loader">
<cfif ListFind("CF_ONREADY", parentTag)>
	<cfset _collection = "items">
</cfif>


<cfsavecontent variable="attributes._out">
<cfprocessingdirective suppresswhitespace="true">
<cfoutput>
	<cfif AttributeNotEmpty("var")>var #attributes.var# = </cfif>new Ext.tree.TreeLoader({
		<cfif AttributeNotEmpty("baseAttrs")>baseAttrs: #attributes.baseAttrs#,</cfif>
		<cfif AttributeNotEmpty("baseParams")>baseParams: #attributes.baseParams#,</cfif>
		<cfif AttributeNotEmpty("clearOnLoad")>clearOnLoad: #attributes.clearOnLoad#,</cfif>
		<cfif AttributeNotEmpty("dataUrl")>dataUrl: "#JSStringFormat(attributes.dataUrl)#",</cfif>
		<cfif AttributeNotEmpty("dataUrlJS")>dataUrl: #attributes.dataUrlJS#,</cfif>
		<cfif AttributeNotEmpty("listeners")>listeners: #attributes.listeners#,</cfif>
		<cfif AttributeNotEmpty("preloadChildren")>preloadChildren: #attributes.preloadChildren#,</cfif>
		<cfif AttributeNotEmpty("requestMethod")>requestMethod: "#JSStringFormat(attributes.requestMethod)#",</cfif>
		<cfif AttributeNotEmpty("requestMethodJS")>requestMethod: #attributes.requestMethodJS#,</cfif>
		<cfif AttributeNotEmpty("uiProviders")>uiProviders: #attributes.uiProviders#,</cfif>
		<cfif AttributeNotEmpty("url")>url: "#JSStringFormat(attributes.url)#",</cfif>
		<cfif AttributeNotEmpty("urlJS")>url: #attributes.urlJS#,</cfif>

		<cfif AttributeNotEmpty("passThrough")>#attributes.passThrough#,</cfif>

		<cfif arrayLen(thisTag.baseParams)>baseParams: { #ArrayKeyToList(thisTag.baseParams, "_out")# },</cfif>
		<cfif arrayLen(thisTag.listeners)>listeners: { #ArrayKeyToList(thisTag.listeners, "_out")# },</cfif>


		dummy: true
	})<cfif AttributeNotEmpty("var")>;</cfif>
</cfoutput>
</cfprocessingdirective>
</cfsavecontent>

<cfassociate basetag="#parentTag#" datacollection="#_collection#">


</cfif>


<cfsetting enablecfoutputonly="false">