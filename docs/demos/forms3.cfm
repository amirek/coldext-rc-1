<cfimport prefix="ext" taglib="/coldext">
<cfinclude template="_header.cfm">

<!--- all examples will be appended to this div --->
<div id="forms3-out" class="output"></div>


<ext:onReady>

	<!--- coldext custom example - simple ajax form --->
	<ext:createChild tag="h2" renderTo="forms3-out">Another Simple Form</ext:createChild>

	<ext:jsonStore var="myJSON" url="#application.appPath#/demos/data/countries.cfm" root="query.data">
		<ext:field name="id" />
		<ext:field name="country" />
	</ext:jsonStore>

	<ext:formPanel var="myForm" title="Simple Ajax Form" url="#application.appPath#/demos/data/submit.cfm" renderTo="forms3-out">
		<ext:toolbar position="top">
			<ext:toolbarButton text="Save Form" iconCls="icon-save" handler="myHandler" />
			<ext:toolbarFill />
			<ext:toolbarSplitButton text="Splitness" iconCls="icon-user-green">
				<ext:menu subMenuAlign="tr-tl">
					<ext:textItem text="Menu X" />
					<ext:subMenu text="Left Menu">
						<ext:textItem text="Menu Y" />
						<ext:textItem text="Menu Z" />
					</ext:subMenu>
				</ext:menu>
				<ext:handler>
					Ext.MessageBox.alert("Hello", "Hello Splitter!");
				</ext:handler>
			</ext:toolbarSplitButton>
			<ext:toolbarButton text="Hello World" iconCls="icon-user">
				<ext:handler>
					Ext.MessageBox.alert("Hello", "Hello World!");
				</ext:handler>
			</ext:toolbarButton>
		</ext:toolbar>
		<ext:input name="firstName" required="true" />
		<ext:input name="lastName" />
		<ext:input name="email" vtype="email" />
		<ext:numberField name="age" allowDecimals="false" maxValue="120" />
		<ext:comboBox name="country" displayField="country" valueField="id" emptyText="Select a Country..." store="myJSON" />
		<ext:dateField name="date" />
		<ext:timeField name="time" />
		<ext:textArea name="comments" />
	</ext:formPanel>

	<ext:handler name="myHandler" type="submit" form="myForm">
		<ext:success>
			Ext.MessageBox.alert("Success", a.result.message);
		</ext:success>
	</ext:handler>

</ext:onReady>