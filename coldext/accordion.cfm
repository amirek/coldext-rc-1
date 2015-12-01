<cfsetting enablecfoutputonly="true">
<!---

	ColdExt RC 1, Copyright (c) 2008, Justin Carter

	You may use ColdExt under any terms that satisfy the Ext JS license
	http://extjs.com/license

	Additionally you may modify the ColdExt CFML source code to suit
	your needs, as long as you do not modify this copyright notice.

 --->

<!--- apply accordion layout --->
<cfset attributes.layout = "accordion">

<!--- this is an alias for panel --->
<cfinclude template="panel.cfm">

<cfsetting enablecfoutputonly="false">