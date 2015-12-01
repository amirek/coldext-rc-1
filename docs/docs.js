
function displayTab(node)
{
	if (node.isLeaf())
	{
		// get content tab panel
		var c = Ext.getCmp("contentPanel");
		// search for existing tab
		var tabName = 'panel-'+node.attributes.id;
		if(Ext.getCmp(tabName) == undefined) {
			// create new panel
			var p = new Ext.Panel({
				id: tabName,
				title: node.attributes.text,
				iconCls: (node.attributes.iconCls == undefined) ? "icon-leaf" : node.attributes.iconCls,
				closable: true,
				autoScroll: true,
				listeners: {
					"destroy": {
						fn: function() {
							if ((w = Ext.getCmp('window' + node.attributes.id)) != null) {
								w.destroy();
							}
						}
					},
					"hide": {
						fn: function() {
							if ((w = Ext.getCmp('window' + node.attributes.id)) != null) {
								if (w.isVisible()) w.hide();
							}
						}
					}
				}
			});
			// add it to the content tab panel
			c.add(p);
			c.doLayout();
			c.setActiveTab(p);
			// load/reload using updater
			p.getUpdater().update({
				url: "demos/" + node.attributes.id + ".cfm",
				nocache: true,
				scripts: true,
				text: "",
				timeout: 30
			});
		}
		else
		{
			var p = Ext.getCmp(tabName);
			c.setActiveTab(p);
		}
	}
}

function displayDemo(demo)
{
	var apiTree = Ext.getCmp("apiTree").getRootNode();
	if (demoNode = findDescendant(apiTree, "id", demo)) {
		demoNode.fireEvent("click", demoNode);
	}
}


/* helper functions */

/* http://extjs.com/forum/showthread.php?t=27178 */
/**
* Finds the first child that has the attribute with the specified value.
* Looks recursively down the tree to find the child.
* @param {String} attribute The attribute name
* @param {Mixed} value The value to search for
* @return {Node} The found child or null if none was found
*/
function findDescendant(tree, attribute, value){
	var cs = tree.childNodes;
		for (var i = 0, len = cs.length; i < len; i++) {
			if (cs[i].attributes != undefined && cs[i].attributes[attribute] == value) {
				return cs[i];
			}
			else {
				// Find it in this tree
				if (found = findDescendant(cs[i], attribute, value)) {
					return found;
				}
			}
		}
	return null;
}
