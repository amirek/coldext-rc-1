<cfimport prefix="ext" taglib="/coldext">
<cfinclude template="_header.cfm">

<!--- all examples will be appended to this div --->
<div id="forms4-out" class="output"></div>


<ext:onReady>

	<ext:createChild tag="h2" renderTo="forms4-out">Checkbox and Radio Group form</ext:createChild>

	<ext:formPanel var="myForm" id="myForm" title="Simple Form" url="#application.appPath#/demos/data/submit.cfm" renderTo="forms4-out">
		<ext:toolbar position="top">
			<ext:toolbarButton text="Save Form" iconCls="icon-save" handler="myHandler" />
		</ext:toolbar>
		<ext:input name="firstName" required="true" />
		<ext:input name="lastName" />
		<!--- simple horizontal checkbox group, automatic columns --->
		<ext:checkboxGroup label="Eye Color(s)">
			<ext:checkbox name="blue" checked="true">
			<ext:checkbox name="brown">
			<ext:checkbox name="green">
		</ext:checkboxGroup>
		<!--- radio group with 3 columns, items listed in order vertically --->
		<ext:radioGroup allowBlank="false" name="luckyNumber" columns="3" width="200" vertical="true">
			<ext:radio label="1" value="1">
			<ext:radio label="2" value="2">
			<ext:radio label="3" value="3">
			<ext:radio label="4" value="4">
			<ext:radio label="5" value="5">
			<ext:radio label="6" value="6">
			<ext:radio label="7" value="7">
			<ext:radio label="8" value="8">
			<ext:radio label="9" value="9">
		</ext:radioGroup>
		<!--- advanced checkbox group layout, manual columns and heading labels --->
		<ext:checkboxGroup label="Interests">
			<ext:column columnWidth=".3">
				<ext:label text="Music" cls="x-form-check-group-label" />
				<ext:checkbox name="indie">
				<ext:checkbox name="metal">
				<ext:checkbox name="punk">
				<ext:checkbox name="rock">
			</ext:column>
			<ext:column columnWidth=".40">
				<ext:label text="Technology" cls="x-form-check-group-label"  />
				<ext:checkbox name="gadgets">
				<ext:checkbox name="software">
			</ext:column>
			<ext:column columnWidth=".3">
				<ext:label text="Sport" cls="x-form-check-group-label"  />
				<ext:checkbox name="cricket">
				<ext:checkbox name="football">
				<ext:checkbox name="tennis">
			</ext:column>
		</ext:checkboxGroup>
	</ext:formPanel>

	<ext:handler name="myHandler" type="submit" form="myForm">
		<ext:success>
			Ext.MessageBox.alert("Success", a.result.message);
		</ext:success>
	</ext:handler>

</ext:onReady>