<cfimport prefix="ext" taglib="/coldext">
<cfinclude template="_header.cfm">

<!--- all examples will be appended to this div --->
<div id="tree2-out" class="output"></div>


<ext:onReady>

	<ext:createChild renderTo="tree2-out" tag="h2">Tree 2 - TreeLoader with static remote data, no lazy load</ext:createChild>

	<ext:treePanel var="myTree2" title="TreeLoader" width="250" renderTo="tree2-out"
				rootVisible="false">
		<!--- this file serves static data --->
		<ext:treeLoader url="#application.appPath#/demos/data/treedata.cfm" />
		<ext:rootNode text="Root Node" />
	</ext:treePanel>

	<ext:createChild renderTo="tree2-out" tag="h2">Tree 3 - TreeLoader with dynamic remote data, lazy loading</ext:createChild>

	<ext:treePanel var="myTree2" title="Lazy Loading" width="250" renderTo="tree2-out"
				rootVisible="false">
		<!--- this file serves dynamic data, based on the "node" POST variable --->
		<ext:treeLoader url="#application.appPath#/demos/data/treedata2.cfm" />
		<ext:rootNode id="root" text="Root Node" />
	</ext:treePanel>

</ext:onReady>