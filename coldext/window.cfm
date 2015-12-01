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
<cfparam name="attributes.minHeight" default="50">
<cfparam name="attributes.minWidth" default="100">

<!--- attributes --->
<cfparam name="attributes.activeItem" default=""><!--- @@type: String @@help: A string component id or the numeric index of the component that should be initially activated within the container's layout on render. For example, activeItem: 'item-1' or activeItem: 0 (index 0 = the first item in the container's collection). activeItem only applies to layout styles that can display items one at a time (like Ext.layout.Accordion, Ext.layout.CardLayout and Ext.layout.FitLayout). Related to Ext.layout.ContainerLayout.activeItem. --->
<cfparam name="attributes.activeItemJS" default=""><!--- @@type: String/Number @@help: A string component id or the numeric index of the component that should be initially activated within the container's layout on render. For example, activeItem: 'item-1' or activeItem: 0 (index 0 = the first item in the container's collection). activeItem only applies to layout styles that can display items one at a time (like Ext.layout.Accordion, Ext.layout.CardLayout and Ext.layout.FitLayout). Related to Ext.layout.ContainerLayout.activeItem. --->
<cfparam name="attributes.allowDomMove" default=""><!--- @@type: Boolean @@help: Whether the component can move the Dom node when rendering (defaults to true). --->
<cfparam name="attributes.animCollapse" default=""><!--- @@type: Boolean @@help: True to animate the transition when the panel is collapsed, false to skip the animation (defaults to true if the Ext.Fx class is available, otherwise false). --->
<cfparam name="attributes.animateTarget" default=""><!--- @@type: String @@help: Id or element from which the window should animate while opening (defaults to null with no animation). --->
<cfparam name="attributes.animateTargetJS" default=""><!--- @@type: String/Element @@help: Id or element from which the window should animate while opening (defaults to null with no animation). --->
<cfparam name="attributes.applyTo" default=""><!--- @@type: String @@help: The id of the node, a DOM node or an existing Element corresponding to a DIV that is already present in the document that specifies some structural markup for this component. When applyTo is used, constituent parts of the component can also be specified by id or CSS class name within the main element, and the component being created may attempt to create its subcomponents from that markup if applicable. Using this config, a call to render() is not required. If applyTo is specified, any value passed for renderTo will be ignored and the target element's parent node will automatically be used as the component's container. --->
<cfparam name="attributes.applyToJS" default=""><!--- @@type: Mixed @@help: The id of the node, a DOM node or an existing Element corresponding to a DIV that is already present in the document that specifies some structural markup for this component. When applyTo is used, constituent parts of the component can also be specified by id or CSS class name within the main element, and the component being created may attempt to create its subcomponents from that markup if applicable. Using this config, a call to render() is not required. If applyTo is specified, any value passed for renderTo will be ignored and the target element's parent node will automatically be used as the component's container. --->
<cfparam name="attributes.autoDestroy" default=""><!--- @@type: Boolean @@help: If true the container will automatically destroy any contained component that is removed from it, else destruction must be handled manually (defaults to true). --->
<cfparam name="attributes.autoEl" default=""><!--- @@type: String @@help: A tag name or DomHelper spec to create an element with. This is intended to create shorthand utility components inline via JSON. It should not be used for higher level components which already create their own elements. Example usage: {xtype:'box', autoEl: 'div', cls:'my-class'}{xtype:'box', autoEl: {tag:'blockquote', html:'autoEl is cool!'}} // with DomHelper --->
<cfparam name="attributes.autoElJS" default=""><!--- @@type: String/Object @@help: A tag name or DomHelper spec to create an element with. This is intended to create shorthand utility components inline via JSON. It should not be used for higher level components which already create their own elements. Example usage: {xtype:'box', autoEl: 'div', cls:'my-class'}{xtype:'box', autoEl: {tag:'blockquote', html:'autoEl is cool!'}} // with DomHelper --->
<cfparam name="attributes.autoHeight" default=""><!--- @@type: Boolean @@help: True to use height:'auto', false to use fixed height (defaults to false). Note: Although many components inherit this config option, not all will function as expected with a height of 'auto'. Setting autoHeight:true means that the browser will manage height based on the element's contents, and that Ext will not manage it at all. --->
<cfparam name="attributes.autoLoad" default=""><!--- @@type: String @@help: A valid url spec according to the Updater Ext.Updater.update method. If autoLoad is not null, the panel will attempt to load its contents immediately upon render. The URL will become the default URL for this panel's body element, so it may be refreshed at any time. --->
<cfparam name="attributes.autoLoadJS" default=""><!--- @@type: Object/String/Function @@help: A valid url spec according to the Updater Ext.Updater.update method. If autoLoad is not null, the panel will attempt to load its contents immediately upon render. The URL will become the default URL for this panel's body element, so it may be refreshed at any time. --->
<cfparam name="attributes.autoScroll" default=""><!--- @@type: Boolean @@help: True to use overflow:'auto' on the panel's body element and show scroll bars automatically when necessary, false to clip any overflowing content (defaults to false). --->
<cfparam name="attributes.autoShow" default=""><!--- @@type: Boolean @@help: True if the component should check for hidden classes (e.g. 'x-hidden' or 'x-hide-display') and remove them on render (defaults to false). --->
<cfparam name="attributes.baseCls" default=""><!--- @@type: String @@help: The base CSS class to apply to this panel's element (defaults to 'x-window'). --->
<cfparam name="attributes.baseClsJS" default=""><!--- @@type: JS @@help: The base CSS class to apply to this panel's element (defaults to 'x-window'). --->
<cfparam name="attributes.bbar" default=""><!--- @@type: Object/Array @@help: The bottom toolbar of the panel. This can be either an Ext.Toolbar object or an array of buttons/button configs to be added to the toolbar. Note that this is not available as a property after render. To access the bottom toolbar after render, use getBottomToolbar. --->
<cfparam name="attributes.bodyBorder" default=""><!--- @@type: Boolean @@help: True to display an interior border on the body element of the panel, false to hide it (defaults to true). This only applies when border == true. If border == true and bodyBorder == false, the border will display as a 1px wide inset border, giving the entire body element an inset appearance. --->
<cfparam name="attributes.bodyCfg" default=""><!--- @@type: Object @@help: A DomHelper configuration object specifying the element structure of this Panel's body Element. This may be used to force the body Element to use a different form of markup than is created automatically. An example of this might be to create a child Panel containing custom content, such as a header, or forcing centering of all Panel content by having the body be a  element:new Ext.Panel({    title: 'New Message',    collapsible: true,    renderTo: Ext.getBody(),    width: 400,    bodyCfg: {        tag: 'center',        cls: 'x-panel-body'    },    items: [{        border: false,        header: false,        bodyCfg: {tag: 'h2', html: 'Message'}    }, {        xtype: 'textarea',        style: {            width: '95%',            marginBottom: '10px'        }    },        new Ext.Button({            text: 'Send',            minWidth: '100',            style: {                marginBottom: '10px'            }        })    ]}); --->
<cfparam name="attributes.bodyStyle" default=""><!--- @@type: String @@help: Custom CSS styles to be applied to the body element in the format expected by Ext.Element.applyStyles (defaults to null). --->
<cfparam name="attributes.bodyStyleJS" default=""><!--- @@type: String/Object/Function @@help: Custom CSS styles to be applied to the body element in the format expected by Ext.Element.applyStyles (defaults to null). --->
<cfparam name="attributes.border" default=""><!--- @@type: Boolean @@help: True to display the borders of the panel's body element, false to hide them (defaults to true). By default, the border is a 2px wide inset border, but this can be further altered by setting bodyBorder to false. --->
<cfparam name="attributes.bufferResize" default=""><!--- @@type: Boolean/Number @@help: When set to true (100 milliseconds) or a number of milliseconds, the layout assigned for this container will buffer the frequency it calculates and does a re-layout of components. This is useful for heavy containers or containers with a large quantity of sub-components for which frequent layout calls would be expensive. --->
<cfparam name="attributes.buttonAlign" default=""><!--- @@type: String @@help: The alignment of any buttons added to this panel. Valid values are 'right,' 'left' and 'center' (defaults to 'right'). --->
<cfparam name="attributes.buttonAlignJS" default=""><!--- @@type: JS @@help: The alignment of any buttons added to this panel. Valid values are 'right,' 'left' and 'center' (defaults to 'right'). --->
<cfparam name="attributes.buttons" default=""><!--- @@type: Array @@help: An array of Ext.Buttons or Ext.Button configs used to add buttons to the footer of this panel. --->
<cfparam name="attributes.clearCls" default=""><!--- @@type: String @@help: The CSS class used to provide field clearing (defaults to 'x-form-clear-left'). This config is only used when this Component is rendered by a Container which has been configured to use the FormLayout layout manager. --->
<cfparam name="attributes.clearClsJS" default=""><!--- @@type: JS @@help: The CSS class used to provide field clearing (defaults to 'x-form-clear-left'). This config is only used when this Component is rendered by a Container which has been configured to use the FormLayout layout manager. --->
<cfparam name="attributes.closable" default=""><!--- @@type: Boolean @@help: True to display the 'close' tool button and allow the user to close the window, false to hide the button and disallow closing the window (default to true). By default, when close is requested by either clicking the close button in the header or pressing ESC when the Window has focus, the close method will be called. This will destroy the Window and its content meaning that it may not be reused. To make closing a Window hide the Window so that it may be reused, set closeAction to 'hide'. --->
<cfparam name="attributes.closeAction" default=""><!--- @@type: String @@help: The action to take when the close button is clicked. The default action is 'close' which will actually remove the window from the DOM and destroy it. The other valid option is 'hide' which will simply hide the window by setting visibility to hidden and applying negative offsets, keeping the window available to be redisplayed via the show method. --->
<cfparam name="attributes.closeActionJS" default=""><!--- @@type: JS @@help: The action to take when the close button is clicked. The default action is 'close' which will actually remove the window from the DOM and destroy it. The other valid option is 'hide' which will simply hide the window by setting visibility to hidden and applying negative offsets, keeping the window available to be redisplayed via the show method. --->
<cfparam name="attributes.cls" default=""><!--- @@type: String @@help: An optional extra CSS class that will be added to this component's Element (defaults to ''). This can be useful for adding customized styles to the component or any of its children using standard CSS rules. --->
<cfparam name="attributes.clsJS" default=""><!--- @@type: JS @@help: An optional extra CSS class that will be added to this component's Element (defaults to ''). This can be useful for adding customized styles to the component or any of its children using standard CSS rules. --->
<cfparam name="attributes.collapseFirst" default=""><!--- @@type: Boolean @@help: True to make sure the collapse/expand toggle button always renders first (to the left of) any other tools in the panel's title bar, false to render it last (defaults to true). --->
<cfparam name="attributes.collapsed" default=""><!--- @@type: Boolean @@help: True to render the window collapsed, false to render it expanded (defaults to false). Note that if expandOnShow is true (the default) it will override the collapsed config and the window will always be expanded when shown. --->
<cfparam name="attributes.collapsedCls" default=""><!--- @@type: String @@help: A CSS class to add to the panel's element after it has been collapsed (defaults to 'x-panel-collapsed'). --->
<cfparam name="attributes.collapsedClsJS" default=""><!--- @@type: JS @@help: A CSS class to add to the panel's element after it has been collapsed (defaults to 'x-panel-collapsed'). --->
<cfparam name="attributes.collapsible" default=""><!--- @@type: Boolean @@help: True to make the panel collapsible and have the expand/collapse toggle button automatically rendered into the header tool button area, false to keep the panel statically sized with no button (defaults to false). --->
<cfparam name="attributes.constrain" default=""><!--- @@type: Boolean @@help: True to constrain the window to the viewport, false to allow it to fall outside of the viewport (defaults to false). Optionally the header only can be constrained using constrainHeader. --->
<cfparam name="attributes.constrainHeader" default=""><!--- @@type: Boolean @@help: True to constrain the window header to the viewport, allowing the window body to fall outside of the viewport, false to allow the header to fall outside the viewport (defaults to false). Optionally the entire window can be constrained using constrain. --->
<cfparam name="attributes.contentEl" default=""><!--- @@type: String @@help: The id of an existing HTML node to use as the panel's body content (defaults to ''). The specified Element is appended to the Panel's body Element by the Panel's afterRender method after any configured HTML has been inserted, and so the document will not contain this HTML at the time the render event is fired. --->
<cfparam name="attributes.contentElJS" default=""><!--- @@type: JS @@help: The id of an existing HTML node to use as the panel's body content (defaults to ''). The specified Element is appended to the Panel's body Element by the Panel's afterRender method after any configured HTML has been inserted, and so the document will not contain this HTML at the time the render event is fired. --->
<cfparam name="attributes.ctCls" default=""><!--- @@type: String @@help: An optional extra CSS class that will be added to this component's container (defaults to ''). This can be useful for adding customized styles to the container or any of its children using standard CSS rules. --->
<cfparam name="attributes.ctClsJS" default=""><!--- @@type: JS @@help: An optional extra CSS class that will be added to this component's container (defaults to ''). This can be useful for adding customized styles to the container or any of its children using standard CSS rules. --->
<cfparam name="attributes.defaultButton" default=""><!--- @@type: String @@help: The id / index of a button or a button instance to focus when this window received the focus. --->
<cfparam name="attributes.defaultButtonJS" default=""><!--- @@type: String/Number/Button @@help: The id / index of a button or a button instance to focus when this window received the focus. --->
<cfparam name="attributes.defaultType" default=""><!--- @@type: String @@help: The default xtype of child Components to create in this Container when a child item is specified as a raw configuration object, rather than as an instantiated Component. Defaults to 'panel'. --->
<cfparam name="attributes.defaultTypeJS" default=""><!--- @@type: JS @@help: The default xtype of child Components to create in this Container when a child item is specified as a raw configuration object, rather than as an instantiated Component. Defaults to 'panel'. --->
<cfparam name="attributes.defaults" default=""><!--- @@type: Object @@help: A config object that will be applied to all components added to this container either via the items config or via the add or insert methods. The defaults config can contain any number of name/value property pairs to be added to each item, and should be valid for the types of items being added to the container. For example, to automatically apply padding to the body of each of a set of contained Ext.Panel items, you could pass: defaults: {bodyStyle:'padding:15px'}. --->
<cfparam name="attributes.disabled" default=""><!--- @@type: Boolean @@help: Render this component disabled (default is false). --->
<cfparam name="attributes.disabledClass" default=""><!--- @@type: String @@help: CSS class added to the component when it is disabled (defaults to "x-item-disabled"). --->
<cfparam name="attributes.disabledClassJS" default=""><!--- @@type: JS @@help: CSS class added to the component when it is disabled (defaults to "x-item-disabled"). --->
<cfparam name="attributes.draggable" default=""><!--- @@type: Boolean @@help: True to allow the window to be dragged by the header bar, false to disable dragging (defaults to true). Note that by default the window will be centered in the viewport, so if dragging is disabled the window may need to be positioned programmatically after render (e.g., myWindow.setPosition(100, 100);). --->
<cfparam name="attributes.elements" default=""><!--- @@type: String @@help: A comma-delimited list of panel elements to initialize when the window is rendered. Normally, this list will be generated automatically based on the items added to the window at config time, but sometimes it might be useful to make sure a structural element is rendered even if not specified at config time (for example, you may want to add a button or toolbar dynamically after the window has been rendered). Adding those elements to this list will allocate the required placeholders in the window when it is rendered. Valid values are header (required) tbar (top bar) body (required) bbar (bottom bar) footer  Defaults to 'header,body'. --->
<cfparam name="attributes.elementsJS" default=""><!--- @@type: JS @@help: A comma-delimited list of panel elements to initialize when the window is rendered. Normally, this list will be generated automatically based on the items added to the window at config time, but sometimes it might be useful to make sure a structural element is rendered even if not specified at config time (for example, you may want to add a button or toolbar dynamically after the window has been rendered). Adding those elements to this list will allocate the required placeholders in the window when it is rendered. Valid values are header (required) tbar (top bar) body (required) bbar (bottom bar) footer  Defaults to 'header,body'. --->
<cfparam name="attributes.expandOnShow" default=""><!--- @@type: Boolean @@help: True to always expand the window when it is displayed, false to keep it in its current state (which may be collapsed) when displayed (defaults to true). --->
<cfparam name="attributes.fieldLabel" default=""><!--- @@type: String @@help: The label text to display next to this Component (defaults to '') This config is only used when this Component is rendered by a Container which has been configured to use the FormLayout layout manager. Example use:new Ext.FormPanel({    height: 100,    renderTo: Ext.getBody(),    items: [{        xtype: 'textfield',        fieldLabel: 'Name'    }]}); --->
<cfparam name="attributes.fieldLabelJS" default=""><!--- @@type: JS @@help: The label text to display next to this Component (defaults to '') This config is only used when this Component is rendered by a Container which has been configured to use the FormLayout layout manager. Example use:new Ext.FormPanel({    height: 100,    renderTo: Ext.getBody(),    items: [{        xtype: 'textfield',        fieldLabel: 'Name'    }]}); --->
<cfparam name="attributes.footer" default=""><!--- @@type: Boolean @@help: True to create the footer element explicitly, false to skip creating it. By default, when footer is not specified, if one or more buttons have been added to the panel the footer will be created automatically, otherwise it will not. --->
<cfparam name="attributes.header" default=""><!--- @@type: Boolean @@help: True to create the header element explicitly, false to skip creating it. By default, when header is not specified, if a title is set the header will be created automatically, otherwise it will not. If a title is set but header is explicitly set to false, the header will not be rendered. --->
<cfparam name="attributes.headerAsText" default=""><!--- @@type: Boolean @@help: True to display the panel title in the header, false to hide it (defaults to true). --->
<cfparam name="attributes.height" default=""><!--- @@type: Number @@help: The height of this component in pixels (defaults to auto). --->
<cfparam name="attributes.hidden" default=""><!--- @@type: Boolean @@help: Render this component hidden (default is false). --->
<cfparam name="attributes.hideBorders" default=""><!--- @@type: Boolean @@help: True to hide the borders of each contained component, false to defer to the component's existing border settings (defaults to false). --->
<cfparam name="attributes.hideCollapseTool" default=""><!--- @@type: Boolean @@help: True to hide the expand/collapse toggle button when collapsible = true, false to display it (defaults to false). --->
<cfparam name="attributes.hideLabel" default=""><!--- @@type: Boolean @@help: True to completely hide the label element (defaults to false). By default, even if you do not specify a fieldLabel the space will still be reserved so that the field will line up with other fields that do have labels. Setting this to true will cause the field to not reserve that space. This config is only used when this Component is rendered by a Container which has been configured to use the FormLayout layout manager. Example use:new Ext.FormPanel({    height: 100,    renderTo: Ext.getBody(),    items: [{        xtype: 'textfield'        hideLabel: true    }]}); --->
<cfparam name="attributes.hideMode" default=""><!--- @@type: String @@help: How this component should be hidden. Supported values are "visibility" (css visibility), "offsets" (negative offset position) and "display" (css display) - defaults to "display". For Containers which may be hidden and shown as part of a card layout Container such as a TabPanel, it is recommended that hideMode is configured as "offsets". This ensures that hidden Components still have height and width so that layout managers can perform measurements when calculating layouts. --->
<cfparam name="attributes.hideModeJS" default=""><!--- @@type: JS @@help: How this component should be hidden. Supported values are "visibility" (css visibility), "offsets" (negative offset position) and "display" (css display) - defaults to "display". For Containers which may be hidden and shown as part of a card layout Container such as a TabPanel, it is recommended that hideMode is configured as "offsets". This ensures that hidden Components still have height and width so that layout managers can perform measurements when calculating layouts. --->
<cfparam name="attributes.hideParent" default=""><!--- @@type: Boolean @@help: True to hide and show the component's container when hide/show is called on the component, false to hide and show the component itself (defaults to false). For example, this can be used as a shortcut for a hide button on a window by setting hide:true on the button when adding it to its parent container. --->
<cfparam name="attributes.html" default=""><!--- @@type: String @@help: An HTML fragment, or a DomHelper specification to use as the panel's body content (defaults to ''). The HTML content is added by the Panel's afterRender method, and so the document will not contain this HTML at the time the render event is fired. This content is inserted into the body before any configured contentEl is appended. --->
<cfparam name="attributes.htmlJS" default=""><!--- @@type: String/Object @@help: An HTML fragment, or a DomHelper specification to use as the panel's body content (defaults to ''). The HTML content is added by the Panel's afterRender method, and so the document will not contain this HTML at the time the render event is fired. This content is inserted into the body before any configured contentEl is appended. --->
<cfparam name="attributes.iconCls" default=""><!--- @@type: String @@help: A CSS class that will provide a background image to be used as the header icon (defaults to ''). An example custom icon class would be something like: .my-icon { background: url(../images/my-icon.gif) 0 6px no-repeat !important;} --->
<cfparam name="attributes.iconClsJS" default=""><!--- @@type: JS @@help: A CSS class that will provide a background image to be used as the header icon (defaults to ''). An example custom icon class would be something like: .my-icon { background: url(../images/my-icon.gif) 0 6px no-repeat !important;} --->
<cfparam name="attributes.id" default=""><!--- @@type: String @@help: The unique id of this component (defaults to an auto-assigned id). You should assign an id if you need to be able to access the component later and you do not have an object reference available (e.g., using Ext.ComponentMgr.getCmp). Note that this id will also be used as the element id for the containing HTML element that is rendered to the page for this component. This allows you to write id-based CSS rules to style the specific instance of this component uniquely, and also to select sub-elements using this component's id as the parent. --->
<cfparam name="attributes.idJS" default=""><!--- @@type: JS @@help: The unique id of this component (defaults to an auto-assigned id). You should assign an id if you need to be able to access the component later and you do not have an object reference available (e.g., using Ext.ComponentMgr.getCmp). Note that this id will also be used as the element id for the containing HTML element that is rendered to the page for this component. This allows you to write id-based CSS rules to style the specific instance of this component uniquely, and also to select sub-elements using this component's id as the parent. --->
<cfparam name="attributes.itemCls" default=""><!--- @@type: String @@help: An additional CSS class to apply to the wrapper's form item element of this field (defaults to the container's itemCls value if set, or ''). Since it is applied to the item wrapper, it allows you to write standard CSS rules that can apply to the field, the label (if specified) or any other element within the markup for the field. This config is only used when this Component is rendered by a Container which has been configured to use the FormLayout layout manager. Example use:// Apply a style to the field's label:    .required .x-form-item-label {font-weight:bold;color:red;}new Ext.FormPanel({    height: 100,    renderTo: Ext.getBody(),    items: [{        xtype: 'textfield',        fieldLabel: 'Name',        itemCls: 'required' //this label will be styled    },{        xtype: 'textfield',        fieldLabel: 'Favorite Color'    }]}); --->
<cfparam name="attributes.itemClsJS" default=""><!--- @@type: JS @@help: An additional CSS class to apply to the wrapper's form item element of this field (defaults to the container's itemCls value if set, or ''). Since it is applied to the item wrapper, it allows you to write standard CSS rules that can apply to the field, the label (if specified) or any other element within the markup for the field. This config is only used when this Component is rendered by a Container which has been configured to use the FormLayout layout manager. Example use:// Apply a style to the field's label:    .required .x-form-item-label {font-weight:bold;color:red;}new Ext.FormPanel({    height: 100,    renderTo: Ext.getBody(),    items: [{        xtype: 'textfield',        fieldLabel: 'Name',        itemCls: 'required' //this label will be styled    },{        xtype: 'textfield',        fieldLabel: 'Favorite Color'    }]}); --->
<cfparam name="attributes.items" default=""><!--- @@type: String @@help: A single item, or an array of child Components to be added to this container. Each item can be any type of object based on Ext.Component. Component config objects may also be specified in order to avoid the overhead of constructing a real Component object if lazy rendering might mean that the added Component will not be rendered immediately. To take advantage of this "lazy instantiation", set the Ext.Component.xtype config property to the registered type of the Component wanted. For a list of all available xtypes, see Ext.Component. If a single item is being passed, it should be passed directly as an object reference (e.g., items: {...}). Multiple items should be passed as an array of objects (e.g., items: [{...}, {...}]). --->
<cfparam name="attributes.itemsJS" default=""><!--- @@type: Mixed @@help: A single item, or an array of child Components to be added to this container. Each item can be any type of object based on Ext.Component. Component config objects may also be specified in order to avoid the overhead of constructing a real Component object if lazy rendering might mean that the added Component will not be rendered immediately. To take advantage of this "lazy instantiation", set the Ext.Component.xtype config property to the registered type of the Component wanted. For a list of all available xtypes, see Ext.Component. If a single item is being passed, it should be passed directly as an object reference (e.g., items: {...}). Multiple items should be passed as an array of objects (e.g., items: [{...}, {...}]). --->
<cfparam name="attributes.keys" default=""><!--- @@type: Object/Array @@help: A KeyMap config object (in the format expected by Ext.KeyMap.addBinding used to assign custom key handling to this panel (defaults to null). --->
<cfparam name="attributes.labelSeparator" default=""><!--- @@type: String @@help: The standard separator to display after the text of each form label (defaults to the value of Ext.layout.FormLayout.labelSeparator, which is a colon ':' by default). To display no separator for this field's label specify empty string ''. This config is only used when this Component is rendered by a Container which has been configured to use the FormLayout layout manager. Example use:new Ext.FormPanel({    height: 100,    renderTo: Ext.getBody(),    items: [{        xtype: 'textfield',        fieldLabel: 'Name',        labelSeparator: '...'    }]}); --->
<cfparam name="attributes.labelSeparatorJS" default=""><!--- @@type: JS @@help: The standard separator to display after the text of each form label (defaults to the value of Ext.layout.FormLayout.labelSeparator, which is a colon ':' by default). To display no separator for this field's label specify empty string ''. This config is only used when this Component is rendered by a Container which has been configured to use the FormLayout layout manager. Example use:new Ext.FormPanel({    height: 100,    renderTo: Ext.getBody(),    items: [{        xtype: 'textfield',        fieldLabel: 'Name',        labelSeparator: '...'    }]}); --->
<cfparam name="attributes.labelStyle" default=""><!--- @@type: String @@help: A CSS style specification to apply directly to this field's label (defaults to the container's labelStyle value if set, or '').. This config is only used when this Component is rendered by a Container which has been configured to use the FormLayout layout manager. Example use:new Ext.FormPanel({    height: 100,    renderTo: Ext.getBody(),    items: [{        xtype: 'textfield',        fieldLabel: 'Name',        labelStyle: 'font-weight:bold;'    }]}); --->
<cfparam name="attributes.labelStyleJS" default=""><!--- @@type: JS @@help: A CSS style specification to apply directly to this field's label (defaults to the container's labelStyle value if set, or '').. This config is only used when this Component is rendered by a Container which has been configured to use the FormLayout layout manager. Example use:new Ext.FormPanel({    height: 100,    renderTo: Ext.getBody(),    items: [{        xtype: 'textfield',        fieldLabel: 'Name',        labelStyle: 'font-weight:bold;'    }]}); --->
<cfparam name="attributes.layout" default=""><!--- @@type: String @@help: The layout type to be used in this container. If not specified, a default Ext.layout.ContainerLayout will be created and used. Specific config values for the chosen layout type can be specified using layoutConfig. Valid values are: absolute accordion anchor border card column fit form table --->
<cfparam name="attributes.layoutJS" default=""><!--- @@type: JS @@help: The layout type to be used in this container. If not specified, a default Ext.layout.ContainerLayout will be created and used. Specific config values for the chosen layout type can be specified using layoutConfig. Valid values are: absolute accordion anchor border card column fit form table --->
<cfparam name="attributes.layoutConfig" default=""><!--- @@type: Object @@help: This is a config object containing properties specific to the chosen layout (to be used in conjunction with the layout config value). For complete details regarding the valid config options for each layout type, see the layout class corresponding to the type specified: Ext.layout.Absolute Ext.layout.Accordion Ext.layout.AnchorLayout Ext.layout.BorderLayout Ext.layout.CardLayout Ext.layout.ColumnLayout Ext.layout.FitLayout Ext.layout.FormLayout Ext.layout.TableLayout --->
<cfparam name="attributes.listeners" default=""><!--- @@type: Object @@help: (optional) A config object containing one or more event handlers to be added to this object during initialization. This should be a valid listeners config object as specified in the addListener example for attaching multiple handlers at once. --->
<cfparam name="attributes.manager" default=""><!--- @@type: Ext.WindowGroup @@help: A reference to the WindowGroup that should manage this window (defaults to Ext.WindowMgr). --->
<cfparam name="attributes.maskDisabled" default=""><!--- @@type: Boolean @@help: True to mask the panel when it is disabled, false to not mask it (defaults to true). Either way, the panel will always tell its contained elements to disable themselves when it is disabled, but masking the panel can provide an additional visual cue that the panel is disabled. --->
<cfparam name="attributes.maximizable" default=""><!--- @@type: Boolean @@help: True to display the 'maximize' tool button and allow the user to maximize the window, false to hide the button and disallow maximizing the window (defaults to false). Note that when a window is maximized, the tool button will automatically change to a 'restore' button with the appropriate behavior already built-in that will restore the window to its previous size. --->
<cfparam name="attributes.maximized" default=""><!--- @@type: Boolean @@help: True to initially display the window in a maximized state. (Defaults to false). --->
<cfparam name="attributes.minButtonWidth" default=""><!--- @@type: Number @@help: Minimum width in pixels of all buttons in this panel (defaults to 75) --->
<cfparam name="attributes.minHeight" default=""><!--- @@type: Number @@help: The minimum height in pixels allowed for this window (defaults to 100). Only applies when resizable = true. --->
<cfparam name="attributes.minWidth" default=""><!--- @@type: Number @@help: The minimum width in pixels allowed for this window (defaults to 200). Only applies when resizable = true. --->
<cfparam name="attributes.minimizable" default=""><!--- @@type: Boolean @@help: True to display the 'minimize' tool button and allow the user to minimize the window, false to hide the button and disallow minimizing the window (defaults to false). Note that this button provides no implementation -- the behavior of minimizing a window is implementation-specific, so the minimize event must be handled and a custom minimize behavior implemented for this option to be useful. --->
<cfparam name="attributes.modal" default=""><!--- @@type: Boolean @@help: True to make the window modal and mask everything behind it when displayed, false to display it without restricting access to other UI elements (defaults to false). --->
<cfparam name="attributes.onEsc" default=""><!--- @@type: Function @@help: Allows override of the built-in processing for the escape key. Default action is to close the Window (performing whatever action is specified in closeAction. To prevent the Window closing when the escape key is pressed, specify this as Ext.emptyFn (See Ext.emptyFn). --->
<cfparam name="attributes.overCls" default=""><!--- @@type: String @@help: An optional extra CSS class that will be added to this component's Element when the mouse moves over the Element, and removed when the mouse moves out. (defaults to ''). This can be useful for adding customized "active" or "hover" styles to the component or any of its children using standard CSS rules. --->
<cfparam name="attributes.overClsJS" default=""><!--- @@type: JS @@help: An optional extra CSS class that will be added to this component's Element when the mouse moves over the Element, and removed when the mouse moves out. (defaults to ''). This can be useful for adding customized "active" or "hover" styles to the component or any of its children using standard CSS rules. --->
<cfparam name="attributes.pageX" default=""><!--- @@type: Number @@help: The page level x coordinate for this component if contained within a positioning container. --->
<cfparam name="attributes.pageY" default=""><!--- @@type: Number @@help: The page level y coordinate for this component if contained within a positioning container. --->
<cfparam name="attributes.plain" default=""><!--- @@type: Boolean @@help: True to render the window body with a transparent background so that it will blend into the framing elements, false to add a lighter background color to visually highlight the body element and separate it more distinctly from the surrounding frame (defaults to false). --->
<cfparam name="attributes.plugins" default=""><!--- @@type: Object/Array @@help: An object or array of objects that will provide custom functionality for this component. The only requirement for a valid plugin is that it contain an init method that accepts a reference of type Ext.Component. When a component is created, if any plugins are available, the component will call the init method on each plugin, passing a reference to itself. Each plugin can then call methods or respond to events on the component as needed to provide its functionality. --->
<cfparam name="attributes.renderTo" default=""><!--- @@type: String @@help: The id of the node, a DOM node or an existing Element that will be the container to render this component into. Using this config, a call to render() is not required. --->
<cfparam name="attributes.renderToJS" default=""><!--- @@type: Mixed @@help: The id of the node, a DOM node or an existing Element that will be the container to render this component into. Using this config, a call to render() is not required. --->
<cfparam name="attributes.resizable" default=""><!--- @@type: Boolean @@help: True to allow user resizing at each edge and corner of the window, false to disable resizing (defaults to true). --->
<cfparam name="attributes.resizeHandles" default=""><!--- @@type: String @@help: A valid Ext.Resizable handles config string (defaults to 'all'). Only applies when resizable = true. --->
<cfparam name="attributes.resizeHandlesJS" default=""><!--- @@type: JS @@help: A valid Ext.Resizable handles config string (defaults to 'all'). Only applies when resizable = true. --->
<cfparam name="attributes.shadow" default=""><!--- @@type: String @@help: True (or a valid Ext.Shadow Ext.Shadow.mode value) to display a shadow behind the panel, false to display no shadow (defaults to 'sides'). Note that this option only applies when floating = true. --->
<cfparam name="attributes.shadowJS" default=""><!--- @@type: Boolean/String @@help: True (or a valid Ext.Shadow Ext.Shadow.mode value) to display a shadow behind the panel, false to display no shadow (defaults to 'sides'). Note that this option only applies when floating = true. --->
<cfparam name="attributes.shadowOffset" default=""><!--- @@type: Number @@help: The number of pixels to offset the shadow if displayed (defaults to 4). Note that this option only applies when floating = true. --->
<cfparam name="attributes.shim" default=""><!--- @@type: Boolean @@help: False to disable the iframe shim in browsers which need one (defaults to true). Note that this option only applies when floating = true. --->
<cfparam name="attributes.stateEvents" default=""><!--- @@type: Array @@help: An array of events that, when fired, should trigger this component to save its state (defaults to none). These can be any types of events supported by this component, including browser or custom events (e.g., ['click', 'customerchange']). See stateful for an explanation of saving and restoring Component state. --->
<cfparam name="attributes.stateId" default=""><!--- @@type: String @@help: The unique id for this component to use for state management purposes (defaults to the component id if one was set, otherwise null if the component is using a generated id). See stateful for an explanation of saving and restoring Component state. --->
<cfparam name="attributes.stateIdJS" default=""><!--- @@type: JS @@help: The unique id for this component to use for state management purposes (defaults to the component id if one was set, otherwise null if the component is using a generated id). See stateful for an explanation of saving and restoring Component state. --->
<cfparam name="attributes.stateful" default=""><!--- @@type: Boolean @@help: A flag which causes the Component to attempt to restore the state of internal properties from a saved state on startup. The component must have either a stateId or id assigned for state to be managed. Auto-generated ids are not guaranteed to be stable across page loads and cannot be relied upon to save and restore the same state for a component. For state saving to work, the state manager's provider must have been set to an implementation of Ext.state.Provider which overrides the set and get methods to save and recall name/value pairs. A built-in implementation, Ext.state.CookieProvider is available. To set the state provider for the current page: Ext.state.Manager.setProvider(new Ext.state.CookieProvider()); Components attempt to save state when one of the events listed in the stateEvents configuration fires. You can perform extra processing on state save and restore by attaching handlers to the beforestaterestore, staterestore, beforestatesave and statesave events --->
<cfparam name="attributes.style" default=""><!--- @@type: String @@help: A custom style specification to be applied to this component's Element. Should be a valid argument to Ext.Element.applyStyles. --->
<cfparam name="attributes.styleJS" default=""><!--- @@type: JS @@help: A custom style specification to be applied to this component's Element. Should be a valid argument to Ext.Element.applyStyles. --->
<cfparam name="attributes.tabTip" default=""><!--- @@type: String @@help: Adds a tooltip when mousing over the tab of a Ext.Panel which is an item of a Ext.TabPanel. Ext.QuickTips.init() must be called in order for the tips to render. --->
<cfparam name="attributes.tabTipJS" default=""><!--- @@type: JS @@help: Adds a tooltip when mousing over the tab of a Ext.Panel which is an item of a Ext.TabPanel. Ext.QuickTips.init() must be called in order for the tips to render. --->
<cfparam name="attributes.tbar" default=""><!--- @@type: Object/Array @@help: The top toolbar of the panel. This can be either an Ext.Toolbar object or an array of buttons/button configs to be added to the toolbar. Note that this is not available as a property after render. To access the top toolbar after render, use getTopToolbar. --->
<cfparam name="attributes.title" default=""><!--- @@type: String @@help: The title text to display in the panel header (defaults to ''). When a title is specified the header element will automatically be created and displayed unless header is explicitly set to false. If you don't want to specify a title at config time, but you may want one later, you must either specify a non-empty title (a blank space ' ' will do) or header:true so that the container element will get created. --->
<cfparam name="attributes.titleJS" default=""><!--- @@type: JS @@help: The title text to display in the panel header (defaults to ''). When a title is specified the header element will automatically be created and displayed unless header is explicitly set to false. If you don't want to specify a title at config time, but you may want one later, you must either specify a non-empty title (a blank space ' ' will do) or header:true so that the container element will get created. --->
<cfparam name="attributes.titleCollapse" default=""><!--- @@type: Boolean @@help: True to allow expanding and collapsing the panel (when collapsible = true) by clicking anywhere in the header bar, false to allow it only by clicking to tool button (defaults to false). --->
<cfparam name="attributes.tools" default=""><!--- @@type: Array @@help: An array of tool button configs to be added to the header tool area. When rendered, each tool is stored as an Element referenced by a public property called tools. Each tool config may contain the following properties:  id : StringRequired. The type of tool to create. Values may be toggle (Created by default when collapsible is true) close minimize maximize restore gear pin unpin right left up down refresh minus plus help search save print  handler : FunctionRequired. The function to call when clicked. Arguments passed are: event : Ext.EventObjectThe click event. toolEl : Ext.ElementThe tool Element. Panel : Ext.PanelThe host Panel  scope : ObjectThe scope in which to call the handler. qtip : String/ObjectA tip string, or a config argument to Ext.QuickTip.register hidden : BooleanTrue to initially render hidden. on : ObjectA listener config object specifiying event listeners in the format of an argument to addListener  Example usage: tools:[{    id:'refresh',    qtip: 'Refresh form Data',    // hidden:true,    handler: function(event, toolEl, panel){        // refresh logic    }}] Note that apart from the toggle tool which is provided when a panel is collapsible, these tools only provide the visual button. Any required functionality must be provided by adding handlers that implement the necessary behavior. --->
<cfparam name="attributes.width" default=""><!--- @@type: Number @@help: The width of this component in pixels (defaults to auto). --->
<cfparam name="attributes.x" default=""><!--- @@type: Number @@help: The X position of the left edge of the Window on initial showing. Defaults to centering the Window within the width of the Window's container {@link Ext.Element Element) (The Element that the Window is rendered to). --->
<cfparam name="attributes.xtype" default=""><!--- @@type: String @@help: The registered xtype to create. This config option is not used when passing a config object into a constructor. This config option is used only when lazy instantiation is being used, and a child item of a Container is being specified not as a fully instantiated Component, but as a Component config object. The xtype will be looked up at render time up to determine what type of child Component to create. The predefined xtypes are listed here.  If you subclass Components to create your own Components, you may register them using Ext.ComponentMgr.registerType in order to be able to take advantage of lazy instantiation and rendering. --->
<cfparam name="attributes.xtypeJS" default=""><!--- @@type: JS @@help: The registered xtype to create. This config option is not used when passing a config object into a constructor. This config option is used only when lazy instantiation is being used, and a child item of a Container is being specified not as a fully instantiated Component, but as a Component config object. The xtype will be looked up at render time up to determine what type of child Component to create. The predefined xtypes are listed here.  If you subclass Components to create your own Components, you may register them using Ext.ComponentMgr.registerType in order to be able to take advantage of lazy instantiation and rendering. --->
<cfparam name="attributes.y" default=""><!--- @@type: Number @@help: The Y position of the top edge of the Window on initial showing. Defaults to centering the Window within the height of the Window's container {@link Ext.Element Element) (The Element that the Window is rendered to). --->

<!--- custom attributes --->
<cfparam name="attributes.passThrough" default=""><!--- @@type: JS @@help: (ColdExt attribute) A comma separated list of JavaScript name:value pairs that will be written directly to the Ext component config. This is useful for storing custom properties in Ext components. --->
<cfparam name="attributes.var" default=""><!--- @@type: JS Variable Name @@help: (ColdExt attribute) The JavaScript variable name that this component will be assigned to. NOTE: You should only use the var attribute when this tags parent is the onReady tag. --->
<cfparam name="attributes.disabled" default=""><!--- TODO: missing from docs? --->
<cfparam name="attributes.show" default="false"><!--- @@type: Boolean @@help: (ColdExt attribute) True to show the window immediately upon creation (defaults to false) --->



<!--- arrays that may be populated by nested tags --->
<cfset thisTag.bbar = ArrayNew(1)>
<cfset thisTag.buttons = ArrayNew(1)>
<cfset thisTag.items = ArrayNew(1)>
<cfset thisTag.listeners = ArrayNew(1)>
<cfset thisTag.tbar = ArrayNew(1)>
<cfset thisTag.tools = ArrayNew(1)>

<!--- process custom attributes --->
<!--- var --->
<cfset attributes.var = validateVarAttribute(parentTag)>




<cfelseif thisTag.executionMode eq "end">

<cfset _html = JSStringFormat(trim(thisTag.GeneratedContent))>
<cfset thisTag.GeneratedContent = "">


<cfsavecontent variable="attributes._out">
<cfprocessingdirective suppresswhitespace="true">
<cfoutput>
	<cfif AttributeNotEmpty("var")>var #attributes.var# = </cfif>new Ext.Window({
		<cfif AttributeNotEmpty("activeItem")>activeItem: "#JSStringFormat(attributes.activeItem)#",</cfif>
		<cfif AttributeNotEmpty("activeItemJS")>activeItem: #attributes.activeItemJS#,</cfif>
		<cfif AttributeNotEmpty("allowDomMove")>allowDomMove: #attributes.allowDomMove#,</cfif>
		<cfif AttributeNotEmpty("animCollapse")>animCollapse: #attributes.animCollapse#,</cfif>
		<cfif AttributeNotEmpty("animateTarget")>animateTarget: "#JSStringFormat(attributes.animateTarget)#",</cfif>
		<cfif AttributeNotEmpty("animateTargetJS")>animateTarget: #attributes.animateTargetJS#,</cfif>
		<cfif AttributeNotEmpty("applyTo")>applyTo: "#JSStringFormat(attributes.applyTo)#",</cfif>
		<cfif AttributeNotEmpty("applyToJS")>applyTo: #attributes.applyToJS#,</cfif>
		<cfif AttributeNotEmpty("autoDestroy")>autoDestroy: #attributes.autoDestroy#,</cfif>
		<cfif AttributeNotEmpty("autoEl")>autoEl: "#JSStringFormat(attributes.autoEl)#",</cfif>
		<cfif AttributeNotEmpty("autoElJS")>autoEl: #attributes.autoElJS#,</cfif>
		<cfif AttributeNotEmpty("autoHeight")>autoHeight: #attributes.autoHeight#,</cfif>
		<cfif AttributeNotEmpty("autoScroll")>autoScroll: #attributes.autoScroll#,</cfif>
		<cfif AttributeNotEmpty("autoShow")>autoShow: #attributes.autoShow#,</cfif>
		<cfif AttributeNotEmpty("baseCls")>baseCls: "#JSStringFormat(attributes.baseCls)#",</cfif>
		<cfif AttributeNotEmpty("baseClsJS")>baseCls: #attributes.baseClsJS#,</cfif>
		<cfif AttributeNotEmpty("bbar")>bbar: #attributes.bbar#,</cfif>
		<cfif AttributeNotEmpty("bodyBorder")>bodyBorder: #attributes.bodyBorder#,</cfif>
		<cfif AttributeNotEmpty("bodyCfg")>bodyCfg: #attributes.bodyCfg#,</cfif>
		<cfif AttributeNotEmpty("bodyStyle")>bodyStyle: "#JSStringFormat(attributes.bodyStyle)#",</cfif>
		<cfif AttributeNotEmpty("bodyStyleJS")>bodyStyle: #attributes.bodyStyleJS#,</cfif>
		<cfif AttributeNotEmpty("border")>border: #attributes.border#,</cfif>
		<cfif AttributeNotEmpty("bufferResize")>bufferResize: #attributes.bufferResize#,</cfif>
		<cfif AttributeNotEmpty("buttonAlign")>buttonAlign: "#JSStringFormat(attributes.buttonAlign)#",</cfif>
		<cfif AttributeNotEmpty("buttonAlignJS")>buttonAlign: #attributes.buttonAlignJS#,</cfif>
		<cfif AttributeNotEmpty("buttons")>buttons: #attributes.buttons#,</cfif>
		<cfif AttributeNotEmpty("clearCls")>clearCls: "#JSStringFormat(attributes.clearCls)#",</cfif>
		<cfif AttributeNotEmpty("clearClsJS")>clearCls: #attributes.clearClsJS#,</cfif>
		<cfif AttributeNotEmpty("closable")>closable: #attributes.closable#,</cfif>
		<cfif AttributeNotEmpty("closeAction")>closeAction: "#JSStringFormat(attributes.closeAction)#",</cfif>
		<cfif AttributeNotEmpty("closeActionJS")>closeAction: #attributes.closeActionJS#,</cfif>
		<cfif AttributeNotEmpty("cls")>cls: "#JSStringFormat(attributes.cls)#",</cfif>
		<cfif AttributeNotEmpty("clsJS")>cls: #attributes.clsJS#,</cfif>
		<cfif AttributeNotEmpty("collapseFirst")>collapseFirst: #attributes.collapseFirst#,</cfif>
		<cfif AttributeNotEmpty("collapsed")>collapsed: #attributes.collapsed#,</cfif>
		<cfif AttributeNotEmpty("collapsedCls")>collapsedCls: "#JSStringFormat(attributes.collapsedCls)#",</cfif>
		<cfif AttributeNotEmpty("collapsedClsJS")>collapsedCls: #attributes.collapsedClsJS#,</cfif>
		<cfif AttributeNotEmpty("collapsible")>collapsible: #attributes.collapsible#,</cfif>
		<cfif AttributeNotEmpty("constrain")>constrain: #attributes.constrain#,</cfif>
		<cfif AttributeNotEmpty("constrainHeader")>constrainHeader: #attributes.constrainHeader#,</cfif>
		<cfif AttributeNotEmpty("contentEl")>contentEl: "#JSStringFormat(attributes.contentEl)#",</cfif>
		<cfif AttributeNotEmpty("contentElJS")>contentEl: #attributes.contentElJS#,</cfif>
		<cfif AttributeNotEmpty("ctCls")>ctCls: "#JSStringFormat(attributes.ctCls)#",</cfif>
		<cfif AttributeNotEmpty("ctClsJS")>ctCls: #attributes.ctClsJS#,</cfif>
		<cfif AttributeNotEmpty("defaultButton")>defaultButton: "#JSStringFormat(attributes.defaultButton)#",</cfif>
		<cfif AttributeNotEmpty("defaultButtonJS")>defaultButton: #attributes.defaultButtonJS#,</cfif>
		<cfif AttributeNotEmpty("defaultType")>defaultType: "#JSStringFormat(attributes.defaultType)#",</cfif>
		<cfif AttributeNotEmpty("defaultTypeJS")>defaultType: #attributes.defaultTypeJS#,</cfif>
		<cfif AttributeNotEmpty("defaults")>defaults: #attributes.defaults#,</cfif>
		<cfif AttributeNotEmpty("disabled")>disabled: #attributes.disabled#,</cfif>
		<cfif AttributeNotEmpty("disabledClass")>disabledClass: "#JSStringFormat(attributes.disabledClass)#",</cfif>
		<cfif AttributeNotEmpty("disabledClassJS")>disabledClass: #attributes.disabledClassJS#,</cfif>
		<cfif AttributeNotEmpty("draggable")>draggable: #attributes.draggable#,</cfif>
		<cfif AttributeNotEmpty("elements")>elements: "#JSStringFormat(attributes.elements)#",</cfif>
		<cfif AttributeNotEmpty("elementsJS")>elements: #attributes.elementsJS#,</cfif>
		<cfif AttributeNotEmpty("expandOnShow")>expandOnShow: #attributes.expandOnShow#,</cfif>
		<cfif AttributeNotEmpty("fieldLabel")>fieldLabel: "#JSStringFormat(attributes.fieldLabel)#",</cfif>
		<cfif AttributeNotEmpty("fieldLabelJS")>fieldLabel: #attributes.fieldLabelJS#,</cfif>
		<cfif AttributeNotEmpty("footer")>footer: #attributes.footer#,</cfif>
		<cfif AttributeNotEmpty("header")>header: #attributes.header#,</cfif>
		<cfif AttributeNotEmpty("headerAsText")>headerAsText: #attributes.headerAsText#,</cfif>
		<cfif AttributeNotEmpty("height")>height: #attributes.height#,</cfif>
		<cfif AttributeNotEmpty("hidden")>hidden: #attributes.hidden#,</cfif>
		<cfif AttributeNotEmpty("hideBorders")>hideBorders: #attributes.hideBorders#,</cfif>
		<cfif AttributeNotEmpty("hideCollapseTool")>hideCollapseTool: #attributes.hideCollapseTool#,</cfif>
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
		<cfif AttributeNotEmpty("items")>items: "#JSStringFormat(attributes.items)#",</cfif>
		<cfif AttributeNotEmpty("itemsJS")>items: #attributes.itemsJS#,</cfif>
		<cfif AttributeNotEmpty("keys")>keys: #attributes.keys#,</cfif>
		<cfif AttributeNotEmpty("labelSeparator")>labelSeparator: "#JSStringFormat(attributes.labelSeparator)#",</cfif>
		<cfif AttributeNotEmpty("labelSeparatorJS")>labelSeparator: #attributes.labelSeparatorJS#,</cfif>
		<cfif AttributeNotEmpty("labelStyle")>labelStyle: "#JSStringFormat(attributes.labelStyle)#",</cfif>
		<cfif AttributeNotEmpty("labelStyleJS")>labelStyle: #attributes.labelStyleJS#,</cfif>
		<cfif AttributeNotEmpty("layout")>layout: "#JSStringFormat(attributes.layout)#",</cfif>
		<cfif AttributeNotEmpty("layoutJS")>layout: #attributes.layoutJS#,</cfif>
		<cfif AttributeNotEmpty("layoutConfig")>layoutConfig: #attributes.layoutConfig#,</cfif>
		<cfif AttributeNotEmpty("listeners")>listeners: #attributes.listeners#,</cfif>
		<cfif AttributeNotEmpty("manager")>manager: #attributes.manager#,</cfif>
		<cfif AttributeNotEmpty("maskDisabled")>maskDisabled: #attributes.maskDisabled#,</cfif>
		<cfif AttributeNotEmpty("maximizable")>maximizable: #attributes.maximizable#,</cfif>
		<cfif AttributeNotEmpty("maximized")>maximized: #attributes.maximized#,</cfif>
		<cfif AttributeNotEmpty("minButtonWidth")>minButtonWidth: #attributes.minButtonWidth#,</cfif>
		<cfif AttributeNotEmpty("minHeight")>minHeight: #attributes.minHeight#,</cfif>
		<cfif AttributeNotEmpty("minWidth")>minWidth: #attributes.minWidth#,</cfif>
		<cfif AttributeNotEmpty("minimizable")>minimizable: #attributes.minimizable#,</cfif>
		<cfif AttributeNotEmpty("modal")>modal: #attributes.modal#,</cfif>
		<cfif AttributeNotEmpty("onEsc")>onEsc: #attributes.onEsc#,</cfif>
		<cfif AttributeNotEmpty("overCls")>overCls: "#JSStringFormat(attributes.overCls)#",</cfif>
		<cfif AttributeNotEmpty("overClsJS")>overCls: #attributes.overClsJS#,</cfif>
		<cfif AttributeNotEmpty("pageX")>pageX: #attributes.pageX#,</cfif>
		<cfif AttributeNotEmpty("pageY")>pageY: #attributes.pageY#,</cfif>
		<cfif AttributeNotEmpty("plain")>plain: #attributes.plain#,</cfif>
		<cfif AttributeNotEmpty("plugins")>plugins: #attributes.plugins#,</cfif>
		<cfif AttributeNotEmpty("renderTo")>renderTo: "#JSStringFormat(attributes.renderTo)#",</cfif>
		<cfif AttributeNotEmpty("renderToJS")>renderTo: #attributes.renderToJS#,</cfif>
		<cfif AttributeNotEmpty("resizable")>resizable: #attributes.resizable#,</cfif>
		<cfif AttributeNotEmpty("resizeHandles")>resizeHandles: "#JSStringFormat(attributes.resizeHandles)#",</cfif>
		<cfif AttributeNotEmpty("resizeHandlesJS")>resizeHandles: #attributes.resizeHandlesJS#,</cfif>
		<cfif AttributeNotEmpty("shadow")>shadow: "#JSStringFormat(attributes.shadow)#",</cfif>
		<cfif AttributeNotEmpty("shadowJS")>shadow: #attributes.shadowJS#,</cfif>
		<cfif AttributeNotEmpty("shadowOffset")>shadowOffset: #attributes.shadowOffset#,</cfif>
		<cfif AttributeNotEmpty("shim")>shim: #attributes.shim#,</cfif>
		<cfif AttributeNotEmpty("stateEvents")>stateEvents: #attributes.stateEvents#,</cfif>
		<cfif AttributeNotEmpty("stateId")>stateId: "#JSStringFormat(attributes.stateId)#",</cfif>
		<cfif AttributeNotEmpty("stateIdJS")>stateId: #attributes.stateIdJS#,</cfif>
		<cfif AttributeNotEmpty("stateful")>stateful: #attributes.stateful#,</cfif>
		<cfif AttributeNotEmpty("style")>style: "#JSStringFormat(attributes.style)#",</cfif>
		<cfif AttributeNotEmpty("styleJS")>style: #attributes.styleJS#,</cfif>
		<cfif AttributeNotEmpty("tabTip")>tabTip: "#JSStringFormat(attributes.tabTip)#",</cfif>
		<cfif AttributeNotEmpty("tabTipJS")>tabTip: #attributes.tabTipJS#,</cfif>
		<cfif AttributeNotEmpty("tbar")>tbar: #attributes.tbar#,</cfif>
		<cfif AttributeNotEmpty("title")>title: "#JSStringFormat(attributes.title)#",</cfif>
		<cfif AttributeNotEmpty("titleJS")>title: #attributes.titleJS#,</cfif>
		<cfif AttributeNotEmpty("titleCollapse")>titleCollapse: #attributes.titleCollapse#,</cfif>
		<cfif AttributeNotEmpty("tools")>tools: #attributes.tools#,</cfif>
		<cfif AttributeNotEmpty("width")>width: #attributes.width#,</cfif>
		<cfif AttributeNotEmpty("x")>x: #attributes.x#,</cfif>
		<cfif AttributeNotEmpty("xtype")>xtype: "#JSStringFormat(attributes.xtype)#",</cfif>
		<cfif AttributeNotEmpty("xtypeJS")>xtype: #attributes.xtypeJS#,</cfif>
		<cfif AttributeNotEmpty("y")>y: #attributes.y#,</cfif>

		<cfif AttributeNotEmpty("passThrough")>#attributes.passThrough#,</cfif>

		<cfif arrayLen(thisTag.bbar)>bbar: #thisTag.bbar[1]._out#,</cfif>
		<cfif arrayLen(thisTag.buttons)>buttons: [ #ArrayKeyToList(thisTag.buttons, "_out")# ],</cfif>
		<cfif arrayLen(thisTag.items)>items: [ #ArrayKeyToList(thisTag.items, "_out")# ],</cfif>
		<cfif arrayLen(thisTag.listeners)>listeners: { #ArrayKeyToList(thisTag.listeners, "_out")# },</cfif>
		<cfif arrayLen(thisTag.tbar)>tbar: #thisTag.tbar[1]._out#,</cfif>
		<cfif arrayLen(thisTag.tools)>tools: [ #ArrayKeyToList(thisTag.tools, "_out")# ],</cfif>

		<!--- TODO: missing from docs? --->
		<cfif AttributeNotEmpty("disabled")>disabled: #attributes.disabled#,</cfif>

		<!--- autoload remote content --->
		<cfif AttributeNotEmpty("autoLoad")>
			<cfif reFind("^http", attributes.autoLoad)>html: '<iframe width="100%" height="100%" src="#attributes.autoLoad#" frameborder="0"></iframe>',
			<cfelse>autoLoad: "#JSStringFormat(attributes.autoLoad)#",
			</cfif>
		<cfelseif AttributeNotEmpty("autoLoadJS")>autoLoad: #attributes.autoLoadJS#,
		<!--- html content --->
		<cfelseif len(_html)>html: "#_html#",
		<cfelseif AttributeNotEmpty("html")>html: "#JSStringFormat(attributes.html)#",
		<cfelseif AttributeNotEmpty("htmlJS")>html: #attributes.htmlJS#,
		</cfif>

		dummy: true
	})<cfif AttributeNotEmpty("var")>;</cfif>

	<cfif attributes.show AND AttributeNotEmpty("var")>
		#attributes.var#.show();
	</cfif>
</cfoutput>
</cfprocessingdirective>
</cfsavecontent>

<cfassociate basetag="#parentTag#" datacollection="items">


</cfif>


<cfsetting enablecfoutputonly="false">