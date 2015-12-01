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


<!--- attributes --->
<cfparam name="attributes.class" default=""><!--- @@type: String @@help: The class of the HTML Element being created --->
<cfparam name="attributes.classJS" default=""><!--- @@type: JS @@help: The class of the HTML Element being created --->
<cfparam name="attributes.id" default=""><!--- @@type: String @@help: The id of the HTML Element being created --->
<cfparam name="attributes.idJS" default=""><!--- @@type: JS @@help: The id of the HTML Element being created --->
<cfparam name="attributes.insertBefore" default=""><!--- @@type: HTML Element @@help: (optional) a child element of this element which the node will be inserted before. --->
<cfparam name="attributes.renderTo" default=""><!--- @@type: String @@help: The id of the node, a DOM node or an existing Element that will be the container to render this component into. Using this config, a call to render() is not required. --->
<cfparam name="attributes.renderToJS" default=""><!--- JS ---><!--- @@type: Mixed @@help: The id of the node, a DOM node or an existing Element that will be the container to render this component into. Using this config, a call to render() is not required. --->
<cfparam name="attributes.style" default=""><!--- @@type: String @@help: The style of the HTML Element being created --->
<cfparam name="attributes.styleJS" default=""><!--- @@type: JS @@help: The style of the HTML Element being created --->
<cfparam name="attributes.tag" default=""><!--- @@type: String @@help: The HTML element to be created (e.g. h1, h2, div, span, etc). The text inside this tag will be inserted as node text inside the newly created HTML element. --->

<!--- process attributes --->
<cfif AttributeNotEmpty("renderToJS")>
	<cfset attributes.renderTo = attributes.renderToJS>
</cfif>


</cfif>


<cfif thisTag.executionMode eq "end" OR NOT thisTag.hasEndTag>

<cfset html = JSStringFormat(thisTag.generatedContent)>
<cfset thisTag.generatedContent = "">

<cfsavecontent variable="attributes._out">
<cfprocessingdirective suppresswhitespace="true">
<cfoutput>
	Ext.get("#attributes.renderTo#").createChild({
		tag: "#attributes.tag#", html: "#JSStringFormat(html)#"
		<cfif AttributeNotEmpty("class")>, class: "#JSStringFormat(attributes.class)#"</cfif>
		<cfif AttributeNotEmpty("classJS")>, class: #attributes.classJS#</cfif>
		<cfif AttributeNotEmpty("id")>, id: "#JSStringFormat(attributes.id)#"</cfif>
		<cfif AttributeNotEmpty("idJS")>, id: #attributes.idJS#</cfif>
		<cfif AttributeNotEmpty("style")>, style: "#JSStringFormat(attributes.style)#"</cfif>
		<cfif AttributeNotEmpty("styleJS")>, style: #attributes.styleJS#</cfif>
		}
		<cfif AttributeNotEmpty("insertBefore")>,#attributes.insertBefore#</cfif>
	);
</cfoutput>
</cfprocessingdirective>
</cfsavecontent>

<cfassociate basetag="#parentTag#" datacollection="items">


</cfif>


<cfsetting enablecfoutputonly="false">