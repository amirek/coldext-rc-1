<cfimport prefix="ext" taglib="/coldext">
<cfinclude template="_header.cfm">

<!--- all examples will be appended to this div --->
<div id="grid5-out" class="output"></div>


<ext:onReady>

	<ext:createChild tag="h2" renderTo="grid5-out">Editable JSON Grid with saving, remote paging and sorting</ext:createChild>

	<ext:jsonStore var="myJSON" autoLoad="true" remoteSort="true"
			root="query.data" totalProperty="totalcount" url="#application.appPath#/demos/data/countries.cfm">
		<ext:field name="id" />
		<ext:field name="country" />
		<ext:field name="capital" />
		<ext:field name="continent" />
		<ext:param name="limit" value="10" />
	</ext:jsonStore>

	<ext:editorGridPanel var="myGrid" renderTo="grid5-out" title="Editable JSON Grid" width="473" autoHeight="true"
				clicksToEdit="1" stripeRows="true" store="myJSON">
		<ext:toolbar position="top">
			<ext:toolbarButton text="Save Data" iconCls="icon-save" handler="saveGrid" />
			<ext:toolbarButton text="Discard Changes" iconCls="icon-cross">
				<ext:handler>
					myGrid.getStore().rejectChanges();
				</ext:handler>
			</ext:toolbarButton>
			<ext:toolbarFill>
			<ext:toolbarButton text="Reset Sample Data" iconCls="icon-table-refresh">
				<ext:handler>
					<cfoutput>
					Ext.Ajax.request({ url: "#application.appPath#/demos/data/countries.cfm", method: "GET", params: { qCountriesInit: 1 } });
					myGrid.getStore().reload();
					</cfoutput>
				</ext:handler>
			</ext:toolbarButton>
		</ext:toolbar>
		<ext:gridColumn header="ID" width="40" sortable="true" dataIndex="id" />
		<ext:gridColumn header="Country" width="150" sortable="true" dataIndex="country">
			<ext:input allowBlank="false" />
		</ext:gridColumn>
		<ext:gridColumn header="Capital" width="160" sortable="true" dataIndex="capital">
			<ext:input allowBlank="false" />
		</ext:gridColumn>
		<ext:gridColumn header="Continent" width="120" sortable="true" dataIndex="continent">
			<ext:comboBox>
				<ext:option>Asia</ext:option>
				<ext:option>Europe</ext:option>
				<ext:option>North America</ext:option>
				<ext:option>Oceania</ext:option>
			</ext:comboBox>
		</ext:gridColumn>
		<ext:pagingToolbar displayInfo="true" pageSize="10" store="myJSON" />
	</ext:editorGridPanel>

	<ext:handler name="saveGrid">
		<cfoutput>
		var modifiedRecords = myGrid.getStore().getModifiedRecords();
		var len = modifiedRecords.length;
		if(len > 0)
		{
			var jsonData="{\"records\":[";
			for(var i=0;i<len;i++){
				record = modifiedRecords[i];
				jsonData += Ext.util.JSON.encode(record.data);
				if(i<len-1) jsonData += ",";
			}
			jsonData = jsonData.substring(0,jsonData.length) + "]}";
			Ext.Ajax.request({
				waitMsg: "Saving changes...",
				url: "#application.appPath#/demos/data/countriesGridUpdate.cfm",
				method: "POST",
				params: {
					action: "update",
					data: jsonData
				},
				failure: function(response,options){
					Ext.MessageBox.alert('Error','Grid could not be updated.');
				},
				success: function(response,options){
					var a = Ext.util.JSON.decode(response.responseText);
					Ext.MessageBox.alert('OK', a.message);
					myGrid.getStore().commitChanges();
				}
			});
		}
		</cfoutput>
	</ext:handler>

</ext:onReady>