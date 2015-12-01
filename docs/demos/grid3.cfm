<cfimport prefix="ext" taglib="/coldext">
<cfinclude template="_header.cfm">

<!--- all examples will be appended to this div --->
<div id="grid3-out" style="padding: 20px 0 0 20px;"></div>
<div id="grid3-gridOut" style="float: left; padding: 0 20px;"></div>
<div id="grid3-formOut" style="float: left;"></div>


<ext:onReady>

	<ext:createChild renderTo="grid3-out" tag="h2">Row Numbered JSON Grid with rowClick events</ext:createChild>

	<ext:jsonStore var="myJSON" autoLoad="true" remoteSort="true"
			root="query.data" totalProperty="totalcount" url="#application.appPath#/demos/data/countries.cfm">
		<ext:field name="id" />
		<ext:field name="country" />
		<ext:field name="capital" />
	</ext:jsonStore>

	<ext:gridPanel renderTo="grid3-gridOut" title="Countries" width="354" autoHeight="true" stripeRows="true" store="myJSON">
		<ext:gridRowNumberer>
		<ext:gridColumn  header="ID" width="40" sortable="true" dataIndex="id" />
		<ext:gridColumn header="Country" width="150" sortable="true" dataIndex="country" />
		<ext:gridColumn header="Capital" width="160" sortable="true" dataIndex="capital" />
		<ext:listener eventName="rowclick">
			function(grid, rowIndex, e) {
				var row = grid.getStore().getAt(rowIndex);

				Ext.getCmp("countryCode").setValue(row.data.id);
				Ext.getCmp("countryName").setValue(row.data.country);
				Ext.getCmp("countryCapital").setValue(row.data.capital);
			}
		</ext:listener>
	</ext:gridPanel>

	<ext:formPanel renderTo="grid3-formOut" title="Edit Country" width="350">
		<ext:input id="countryCode" label="Country Code" readOnly="true">
		<ext:input id="countryName" name="countryName">
		<ext:input id="countryCapital" name="countryCapital">
	</ext:formPanel>

</ext:onReady>
