<cfsetting enablecfoutputonly="true">
<!---

	ColdExt RC 1, Copyright (c) 2008, Justin Carter

	You may use ColdExt under any terms that satisfy the Ext JS license
	http://extjs.com/license

	Additionally you may modify the ColdExt CFML source code to suit
	your needs, as long as you do not modify this copyright notice.

 --->
<!---

	NOTE: You should not modify this file. Configuration
	should be set up in your application.cfc/cfm file.
	Refer to the ColdExt Wiki on RIAForge for more info!

 --->


<cfset Application.ColdExt = StructNew()>

<!--- paths --->
<cfset Application.ColdExt.js = "/ext">
<cfset Application.ColdExt.css = "/ext/css">
<cfset Application.ColdExt.images = "/ext/images">
<cfset Application.ColdExt.theme = "">
<cfset Application.ColdExt.blankImageURL = Application.ColdExt.images & "/default/s.gif">

<!--- other setup --->
<cfset Application.ColdExt.quickTips = true>
<cfset Application.ColdExt.validationTarget = "side">

<!--- debug js --->
<cfset Application.ColdExt.debug = false>

<!--- loading indicator --->
<cfset Application.ColdExt.loadingMask = false>

<!--- user extensions --->
<cfset Application.ColdExt.uxLoad = "">
<!--- list of all extensions in the library, should not be set by the user --->
<cfset Application.ColdExt.uxAll = "gridfilters,gridgroupsummary,gridpanelresizer,gridrowactions,gridrowexpander,gridsearch,portal,fileupload">


<!--- custom --->
<!--- TODO: subject to change... --->
<cfset Application.ColdExt.defaultFormPanelWidth = "350">
<cfset Application.ColdExt.defaultFormPanelChildWidth = "200">
<cfset Application.ColdExt.defaultFormPanelPadding = "10">
<cfset Application.ColdExt.defaultFieldWidth = "200">
<cfset Application.ColdExt.defaultLabelWidth = "100">


<cfsetting enablecfoutputonly="false">