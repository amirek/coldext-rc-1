<cfsetting enablecfoutputonly="true">
<!---

	ColdExt RC 1, Copyright (c) 2008, Justin Carter

	You may use ColdExt under any terms that satisfy the Ext JS license
	http://extjs.com/license

	Additionally you may modify the ColdExt CFML source code to suit
	your needs, as long as you do not modify this copyright notice.

 --->

<cfif thisTag.executionMode eq "start">


<cfif not isDefined("_coldext_functions")>
	<cfinclude template="_functions.cfm">
</cfif>

<cfset baseTagList = getBaseTagList()>
<cfset parentTag = getColdExtParentTag(baseTagList)>

<cfif StructKeyExists(attributes, "attributeCollection")>
	<cfset StructAppend(attributes, attributes.attributeCollection, false)>
</cfif>


<!--- defaults --->

<!--- attributes --->
<cfparam name="attributes.animCollapse" default=""><!--- @@type: Boolean @@help: True to animate the transition when the panel is collapsed, false to skip the animation (defaults to true if the Ext.Fx class is available, otherwise false). --->
<cfparam name="attributes.animFloat" default=""><!--- @@type: Boolean @@help: When a collapsed region's bar is clicked, the region's panel will be displayed as a floated panel that will close again once the user mouses out of that panel (or clicks out if autoHide = false). Setting animFloat to false will prevent the open and close of these floated panels from being animated (defaults to true). --->
<cfparam name="attributes.autoExpandColumn" default=""><!--- @@type: String @@help: The id of a column in this grid that should expand to fill unused space. This id can not be 0. --->
<cfparam name="attributes.autoExpandColumnJS" default=""><!--- @@type: JS @@help: The id of a column in this grid that should expand to fill unused space. This id can not be 0. --->
<cfparam name="attributes.autoExpandMax" default=""><!--- @@type: Number @@help: The maximum width the autoExpandColumn can have (if enabled). Defaults to 1000. --->
<cfparam name="attributes.autoExpandMin" default=""><!--- @@type: Number @@help: The minimum width the autoExpandColumn can have (if enabled). defaults to 50. --->
<cfparam name="attributes.autoHeight" default=""><!--- @@type: Boolean @@help: True to use height:'auto', false to use fixed height (defaults to false). Note: Although many components inherit this config option, not all will function as expected with a height of 'auto'. Setting autoHeight:true means that the browser will manage height based on the element's contents, and that Ext will not manage it at all. --->
<cfparam name="attributes.autoHide" default=""><!--- @@type: Boolean @@help: When a collapsed region's bar is clicked, the region's panel will be displayed as a floated panel. If autoHide is true, the panel will automatically hide after the user mouses out of the panel. If autoHide is false, the panel will continue to display until the user clicks outside of the panel (defaults to true). --->
<cfparam name="attributes.autoShow" default=""><!--- @@type: Boolean @@help: True if the component should check for hidden classes (e.g. 'x-hidden' or 'x-hide-display') and remove them on render (defaults to false). --->
<cfparam name="attributes.baseCls" default=""><!--- @@type: String @@help: The base CSS class to apply to this panel's element (defaults to 'x-panel'). --->
<cfparam name="attributes.baseClsJS" default=""><!--- @@type: JS @@help: The base CSS class to apply to this panel's element (defaults to 'x-panel'). --->
<cfparam name="attributes.bbar" default=""><!--- @@type: Object/Array @@help: The bottom toolbar of the panel. This can be either an Ext.Toolbar object or an array of buttons/button configs to be added to the toolbar. Note that this is not available as a property after render. To access the bottom toolbar after render, use getBottomToolbar. --->
<cfparam name="attributes.bodyCfg" default=""><!--- @@type: Object @@help: A DomHelper configuration object specifying the element structure of this Panel's body Element. This may be used to force the body Element to use a different form of markup than is created automatically. An example of this might be to create a child Panel containing custom content, such as a header, or forcing centering of all Panel content by having the body be a  element:new Ext.Panel({    title: 'New Message',    collapsible: true,    renderTo: Ext.getBody(),    width: 400,    bodyCfg: {        tag: 'center',        cls: 'x-panel-body'    },    items: [{        border: false,        header: false,        bodyCfg: {tag: 'h2', html: 'Message'}    }, {        xtype: 'textarea',        style: {            width: '95%',            marginBottom: '10px'        }    },        new Ext.Button({            text: 'Send',            minWidth: '100',            style: {                marginBottom: '10px'            }        })    ]}); --->
<cfparam name="attributes.border" default=""><!--- @@type: Boolean @@help: True to display the borders of the panel's body element, false to hide them (defaults to true). By default, the border is a 2px wide inset border, but this can be further altered by setting bodyBorder to false. --->
<cfparam name="attributes.buttonAlign" default=""><!--- @@type: String @@help: The alignment of any buttons added to this panel. Valid values are 'right,' 'left' and 'center' (defaults to 'right'). --->
<cfparam name="attributes.buttonAlignJS" default=""><!--- @@type: JS @@help: The alignment of any buttons added to this panel. Valid values are 'right,' 'left' and 'center' (defaults to 'right'). --->
<cfparam name="attributes.buttons" default=""><!--- @@type: Array @@help: An array of Ext.Buttons or Ext.Button configs used to add buttons to the footer of this panel. --->
<cfparam name="attributes.clearCls" default=""><!--- @@type: String @@help: The CSS class used to provide field clearing (defaults to 'x-form-clear-left'). This config is only used when this Component is rendered by a Container which has been configured to use the FormLayout layout manager. --->
<cfparam name="attributes.clearClsJS" default=""><!--- @@type: JS @@help: The CSS class used to provide field clearing (defaults to 'x-form-clear-left'). This config is only used when this Component is rendered by a Container which has been configured to use the FormLayout layout manager. --->
<cfparam name="attributes.cls" default=""><!--- @@type: String @@help: An optional extra CSS class that will be added to this component's Element (defaults to ''). This can be useful for adding customized styles to the component or any of its children using standard CSS rules. --->
<cfparam name="attributes.clsJS" default=""><!--- @@type: JS @@help: An optional extra CSS class that will be added to this component's Element (defaults to ''). This can be useful for adding customized styles to the component or any of its children using standard CSS rules. --->
<cfparam name="attributes.cm" default=""><!--- @@type: Object @@help: Shorthand for colModel. --->
<cfparam name="attributes.cmargins" default=""><!--- @@type: Object @@help: An object containing margins to apply to the region when in the collapsed state in the format:{    top: (top margin),    right: (right margin),    bottom: (bottom margin)    left: (left margin),} May also be a string containing space-separated, numeric margin values. The order of the sides associated with each value matches the way CSS processes margin values.  If there is only one value, it applies to all sides. If there are two values, the top and bottom borders are set to the first value and the right and left are set to the second. If there are three values, the top is set to the first value, the left and right are set to the second, and the bottom is set to the third. If there are four values, they apply to the top, right, bottom, and left, respectively. --->
<cfparam name="attributes.colModel" default=""><!--- @@type: Object @@help: The Ext.grid.ColumnModel to use when rendering the grid (required). --->
<cfparam name="attributes.collapseFirst" default=""><!--- @@type: Boolean @@help: True to make sure the collapse/expand toggle button always renders first (to the left of) any other tools in the panel's title bar, false to render it last (defaults to true). --->
<cfparam name="attributes.collapseMode" default=""><!--- @@type: String @@help: By default, collapsible regions are collapsed by clicking the expand/collapse tool button that renders into the region's title bar. Optionally, when collapseMode is set to 'mini' the region's split bar will also display a small collapse button in the center of the bar. In 'mini' mode the region will collapse to a thinner bar than in normal mode. By default collapseMode is undefined, and the only two supported values are undefined and 'mini'. Note that if a collapsible region does not have a title bar, then collapseMode must be set to 'mini' in order for the region to be collapsible by the user as the tool button will not be rendered. --->
<cfparam name="attributes.collapseModeJS" default=""><!--- @@type: JS @@help: By default, collapsible regions are collapsed by clicking the expand/collapse tool button that renders into the region's title bar. Optionally, when collapseMode is set to 'mini' the region's split bar will also display a small collapse button in the center of the bar. In 'mini' mode the region will collapse to a thinner bar than in normal mode. By default collapseMode is undefined, and the only two supported values are undefined and 'mini'. Note that if a collapsible region does not have a title bar, then collapseMode must be set to 'mini' in order for the region to be collapsible by the user as the tool button will not be rendered. --->
<cfparam name="attributes.collapsed" default=""><!--- @@type: Boolean @@help: By default, collapsible regions will be visible when rendered. Set the collapsed config to true to render the region as collapsed. --->
<cfparam name="attributes.collapsed" default=""><!--- @@type: Boolean @@help: True to render the panel collapsed, false to render it expanded (defaults to false). --->
<cfparam name="attributes.collapsedCls" default=""><!--- @@type: String @@help: A CSS class to add to the panel's element after it has been collapsed (defaults to 'x-panel-collapsed'). --->
<cfparam name="attributes.collapsedClsJS" default=""><!--- @@type: JS @@help: A CSS class to add to the panel's element after it has been collapsed (defaults to 'x-panel-collapsed'). --->
<cfparam name="attributes.collapsible" default=""><!--- @@type: Boolean @@help: True to allow the user to collapse this region (defaults to false). If true, an expand/collapse tool button will automatically be rendered into the title bar of the region, otherwise the button will not be shown. Note that a title bar is required to display the toggle button -- if no region title is specified, the region will only be collapsible if collapseMode is set to 'mini'. --->
<cfparam name="attributes.collapsible" default=""><!--- @@type: Boolean @@help: True to make the panel collapsible and have the expand/collapse toggle button automatically rendered into the header tool button area, false to keep the panel statically sized with no button (defaults to false). --->
<cfparam name="attributes.collapsibleSplitTip" default=""><!--- @@type: String @@help: The tooltip to display when the user hovers over a collapsible region's split bar (defaults to "Drag to resize. Double click to hide."). Only applies if useSplitTips = true. --->
<cfparam name="attributes.collapsibleSplitTipJS" default=""><!--- @@type: JS @@help: The tooltip to display when the user hovers over a collapsible region's split bar (defaults to "Drag to resize. Double click to hide."). Only applies if useSplitTips = true. --->
<cfparam name="attributes.columns" default=""><!--- @@type: Array @@help: An array of columns to auto create a ColumnModel --->
<cfparam name="attributes.ctCls" default=""><!--- @@type: String @@help: An optional extra CSS class that will be added to this component's container (defaults to ''). This can be useful for adding customized styles to the container or any of its children using standard CSS rules. --->
<cfparam name="attributes.ctClsJS" default=""><!--- @@type: JS @@help: An optional extra CSS class that will be added to this component's container (defaults to ''). This can be useful for adding customized styles to the container or any of its children using standard CSS rules. --->
<cfparam name="attributes.deferRowRender" default=""><!--- @@type: Boolean @@help: True to enable deferred row rendering. Default is true. --->
<cfparam name="attributes.disableSelection" default=""><!--- @@type: Boolean @@help: True to disable selections in the grid (defaults to false). - ignored if a SelectionModel is specified --->
<cfparam name="attributes.disabled" default=""><!--- @@type: Boolean @@help: Render this component disabled (default is false). --->
<cfparam name="attributes.draggable" default=""><!--- @@type: Boolean @@help: True to enable dragging of this Panel (defaults to false). For custom drag/drop implementations, an Ext.Panel.DD config could also be passed in this config instead of true. Ext.Panel.DD is an internal, undocumented class which moves a proxy Element around in place of the Panel's element, but provides no other behaviour during dragging or on drop. It is a subclass of Ext.dd.DragSource, so behaviour may be added by implementing the interface methods of Ext.dd.DragDrop eg: new Ext.Panel({    title: 'Drag me',    x: 100,    y: 100,    renderTo: Ext.getBody(),    floating: true,    frame: true,    width: 400,    height: 200,    draggable: {//      Config option of Ext.Panel.DD class.//      It's a floating Panel, so do not show a placeholder proxy in the original position.        insertProxy: false,//      Called for each mousemove event while dragging the DD object.        onDrag : function(e){//          Record the x,y position of the drag proxy so that we can//          position the Panel at end of drag.            var pel = this.proxy.getEl();            this.x = pel.getLeft(true);            this.y = pel.getTop(true);//          Keep the Shadow aligned if there is one.            var s = this.panel.getEl().shadow;            if (s) {                s.realign(this.x, this.y, pel.getWidth(), pel.getHeight());            }        },//      Called on the mouseup event.        endDrag : function(e){            this.panel.setPosition(this.x, this.y);        }    }}).show(); --->
<cfparam name="attributes.enableColumnHide" default=""><!--- @@type: Boolean @@help: True to enable hiding of columns with the header context menu. --->
<cfparam name="attributes.enableColumnMove" default=""><!--- @@type: Boolean @@help: True to enable drag and drop reorder of columns. --->
<cfparam name="attributes.enableColumnResize" default=""><!--- @@type: Boolean @@help: False to turn off column resizing for the whole grid (defaults to true). --->
<cfparam name="attributes.enableDragDrop" default=""><!--- @@type: Boolean @@help: True to enable dragging of the selected rows of the GridPanel. Setting this to true causes this GridPanel's GridView to create an instance of Ext.grid.GridDragZone. This is available (only after the Grid has been rendered) as the GridView's dragZone property. A cooperating DropZone must be created who's implementations of onNodeEnter, onNodeOver, onNodeOut and onNodeDrop are able to process the data which is provided. --->
<cfparam name="attributes.enableHdMenu" default=""><!--- @@type: Boolean @@help: True to enable the drop down button for menu in the headers. --->
<cfparam name="attributes.extraCls" default=""><!--- @@type: String @@help: An optional extra CSS class that will be added to the container (defaults to ''). This can be useful for adding customized styles to the container or any of its children using standard CSS rules. --->
<cfparam name="attributes.extraClsJS" default=""><!--- @@type: JS @@help: An optional extra CSS class that will be added to the container (defaults to ''). This can be useful for adding customized styles to the container or any of its children using standard CSS rules. --->
<cfparam name="attributes.fieldLabel" default=""><!--- @@type: String @@help: The label text to display next to this Component (defaults to '') This config is only used when this Component is rendered by a Container which has been configured to use the FormLayout layout manager. Example use:new Ext.FormPanel({    height: 100,    renderTo: Ext.getBody(),    items: [{        xtype: 'textfield',        fieldLabel: 'Name'    }]}); --->
<cfparam name="attributes.fieldLabelJS" default=""><!--- @@type: JS @@help: The label text to display next to this Component (defaults to '') This config is only used when this Component is rendered by a Container which has been configured to use the FormLayout layout manager. Example use:new Ext.FormPanel({    height: 100,    renderTo: Ext.getBody(),    items: [{        xtype: 'textfield',        fieldLabel: 'Name'    }]}); --->
<cfparam name="attributes.floatable" default=""><!--- @@type: Boolean @@help: True to allow clicking a collapsed region's bar to display the region's panel floated above the layout, false to force the user to fully expand a collapsed region by clicking the expand button to see it again (defaults to true). --->
<cfparam name="attributes.floating" default=""><!--- @@type: Boolean @@help: True to float the panel (absolute position it with automatic shimming and shadow), false to display it inline where it is rendered (defaults to false). Note that by default, setting floating to true will cause the panel to display at negative offsets so that it is hidden -- because the panel is absolute positioned, the position must be set explicitly after render (e.g., myPanel.setPosition(100,100);). Also, when floating a panel you should always assign a fixed width, otherwise it will be auto width and will expand to fill to the right edge of the viewport. --->
<cfparam name="attributes.footer" default=""><!--- @@type: Boolean @@help: True to create the footer element explicitly, false to skip creating it. By default, when footer is not specified, if one or more buttons have been added to the panel the footer will be created automatically, otherwise it will not. --->
<cfparam name="attributes.frame" default=""><!--- @@type: Boolean @@help: True to render the panel with custom rounded borders, false to render with plain 1px square borders (defaults to false). --->
<cfparam name="attributes.header" default=""><!--- @@type: Boolean @@help: True to create the header element explicitly, false to skip creating it. By default, when header is not specified, if a title is set the header will be created automatically, otherwise it will not. If a title is set but header is explicitly set to false, the header will not be rendered. --->
<cfparam name="attributes.headerAsText" default=""><!--- @@type: Boolean @@help: True to display the panel title in the header, false to hide it (defaults to true). --->
<cfparam name="attributes.height" default=""><!--- @@type: Number @@help: The height of this component in pixels (defaults to auto). --->
<cfparam name="attributes.hidden" default=""><!--- @@type: Boolean @@help: Render this component hidden (default is false). --->
<cfparam name="attributes.hideCollapseTool" default=""><!--- @@type: Boolean @@help: True to hide the expand/collapse toggle button when collapsible = true, false to display it (defaults to false). --->
<cfparam name="attributes.hideHeaders" default=""><!--- @@type: Boolean @@help: True to hide the grid's header (defaults to false). --->
<cfparam name="attributes.hideLabel" default=""><!--- @@type: Boolean @@help: True to completely hide the label element (defaults to false). By default, even if you do not specify a fieldLabel the space will still be reserved so that the field will line up with other fields that do have labels. Setting this to true will cause the field to not reserve that space. This config is only used when this Component is rendered by a Container which has been configured to use the FormLayout layout manager. Example use:new Ext.FormPanel({    height: 100,    renderTo: Ext.getBody(),    items: [{        xtype: 'textfield'        hideLabel: true    }]}); --->
<cfparam name="attributes.hideMode" default=""><!--- @@type: String @@help: How this component should be hidden. Supported values are "visibility" (css visibility), "offsets" (negative offset position) and "display" (css display) - defaults to "display". For Containers which may be hidden and shown as part of a card layout Container such as a TabPanel, it is recommended that hideMode is configured as "offsets". This ensures that hidden Components still have height and width so that layout managers can perform measurements when calculating layouts. --->
<cfparam name="attributes.hideModeJS" default=""><!--- @@type: JS @@help: How this component should be hidden. Supported values are "visibility" (css visibility), "offsets" (negative offset position) and "display" (css display) - defaults to "display". For Containers which may be hidden and shown as part of a card layout Container such as a TabPanel, it is recommended that hideMode is configured as "offsets". This ensures that hidden Components still have height and width so that layout managers can perform measurements when calculating layouts. --->
<cfparam name="attributes.hideParent" default=""><!--- @@type: Boolean @@help: True to hide and show the component's container when hide/show is called on the component, false to hide and show the component itself (defaults to false). For example, this can be used as a shortcut for a hide button on a window by setting hide:true on the button when adding it to its parent container. --->
<cfparam name="attributes.iconCls" default=""><!--- @@type: String @@help: A CSS class that will provide a background image to be used as the header icon (defaults to ''). An example custom icon class would be something like: .my-icon { background: url(../images/my-icon.gif) 0 6px no-repeat !important;} --->
<cfparam name="attributes.iconClsJS" default=""><!--- @@type: JS @@help: A CSS class that will provide a background image to be used as the header icon (defaults to ''). An example custom icon class would be something like: .my-icon { background: url(../images/my-icon.gif) 0 6px no-repeat !important;} --->
<cfparam name="attributes.id" default=""><!--- @@type: String @@help: The unique id of this component (defaults to an auto-assigned id). You should assign an id if you need to be able to access the component later and you do not have an object reference available (e.g., using Ext.ComponentMgr.getCmp). Note that this id will also be used as the element id for the containing HTML element that is rendered to the page for this component. This allows you to write id-based CSS rules to style the specific instance of this component uniquely, and also to select sub-elements using this component's id as the parent. --->
<cfparam name="attributes.idJS" default=""><!--- @@type: JS @@help: The unique id of this component (defaults to an auto-assigned id). You should assign an id if you need to be able to access the component later and you do not have an object reference available (e.g., using Ext.ComponentMgr.getCmp). Note that this id will also be used as the element id for the containing HTML element that is rendered to the page for this component. This allows you to write id-based CSS rules to style the specific instance of this component uniquely, and also to select sub-elements using this component's id as the parent. --->
<cfparam name="attributes.itemCls" default=""><!--- @@type: String @@help: An additional CSS class to apply to the wrapper's form item element of this field (defaults to the container's itemCls value if set, or ''). Since it is applied to the item wrapper, it allows you to write standard CSS rules that can apply to the field, the label (if specified) or any other element within the markup for the field. This config is only used when this Component is rendered by a Container which has been configured to use the FormLayout layout manager. Example use:// Apply a style to the field's label:    .required .x-form-item-label {font-weight:bold;color:red;}new Ext.FormPanel({    height: 100,    renderTo: Ext.getBody(),    items: [{        xtype: 'textfield',        fieldLabel: 'Name',        itemCls: 'required' //this label will be styled    },{        xtype: 'textfield',        fieldLabel: 'Favorite Color'    }]}); --->
<cfparam name="attributes.itemClsJS" default=""><!--- @@type: JS @@help: An additional CSS class to apply to the wrapper's form item element of this field (defaults to the container's itemCls value if set, or ''). Since it is applied to the item wrapper, it allows you to write standard CSS rules that can apply to the field, the label (if specified) or any other element within the markup for the field. This config is only used when this Component is rendered by a Container which has been configured to use the FormLayout layout manager. Example use:// Apply a style to the field's label:    .required .x-form-item-label {font-weight:bold;color:red;}new Ext.FormPanel({    height: 100,    renderTo: Ext.getBody(),    items: [{        xtype: 'textfield',        fieldLabel: 'Name',        itemCls: 'required' //this label will be styled    },{        xtype: 'textfield',        fieldLabel: 'Favorite Color'    }]}); --->
<cfparam name="attributes.keys" default=""><!--- @@type: Object/Array @@help: A KeyMap config object (in the format expected by Ext.KeyMap.addBinding used to assign custom key handling to this panel (defaults to null). --->
<cfparam name="attributes.labelSeparator" default=""><!--- @@type: String @@help: The standard separator to display after the text of each form label (defaults to the value of Ext.layout.FormLayout.labelSeparator, which is a colon ':' by default). To display no separator for this field's label specify empty string ''. This config is only used when this Component is rendered by a Container which has been configured to use the FormLayout layout manager. Example use:new Ext.FormPanel({    height: 100,    renderTo: Ext.getBody(),    items: [{        xtype: 'textfield',        fieldLabel: 'Name',        labelSeparator: '...'    }]}); --->
<cfparam name="attributes.labelSeparatorJS" default=""><!--- @@type: JS @@help: The standard separator to display after the text of each form label (defaults to the value of Ext.layout.FormLayout.labelSeparator, which is a colon ':' by default). To display no separator for this field's label specify empty string ''. This config is only used when this Component is rendered by a Container which has been configured to use the FormLayout layout manager. Example use:new Ext.FormPanel({    height: 100,    renderTo: Ext.getBody(),    items: [{        xtype: 'textfield',        fieldLabel: 'Name',        labelSeparator: '...'    }]}); --->
<cfparam name="attributes.labelStyle" default=""><!--- @@type: String @@help: A CSS style specification to apply directly to this field's label (defaults to the container's labelStyle value if set, or '').. This config is only used when this Component is rendered by a Container which has been configured to use the FormLayout layout manager. Example use:new Ext.FormPanel({    height: 100,    renderTo: Ext.getBody(),    items: [{        xtype: 'textfield',        fieldLabel: 'Name',        labelStyle: 'font-weight:bold;'    }]}); --->
<cfparam name="attributes.labelStyleJS" default=""><!--- @@type: JS @@help: A CSS style specification to apply directly to this field's label (defaults to the container's labelStyle value if set, or '').. This config is only used when this Component is rendered by a Container which has been configured to use the FormLayout layout manager. Example use:new Ext.FormPanel({    height: 100,    renderTo: Ext.getBody(),    items: [{        xtype: 'textfield',        fieldLabel: 'Name',        labelStyle: 'font-weight:bold;'    }]}); --->
<cfparam name="attributes.listeners" default=""><!--- @@type: Object @@help: (optional) A config object containing one or more event handlers to be added to this object during initialization. This should be a valid listeners config object as specified in the addListener example for attaching multiple handlers at once. --->
<cfparam name="attributes.loadMask" default=""><!--- @@type: Object @@help: An Ext.LoadMask config or true to mask the grid while loading (defaults to false). --->
<cfparam name="attributes.margins" default=""><!--- @@type: String @@help: An object containing margins to apply to the region when in the expanded state in the format:{    top: (top margin),    right: (right margin),    bottom: (bottom margin)    left: (left margin),} May also be a string containing space-separated, numeric margin values. The order of the sides associated with each value matches the way CSS processes margin values:  If there is only one value, it applies to all sides. If there are two values, the top and bottom borders are set to the first value and the right and left are set to the second. If there are three values, the top is set to the first value, the left and right are set to the second, and the bottom is set to the third. If there are four values, they apply to the top, right, bottom, and left, respectively. --->
<cfparam name="attributes.marginsJS" default=""><!--- @@type: Object @@help: An object containing margins to apply to the region when in the expanded state in the format:{    top: (top margin),    right: (right margin),    bottom: (bottom margin)    left: (left margin),} May also be a string containing space-separated, numeric margin values. The order of the sides associated with each value matches the way CSS processes margin values:  If there is only one value, it applies to all sides. If there are two values, the top and bottom borders are set to the first value and the right and left are set to the second. If there are three values, the top is set to the first value, the left and right are set to the second, and the bottom is set to the third. If there are four values, they apply to the top, right, bottom, and left, respectively. --->
<cfparam name="attributes.maskDisabled" default=""><!--- @@type: Boolean @@help: True to mask the panel when it is disabled, false to not mask it (defaults to true). Either way, the panel will always tell its contained elements to disable themselves when it is disabled, but masking the panel can provide an additional visual cue that the panel is disabled. --->
<cfparam name="attributes.maxHeight" default=""><!--- @@type: Number @@help: Sets the maximum height of the grid - ignored if autoHeight is not on. --->
<cfparam name="attributes.minButtonWidth" default=""><!--- @@type: Number @@help: Minimum width in pixels of all buttons in this panel (defaults to 75) --->
<cfparam name="attributes.minColumnWidth" default=""><!--- @@type: Number @@help: The minimum width a column can be resized to. Defaults to 25. --->
<cfparam name="attributes.minHeight" default=""><!--- @@type: Number @@help: The minimum allowable height in pixels for this region (defaults to 50) --->
<cfparam name="attributes.minWidth" default=""><!--- @@type: Number @@help: The minimum allowable width in pixels for this region (defaults to 50) --->
<cfparam name="attributes.overCls" default=""><!--- @@type: String @@help: An optional extra CSS class that will be added to this component's Element when the mouse moves over the Element, and removed when the mouse moves out. (defaults to ''). This can be useful for adding customized "active" or "hover" styles to the component or any of its children using standard CSS rules. --->
<cfparam name="attributes.overClsJS" default=""><!--- @@type: JS @@help: An optional extra CSS class that will be added to this component's Element when the mouse moves over the Element, and removed when the mouse moves out. (defaults to ''). This can be useful for adding customized "active" or "hover" styles to the component or any of its children using standard CSS rules. --->
<cfparam name="attributes.pageX" default=""><!--- @@type: Number @@help: The page level x coordinate for this component if contained within a positioning container. --->
<cfparam name="attributes.pageY" default=""><!--- @@type: Number @@help: The page level y coordinate for this component if contained within a positioning container. --->
<cfparam name="attributes.plugins" default=""><!--- @@type: Object/Array @@help: An object or array of objects that will provide custom functionality for this component. The only requirement for a valid plugin is that it contain an init method that accepts a reference of type Ext.Component. When a component is created, if any plugins are available, the component will call the init method on each plugin, passing a reference to itself. Each plugin can then call methods or respond to events on the component as needed to provide its functionality. --->
<cfparam name="attributes.renderHidden" default=""><!--- @@type: Boolean @@help: True to hide each contained item on render (defaults to false). --->
<cfparam name="attributes.renderTo" default=""><!--- @@type: String @@help: The id of the node, a DOM node or an existing Element that will be the container to render this component into. Using this config, a call to render() is not required. --->
<cfparam name="attributes.renderToJS" default=""><!--- @@type: Mixed @@help: The id of the node, a DOM node or an existing Element that will be the container to render this component into. Using this config, a call to render() is not required. --->
<cfparam name="attributes.selModel" default=""><!--- @@type: Object @@help: Any subclass of Ext.grid.AbstractSelectionModel that will provide the selection model for the grid (defaults to Ext.grid.RowSelectionModel if not specified). --->
<cfparam name="attributes.shadow" default=""><!--- @@type: String @@help: True (or a valid Ext.Shadow Ext.Shadow.mode value) to display a shadow behind the panel, false to display no shadow (defaults to 'sides'). Note that this option only applies when floating = true. --->
<cfparam name="attributes.shadowJS" default=""><!--- @@type: Boolean/String @@help: True (or a valid Ext.Shadow Ext.Shadow.mode value) to display a shadow behind the panel, false to display no shadow (defaults to 'sides'). Note that this option only applies when floating = true. --->
<cfparam name="attributes.shadowOffset" default=""><!--- @@type: Number @@help: The number of pixels to offset the shadow if displayed (defaults to 4). Note that this option only applies when floating = true. --->
<cfparam name="attributes.shim" default=""><!--- @@type: Boolean @@help: False to disable the iframe shim in browsers which need one (defaults to true). Note that this option only applies when floating = true. --->
<cfparam name="attributes.sm" default=""><!--- @@type: Object @@help: Shorthand for selModel. --->
<cfparam name="attributes.split" default=""><!--- @@type: Boolean @@help: True to display a Ext.SplitBar between this region and its neighbor, allowing the user to resize the regions dynamically (defaults to false). When split == true, it is common to specify a minSize and maxSize for the BoxComponent representing the region. These are not native configs of BoxComponent, and are used only by this class. --->
<cfparam name="attributes.splitTip" default=""><!--- @@type: String @@help: The tooltip to display when the user hovers over a non-collapsible region's split bar (defaults to "Drag to resize."). Only applies if useSplitTips = true. --->
<cfparam name="attributes.splitTipJS" default=""><!--- @@type: JS @@help: The tooltip to display when the user hovers over a non-collapsible region's split bar (defaults to "Drag to resize."). Only applies if useSplitTips = true. --->
<cfparam name="attributes.stateEvents" default=""><!--- @@type: Array @@help: An array of events that, when fired, should trigger this component to save its state (defaults to ["columnmove", "columnresize", "sortchange"]). These can be any types of events supported by this component, including browser or custom events (e.g., ['click', 'customerchange']). See stateful for an explanation of saving and restoring Component state. --->
<cfparam name="attributes.stateId" default=""><!--- @@type: String @@help: The unique id for this component to use for state management purposes (defaults to the component id if one was set, otherwise null if the component is using a generated id). See stateful for an explanation of saving and restoring Component state. --->
<cfparam name="attributes.stateIdJS" default=""><!--- @@type: JS @@help: The unique id for this component to use for state management purposes (defaults to the component id if one was set, otherwise null if the component is using a generated id). See stateful for an explanation of saving and restoring Component state. --->
<cfparam name="attributes.stateful" default=""><!--- @@type: Boolean @@help: A flag which causes the Component to attempt to restore the state of internal properties from a saved state on startup. The component must have either a stateId or id assigned for state to be managed. Auto-generated ids are not guaranteed to be stable across page loads and cannot be relied upon to save and restore the same state for a component. For state saving to work, the state manager's provider must have been set to an implementation of Ext.state.Provider which overrides the set and get methods to save and recall name/value pairs. A built-in implementation, Ext.state.CookieProvider is available. To set the state provider for the current page: Ext.state.Manager.setProvider(new Ext.state.CookieProvider()); Components attempt to save state when one of the events listed in the stateEvents configuration fires. You can perform extra processing on state save and restore by attaching handlers to the beforestaterestore, staterestore, beforestatesave and statesave events --->
<cfparam name="attributes.store" default=""><!--- @@type: Ext.data.Store @@help: The Ext.data.Store the grid should use as its data source (required). --->
<cfparam name="attributes.stripeRows" default=""><!--- @@type: Boolean @@help: True to stripe the rows. Default is false. This causes the CSS class x-grid3-row-alt to be added to alternate rows of the grid. A default CSS rule is provided which sets a background colour, but you can override this with a rule which either overrides the background-color style using the "!important" modifier, or which uses a CSS selector of higher specificity. --->
<cfparam name="attributes.style" default=""><!--- @@type: String @@help: A custom style specification to be applied to this component's Element. Should be a valid argument to Ext.Element.applyStyles. --->
<cfparam name="attributes.styleJS" default=""><!--- @@type: JS @@help: A custom style specification to be applied to this component's Element. Should be a valid argument to Ext.Element.applyStyles. --->
<cfparam name="attributes.tabTip" default=""><!--- @@type: String @@help: Adds a tooltip when mousing over the tab of a Ext.Panel which is an item of a Ext.TabPanel. Ext.QuickTips.init() must be called in order for the tips to render. --->
<cfparam name="attributes.tabTipJS" default=""><!--- @@type: JS @@help: Adds a tooltip when mousing over the tab of a Ext.Panel which is an item of a Ext.TabPanel. Ext.QuickTips.init() must be called in order for the tips to render. --->
<cfparam name="attributes.tbar" default=""><!--- @@type: Object/Array @@help: The top toolbar of the panel. This can be either an Ext.Toolbar object or an array of buttons/button configs to be added to the toolbar. Note that this is not available as a property after render. To access the top toolbar after render, use getTopToolbar. --->
<cfparam name="attributes.title" default=""><!--- @@type: String @@help: The title text to display in the panel header (defaults to ''). When a title is specified the header element will automatically be created and displayed unless header is explicitly set to false. If you don't want to specify a title at config time, but you may want one later, you must either specify a non-empty title (a blank space ' ' will do) or header:true so that the container element will get created. --->
<cfparam name="attributes.titleJS" default=""><!--- @@type: JS @@help: The title text to display in the panel header (defaults to ''). When a title is specified the header element will automatically be created and displayed unless header is explicitly set to false. If you don't want to specify a title at config time, but you may want one later, you must either specify a non-empty title (a blank space ' ' will do) or header:true so that the container element will get created. --->
<cfparam name="attributes.titleCollapse" default=""><!--- @@type: Boolean @@help: True to allow expanding and collapsing the panel (when collapsible = true) by clicking anywhere in the header bar, false to allow it only by clicking to tool button (defaults to false). --->
<cfparam name="attributes.tools" default=""><!--- @@type: Array @@help: An array of tool button configs to be added to the header tool area. When rendered, each tool is stored as an Element referenced by a public property called tools. Each tool config may contain the following properties:  id : StringRequired. The type of tool to create. Values may be toggle (Created by default when collapsible is true) close minimize maximize restore gear pin unpin right left up down refresh minus plus help search save print  handler : FunctionRequired. The function to call when clicked. Arguments passed are: event : Ext.EventObjectThe click event. toolEl : Ext.ElementThe tool Element. Panel : Ext.PanelThe host Panel  scope : ObjectThe scope in which to call the handler. qtip : String/ObjectA tip string, or a config argument to Ext.QuickTip.register hidden : BooleanTrue to initially render hidden. on : ObjectA listener config object specifiying event listeners in the format of an argument to addListener  Example usage: tools:[{    id:'refresh',    qtip: 'Refresh form Data',    // hidden:true,    handler: function(event, toolEl, panel){        // refresh logic    }}] Note that apart from the toggle tool which is provided when a panel is collapsible, these tools only provide the visual button. Any required functionality must be provided by adding handlers that implement the necessary behavior. --->
<cfparam name="attributes.trackMouseOver" default=""><!--- @@type: Boolean @@help: True to highlight rows when the mouse is over. Default is true. --->
<cfparam name="attributes.useSplitTips" default=""><!--- @@type: Boolean @@help: True to display a tooltip when the user hovers over a region's split bar (defaults to false). The tooltip text will be the value of either splitTip or collapsibleSplitTip as appropriate. --->
<cfparam name="attributes.view" default=""><!--- @@type: Object @@help: The Ext.grid.GridView used by the grid. This can be set before a call to render(). --->
<cfparam name="attributes.viewConfig" default=""><!--- @@type: Object @@help: A config object that will be used to create the grid's UI view. Any of the config options available for Ext.grid.GridView can be specified here. This option is ignored if view is xpecified. --->
<cfparam name="attributes.width" default=""><!--- @@type: Number @@help: The width of this component in pixels (defaults to auto). --->
<cfparam name="attributes.x" default=""><!--- @@type: Number @@help: The local x (left) coordinate for this component if contained within a positioning container. --->
<cfparam name="attributes.xtype" default=""><!--- @@type: String @@help: The registered xtype to create. This config option is not used when passing a config object into a constructor. This config option is used only when lazy instantiation is being used, and a child item of a Container is being specified not as a fully instantiated Component, but as a Component config object. The xtype will be looked up at render time up to determine what type of child Component to create. The predefined xtypes are listed here.  If you subclass Components to create your own Components, you may register them using Ext.ComponentMgr.registerType in order to be able to take advantage of lazy instantiation and rendering. --->
<cfparam name="attributes.xtypeJS" default=""><!--- @@type: JS @@help: The registered xtype to create. This config option is not used when passing a config object into a constructor. This config option is used only when lazy instantiation is being used, and a child item of a Container is being specified not as a fully instantiated Component, but as a Component config object. The xtype will be looked up at render time up to determine what type of child Component to create. The predefined xtypes are listed here.  If you subclass Components to create your own Components, you may register them using Ext.ComponentMgr.registerType in order to be able to take advantage of lazy instantiation and rendering. --->
<cfparam name="attributes.y" default=""><!--- @@type: Number @@help: The local y (top) coordinate for this component if contained within a positioning container. --->

<!--- custom attributes --->
<cfparam name="attributes.passThrough" default=""><!--- @@type: JS @@help: (ColdExt attribute) A comma separated list of JavaScript name:value pairs that will be written directly to the Ext component config. This is useful for storing custom properties in Ext components. --->
<cfparam name="attributes.var" default=""><!--- @@type: JS Variable Name @@help: (ColdExt attribute) The JavaScript variable name that this component will be assigned to. NOTE: You should only use the var attribute when this tags parent is the onReady tag. --->
<cfparam name="attributes.region" default=""><!--- @@type: String @@options: center,east,north,south,west @@help: The position within the viewport to attach this component to. The 'center' region is always required when using a viewport. --->



<!--- arrays that may be populated by nested tags --->
<cfset thisTag.bbar = ArrayNew(1)>
<cfset thisTag.buttons = ArrayNew(1)>
<cfset thisTag.columns = ArrayNew(1)>
<cfset thisTag.listeners = ArrayNew(1)>
<cfset thisTag.sm = ArrayNew(1)>
<cfset thisTag.tbar = ArrayNew(1)>
<cfset thisTag.tools = ArrayNew(1)>
<cfset thisTag.view = ArrayNew(1)>

<!--- process custom attributes --->
<!--- var --->
<cfset attributes.var = validateVarAttribute(parentTag)>

<!--- check for closing tag --->
<cfif not thisTag.hasEndTag>
	<cfthrow message="gridPanel missing closing tag">
</cfif>



<cfelseif thisTag.executionMode eq "end">



<cfsavecontent variable="attributes._out">
<cfprocessingdirective suppresswhitespace="true">
<cfoutput>
	<cfif AttributeNotEmpty("var")>var #attributes.var# = </cfif>new Ext.grid.GridPanel({
		<cfif AttributeNotEmpty("animCollapse")>animCollapse: #attributes.animCollapse#,</cfif>
		<cfif AttributeNotEmpty("animFloat")>animFloat: #attributes.animFloat#,</cfif>
		<cfif AttributeNotEmpty("autoExpandColumn")>autoExpandColumn: "#JSStringFormat(attributes.autoExpandColumn)#",</cfif>
		<cfif AttributeNotEmpty("autoExpandColumnJS")>autoExpandColumn: #attributes.autoExpandColumnJS#,</cfif>
		<cfif AttributeNotEmpty("autoExpandMax")>autoExpandMax: #attributes.autoExpandMax#,</cfif>
		<cfif AttributeNotEmpty("autoExpandMin")>autoExpandMin: #attributes.autoExpandMin#,</cfif>
		<cfif AttributeNotEmpty("autoHeight")>autoHeight: #attributes.autoHeight#,</cfif>
		<cfif AttributeNotEmpty("autoHide")>autoHide: #attributes.autoHide#,</cfif>
		<cfif AttributeNotEmpty("autoShow")>autoShow: #attributes.autoShow#,</cfif>
		<cfif AttributeNotEmpty("baseCls")>baseCls: "#JSStringFormat(attributes.baseCls)#",</cfif>
		<cfif AttributeNotEmpty("baseClsJS")>baseCls: #attributes.baseClsJS#,</cfif>
		<cfif AttributeNotEmpty("bbar")>bbar: #attributes.bbar#,</cfif>
		<cfif AttributeNotEmpty("bodyCfg")>bodyCfg: #attributes.bodyCfg#,</cfif>
		<cfif AttributeNotEmpty("border")>border: #attributes.border#,</cfif>
		<cfif AttributeNotEmpty("buttonAlign")>buttonAlign: "#JSStringFormat(attributes.buttonAlign)#",</cfif>
		<cfif AttributeNotEmpty("buttonAlignJS")>buttonAlign: #attributes.buttonAlignJS#,</cfif>
		<cfif AttributeNotEmpty("buttons")>buttons: #attributes.buttons#,</cfif>
		<cfif AttributeNotEmpty("clearCls")>clearCls: "#JSStringFormat(attributes.clearCls)#",</cfif>
		<cfif AttributeNotEmpty("clearClsJS")>clearCls: #attributes.clearClsJS#,</cfif>
		<cfif AttributeNotEmpty("cls")>cls: "#JSStringFormat(attributes.cls)#",</cfif>
		<cfif AttributeNotEmpty("clsJS")>cls: #attributes.clsJS#,</cfif>
		<cfif AttributeNotEmpty("cm")>cm: #attributes.cm#,</cfif>
		<cfif AttributeNotEmpty("cmargins")>cmargins: #attributes.cmargins#,</cfif>
		<cfif AttributeNotEmpty("colModel")>colModel: #attributes.colModel#,</cfif>
		<cfif AttributeNotEmpty("collapseFirst")>collapseFirst: #attributes.collapseFirst#,</cfif>
		<cfif AttributeNotEmpty("collapseMode")>collapseMode: "#JSStringFormat(attributes.collapseMode)#",</cfif>
		<cfif AttributeNotEmpty("collapseModeJS")>collapseMode: #attributes.collapseModeJS#,</cfif>
		<cfif AttributeNotEmpty("collapsed")>collapsed: #attributes.collapsed#,</cfif>
		<cfif AttributeNotEmpty("collapsed")>collapsed: #attributes.collapsed#,</cfif>
		<cfif AttributeNotEmpty("collapsedCls")>collapsedCls: "#JSStringFormat(attributes.collapsedCls)#",</cfif>
		<cfif AttributeNotEmpty("collapsedClsJS")>collapsedCls: #attributes.collapsedClsJS#,</cfif>
		<cfif AttributeNotEmpty("collapsible")>collapsible: #attributes.collapsible#,</cfif>
		<cfif AttributeNotEmpty("collapsible")>collapsible: #attributes.collapsible#,</cfif>
		<cfif AttributeNotEmpty("collapsibleSplitTip")>collapsibleSplitTip: "#JSStringFormat(attributes.collapsibleSplitTip)#",</cfif>
		<cfif AttributeNotEmpty("collapsibleSplitTipJS")>collapsibleSplitTip: #attributes.collapsibleSplitTipJS#,</cfif>
		<cfif AttributeNotEmpty("columns")>columns: #attributes.columns#,</cfif>
		<cfif AttributeNotEmpty("ctCls")>ctCls: "#JSStringFormat(attributes.ctCls)#",</cfif>
		<cfif AttributeNotEmpty("ctClsJS")>ctCls: #attributes.ctClsJS#,</cfif>
		<cfif AttributeNotEmpty("deferRowRender")>deferRowRender: #attributes.deferRowRender#,</cfif>
		<cfif AttributeNotEmpty("disableSelection")>disableSelection: #attributes.disableSelection#,</cfif>
		<cfif AttributeNotEmpty("disabled")>disabled: #attributes.disabled#,</cfif>
		<cfif AttributeNotEmpty("draggable")>draggable: #attributes.draggable#,</cfif>
		<cfif AttributeNotEmpty("enableColumnHide")>enableColumnHide: #attributes.enableColumnHide#,</cfif>
		<cfif AttributeNotEmpty("enableColumnMove")>enableColumnMove: #attributes.enableColumnMove#,</cfif>
		<cfif AttributeNotEmpty("enableColumnResize")>enableColumnResize: #attributes.enableColumnResize#,</cfif>
		<cfif AttributeNotEmpty("enableDragDrop")>enableDragDrop: #attributes.enableDragDrop#,</cfif>
		<cfif AttributeNotEmpty("enableHdMenu")>enableHdMenu: #attributes.enableHdMenu#,</cfif>
		<cfif AttributeNotEmpty("extraCls")>extraCls: "#JSStringFormat(attributes.extraCls)#",</cfif>
		<cfif AttributeNotEmpty("extraClsJS")>extraCls: #attributes.extraClsJS#,</cfif>
		<cfif AttributeNotEmpty("fieldLabel")>fieldLabel: "#JSStringFormat(attributes.fieldLabel)#",</cfif>
		<cfif AttributeNotEmpty("fieldLabelJS")>fieldLabel: #attributes.fieldLabelJS#,</cfif>
		<cfif AttributeNotEmpty("floatable")>floatable: #attributes.floatable#,</cfif>
		<cfif AttributeNotEmpty("floating")>floating: #attributes.floating#,</cfif>
		<cfif AttributeNotEmpty("footer")>footer: #attributes.footer#,</cfif>
		<cfif AttributeNotEmpty("frame")>frame: #attributes.frame#,</cfif>
		<cfif AttributeNotEmpty("header")>header: #attributes.header#,</cfif>
		<cfif AttributeNotEmpty("headerAsText")>headerAsText: #attributes.headerAsText#,</cfif>
		<cfif AttributeNotEmpty("height")>height: #attributes.height#,</cfif>
		<cfif AttributeNotEmpty("hidden")>hidden: #attributes.hidden#,</cfif>
		<cfif AttributeNotEmpty("hideCollapseTool")>hideCollapseTool: #attributes.hideCollapseTool#,</cfif>
		<cfif AttributeNotEmpty("hideHeaders")>hideHeaders: #attributes.hideHeaders#,</cfif>
		<cfif AttributeNotEmpty("hideLabel")>hideLabel: #attributes.hideLabel#,</cfif>
		<cfif AttributeNotEmpty("hideMode")>hideMode: "#JSStringFormat(attributes.hideMode)#",</cfif>
		<cfif AttributeNotEmpty("hideModeJS")>hideMode: #attributes.hideModeJS#,</cfif>
		<cfif AttributeNotEmpty("hideParent")>hideParent: #attributes.hideParent#,</cfif>
		<cfif AttributeNotEmpty("iconCls")>iconCls: "#JSStringFormat(attributes.iconCls)#",</cfif>
		<cfif AttributeNotEmpty("iconClsJS")>iconCls: #attributes.iconClsJS#,</cfif>
		<cfif AttributeNotEmpty("id")>id: "#JSStringFormat(attributes.id)#",</cfif>
		<cfif AttributeNotEmpty("idJS")>id: #attributes.idJS#,</cfif>
		<cfif AttributeNotEmpty("itemCls")>itemCls: "#JSStringFormat(attributes.itemCls)#",</cfif>
		<cfif AttributeNotEmpty("itemClsJS")>itemCls: #attributes.itemClsJS#,</cfif>
		<cfif AttributeNotEmpty("keys")>keys: #attributes.keys#,</cfif>
		<cfif AttributeNotEmpty("labelSeparator")>labelSeparator: "#JSStringFormat(attributes.labelSeparator)#",</cfif>
		<cfif AttributeNotEmpty("labelSeparatorJS")>labelSeparator: #attributes.labelSeparatorJS#,</cfif>
		<cfif AttributeNotEmpty("labelStyle")>labelStyle: "#JSStringFormat(attributes.labelStyle)#",</cfif>
		<cfif AttributeNotEmpty("labelStyleJS")>labelStyle: #attributes.labelStyleJS#,</cfif>
		<cfif AttributeNotEmpty("listeners")>listeners: #attributes.listeners#,</cfif>
		<cfif AttributeNotEmpty("loadMask")>loadMask: #attributes.loadMask#,</cfif>
		<cfif AttributeNotEmpty("margins")>margins: "#JSStringFormat(attributes.margins)#",</cfif>
		<cfif AttributeNotEmpty("marginsJS")>margins: #attributes.marginsJS#,</cfif>
		<cfif AttributeNotEmpty("maskDisabled")>maskDisabled: #attributes.maskDisabled#,</cfif>
		<cfif AttributeNotEmpty("maxHeight")>maxHeight: #attributes.maxHeight#,</cfif>
		<cfif AttributeNotEmpty("minButtonWidth")>minButtonWidth: #attributes.minButtonWidth#,</cfif>
		<cfif AttributeNotEmpty("minColumnWidth")>minColumnWidth: #attributes.minColumnWidth#,</cfif>
		<cfif AttributeNotEmpty("minHeight")>minHeight: #attributes.minHeight#,</cfif>
		<cfif AttributeNotEmpty("minWidth")>minWidth: #attributes.minWidth#,</cfif>
		<cfif AttributeNotEmpty("overCls")>overCls: "#JSStringFormat(attributes.overCls)#",</cfif>
		<cfif AttributeNotEmpty("overClsJS")>overCls: #attributes.overClsJS#,</cfif>
		<cfif AttributeNotEmpty("pageX")>pageX: #attributes.pageX#,</cfif>
		<cfif AttributeNotEmpty("pageY")>pageY: #attributes.pageY#,</cfif>
		<cfif AttributeNotEmpty("plugins")>plugins: #attributes.plugins#,</cfif>
		<cfif AttributeNotEmpty("renderHidden")>renderHidden: #attributes.renderHidden#,</cfif>
		<cfif AttributeNotEmpty("renderTo")>renderTo: "#JSStringFormat(attributes.renderTo)#",</cfif>
		<cfif AttributeNotEmpty("renderToJS")>renderTo: #attributes.renderToJS#,</cfif>
		<cfif AttributeNotEmpty("selModel")>selModel: #attributes.selModel#,</cfif>
		<cfif AttributeNotEmpty("shadow")>shadow: "#JSStringFormat(attributes.shadow)#",</cfif>
		<cfif AttributeNotEmpty("shadowJS")>shadow: #attributes.shadowJS#,</cfif>
		<cfif AttributeNotEmpty("shadowOffset")>shadowOffset: #attributes.shadowOffset#,</cfif>
		<cfif AttributeNotEmpty("shim")>shim: #attributes.shim#,</cfif>
		<cfif AttributeNotEmpty("sm")>sm: #attributes.sm#,</cfif>
		<cfif AttributeNotEmpty("split")>split: #attributes.split#,</cfif>
		<cfif AttributeNotEmpty("splitTip")>splitTip: "#JSStringFormat(attributes.splitTip)#",</cfif>
		<cfif AttributeNotEmpty("splitTipJS")>splitTip: #attributes.splitTipJS#,</cfif>
		<cfif AttributeNotEmpty("stateEvents")>stateEvents: #attributes.stateEvents#,</cfif>
		<cfif AttributeNotEmpty("stateId")>stateId: "#JSStringFormat(attributes.stateId)#",</cfif>
		<cfif AttributeNotEmpty("stateIdJS")>stateId: #attributes.stateIdJS#,</cfif>
		<cfif AttributeNotEmpty("stateful")>stateful: #attributes.stateful#,</cfif>
		<cfif AttributeNotEmpty("store")>store: #attributes.store#,</cfif>
		<cfif AttributeNotEmpty("stripeRows")>stripeRows: #attributes.stripeRows#,</cfif>
		<cfif AttributeNotEmpty("style")>style: "#JSStringFormat(attributes.style)#",</cfif>
		<cfif AttributeNotEmpty("styleJS")>style: #attributes.styleJS#,</cfif>
		<cfif AttributeNotEmpty("tabTip")>tabTip: "#JSStringFormat(attributes.tabTip)#",</cfif>
		<cfif AttributeNotEmpty("tabTipJS")>tabTip: #attributes.tabTipJS#,</cfif>
		<cfif AttributeNotEmpty("tbar")>tbar: #attributes.tbar#,</cfif>
		<cfif AttributeNotEmpty("title")>title: "#JSStringFormat(attributes.title)#",</cfif>
		<cfif AttributeNotEmpty("titleJS")>title: #attributes.titleJS#,</cfif>
		<cfif AttributeNotEmpty("titleCollapse")>titleCollapse: #attributes.titleCollapse#,</cfif>
		<cfif AttributeNotEmpty("tools")>tools: #attributes.tools#,</cfif>
		<cfif AttributeNotEmpty("trackMouseOver")>trackMouseOver: #attributes.trackMouseOver#,</cfif>
		<cfif AttributeNotEmpty("useSplitTips")>useSplitTips: #attributes.useSplitTips#,</cfif>
		<cfif AttributeNotEmpty("view")>view: #attributes.view#,</cfif>
		<cfif AttributeNotEmpty("viewConfig")>viewConfig: #attributes.viewConfig#,</cfif>
		<cfif AttributeNotEmpty("width")>width: #attributes.width#,</cfif>
		<cfif AttributeNotEmpty("x")>x: #attributes.x#,</cfif>
		<cfif AttributeNotEmpty("xtype")>xtype: "#JSStringFormat(attributes.xtype)#",</cfif>
		<cfif AttributeNotEmpty("xtypeJS")>xtype: #attributes.xtypeJS#,</cfif>
		<cfif AttributeNotEmpty("y")>y: #attributes.y#,</cfif>

		<cfif AttributeNotEmpty("passThrough")>#attributes.passThrough#,</cfif>

		<cfif arrayLen(thisTag.bbar)>bbar: #thisTag.bbar[1]._out#,</cfif>
		<cfif arrayLen(thisTag.buttons)>buttons: [ #ArrayKeyToList(thisTag.buttons, "_out")# ],</cfif>
		<cfif arrayLen(thisTag.columns)>columns: [ #ArrayKeyToList(thisTag.columns, "_out")# ],</cfif>
		<cfif arrayLen(thisTag.listeners)>listeners: { #ArrayKeyToList(thisTag.listeners, "_out")# },</cfif>
		<cfif arrayLen(thisTag.sm)>sm: #thisTag.sm[1]._out#,</cfif>
		<cfif arrayLen(thisTag.tbar)>tbar: #thisTag.tbar[1]._out#,</cfif>
		<cfif arrayLen(thisTag.tools)>tools: [ #ArrayKeyToList(thisTag.tools, "_out")# ],</cfif>
		<cfif arrayLen(thisTag.view)>view: #thisTag.view[1]._out#,</cfif>


		<!--- TODO: MISSING FORM DOCS? --->
		<cfif AttributeNotEmpty("region")>region: "#JSStringFormat(attributes.region)#",</cfif>

		dummy: true
	})<cfif AttributeNotEmpty("var")>;</cfif>
</cfoutput>
</cfprocessingdirective>
</cfsavecontent>

<cfassociate basetag="#parentTag#" datacollection="items">


</cfif>


<cfsetting enablecfoutputonly="false">