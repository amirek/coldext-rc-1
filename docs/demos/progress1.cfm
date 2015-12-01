<cfimport prefix="ext" taglib="/coldext">
<cfinclude template="_header.cfm">

<!--- all examples will be appended to this div --->
<div id="progress1-out" class="output"></div>


<ext:onReady>

	<ext:createChild tag="h2" renderTo="progress1-out">Color Palette</ext:createChild>
	<ext:colorPalette var="myPalette" renderTo="progress1-out">

	<ext:createChild tag="h2" renderTo="progress1-out">Date Picker</ext:createChild>
	<ext:datePicker var="myDatePicker" renderTo="progress1-out">

	<ext:createChild tag="h2" renderTo="progress1-out">Progress Bar</ext:createChild>
	<ext:progressBar var="myBar" width="100" height="15" renderTo="progress1-out">
	<ext:script>
		myBar.wait({interval: 100, increment: 20});
	</ext:script>

</ext:onReady>