<cfimport prefix="ext" taglib="/coldext">
<cfinclude template="_header.cfm">

<!--- all examples will be appended to this div --->
<div id="slider-out" class="output"></div>


<ext:onReady>

	<ext:createChild tag="h2" renderTo="slider-out">Horizontal Slider</ext:createChild>
	<ext:slider var="mySlider" maxValue="10" value="6" width="250" renderTo="slider-out">

	<ext:createChild tag="h2" renderTo="slider-out">Vertical Slider</ext:createChild>
	<ext:slider var="mySlider2" maxValue="10" height="100" vertical="true" renderTo="slider-out">

</ext:onReady>