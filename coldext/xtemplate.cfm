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

<!--- custom attributes --->
<cfparam name="attributes.var" default=""><!--- @@type: JS Variable Name @@help: (ColdExt attribute) The JavaScript variable name that this component will be assigned to. NOTE: You should only use the var attribute when this tags parent is the onReady tag. --->

<!--- arrays that may be populated by nested tags --->
<cfset thisTag.items = ArrayNew(1)>

<!--- process custom attributes --->
<!--- var --->
<cfset attributes.var = validateVarAttribute(parentTag)>



<cfelseif thisTag.executionMode eq "end">

<cfset _template = JSStringFormat(trim(thisTag.generatedContent))>
<cfset _template = ReReplace(_template,"\\r|\\n|\\t","", "all")>

<!--- determine data collection to use for cfassociate --->
<cfset _collection = "tpl">
<cfif ListFind("CF_ONREADY", parentTag)>
	<cfset _collection = "items">
</cfif>


<cfsavecontent variable="attributes._out">
<cfprocessingdirective suppresswhitespace="true">
<cfoutput>
		<cfif AttributeNotEmpty("var")>var #attributes.var# = </cfif>new Ext.XTemplate(
			"#_template#"
			<cfif arrayLen(thisTag.items)>, { #ArrayKeyToList(thisTag.items, "_out")# }</cfif>
		)<cfif AttributeNotEmpty("var")>;</cfif>
</cfoutput>
</cfprocessingdirective>
</cfsavecontent>

<cfset thisTag.generatedContent = "">

<cfassociate basetag="#parentTag#" datacollection="#_collection#">


</cfif>


<cfsetting enablecfoutputonly="false">