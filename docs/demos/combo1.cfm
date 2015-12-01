<cfimport prefix="ext" taglib="/coldext">
<cfinclude template="_header.cfm">

<!--- all examples will be appended to this div --->
<div id="combo1-out" class="output"></div>

<ext:onReady>

	<ext:createChild tag="h2" renderTo="combo1-out">Static Options</ext:createChild>

	<ext:formPanel border="false" renderTo="combo1-out">
		<ext:comboBox name="color" emptyText="Select a Flavor..." hideLabel="true">
			<!--- with value attribute --->
			<ext:option value="Caramel">Caramel</ext:option>
			<ext:option value="Chocolate">Chocolate</ext:option>
			<!--- without element text, text defaults to value attribute --->
			<ext:option value="Peppermint">
			<ext:option value="Rainbow">
			<!--- without value attribute, value defaults to element text --->
			<ext:option>Strawberry</ext:option>
			<ext:option>Vanilla</ext:option>
		</ext:combobox>
	</ext:formPanel>


	<ext:createChild tag="h2" renderTo="combo1-out">Remote jsonStore</ext:createChild>

	<ext:jsonStore var="store1" url="#application.appPath#/demos/data/countries.cfm" root="query.data" autoLoad="true">
		<ext:field name="id">
		<ext:field name="country">
	</ext:jsonStore>

	<ext:formPanel border="false" renderTo="combo1-out">
		<!--- comboBox can be a self-closing tag when used with a data store --->
		<ext:comboBox name="country" emptyText="Select a Country..." hideLabel="true"
			store="store1" displayField="country" valueField="id" value="Australia" />
	</ext:formPanel>


	<ext:createChild tag="h2" renderTo="combo1-out">XTemplate, Remote Filtering</ext:createChild>

	<ext:jsonStore var="store2" url="#application.appPath#/demos/data/countries.cfm" root="query.data">
		<ext:field name="id">
		<ext:field name="country">
	</ext:jsonStore>

	<ext:formPanel border="false" renderTo="combo1-out">
		<ext:comboBox name="country" emptyText="Select a Country..." hideLabel="true"
				store="store2" displayField="country" valueField="id" minChars="2">
			<!--- xtemplate can be used to render comboBox options --->
			<ext:xtemplate>
				<tpl for="."><div class="x-combo-list-item">
					<span class="country">{country}
						<tpl if="this.idEquals(id, 'KZ')">, very nice!</tpl>
					</span>
					<span class="code">{id}</span>
				</div></tpl>
				<!--- the template can reference functions written in script tags --->
				<ext:script>
					<!--- NOTE: this is an over simplified example to show the syntax --->
					<!--- it could have be written above in the tpl tag as: if="id=='KZ'" --->
					idEquals: function(a, b){
						return a == b;
					}
				</ext:script>
			</ext:xtemplate>
		</ext:combobox>
	</ext:formPanel>


	<ext:createChild tag="h2" renderTo="combo1-out">Select list with Paging</ext:createChild>

	<ext:jsonStore var="store3" url="#application.appPath#/demos/data/countries.cfm" root="query.data" totalProperty="totalcount">
		<ext:field name="id">
		<ext:field name="country">
	</ext:jsonStore>

	<ext:formPanel border="false" renderTo="combo1-out">
		<!--- typing into the combobox is disabled when editable is false --->
		<!--- setting a value for pageSize enables paging in the list --->
		<ext:comboBox name="country" emptyText="Select a Country..." hideLabel="true"
			store="store3" displayField="country" valueField="id" width="250"
			editable="false" pageSize="5"
		/>
	</ext:formPanel>

</ext:onReady>