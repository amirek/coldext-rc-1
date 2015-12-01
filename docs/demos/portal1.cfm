<cfimport prefix="ext" taglib="/coldext">
<cfimport prefix="ux" taglib="/coldext/ux">
<cfinclude template="_header.cfm">

<!--- all examples will be appended to this div --->
<div id="portal1-out" class="output">
	<h2>Portals</h2>
	<div style="font-family: Verdana, Arial, sans serif; font-size: 13px;">
		Drag and drop the panels to see Portals in action.<br>
		The panel "foo3" has remote content which can be refreshed.<br><br>
	</div>
</div>


<ext:onReady>

    <ext:script>
    // create some portlet tools using built in Ext tool ids
    var tools = [{
        id:'gear',
        handler: function(){
            Ext.Msg.alert('Message', 'The Settings tool was clicked.');
        }
    },{
        id:'close',
        handler: function(e, target, panel){
            panel.ownerCt.remove(panel, true);
        }
    }];
    </ext:script>

	<ext:panel border="false" width="600" renderTo="portal1-out">
    	<ux:portal border="false">
        	<ux:portalColumn columnWidth=".33" style="padding:10px 0 10px 10px">
            	<ux:portlet title="foo1" layout="fit" tools="tools" html="foo" />
            	<ux:portlet title="foo2" layout="fit" tools="tools" html="foo" />
			</ux:portalcolumn>
        	<ux:portalColumn columnWidth=".33" style="padding:10px 0 10px 10px">
            	<ux:portlet id="foo3" title="foo3" layout="fit" autoLoad="#application.appPath#/demos/data/portal1-foo3.cfm">
					<ext:tool id="refresh">
						<ext:onclick>Ext.getCmp("foo3").getUpdater().refresh();</ext:onclick>
					</ext:tool>
				</ux:portlet>
            	<ux:portlet title="foo4" layout="fit" tools="tools" html="foo" />
			</ux:portalcolumn>
        	<ux:portalColumn columnWidth=".33" style="padding:10px">
            	<ux:portlet title="foo5" layout="fit" tools="tools" html="foo" />
            	<ux:portlet title="foo6" layout="fit" tools="tools" html="foo" />
			</ux:portalcolumn>
        </ux:portal>
	</ext:panel>

</ext:onReady>