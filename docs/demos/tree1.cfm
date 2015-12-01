<cfimport prefix="ext" taglib="/coldext">
<cfinclude template="_header.cfm">

<!--- all examples will be appended to this div --->
<div id="tree1-out" class="output"></div>


<ext:onReady>

	<ext:createChild tag="h2" renderTo="tree1-out">Static Tree</ext:createChild>

	<ext:treePanel var="myTree" title="Example Tree" enableDD="true" rootVisible="false" width="250"
			renderTo="tree1-out">
		<ext:rootNode text="ColdExt" >
			<ext:treeNode text="coldext">
				<ext:treeNode text="config.cfm" />
			</ext:treeNode>
			<ext:treeNode text="demos">
				<ext:treeNode text="form.cfm" />
				<ext:treeNode text="menu.cfm" />
				<ext:treeNode text="tree.cfm" />
			</ext:treeNode>
			<ext:treeNode text="ext">
				<ext:treeNode text="ext-all.js" />
			</ext:treeNode>
			<ext:treeNode text="tools">
				<ext:treeNode text="generate.cfm" />
			</ext:treeNode>
		</ext:rootNode>
	</ext:treePanel>

</ext:onReady>