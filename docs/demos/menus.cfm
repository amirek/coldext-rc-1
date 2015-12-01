<cfimport prefix="ext" taglib="/coldext">
<cfinclude template="_header.cfm">

<!--- all examples will be appended to this div --->
<div id="menus-out" class="output"></div>


<ext:onReady>

	<ext:createChild tag="h2" renderTo="menus-out">Menus 1 - Example Menus</ext:createChild>

	<ext:formPanel var="myForm" title="Example Menus" renderTo="menus-out">
		<ext:toolbar position="top">
			<!--- very minimal menu --->
			<ext:subMenu text="Minimal Menu">
				<ext:textItem text="Menu X" iconCls="icon-save" />
				<ext:subMenu text="Submenu">
					<ext:textItem text="Menu Y" iconCls="icon-user" />
					<ext:textItem text="Menu Z" iconCls="icon-user-green" />
				</ext:subMenu>
			</ext:subMenu>
			<!--- menu attached to toolbar button --->
			<ext:toolbarButton text="Simple Menu">
				<ext:menu>
					<ext:textItem text="Menu 1" />
					<ext:checkItem text="Menu 2" />
					<ext:separator />
					<ext:textItem text="Menu 3">
						<ext:menu>
							<ext:checkItem text="Menu i." checked="true" group="g" />
							<ext:checkItem text="Menu ii." group="g" />
						</ext:menu>
					</ext:textItem>
					<ext:subMenu text="Submenu">
						<ext:textItem text="Menu A" />
						<ext:textItem text="Menu B" />
					</ext:subMenu>
				</ext:menu>
			</ext:toolbarButton>
			<!--- advanced menu --->
			<ext:toolbarButton text="Advanced Menu">
				<ext:menu>
					<ext:textItem text="Color Menu">
						<ext:colorMenu />
					</ext:textItem>
					<ext:textItem text="Date Menu">
						<ext:dateMenu />
					</ext:textItem>
					<ext:subMenu text="Submenu ColorItem">
						<ext:colorItem />
						<ext:separator />
						<ext:textItem text="Some Item" />
						<ext:textItem text="Another Item" />
					</ext:subMenu>
					<ext:subMenu text="Submenu DateItem">
						<ext:dateItem />
						<ext:separator />
						<ext:textItem text="Some Item" />
						<ext:textItem text="Another Item" />
					</ext:subMenu>
				</ext:menu>
			</ext:toolbarButton>
		</ext:toolbar>
		<ext:input name="firstName" required="true" />
		<ext:input name="lastName" />
		<ext:input name="email" vtype="email" />
		<ext:textArea name="comments" />
	</ext:formPanel>

</ext:onReady>