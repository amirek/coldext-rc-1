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


<!--- check for closing tag --->
<cfif not thisTag.hasEndTag>
	<cfthrow message="html missing closing tag">
</cfif>



<cfelseif thisTag.executionMode eq "end" >


<cfset _html = JSStringFormat(trim(thisTag.GeneratedContent))>
<cfset thisTag.GeneratedContent = "">


<cfsavecontent variable="attributes._out">
<cfoutput>
		{
			xtype: "box",
			autoEl: { cn: "#_html#" }
		}</cfoutput>
</cfsavecontent>

<cfassociate basetag="#parentTag#" datacollection="items">


</cfif>


<cfsetting enablecfoutputonly="false">