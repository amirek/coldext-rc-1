<cfimport prefix="ext" taglib="/coldext">
<cfimport prefix="ux" taglib="/coldext/ux">
<cfinclude template="_header.cfm">

<!--- all examples will be appended to this div --->
<div id="grid11-out" class="output">
	<h2>Grid Search user extension</h2>
</div>


<ext:onReady>

	<ext:jsonStore var="myJSON" autoLoad="true" remoteSort="true"
			root="query.data" totalProperty="totalcount" url="#application.appPath#/demos/data/countries.cfm">
		<ext:field name="id" />
		<ext:field name="country" />
		<ext:field name="capital" />
		<ext:field name="continent" />
		<ext:param name="limit" value="10" />
	</ext:jsonStore>

	<!--- simple example --->
	<ux:gridSearch var="mySearch" width="150" />
	<!--- alternative example --->
	<!--- use position="top" AND explicitly define a top toolbar in the gridPanel --->
	<!--- <ux:gridSearch var="mySearch" position="top" width="150" /> --->

	<ext:gridPanel renderTo="grid11-out" title="JSON Grid" width="600" height="287"
			stripeRows="true" plugins="mySearch" store="myJSON">
		<!--- alternative example --->
		<!--- <ext:toolbar><ext:toolbarFill></ext:toolbar> --->
		<ext:gridColumn header="ID" width="40" sortable="true" dataIndex="id" />
		<ext:gridColumn id="country" header="Country" width="150" sortable="true" dataIndex="country" />
		<ext:gridColumn header="Capital" width="245" sortable="true" dataIndex="capital" />
		<ext:gridColumn header="Continent" width="160" sortable="true" dataIndex="continent" />
		<ext:pagingToolbar displayInfo="true" pageSize="10" store="myJSON" />
	</ext:gridPanel>

</ext:onReady>