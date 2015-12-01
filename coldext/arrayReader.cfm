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
<cfparam name="attributes.id" default=""><!--- @@type: String @@help: (optional) The subscript within row Array that provides an ID for the Record --->
<cfparam name="attributes.idJS" default=""><!--- @@type: JS @@help: (optional) The subscript within row Array that provides an ID for the Record --->
<cfparam name="attributes.root" default=""><!--- @@type: String @@help: name of the property which contains the Array of row objects. --->
<cfparam name="attributes.rootJS" default=""><!--- @@type: JS @@help: name of the property which contains the Array of row objects. --->
<cfparam name="attributes.successProperty" default=""><!--- @@type: String @@help: Name of the property from which to retrieve the success attribute used by forms. --->
<cfparam name="attributes.successPropertyJS" default=""><!--- @@type: JS @@help: Name of the property from which to retrieve the success attribute used by forms. --->
<cfparam name="attributes.totalProperty" default=""><!--- @@type: String @@help: Name of the property from which to retrieve the total number of records in the dataset. This is only needed if the whole dataset is not passed in one go, but is being paged from the remote server. --->
<cfparam name="attributes.totalPropertyJS" default=""><!--- @@type: JS @@help: Name of the property from which to retrieve the total number of records in the dataset. This is only needed if the whole dataset is not passed in one go, but is being paged from the remote server. --->

<!--- custom attributes --->
<cfparam name="attributes.passThrough" default=""><!--- @@type: JS @@help: (ColdExt attribute) A comma separated list of JavaScript name:value pairs that will be written directly to the Ext component config. This is useful for storing custom properties in Ext components. --->
<cfparam name="attributes.var" default=""><!--- @@type: JS Variable Name @@help: (ColdExt attribute) The JavaScript variable name that this component will be assigned to. NOTE: You should only use the var attribute when this tags parent is the onReady tag. --->



<!--- arrays that may be populated by nested tags --->
<cfset thisTag.fields = ArrayNew(1)>

<!--- process custom attributes --->
<!--- var --->
<cfset attributes.var = validateVarAttribute(parentTag)>




<cfelseif thisTag.executionMode eq "end">

<!--- determine data collection to use for cfassociate --->
<cfset _collection = "reader">
<cfif ListFind("CF_ONREADY", parentTag)>
	<cfset _collection = "items">
</cfif>


<cfsavecontent variable="attributes._out">
<cfprocessingdirective suppresswhitespace="true">
<cfoutput>
	<cfif AttributeNotEmpty("var")>var #attributes.var# = </cfif>new Ext.data.ArrayReader({
		<cfif AttributeNotEmpty("id")>id: "#JSStringFormat(attributes.id)#",</cfif>
		<cfif AttributeNotEmpty("idJS")>id: #attributes.idJS#,</cfif>
		<cfif AttributeNotEmpty("root")>root: "#JSStringFormat(attributes.root)#",</cfif>
		<cfif AttributeNotEmpty("rootJS")>root: #attributes.rootJS#,</cfif>
		<cfif AttributeNotEmpty("successProperty")>successProperty: "#JSStringFormat(attributes.successProperty)#",</cfif>
		<cfif AttributeNotEmpty("successPropertyJS")>successProperty: #attributes.successPropertyJS#,</cfif>
		<cfif AttributeNotEmpty("totalProperty")>totalProperty: "#JSStringFormat(attributes.totalProperty)#",</cfif>
		<cfif AttributeNotEmpty("totalPropertyJS")>totalProperty: #attributes.totalPropertyJS#,</cfif>

		<cfif AttributeNotEmpty("passThrough")>#attributes.passThrough#,</cfif>

		<cfif arrayLen(thisTag.fields)>fields: [ #ArrayKeyToList(thisTag.fields, "_out")# ],</cfif>


		dummy: true
	},[
		<cfif arrayLen(thisTag.fields)>#ArrayKeyToList(thisTag.fields, "_out")#</cfif>
	])<cfif AttributeNotEmpty("var")>;</cfif>
</cfoutput>
</cfprocessingdirective>
</cfsavecontent>

<cfassociate basetag="#parentTag#" datacollection="#_collection#">


</cfif>


<cfsetting enablecfoutputonly="false">