<cfimport prefix="ext" taglib="/coldext">
<cfinclude template="_header.cfm">

<!--- all examples will be appended to this div --->
<div id="menus2-out" class="output"></div>


<ext:onReady>

	<ext:createChild tag="h2" renderTo="menus2-out">Menus 2 - Example Menu Handler</ext:createChild>

	<ext:toolbar renderTo="menus2-out" width="400">
		<!--- menu attached to toolbar button --->
		<ext:toolbarButton text="Form Demos">
			<ext:menu defaults="{ handler: navigate }">
				<ext:textItem text="Ext Forms" passThrough="url: 'forms1.cfm'" />
				<ext:textItem text="Ajax Form" passThrough="url: 'forms2.cfm'" />
			</ext:menu>
		</ext:toolbarButton>
		<ext:toolbarButton text="Grid Demos">
			<ext:menu defaults="{ handler: navigate }">
				<ext:textItem text="JSON Grid" passThrough="url: 'grid2.cfm'" />
				<ext:textItem text="Row Numbers" passThrough="url: 'grid3.cfm'" />
				<ext:textItem text="Grouping Grid" passThrough="url: 'grid5.cfm'" />
			</ext:menu>
		</ext:toolbarButton>
	</ext:toolbar>

	<ext:script>
		<cfoutput>
		function navigate(item, e) {
			window.location = '#application.appPath#/demos/' + item.url;
		}
		</cfoutput>
	</ext:script>

</ext:onReady>