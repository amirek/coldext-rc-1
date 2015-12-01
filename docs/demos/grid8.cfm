<cfimport prefix="ext" taglib="/coldext">
<cfimport prefix="ux" taglib="/coldext/ux">
<cfinclude template="_header.cfm">

<!--- all examples will be appended to this div --->
<div id="grid8-out" class="output"></div>


<ext:onReady>

	<ext:createChild tag="h2" renderTo="grid8-out">JSON Grid with a Row Expander, XTemplate</ext:createChild>

	<ext:jsonStore var="myJSON" autoLoad="true" remoteSort="true"
			root="query.data" totalProperty="totalcount" url="#application.appPath#/demos/data/countries.cfm">
		<ext:field name="id" />
		<ext:field name="country" />
		<ext:field name="capital" />
		<ext:field name="continent" />
		<ext:field name="visited" />
	</ext:jsonStore>

	<ux:gridRowExpander var="myExpander">
		<ext:xtemplate>
			<tpl for="."><div style="padding: 5px; line-height: 1.3;">
				<div style="float: right; width: 20px; font-weight: bold; padding: 3px; text-align: center; font-size: 1.2em; border: 1px solid #999;">
					{id}
				</div>
				<b>{country}</b> belongs to the continent of <b>{continent}</b>.<br>
				I <b>have<tpl if="!visited"> not</tpl></b> been to <b>{capital}</b> in my travels.<br>
			</div></tpl>
		</ext:xtemplate>
	</ux:gridRowExpander>

	<ext:gridPanel renderTo="grid8-out" title="Grid Row Expander" plugins="myExpander" width="392" height="300"
				stripeRows="true" store="myJSON">
		<ext:gridColumn plugin="myExpander">
		<ext:gridColumn header="ID" width="40" sortable="true" dataIndex="id">
		<ext:gridColumn header="Country" width="150" sortable="true" id="country" dataIndex="country">
		<ext:gridColumn header="Capital" width="160" sortable="true" dataIndex="capital">
	</ext:gridPanel>

</ext:onReady>