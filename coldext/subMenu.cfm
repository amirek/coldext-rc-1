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


<!--- custom attributes --->
<cfparam name="attributes.text" default="">


<!--- arrays that may be populated by nested tags --->
<cfset thisTag.items = ArrayNew(1)>



<cfelseif thisTag.executionMode eq "end">

<cfsavecontent variable="attributes._out">
<cfoutput>
				{
					text: "#JSStringFormat(attributes.text)#",
					menu: {
						<cfif arrayLen(thisTag.items)>
						items: [ #ArrayKeyToList(thisTag.items, "_out")# ]
						</cfif>
					}
				}
</cfoutput>
</cfsavecontent>

<cfassociate basetag="#parentTag#" datacollection="items">


</cfif>


<cfsetting enablecfoutputonly="false">