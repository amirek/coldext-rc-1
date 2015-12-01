<cfimport prefix="ext" taglib="/coldext">
<cfinclude template="_header.cfm">

<!--- all examples will be appended to this div --->
<div id="grid2-out" class="output"></div>


<ext:onReady>

	<ext:createChild tag="h2" renderTo="grid2-out">JSON Grid with remote paging and sorting</ext:createChild>

	<ext:jsonStore var="myJSON" autoLoad="true" remoteSort="true"
			root="query.data" totalProperty="totalcount" url="#application.appPath#/demos/data/countries.cfm">
		<ext:field name="id" />
		<ext:field name="country" />
		<ext:field name="capital" />
		<ext:param name="limit" value="10" />
	</ext:jsonStore>

	<ext:gridPanel renderTo="grid2-out" title="JSON Grid" width="354" height="287" stripeRows="true" store="myJSON">
		<ext:gridColumn header="ID" width="40" sortable="true" dataIndex="id" />
		<ext:gridColumn header="Country" width="150" sortable="true" dataIndex="country" />
		<ext:gridColumn header="Capital" width="160" sortable="true" dataIndex="capital" />
		<ext:pagingToolbar displayInfo="true" pageSize="10" store="myJSON" />
	</ext:gridPanel>

</ext:onReady>