<cfimport prefix="ext" taglib="/coldext">
<cfimport prefix="ux" taglib="/coldext/ux">
<cfinclude template="_header.cfm">

<!--- all examples will be appended to this div --->
<div id="upload1-out" class="output"></div>


<ext:onReady>

	<ext:createChild tag="h2" renderTo="upload1-out">Simple File Upload</ext:createChild>

	<ext:formPanel var="myForm" fileUpload="true" title="Simple File Upload" url="#application.appPath#/demos/data/upload.cfm" renderTo="upload1-out">
		<ext:toolbar position="top">
			<ext:toolbarButton text="Save Form" iconCls="icon-save" handler="myHandler" />
		</ext:toolbar>
		<ext:input name="documentTitle" required="true" />
		<ux:fileUploadField name="uploadFile" required="true" />
	</ext:formPanel>

	<ext:handler name="myHandler" type="submit" form="myForm">
		<ext:success>
			Ext.MessageBox.alert("Success", a.result.message);
		</ext:success>
	</ext:handler>

</ext:onReady>