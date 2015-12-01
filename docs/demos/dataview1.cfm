<cfimport prefix="ext" taglib="/coldext">
<cfinclude template="_header.cfm">

<!--- all examples will be appended to this div --->
<div id="dataview1-out" class="output"></div>


<ext:onReady>

	<ext:createChild renderTo="dataview1-out" tag="h2">DataView Example</ext:createChild>

	<ext:jsonStore var="store1" url="#application.appPath#/demos/data/countries.cfm" root="query.data" autoLoad="true">
		<ext:field name="id" />
		<ext:field name="country" />
	</ext:jsonStore>

	<ext:panel renderTo="dataview1-out" title="DataView" width="380" padding="5">
		<ext:dataView itemSelector="div.dataview1" overClass="dataview1Over" store="store1" emptyText="Nothing to display">
			<ext:xtemplate>
				<tpl for="."><div class="dataview1">
					<span class="dataviewCountry">{country}</span>
					<span class="dataviewCode">{id}</span>
				</div></tpl>
			</ext:xtemplate>
		</ext:dataView>
	</ext:panel>

</ext:onReady>
