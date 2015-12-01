<cfsetting enablecfoutputonly="true">

<cfif NOT StructKeyExists(url, "noToolbar")>

<cfimport prefix="ext" taglib="/coldext">

<cfset path = getBaseTemplatePath()>
<cfset sourceFile = ListLast(path, "/\")>
<cfset sourceName = ListFirst(sourceFile, ".")>

<cffile action="read" file="#path#" variable="source">
<!--- strip the include of this file from the source code --->
<cfset source = Replace(source, "<cfinclude template=""_header.cfm"">", "")>
<!--- do some formatting --->
<cfset source = Replace(source, "<", "&lt;", "all")>
<cfset source = Replace(source, ">", "&gt;", "all")>
<cfset source = trim(source)>

<cfset isStandAlone = (not StructKeyExists(getHTTPRequestData().headers, "X-Requested-With"))>

<cfif isStandAlone>
<!--- insert css, syntax highlighting and toolbar container  --->
<cfoutput>
<link type="text/css" href="../docs.css" rel="stylesheet">
<link type="text/css" href="css/demos.css" rel="stylesheet">
<link type="text/css" rel="stylesheet" href="../syntax/SyntaxHighlighter.css">
<script type="text/javascript" src="../syntax/shCore.js"></script>
<script type="text/javascript" src="../syntax/shBrushXml.js"></script>
<style type="text/css">
.output { padding: 15px; }
</style>
</cfoutput>
</cfif>

<cfoutput>
<div id="toolbar-#sourceName#" class="demoToolbar"></div>

<ext:onReady>

	<ext:toolbar var="toolbar#sourceName#" position="top" renderTo="toolbar-#sourceName#">
		<ext:toolbarButton text="View Source" iconCls="icon-source">
			<ext:listener eventName="click">
				function() {
					window#sourceName#.show("viewSource-#sourceName#");
				}
			</ext:listener>
		</ext:toolbarButton>
		<ext:toolbarButton text="Refresh" iconCls="icon-refresh">
			<ext:listener eventName="click" scope="this">
				function() {
					<cfif isStandAlone>
						window.location = window.location;
					<cfelse>
						var p = Ext.getCmp("panel-#sourceName#");

						p.tbar = undefined;
						p.getUpdater().update({
							url: "demos/#sourceFile#",
							nocache: true,
							scripts: true,
							text: "",
							timeout: 30,
							callback: function() {
								p.render();
							}
						});
					</cfif>
				}
			</ext:listener>
		</ext:toolbarButton>
		<ext:toolbarFill>
		<ext:toolbarButton text="Direct Link" iconCls="icon-fav">
			<ext:listener eventName="click">
				function() {
					<cfif isStandAlone>
						u = window.location.toString().split("/demos");
						window.location = u[0] + "?demo=#sourceName#";
					<cfelse>
						u = window.location.toString().split("?");
						window.location = u[0] + "?demo=#sourceName#";
					</cfif>
				}
			</ext:listener>
		</ext:toolbarButton>
		<ext:toolbarButton text="Stand-alone Link" iconCls="icon-fav">
			<ext:listener eventName="click">
				function() {
					<cfif isStandAlone>
						window.location = window.location;
					<cfelse>
						u = window.location.toString().split("?");
						window.location = u[0] + "demos/#sourceName#.cfm";
					</cfif>
				}
			</ext:listener>
		</ext:toolbarButton>
	</ext:toolbar>

	<ext:window var="window#sourceName#" id="window#sourceName#" title="Source Code: docs/demos/#sourceFile#"
			 autoScroll="true" closeAction="hide" iconCls="icon-source" maximizable="true"
			 width="750" height="500" y="80" bodyStyle="background: ##ffffff;">
		<pre id="code#sourceName#" name="code#sourceName#" class="xml">#source#</pre>
		<!--- listener is require to do syntax highlighting after the pre is inserted into the DOM via Ajax --->
		<ext:listener eventName="show" single="true">
			function() {
				dp.SyntaxHighlighter.HighlightAll('code#sourceName#');
			}
		</ext:listener>
	</ext:window>

</ext:onReady>
</cfoutput>

</cfif>

<cfsetting enablecfoutputonly="false">