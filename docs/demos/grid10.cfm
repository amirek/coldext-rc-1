<cfimport prefix="ext" taglib="/coldext">
<cfinclude template="_header.cfm">

<!--- all examples will be appended to this div --->
<div id="grid10-out" class="output"></div>


<ext:onReady>

	<ext:createChild tag="h2" renderTo="grid10-out">JSON Grid with remote sorting (CFC-based)</ext:createChild>

	<ext:jsonStore var="myJSON" autoLoad="true" remoteSort="true" root="query.data"
			totalProperty="totalcount" url="#application.appPath#/demos/data/countries.cfc?method=getCountries">
		<ext:field name="id" />
		<ext:field name="country" />
		<ext:field name="capital" />
	</ext:jsonStore>

	<ext:gridPanel renderTo="grid10-out" title="JSON Grid" width="354" autoHeight="true" stripeRows="true" store="myJSON">
		<ext:gridColumn header="ID" width="40" sortable="true" dataIndex="id" />
		<ext:gridColumn header="Country" width="150" sortable="true" dataIndex="country" />
		<ext:gridColumn header="Capital" width="160" sortable="true" dataIndex="capital" />
	</ext:gridPanel>

</ext:onReady>