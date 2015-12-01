<cfsetting enablecfoutputonly="true">

<cfimport prefix="ext" taglib="/coldext">
<ext:init>

<cfsetting enablecfoutputonly="false">
<cfinclude template="_header.cfm">

<!--- all examples will be appended to this div --->
<div id="property1-out" class="output"></div>
<div id="property1a-out" style="float:left; padding: 0 15px"></div>
<div id="property1b-out" style="float:left"></div>


<ext:onReady>

	<ext:createChild tag="h2" renderTo="property1-out">Property Grid</ext:createChild>

	<!--- property grid using JavaScript array --->
	<ext:script>
		var myData = {
	        "(name)": "My Object",
	        "Created": new Date(Date.parse('10/15/2006')),
	        "Available": false,
	        "Version": 0.1,
	        "Description": "A test object"
	    }
	</ext:script>

	<ext:propertyGrid source="myData" renderTo="property1a-out" title="Property Grid"
			width="250" height="300" />

	<!--- property grid using tags only --->
	<ext:propertyGrid renderTo="property1b-out" title="Property Grid" width="250" height="300">
		<ext:propertyRecord name="(name)" value="'My Other Object'">
		<ext:propertyRecord name="Created" value="new Date(Date.parse('10/15/2006'))">
		<ext:propertyRecord name="Available" value="true">
		<ext:propertyRecord name="Version" value="0.2">
		<ext:propertyRecord name="Description" value="'Another test'">
	</ext:propertyGrid>

</ext:onReady>