<cfsetting enablecfoutputonly="true">

<cfimport prefix="ext" taglib="/coldext">

<cfsetting enablecfoutputonly="false"><!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>

<head>

<title>ColdExt Demos (RC 1)</title>
<link type="text/css" href="docs.css" rel="stylesheet">
<script type="text/javascript" src="docs.js"></script>
<link type="text/css" href="demos/css/demos.css" rel="stylesheet">
<link type="text/css" rel="stylesheet" href="syntax/SyntaxHighlighter.css">
<script type="text/javascript" src="syntax/shCore.js"></script>
<script type="text/javascript" src="syntax/shBrushXml.js"></script>

<style type="text/css">
body { background: #f0f0f0 url(images/bg.jpg) repeat-x 0 0 !important; }
#header { padding: 17px 0 0 10px; }
#version { float: right; padding: 2px 15px 0 0; font-family: Verdana, sans-serif; font-size: 18px; color: #ffffff; }
</style>

</head>

<body>

<style type="text/css">
/* tab background override */
.x-tab-panel-header-plain .x-tab-strip-top { background: none !important; }
/* treePanel font override */
.x-tree-node { font-family: Tahoma; }
/* toolbar link */
.x-toolbar a { color: black; }
</style>


<div id="header">
	<span id="version">ColdExt Demos (RC 1)</span>
	<img src="images/logo.gif" />
</div>


<ext:onReady loadingMask="true" uxLoad="all">

	<ext:viewport>

		<!--- tree --->
		<ext:treePanel id="apiTree" region="west" width="250" lines="false" split="true" collapsible="true" collapseMode="mini"
				 rootVisible="false" margins="59 0 5 5" autoScroll="true">
			<ext:rootNode text="ColdExt">
				<ext:treeNode text="ColdExt Demos" expanded="true">
					<ext:treeNode text="Forms" expanded="true">
						<ext:treeNode text="Simple Ajax Form" id="forms2" />
						<ext:treeNode text="Another Simple Form" id="forms3" />
						<ext:treeNode text="Checkbox and Radio Groups" id="forms4" />
						<ext:treeNode text="Standard Submit (non-Ajax)" id="forms5" />
						<ext:treeNode text="Columns in TabPanel" id="forms6" />
					</ext:treeNode>
					<ext:treeNode text="Grids" expanded="true">
						<ext:treeNode text="JSON grid" id="grid2" />
						<ext:treeNode text="JSON grid (CFC-based)" id="grid10" />
						<ext:treeNode text="Numbered and clickable rows" id="grid3" />
						<ext:treeNode text="Grouping grid" id="grid4" />
						<ext:treeNode text="Editable grid" id="grid5" />
						<ext:treeNode text="Property Grid" id="property1" />
					</ext:treeNode>
					<ext:treeNode text="Other" expanded="true">
						<ext:treeNode text="Color/DatePicker, Progress" id="progress1" />
						<ext:treeNode text="ComboBox" id="combo1" />
						<ext:treeNode text="Data View" id="dataview1" />
						<ext:treeNode text="Menus" id="menus" />
						<ext:treeNode text="TreePanel (static)" id="tree1" />
						<ext:treeNode text="TreePanel (dynamic)" id="tree2" />
						<ext:treeNode text="Windows with remote content" id="window1" />
					</ext:treeNode>
					<ext:treeNode text="User Extensions (ux)" expanded="true">
						<ext:treeNode text="File Upload Field" id="upload1" />
						<ext:treeNode text="Grid Filters" id="grid6" />
						<ext:treeNode text="Grid Group Summary & Resizer" id="grid9" />
						<ext:treeNode text="Grid Row Actions" id="grid7" />
						<ext:treeNode text="Grid Row Expander" id="grid8" />
						<ext:treeNode text="Grid Search" id="grid11" />
						<ext:treeNode text="Portals" id="portal1" />
					</ext:treeNode>
					<ext:treeNode text="Ext Replica Demos" expanded="true">
						<ext:treeNode text="Accordion" id="accordion" />
						<ext:treeNode text="Dynamic Forms" id="forms1" />
						<ext:treeNode text="Grids (JS Array, XML)" id="grid1" />
					</ext:treeNode>
				</ext:treeNode>
			</ext:rootNode>
			<ext:listener eventName="click" handler="displayTab" />
		</ext:treePanel>

		<!--- content --->
		<ext:tabPanel id="contentPanel" region="center" margins="59 5 5 0" enableTabScroll="true">
			<ext:panel title="ColdExt" cls="content" iconCls="icon-docs" >
				<div class="output">
				<h2>Welcome to ColdExt RC 1!</h2>
				<p>ColdExt is a ColdFusion tag library which makes it easier to build rich user interfaces using the amazing <a href="http://extjs.com">Ext JS</a> library (currently version 2.2.1).
				ColdExt supports multiple CFML engines including CFMX 7, CF8, Railo 3.0.1 and OpenBD 1.0.</p>
				<p>You may use ColdExt under any terms that satisfy the <a href="http://extjs.com/license">Ext JS license</a>.</p>
				<p>Please support Ext JS by purchasing an appropriate license and/or support package from the <a href="http://extjs.com/store/extjs/">Ext Store</a>.</p>
				<p><strong>ColdExt Resources</strong>
				<ul>
					<li><a href="http://www.madfellas.com/wiki/">ColdExt Documentation Wiki</a></li>
					<li><a href="http://coldext.riaforge.org/index.cfm?event=page.forums">ColdExt Forums</a></li>
					<li><a href="http://coldext.riaforge.org/index.cfm?event=page.issues">ColdExt Issue Tracker</a></li>
					<li><a href="http://coldext.riaforge.org/index.cfm?event=page.projectcontact">ColdExt Project Contact</a></li>
					<li><a href="http://extjs.com/deploy/dev/docs/">Ext 2.x - API Documentation</a></li>
				</ul>
				</p>
				<p><br>For the latest ColdExt information see <a href="http://coldext.riaforge.org">ColdExt on RIAForge</a>.</p>
				</div>
			</ext:panel>
		</ext:tabPanel>

	</ext:viewport>


	<cfif StructKeyExists(url, "demo")><cfoutput>
		<ext:script>
			displayDemo("#url.demo#");
		</ext:script>
	</cfoutput></cfif>

</ext:onReady>

</body>

</html>