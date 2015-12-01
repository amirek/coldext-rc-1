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


<!--- custom attributes --->
<cfparam name="attributes.name" default="">
<cfparam name="attributes.type" default="">
<cfparam name="attributes.form" default="">



<!--- arrays that may be populated by nested tags --->
<cfset thisTag.params = ArrayNew(1)>
<cfset thisTag.failure = ArrayNew(1)>
<cfset thisTag.success = ArrayNew(1)>


<!--- set default collection --->
<cfset _collection = "items">

<cfif ListFind("CF_BUTTON,CF_TOOLBARBUTTON,CF_TOOLBARSPLITBUTTON", parentTag)>
	<cfset _collection = "handler">
	<!--- ensure name attribute is empty --->
	<cfset attributes.name = "">
</cfif>


<cfelseif thisTag.executionMode eq "end">


<cfsavecontent variable="attributes._out">
<cfprocessingdirective suppresswhitespace="true">
<cfoutput>
	function #attributes.name#() {
</cfoutput>

	<!--- TODO: cases for other (custom?) handler types --->
	<cfswitch expression="#attributes.type#">

	<!--- submit --->
	<cfcase value="submit">
		<cfoutput>
		var f;
		if (typeof(#attributes.form#) != "undefined" && #attributes.form#.ctype != "Ext.Component")
			f = Ext.getCmp("#attributes.form#");
		else
			f = #attributes.form#;
		if (f.getForm().isValid())
		{
			if(f.url) f.getForm().getEl().dom.action = f.url;
			f.getForm().submit({
				<cfif arrayLen(thisTag.params)>params: { #ArrayKeyToList(thisTag.params, "_out")# },</cfif>
				<cfif arrayLen(thisTag.failure)>failure: function(f, a) { #thisTag.failure[1]._out# },</cfif>
				<cfif arrayLen(thisTag.success)>success: function (f, a) { #thisTag.success[1]._out# },</cfif>
				<!--- required --->
				waitMsg:'Saving...'<!--- TODO: custom wait message --->
			});
		}
		else
		{
			<!--- TODO: custom error message --->
			Ext.MessageBox.alert("Validation Error", "Please correct the errors on the form and try again");
		}
		</cfoutput>
	</cfcase>

	<!--- click --->
	<cfcase value="click">
		<cfoutput>
		#thisTag.generatedContent#
		</cfoutput>
		<cfset thisTag.generatedContent = "">
	</cfcase>

	<!--- empty --->
	<cfcase value="">
		<cfoutput>
		#thisTag.generatedContent#
		</cfoutput>
		<cfset thisTag.generatedContent = "">
	</cfcase>

	<!--- unknown --->
	<cfdefaultcase>
		<cfoutput>
		Ext.MessageBox.alert("Unknown Action Type", "The action type '#attributes.type#' has not been implemented yet");
		</cfoutput>
	</cfdefaultcase>

	</cfswitch>

<cfoutput>
	}
</cfoutput>
</cfprocessingdirective>
</cfsavecontent>

<cfassociate basetag="#parentTag#" datacollection="#_collection#">


</cfif>


<cfsetting enablecfoutputonly="false">