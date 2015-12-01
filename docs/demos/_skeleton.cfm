<cfsetting enablecfoutputonly="true">

<cfimport prefix="ext" taglib="/coldext">
<ext:init>

<cfsetting enablecfoutputonly="false">
<cfinclude template="_header.cfm">

<!--- all examples will be appended to this div --->
<div id="{demoName}-out" class="output"></div>


<ext:onReady>

	<ext:createChild tag="h2" renderTo="{demoName}-out">{demoDescription}</ext:createChild>



</ext:onReady>
