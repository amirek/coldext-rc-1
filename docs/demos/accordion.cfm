<cfimport prefix="ext" taglib="/coldext">
<cfinclude template="_header.cfm">

<!--- all examples will be appended to this div --->
<div id="accordion-out" class="output"></div>


<ext:onReady>

	<ext:createChild tag="h2" renderTo="accordion-out">Accordion (Ext Replica)</ext:createChild>

	<ext:window var="myWindow" title="Accordion Window" layout="accordion" iconCls="icon-accordion"
				width="250" height="400" y="175" border="false" resizable="true" show="true">
		<ext:toolbar>
			<ext:toolbarButton iconCls="icon-connect">
				<ext:tooltip title="Rich Tooltips" text="Let your users know what they can do!" />
			</ext:toolbarButton>
			<ext:separator />
			<ext:toolbarButton iconCls="icon-user-add" tooltip="Add a new user" />
			<ext:toolbarButton iconCls="icon-user-delete" tooltip="Remove the selected user" />
		</ext:toolbar>
		<ext:treePanel id="myTree" title="Online Users" lines="false" rootVisible="false" margin="0 0 5 0">
			<ext:tool id="refresh">
				<ext:onclick>
					var tree = Ext.getCmp('myTree');
					tree.body.mask('Loading', 'x-mask-loading');
					tree.root.reload();
					tree.root.collapse(true, false);
					setTimeout(function(){
						tree.body.unmask();
						tree.root.expand(true, true);
					}, 1000);
				</ext:onclick>
			</ext:tool>
			<ext:rootNode>
				<ext:treeNode text="Friends" expanded="true">
					<ext:treeNode text="Jack" iconCls="icon-user" />
					<ext:treeNode text="Brian" iconCls="icon-user" />
					<ext:treeNode text="Jon" iconCls="icon-user" />
					<ext:treeNode text="Tim" iconCls="icon-user" />
					<ext:treeNode text="Nige" iconCls="icon-user" />
					<ext:treeNode text="Fred" iconCls="icon-user" />
					<ext:treeNode text="Bob" iconCls="icon-user" />
				</ext:treeNode>
				<ext:treeNode text="Family" expanded="true">
					<ext:treeNode text="Kelly" iconCls="icon-user-female" />
					<ext:treeNode text="Sarah" iconCls="icon-user-female" />
					<ext:treeNode text="Zack" iconCls="icon-user-green" />
					<ext:treeNode text="John" iconCls="icon-user-green" />
				</ext:treeNode>
			</ext:rootNode>
		</ext:treePanel>
		<ext:panel title="Settings">
			Something useful would be in here.
		</ext:panel>
		<ext:panel title="Even More Stuff">
			Something useful would be in here.
		</ext:panel>
		<ext:panel title="My Stuff">
			Something useful would be in here.
		</ext:panel>
	</ext:window>

</ext:onReady>
