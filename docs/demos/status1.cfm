<cfimport prefix="ext" taglib="/coldext">
<cfinclude template="_header.cfm">

<!--- all examples will be appended to this div --->
<div id="status1-out" class="output"></div>


<ext:onReady>

	<ext:createChild tag="h2" renderTo="status1-out">Status Bar</ext:createChild>

	<ext:jsonStore var="myJSON" url="#application.appPath#/demos/data/countries.cfm" root="query.data">
		<ext:field name="id" />
		<ext:field name="country" />
	</ext:jsonStore>

	<ext:formPanel var="myForm" title="Simple Ajax Form" url="#application.appPath#/demos/data/submit.cfm" renderTo="status1-out">
		<ext:toolbar position="top">
			<ext:toolbarButton text="Save Form" iconCls="icon-save" handler="myHandler" />
		</ext:toolbar>
		<ext:input name="firstName" required="true" />
		<ext:input name="lastName" />
		<ext:input name="email" vtype="email" />
		<ext:comboBox name="country" displayField="country" valueField="id" emptyText="Select a Country..." store="myJSON" />
		<ext:dateField name="date" />
		<ext:timeField name="time" />
		<ext:textArea name="comments" />
		<ext:statusBar id="myStatus" defaultText="Ready">
	</ext:formPanel>

	<ext:handler name="myHandler" type="submit" form="myForm">
		<ext:success>
			Ext.getCmp("myStatus").setStatus({
				text: a.result.message,
				clear: true
			});
		</ext:success>
	</ext:handler>

</ext:onReady>