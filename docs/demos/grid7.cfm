<cfimport prefix="ext" taglib="/coldext">
<cfimport prefix="ux" taglib="/coldext/ux">
<cfinclude template="_header.cfm">

<!--- all examples will be appended to this div --->
<div id="grid7-out" class="output"></div>


<ext:onReady>

	<ext:createChild tag="h2" renderTo="grid7-out">Grid RowActions Extension</ext:createChild>

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

	<ux:gridRowActions var="myActions">
		<ux:gridAction iconCls="icon-save" tooltip="Save Record">
			function(grid, record, action, row, col) {
				Ext.Msg.alert('Grid Row Action', 'You have clicked record ID: <b>'+ record.data.id +'</b>, row: <b>'+ row +'</b>, action: <b>'+ action +'</b>');
			}
		</ux:gridAction>
		<ux:gridGroupAction iconCls="icon-table-refresh" tooltip="Process Group">
			function(grid, records, action, groupid) {
				Ext.Msg.alert('Group Action', 'You have clicked group ID: <b>'+ groupid +'</b>, records: <b>'+ records.length +'</b>, action: <b>'+ action +'</b>');
			}
		</ux:gridGroupAction>
	</ux:gridRowActions>

	<ext:gridPanel renderTo="grid7-out" title="Grouped JSON Grid" plugins="myActions" width="540" autoHeight="true" stripeRows="true" store="myGroupedJSON">
		<ext:gridColumn header="ID" width="40" sortable="true" dataIndex="id" />
		<ext:gridColumn header="Country" width="150" sortable="true" dataIndex="country" />
		<ext:gridColumn header="Capital" width="160" sortable="true" dataIndex="capital" />
		<ext:gridColumn header="Continent" width="120" sortable="true" dataIndex="continent" />
		<ext:gridColumn plugin="myActions">
		<ext:groupingView forcefit="true" groupTextTpl="{text} ({[values.rs.length]} {[values.rs.length > 1 ? ""Items"" : ""Item""]})" />
		<ext:pagingToolbar displayInfo="true" pageSize="10" store="myGroupedJSON" />
	</ext:gridPanel>

</ext:onReady>