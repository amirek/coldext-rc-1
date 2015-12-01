<cfsetting enablecfoutputonly="true">
<!---

	ColdExt RC 1, Copyright (c) 2008, Justin Carter

	You may use ColdExt under any terms that satisfy the Ext JS license
	http://extjs.com/license

	Additionally you may modify the ColdExt CFML source code to suit
	your needs, as long as you do not modify this copyright notice.

 --->
<!---
	NOTE: this tag should only be used in onApplicationStart()
 --->

<cfif thisTag.executionMode eq "start">

	<cfif StructKeyExists(attributes, "attributeCollection")>
		<cfset StructAppend(attributes, attributes.attributeCollection, false)>
	</cfif>

	<!--- this will set up ColdExt using the built-in default config --->
	<cfinclude template="_config.cfm">

	<!--- override defaults with the settings supplied --->
	<cfloop collection="#attributes#" item="i">
		<cfset Application.ColdExt[i] = attributes[i]>
	</cfloop>

</cfif>

<cfsetting enablecfoutputonly="false">