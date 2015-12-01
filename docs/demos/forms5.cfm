<cfimport prefix="ext" taglib="/coldext">
<cfinclude template="_header.cfm">

<!--- all examples will be appended to this div --->
<div id="forms5-out" class="output"></div>


<ext:onReady>

	<ext:createChild tag="h2" renderTo="forms5-out">Standard Submit Form</ext:createChild>

	<ext:formPanel standardSubmit="true" title="Standard Form" url="#application.appPath#/demos/data/submit.cfm"
			 renderTo="forms5-out">
		<ext:toolbar position="top">
			<ext:toolbarButton text="Save Form" type="submit" iconCls="icon-save" />
		</ext:toolbar>
		<ext:input name="firstName" required="true" />
		<ext:input name="lastName" />
		<ext:input name="email" vtype="email" />
		<ext:textArea name="comments" />
		<!--- <ext:button text="Save Form" type="submit" iconCls="icon-save"> --->
	</ext:formPanel>

</ext:onReady>