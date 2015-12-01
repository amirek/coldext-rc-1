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
<cfparam name="attributes.eventName" default=""><!--- @@type: String @@help: The type of event to listen for --->
<cfparam name="attributes.handler" default=""><!--- @@type: Function @@help: The method the event invokes --->
<cfparam name="attributes.scope" default=""><!--- @@type: Object @@help: (optional) The scope in which to execute the handler function. The handler function's "this" context. --->
<cfparam name="attributes.options" default=""><!--- @@type: Object @@help: (optional) An object containing handler configuration properties. This may contain any of the following properties: * scope : Object The scope in which to execute the handler function. The handler function's "this" context. * delay : Number The number of milliseconds to delay the invocation of the handler after the event fires. * single : Boolean True to add a handler to handle just the next firing of the event, and then remove itself. * buffer : Number Causes the handler to be scheduled to run in an Ext.util.DelayedTask delayed by the specified number of milliseconds. If the event fires again within that time, the original handler is not invoked, but the new handler is scheduled in its place. --->
<cfparam name="attributes.buffer" default=""><!--- @@type: Number @@help: Causes the handler to be scheduled to run in an Ext.util.DelayedTask delayed by the specified number of milliseconds. If the event fires again within that time, the original handler is not invoked, but the new handler is scheduled in its place. --->
<cfparam name="attributes.delay" default=""><!--- @@type: Number @@help: The number of milliseconds to delay the invocation of the handler after the event fires. --->
<cfparam name="attributes.single" default=""><!--- @@type: Boolean @@help: True to add a handler to handle just the next firing of the event, and then remove itself. --->


<cfelseif thisTag.executionMode eq "end">

<cfset script = thisTag.generatedContent>
<cfset thisTag.generatedContent = "">

<!--- determine data collection to use for cfassociate --->
<cfset _collection = "listeners">
<cfif ListFind("CF_GRIDACTION,CF_GRIDGROUPACTION", parentTag)>
	<cfset _collection = "callback">
</cfif>

<cfsavecontent variable="attributes._out">
<cfprocessingdirective suppresswhitespace="true">
<cfoutput>
		<cfif _collection neq "callback">
		"#attributes.eventName#":
		</cfif>
		<cfif ListFind("CF_GRIDROWACTIONS,CF_GRIDACTION,CF_GRIDGROUPACTION", parentTag)>
			#script#
		<cfelse>
		{
			<cfif AttributeNotEmpty("handler")>
			fn: #attributes.handler#,
			<cfelse>
			fn: #script#,
			</cfif>
			<cfif AttributeNotEmpty("scope")>scope: #attributes.scope#,</cfif>
			<cfif AttributeNotEmpty("options")>options: #attributes.options#,</cfif>

			<cfif AttributeNotEmpty("buffer")>buffer: #attributes.buffer#,</cfif>
			<cfif AttributeNotEmpty("delay")>delay: #attributes.delay#,</cfif>
			<cfif AttributeNotEmpty("single")>single: #attributes.single#,</cfif>

			dummy: true
		}
		</cfif>
</cfoutput>
</cfprocessingdirective>
</cfsavecontent>

<cfassociate basetag="#parentTag#" datacollection="#_collection#">


</cfif>


<cfsetting enablecfoutputonly="false">