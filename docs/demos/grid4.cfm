<cfimport prefix="ext" taglib="/coldext">
<cfinclude template="_header.cfm">

<!--- all examples will be appended to this div --->
<div id="grid4-out" class="output"></div>


<ext:onReady>

	<ext:createChild tag="h2" renderTo="grid4-out">JSON Grid with grouping and remote paging and sorting</ext:createChild>

	<ext:groupingStore var="myGroupedJSON" autoLoad="true" groupField="continent"
			remoteSort="true" url="#application.appPath#/demos/data/countries.cfm">
		<ext:jsonReader root="query.data" totalProperty="totalcount">
			<ext:field name="id" />
			<ext:field name="country" />
			<ext:field name="capital" />
			<ext:field name="continent" />
		</ext:jsonReader>
		<ext:param name="limit" value="10">
	</ext:groupingStore>

	<ext:gridPanel renderTo="grid4-out" title="Grouped JSON Grid" width="491" autoHeight="true" stripeRows="true" store="myGroupedJSON">
		<ext:gridColumn header="ID" width="40" sortable="true" dataIndex="id" />
		<ext:gridColumn header="Country" width="150" sortable="true" dataIndex="country" />
		<ext:gridColumn header="Capital" width="160" sortable="true" dataIndex="capital" />
		<ext:gridColumn header="Continent" width="120" sortable="true" dataIndex="continent" />
		<ext:groupingView forcefit="true" groupTextTpl="{text} ({[values.rs.length]} {[values.rs.length > 1 ? ""Items"" : ""Item""]})" />
		<ext:pagingToolbar displayInfo="true" pageSize="10" store="myGroupedJSON" />
	</ext:gridPanel>

</ext:onReady>