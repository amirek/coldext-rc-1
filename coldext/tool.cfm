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
<cfparam name="attributes.handler" default="">
<cfparam name="attributes.hidden" default="">
<cfparam name="attributes.id" default="">
<cfparam name="attributes.on" default="">
<cfparam name="attributes.qtip" default="">
<cfparam name="attributes.scope" default="">


<!--- custom attributes --->
<cfparam name="attributes.passThrough" default=""><!--- @@type: JS @@help: (ColdExt attribute) A comma separated list of JavaScript name:value pairs that will be written directly to the Ext component config. This is useful for storing custom properties in Ext components. --->


<!--- arrays that may be populated by nested tags --->
<cfset thisTag.on = ArrayNew(1)>


<cfelseif thisTag.executionMode eq "end">

<cfsavecontent variable="attributes._out">
<cfprocessingdirective suppresswhitespace="true">
<cfoutput>
		{
			<cfif AttributeNotEmpty("handler")>handler: #attributes.handler#,</cfif>
			<cfif AttributeNotEmpty("hidden")>hidden: #attributes.hidden#,</cfif>
			<cfif AttributeNotEmpty("on")>on: #attributes.on#,</cfif>
			<cfif AttributeNotEmpty("qtip")>qtip: "#JSStringFormat(attributes.qtip)#",</cfif>
			<cfif AttributeNotEmpty("scope")>scope: #attributes.scope#,</cfif>
			<cfif AttributeNotEmpty("passThrough")>#attributes.passThrough#,</cfif>
			<cfif arrayLen(thisTag.on)>
			on: { #thisTag.on[1]._out# },
			</cfif>
			id: "#attributes.id#"
		}</cfoutput>
</cfprocessingdirective>
</cfsavecontent>

<cfassociate basetag="#parentTag#" datacollection="tools">


</cfif>


<cfsetting enablecfoutputonly="false">