<cfimport prefix="ext" taglib="/coldext">
<cfinclude template="_header.cfm">

<!--- all examples will be appended to this div --->
<div id="forms6-out" class="output"></div>


<ext:onReady>

	<ext:jsonStore var="myJSON" url="#application.appPath#/demos/data/countries.cfm" root="query.data">
		<ext:field name="id" />
		<ext:field name="country" />
	</ext:jsonStore>

	<!--- use static heights to make it easier to deal with tabPanel child components --->
	<ext:formPanel title="Columns in TabPanel" renderTo="forms6-out" width="700" height="175">

		<!--- set deferredRender="false" so that component dimensions are calculated immediately --->
		<ext:tabPanel plain="true" deferredRender="false" height="120">
			<ext:panel title="First" padding="10">
				<ext:columns>
					<ext:column columnWidth="0.5">
						<ext:input name="firstName" required="true" />
						<ext:input name="lastName" />
						<ext:input name="email" vtype="email" />
					</ext:column>
					<ext:column columnWidth="0.5">
						<ext:comboBox name="country" displayField="country" valueField="id" emptyText="Select a Country..." store="myJSON" />
						<ext:dateField name="date" />
						<ext:timeField name="time" />
					</ext:column>
				</ext:columns>
			</ext:panel>
			<!--- set hideMode="visibility" on additional tabs to fix rendering issues with columns and comboBox lists --->
			<ext:panel title="Second" padding="10" hideMode="visibility">
				<ext:columns>
					<ext:column columnWidth="0.5">
						<ext:input name="firstName2" required="true" />
						<ext:input name="lastName2" />
						<ext:input name="email2" vtype="email" />
					</ext:column>
					<ext:column columnWidth="0.5">
						<ext:comboBox name="country2" displayField="country" valueField="id" emptyText="Select a Country..." store="myJSON" />
						<ext:dateField name="date2" />
						<ext:timeField name="time2" />
					</ext:column>
				</ext:columns>
			</ext:panel>
		</ext:tabPanel>

	</ext:formPanel>

</ext:onReady>