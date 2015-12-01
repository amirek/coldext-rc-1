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

<!--- attributes --->
<cfparam name="columnWidth" default=""><!--- @@type: Number @@help: Percent width of the column --->
<cfparam name="style" default=""><!--- @@type: String @@help: A custom style specification to be applied to this component's Element. Should be a valid argument to Ext.Element.applyStyles. --->

<!--- custom attributes --->
<cfparam name="attributes.var" default=""><!--- @@type: JS Variable @@help: The JavaScript variable name that this component will be assigned to. NOTE: You should only use the var attribute when this tags parent is the onReady tag. --->

<!--- arrays that may be populated by nested tags --->
<cfset thisTag.items = ArrayNew(1)>

<!--- var --->
<cfset attributes.var = validateVarAttribute(parentTag)>

<cfelseif thisTag.executionMode eq "end">

<cfsavecontent variable="attributes._out">
<cfprocessingdirective suppresswhitespace="true">
<cfoutput>
		<cfif AttributeNotEmpty("var")>var #attributes.var# = </cfif> ({
			<cfif AttributeNotEmpty("columnWidth")>columnWidth: #attributes.columnWidth#,</cfif>
			<cfif AttributeNotEmpty("style")>style: '#attributes.style#',</cfif>
			<cfif arrayLen(thisTag.items)>items: [ #ArrayKeyToList(thisTag.items, "_out")# ],</cfif>
			dummy: true<!--- TODO: cleanup --->
		})<cfif AttributeNotEmpty("var")>;</cfif></cfoutput>
</cfprocessingdirective>
</cfsavecontent>

<cfassociate basetag="#parentTag#" datacollection="items">

</cfif>

<cfsetting enablecfoutputonly="false">