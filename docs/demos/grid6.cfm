<cfimport prefix="ext" taglib="/coldext">
<cfimport prefix="ux" taglib="/coldext/ux">
<cfinclude template="_header.cfm">

<!--- all examples will be appended to this div --->
<div id="grid6-out" class="output">
	<h2>Grid Filters user extension</h2>
	<div style="font-family: Verdana, Arial, sans serif; font-size: 13px;">
		Use the arrow on the right side of the column headings to apply filters to the data.<br>
		<br>
	</div>
</div>


<ext:onReady>

	<ext:groupingStore var="myGroupedJSON" groupField="continent"
			remoteSort="true" url="#application.appPath#/demos/data/countries.cfm">
		<ext:jsonReader root="query.data" totalProperty="totalcount">
			<ext:field name="id" />
			<ext:field name="country" />
			<ext:field name="capital" />
			<ext:field name="continent" />
		</ext:jsonReader>
		<ext:param name="limit" value="10">
	</ext:groupingStore>

	<ux:gridFilters var="myFilters">
		<ux:filterColumn type="string" dataIndex="id">
		<ux:filterColumn type="string" dataIndex="country">
		<ux:filterColumn type="string" dataIndex="capital">
		<ux:filterColumn type="string" dataIndex="continent">
	</ux:gridFilters>

	<ext:gridPanel var="myGrid" renderTo="grid6-out" plugins="myFilters" title="Grouped JSON Grid"
			width="473" autoHeight="true" autoExpandColumn="country" stripeRows="true" store="myGroupedJSON">
		<ext:gridColumn header="ID" width="40" sortable="true" dataIndex="id" />
		<ext:gridColumn header="Country" width="150" sortable="true" dataIndex="country" />
		<ext:gridColumn header="Capital" width="160" sortable="true" dataIndex="capital" />
		<ext:gridColumn header="Continent" width="120" sortable="true" dataIndex="continent" />
		<ext:groupingView forcefit="true" groupTextTpl="{text} ({[values.rs.length]} {[values.rs.length > 1 ? ""Items"" : ""Item""]})" />
		<ext:pagingToolbar plugins="myFilters" displayInfo="true" pageSize="10" store="myGroupedJSON">
			<ext:separator>
			<ext:button text="Clear Filters" handler="clearFiltersClick">
		</ext:pagingToolbar>
	</ext:gridPanel>

	<ext:script>
	function clearFiltersClick() {
		myFilters.clearFilters();
	}
	</ext:script>

	<!--- the store must be loaded manually using the start param, due to the NaN bug in grid filters --->
	<ext:script>
		myGroupedJSON.load({ params: { start: 0 } });
	</ext:script>

</ext:onReady>