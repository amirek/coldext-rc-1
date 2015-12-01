<cfimport prefix="ext" taglib="/coldext">
<cfinclude template="_header.cfm">

<!--- all examples will be appended to this div --->
<div id="window-out" class="output"></div>


<ext:onReady>

	<ext:createChild tag="h2" renderTo="window-out">Windows with remote content</ext:createChild>

	<ext:window var="myWindow1" title="Google Search Window" width="600" height="400" x="250" y="100"
		autoLoad="http://www.google.com" resizable="true" show="true">
	</ext:window>

	<ext:window var="myWindow2" title="ColdExt Demo" width="600" height="400" x="175" y="150"
		autoLoadJS="{ url: '#application.appPath#/demos/forms2.cfm?noToolbar', scripts: true }" 
		bodyStyle="background: ##fff; padding-left: 10px;" resizable="true" show="true">
	</ext:window>

</ext:onReady>