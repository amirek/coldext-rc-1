<cfimport prefix="ext" taglib="/coldext">
<cfinclude template="_header.cfm">

<!--- all examples will be appended to this div --->
<div id="forms1-out" class="output"></div>


<ext:onReady>

	<ext:createChild tag="h1" renderTo="forms1-out">Dynamic Forms (Ext Replicas)</ext:createChild>

	<!--- ext 2.0 example replica - simple form --->
	<ext:createChild tag="h2" renderTo="forms1-out">Form 1 - Simple Form</ext:createChild>
	<ext:formPanel title="Simple Form" frame="true" width="350" renderTo="forms1-out">
		<ext:input name="firstName" />
		<ext:input name="lastName" />
		<ext:input name="company" />
		<ext:input name="email" />
		<ext:timeField name="time" />
		<ext:button text="Save" />
		<ext:button text="Cancel" />
	</ext:formPanel>

	<!--- ext 2.0 example replica - simple form with fieldsets --->
	<ext:createChild tag="h2" renderTo="forms1-out">Form 2 - Simple Form with Fieldsets</ext:createChild>
	<ext:formPanel title="Simple Form with Fieldsets" frame="true" labelWidth="75" width="350" renderTo="forms1-out">
		<ext:fieldSet title="User Information" checkboxToggle="true" collapsed="true">
			<ext:input name="firstName" anchor="95%" />
			<ext:input name="lastName" anchor="95%" />
			<ext:input name="company" anchor="95%" />
			<ext:input name="email" anchor="95%" />
		</ext:fieldSet>
		<ext:fieldSet title="Phone Numbers" collapsible="true">
			<ext:input name="home" anchor="95%" />
			<ext:input name="business" anchor="95%" />
			<ext:input name="mobile" anchor="95%" />
			<ext:input name="fax" anchor="95%" />
		</ext:fieldSet>
		<ext:button text="Save" />
		<ext:button text="Cancel" />
	</ext:formPanel>

	<!--- ext 2.0 example replica - tabpanel --->
	<ext:createChild tag="h2" renderTo="forms1-out">Form 3 - Forms can be a TabPanel</ext:createChild>
	<ext:formPanel width="350" border="false" padding="0" renderTo="forms1-out">
		<ext:tabPanel id="form1TabPanel" defaults="{ autoHeight: true }" labelAlign="left" plain="false">
			<ext:panel title="Personal Details" width="230" padding="10">
				<ext:input name="firstName" value="Justin" />
				<ext:input name="lastName" value="Carter" />
				<ext:input name="company" />
				<ext:input name="email" />
			</ext:panel>
			<ext:panel title="Phone Numbers" width="230" padding="10">
				<ext:input name="home" />
				<ext:input name="business" />
				<ext:input name="mobile" />
				<ext:input name="fax" />
			</ext:panel>
		</ext:tabPanel>
	</ext:formPanel>
	<ext:script>
		Ext.getCmp('form1TabPanel').syncSize();
	</ext:script>

	<!--- ext 2.0 example replica - advanced form --->
	<ext:createChild tag="h2" renderTo="forms1-out">Form 4 - ... and can contain TabPanels</ext:createChild>
	<ext:formPanel title="Inner Tabs" width="600" labelAlign="top" padding="5" renderTo="forms1-out">
		<ext:columns>
			<ext:column columnWidth="0.5">
				<ext:input name="firstName" anchor="95%" />
				<ext:input name="lastName" anchor="95%" />
			</ext:column>
			<ext:column columnWidth="0.5">
				<ext:input name="company" anchor="95%" />
				<ext:input name="email" anchor="95%" />
			</ext:column>
		</ext:columns>
		<ext:tabPanel id="form1AdvTabPanel" height="235" plain="true">
			<ext:panel title="Personal Details" width="230" padding="10">
				<ext:input name="firstName" />
				<ext:input name="lastName" />
				<ext:input name="company" />
				<ext:input name="email" />
			</ext:panel>
			<ext:panel title="Phone Numbers" width="230" padding="10">
				<ext:input name="home" />
				<ext:input name="business" />
				<ext:input name="mobile" />
				<ext:input name="fax" />
			</ext:panel>
			<ext:panel title="Biography" layout="fit" padding="10">
				<ext:htmlEditor name="richtext" />
			</ext:panel>
		</ext:tabPanel>
		<ext:button text="Save" />
		<ext:button text="Cancel" />
	</ext:formPanel>
	<ext:script>
		Ext.getCmp('form1AdvTabPanel').syncSize();
	</ext:script>

</ext:onReady>