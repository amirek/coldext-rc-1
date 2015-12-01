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


<!--- attribute state --->
<cfset _autoHeight = TrueFalseFormat(AttributeEmpty("height"))>
<cfset _autoWidth = TrueFalseFormat(AttributeEmpty("width"))>

<!--- defaults --->
<cfparam name="attributes.autoHeight" default="#_autoHeight#">
<cfparam name="attributes.autoWidth" default="#_autoWidth#">

<!--- attributes --->
<cfparam name="attributes.allowDomMove" default=""><!--- @@type: Boolean @@help: Whether the component can move the Dom node when rendering (defaults to true). --->
<cfparam name="attributes.animCollapse" default=""><!--- @@type: Boolean @@help: True to animate the transition when the panel is collapsed, false to skip the animation (defaults to false). --->
<cfparam name="attributes.autoDestroy" default=""><!--- @@type: Boolean @@help: If true the container will automatically destroy any contained component that is removed from it, else destruction must be handled manually (defaults to true). --->
<cfparam name="attributes.autoEl" default=""><!--- @@type: String @@help: A tag name or DomHelper spec to create an element with. This is intended to create shorthand utility components inline via JSON. It should not be used for higher level components which already create their own elements. Example usage: {xtype:'box', autoEl: 'div', cls:'my-class'}{xtype:'box', autoEl: {tag:'blockquote', html:'autoEl is cool!'}} // with DomHelper --->
<cfparam name="attributes.autoElJS" default=""><!--- @@type: String/Object @@help: A tag name or DomHelper spec to create an element with. This is intended to create shorthand utility components inline via JSON. It should not be used for higher level components which already create their own elements. Example usage: {xtype:'box', autoEl: 'div', cls:'my-class'}{xtype:'box', autoEl: {tag:'blockquote', html:'autoEl is cool!'}} // with DomHelper --->
<cfparam name="attributes.autoHeight" default=""><!--- @@type: Boolean @@help: True to use height:'auto', false to use fixed height (defaults to false). Note: Although many components inherit this config option, not all will function as expected with a height of 'auto'. Setting autoHeight:true means that the browser will manage height based on the element's contents, and that Ext will not manage it at all. --->
<cfparam name="attributes.autoLoad" default=""><!--- @@type: String @@help: A valid url spec according to the Updater Ext.Updater.update method. If autoLoad is not null, the panel will attempt to load its contents immediately upon render. The URL will become the default URL for this panel's body element, so it may be refreshed at any time. --->
<cfparam name="attributes.autoLoadJS" default=""><!--- @@type: Object/String/Function @@help: A valid url spec according to the Updater Ext.Updater.update method. If autoLoad is not null, the panel will attempt to load its contents immediately upon render. The URL will become the default URL for this panel's body element, so it may be refreshed at any time. --->
<cfparam name="attributes.autoScroll" default=""><!--- @@type: Boolean @@help: True to use overflow:'auto' on the panel's body element and show scroll bars automatically when necessary, false to clip any overflowing content (defaults to false). --->
<cfparam name="attributes.autoShow" default=""><!--- @@type: Boolean @@help: True if the component should check for hidden classes (e.g. 'x-hidden' or 'x-hide-display') and remove them on render (defaults to false). --->
<cfparam name="attributes.autoWidth" default=""><!--- @@type: Boolean @@help: True to use width:'auto', false to use fixed width (defaults to false). Note: Although many components inherit this config option, not all will function as expected with a width of 'auto'. Setting autoWidth:true means that the browser will manage width based on the element's contents, and that Ext will not manage it at all. --->
<cfparam name="attributes.baseCls" default=""><!--- @@type: String @@help: The base CSS class applied to the fieldset (defaults to 'x-fieldset'). --->
<cfparam name="attributes.baseClsJS" default=""><!--- @@type: JS @@help: The base CSS class applied to the fieldset (defaults to 'x-fieldset'). --->
<cfparam name="attributes.bodyCfg" default=""><!--- @@type: Object @@help: A DomHelper configuration object specifying the element structure of this Panel's body Element. This may be used to force the body Element to use a different form of markup than is created automatically. An example of this might be to create a child Panel containing custom content, such as a header, or forcing centering of all Panel content by having the body be a  element:new Ext.Panel({    title: 'New Message',    collapsible: true,    renderTo: Ext.getBody(),    width: 400,    bodyCfg: {        tag: 'center',        cls: 'x-panel-body'    },    items: [{        border: false,        header: false,        bodyCfg: {tag: 'h2', html: 'Message'}    }, {        xtype: 'textarea',        style: {            width: '95%',            marginBottom: '10px'        }    },        new Ext.Button({            text: 'Send',            minWidth: '100',            style: {                marginBottom: '10px'            }        })    ]}); --->
<cfparam name="attributes.bodyStyle" default=""><!--- @@type: String @@help: Custom CSS styles to be applied to the body element in the format expected by Ext.Element.applyStyles (defaults to null). --->
<cfparam name="attributes.bodyStyleJS" default=""><!--- @@type: String/Object/Function @@help: Custom CSS styles to be applied to the body element in the format expected by Ext.Element.applyStyles (defaults to null). --->
<cfparam name="attributes.checkboxName" default=""><!--- @@type: String @@help: The name to assign to the fieldset's checkbox if checkboxToggle = true (defaults to '[checkbox id]-checkbox'). --->
<cfparam name="attributes.checkboxNameJS" default=""><!--- @@type: JS @@help: The name to assign to the fieldset's checkbox if checkboxToggle = true (defaults to '[checkbox id]-checkbox'). --->
<cfparam name="attributes.checkboxToggle" default=""><!--- @@type: String @@help: True to render a checkbox into the fieldset frame just in front of the legend, or a DomHelper config object to create the checkbox. (defaults to false). The fieldset will be expanded or collapsed when the checkbox is toggled. --->
<cfparam name="attributes.checkboxToggleJS" default=""><!--- @@type: Mixed @@help: True to render a checkbox into the fieldset frame just in front of the legend, or a DomHelper config object to create the checkbox. (defaults to false). The fieldset will be expanded or collapsed when the checkbox is toggled. --->
<cfparam name="attributes.clearCls" default=""><!--- @@type: String @@help: The CSS class used to provide field clearing (defaults to 'x-form-clear-left'). This config is only used when this Component is rendered by a Container which has been configured to use the FormLayout layout manager. --->
<cfparam name="attributes.clearClsJS" default=""><!--- @@type: JS @@help: The CSS class used to provide field clearing (defaults to 'x-form-clear-left'). This config is only used when this Component is rendered by a Container which has been configured to use the FormLayout layout manager. --->
<cfparam name="attributes.cls" default=""><!--- @@type: String @@help: An optional extra CSS class that will be added to this component's Element (defaults to ''). This can be useful for adding customized styles to the component or any of its children using standard CSS rules. --->
<cfparam name="attributes.clsJS" default=""><!--- @@type: JS @@help: An optional extra CSS class that will be added to this component's Element (defaults to ''). This can be useful for adding customized styles to the component or any of its children using standard CSS rules. --->
<cfparam name="attributes.collapsed" default=""><!--- @@type: Boolean @@help: True to render the panel collapsed, false to render it expanded (defaults to false). --->
<cfparam name="attributes.collapsedCls" default=""><!--- @@type: String @@help: A CSS class to add to the panel's element after it has been collapsed (defaults to 'x-panel-collapsed'). --->
<cfparam name="attributes.collapsedClsJS" default=""><!--- @@type: JS @@help: A CSS class to add to the panel's element after it has been collapsed (defaults to 'x-panel-collapsed'). --->
<cfparam name="attributes.collapsible" default=""><!--- @@type: Boolean @@help: True to make the panel collapsible and have the expand/collapse toggle button automatically rendered into the header tool button area, false to keep the panel statically sized with no button (defaults to false). --->
<cfparam name="attributes.contentEl" default=""><!--- @@type: String @@help: The id of an existing HTML node to use as the panel's body content (defaults to ''). The specified Element is appended to the Panel's body Element by the Panel's afterRender method after any configured HTML has been inserted, and so the document will not contain this HTML at the time the render event is fired. --->
<cfparam name="attributes.contentElJS" default=""><!--- @@type: JS @@help: The id of an existing HTML node to use as the panel's body content (defaults to ''). The specified Element is appended to the Panel's body Element by the Panel's afterRender method after any configured HTML has been inserted, and so the document will not contain this HTML at the time the render event is fired. --->
<cfparam name="attributes.ctCls" default=""><!--- @@type: String @@help: An optional extra CSS class that will be added to this component's container (defaults to ''). This can be useful for adding customized styles to the container or any of its children using standard CSS rules. --->
<cfparam name="attributes.ctClsJS" default=""><!--- @@type: JS @@help: An optional extra CSS class that will be added to this component's container (defaults to ''). This can be useful for adding customized styles to the container or any of its children using standard CSS rules. --->
<cfparam name="attributes.defaults" default=""><!--- @@type: Object @@help: A config object that will be applied to all components added to this container either via the items config or via the add or insert methods. The defaults config can contain any number of name/value property pairs to be added to each item, and should be valid for the types of items being added to the container. For example, to automatically apply padding to the body of each of a set of contained Ext.Panel items, you could pass: defaults: {bodyStyle:'padding:15px'}. --->
<cfparam name="attributes.disabled" default=""><!--- @@type: Boolean @@help: Render this component disabled (default is false). --->
<cfparam name="attributes.draggable" default=""><!--- @@type: Boolean @@help: True to enable dragging of this Panel (defaults to false). For custom drag/drop implementations, an Ext.Panel.DD config could also be passed in this config instead of true. Ext.Panel.DD is an internal, undocumented class which moves a proxy Element around in place of the Panel's element, but provides no other behaviour during dragging or on drop. It is a subclass of Ext.dd.DragSource, so behaviour may be added by implementing the interface methods of Ext.dd.DragDrop eg: new Ext.Panel({    title: 'Drag me',    x: 100,    y: 100,    renderTo: Ext.getBody(),    floating: true,    frame: true,    width: 400,    height: 200,    draggable: {//      Config option of Ext.Panel.DD class.//      It's a floating Panel, so do not show a placeholder proxy in the original position.        insertProxy: false,//      Called for each mousemove event while dragging the DD object.        onDrag : function(e){//          Record the x,y position of the drag proxy so that we can//          position the Panel at end of drag.            var pel = this.proxy.getEl();            this.x = pel.getLeft(true);            this.y = pel.getTop(true);//          Keep the Shadow aligned if there is one.            var s = this.panel.getEl().shadow;            if (s) {                s.realign(this.x, this.y, pel.getWidth(), pel.getHeight());            }        },//      Called on the mouseup event.        endDrag : function(e){            this.panel.setPosition(this.x, this.y);        }    }}).show(); --->
<cfparam name="attributes.fieldLabel" default=""><!--- @@type: String @@help: The label text to display next to this Component (defaults to '') This config is only used when this Component is rendered by a Container which has been configured to use the FormLayout layout manager. Example use:new Ext.FormPanel({    height: 100,    renderTo: Ext.getBody(),    items: [{        xtype: 'textfield',        fieldLabel: 'Name'    }]}); --->
<cfparam name="attributes.fieldLabelJS" default=""><!--- @@type: JS @@help: The label text to display next to this Component (defaults to '') This config is only used when this Component is rendered by a Container which has been configured to use the FormLayout layout manager. Example use:new Ext.FormPanel({    height: 100,    renderTo: Ext.getBody(),    items: [{        xtype: 'textfield',        fieldLabel: 'Name'    }]}); --->
<cfparam name="attributes.height" default=""><!--- @@type: Number @@help: The height of this component in pixels (defaults to auto). --->
<cfparam name="attributes.hidden" default=""><!--- @@type: Boolean @@help: Render this component hidden (default is false). --->
<cfparam name="attributes.hideBorders" default=""><!--- @@type: Boolean @@help: True to hide the borders of each contained component, false to defer to the component's existing border settings (defaults to false). --->
<cfparam name="attributes.hideLabel" default=""><!--- @@type: Boolean @@help: True to completely hide the label element (defaults to false). By default, even if you do not specify a fieldLabel the space will still be reserved so that the field will line up with other fields that do have labels. Setting this to true will cause the field to not reserve that space. This config is only used when this Component is rendered by a Container which has been configured to use the FormLayout layout manager. Example use:new Ext.FormPanel({    height: 100,    renderTo: Ext.getBody(),    items: [{        xtype: 'textfield'        hideLabel: true    }]}); --->
<cfparam name="attributes.hideMode" default=""><!--- @@type: String @@help: How this component should be hidden. Supported values are "visibility" (css visibility), "offsets" (negative offset position) and "display" (css display) - defaults to "display". For Containers which may be hidden and shown as part of a card layout Container such as a TabPanel, it is recommended that hideMode is configured as "offsets". This ensures that hidden Components still have height and width so that layout managers can perform measurements when calculating layouts. --->
<cfparam name="attributes.hideModeJS" default=""><!--- @@type: JS @@help: How this component should be hidden. Supported values are "visibility" (css visibility), "offsets" (negative offset position) and "display" (css display) - defaults to "display". For Containers which may be hidden and shown as part of a card layout Container such as a TabPanel, it is recommended that hideMode is configured as "offsets". This ensures that hidden Components still have height and width so that layout managers can perform measurements when calculating layouts. --->
<cfparam name="attributes.hideParent" default=""><!--- @@type: Boolean @@help: True to hide and show the component's container when hide/show is called on the component, false to hide and show the component itself (defaults to false). For example, this can be used as a shortcut for a hide button on a window by setting hide:true on the button when adding it to its parent container. --->
<cfparam name="attributes.html" default=""><!--- @@type: String @@help: An HTML fragment, or a DomHelper specification to use as the panel's body content (defaults to ''). The HTML content is added by the Panel's afterRender method, and so the document will not contain this HTML at the time the render event is fired. This content is inserted into the body before any configured contentEl is appended. --->
<cfparam name="attributes.htmlJS" default=""><!--- @@type: String/Object @@help: An HTML fragment, or a DomHelper specification to use as the panel's body content (defaults to ''). The HTML content is added by the Panel's afterRender method, and so the document will not contain this HTML at the time the render event is fired. This content is inserted into the body before any configured contentEl is appended. --->
<cfparam name="attributes.id" default=""><!--- @@type: String @@help: The unique id of this component (defaults to an auto-assigned id). You should assign an id if you need to be able to access the component later and you do not have an object reference available (e.g., using Ext.ComponentMgr.getCmp). Note that this id will also be used as the element id for the containing HTML element that is rendered to the page for this component. This allows you to write id-based CSS rules to style the specific instance of this component uniquely, and also to select sub-elements using this component's id as the parent. --->
<cfparam name="attributes.idJS" default=""><!--- @@type: JS @@help: The unique id of this component (defaults to an auto-assigned id). You should assign an id if you need to be able to access the component later and you do not have an object reference available (e.g., using Ext.ComponentMgr.getCmp). Note that this id will also be used as the element id for the containing HTML element that is rendered to the page for this component. This allows you to write id-based CSS rules to style the specific instance of this component uniquely, and also to select sub-elements using this component's id as the parent. --->
<cfparam name="attributes.itemCls" default=""><!--- @@type: String @@help: A css class to apply to the x-form-item of fields. This property cascades to child containers. --->
<cfparam name="attributes.itemClsJS" default=""><!--- @@type: JS @@help: A css class to apply to the x-form-item of fields. This property cascades to child containers. --->
<cfparam name="attributes.items" default=""><!--- @@type: String @@help: A single item, or an array of child Components to be added to this container. Each item can be any type of object based on Ext.Component. Component config objects may also be specified in order to avoid the overhead of constructing a real Component object if lazy rendering might mean that the added Component will not be rendered immediately. To take advantage of this "lazy instantiation", set the Ext.Component.xtype config property to the registered type of the Component wanted. For a list of all available xtypes, see Ext.Component. If a single item is being passed, it should be passed directly as an object reference (e.g., items: {...}). Multiple items should be passed as an array of objects (e.g., items: [{...}, {...}]). --->
<cfparam name="attributes.itemsJS" default=""><!--- @@type: Mixed @@help: A single item, or an array of child Components to be added to this container. Each item can be any type of object based on Ext.Component. Component config objects may also be specified in order to avoid the overhead of constructing a real Component object if lazy rendering might mean that the added Component will not be rendered immediately. To take advantage of this "lazy instantiation", set the Ext.Component.xtype config property to the registered type of the Component wanted. For a list of all available xtypes, see Ext.Component. If a single item is being passed, it should be passed directly as an object reference (e.g., items: {...}). Multiple items should be passed as an array of objects (e.g., items: [{...}, {...}]). --->
<cfparam name="attributes.keys" default=""><!--- @@type: Object/Array @@help: A KeyMap config object (in the format expected by Ext.KeyMap.addBinding used to assign custom key handling to this panel (defaults to null). --->
<cfparam name="attributes.labelSeparator" default=""><!--- @@type: String @@help: The standard separator to display after the text of each form label (defaults to the value of Ext.layout.FormLayout.labelSeparator, which is a colon ':' by default). To display no separator for this field's label specify empty string ''. This config is only used when this Component is rendered by a Container which has been configured to use the FormLayout layout manager. Example use:new Ext.FormPanel({    height: 100,    renderTo: Ext.getBody(),    items: [{        xtype: 'textfield',        fieldLabel: 'Name',        labelSeparator: '...'    }]}); --->
<cfparam name="attributes.labelSeparatorJS" default=""><!--- @@type: JS @@help: The standard separator to display after the text of each form label (defaults to the value of Ext.layout.FormLayout.labelSeparator, which is a colon ':' by default). To display no separator for this field's label specify empty string ''. This config is only used when this Component is rendered by a Container which has been configured to use the FormLayout layout manager. Example use:new Ext.FormPanel({    height: 100,    renderTo: Ext.getBody(),    items: [{        xtype: 'textfield',        fieldLabel: 'Name',        labelSeparator: '...'    }]}); --->
<cfparam name="attributes.labelStyle" default=""><!--- @@type: String @@help: A CSS style specification to apply directly to this field's label (defaults to the container's labelStyle value if set, or '').. This config is only used when this Component is rendered by a Container which has been configured to use the FormLayout layout manager. Example use:new Ext.FormPanel({    height: 100,    renderTo: Ext.getBody(),    items: [{        xtype: 'textfield',        fieldLabel: 'Name',        labelStyle: 'font-weight:bold;'    }]}); --->
<cfparam name="attributes.labelStyleJS" default=""><!--- @@type: JS @@help: A CSS style specification to apply directly to this field's label (defaults to the container's labelStyle value if set, or '').. This config is only used when this Component is rendered by a Container which has been configured to use the FormLayout layout manager. Example use:new Ext.FormPanel({    height: 100,    renderTo: Ext.getBody(),    items: [{        xtype: 'textfield',        fieldLabel: 'Name',        labelStyle: 'font-weight:bold;'    }]}); --->
<cfparam name="attributes.labelWidth" default=""><!--- @@type: Number @@help: The width of labels. This property cascades to child containers. --->
<cfparam name="attributes.layout" default=""><!--- @@type: String @@help: The Ext.Container.layout to use inside the fieldset (defaults to 'form'). --->
<cfparam name="attributes.layoutJS" default=""><!--- @@type: JS @@help: The Ext.Container.layout to use inside the fieldset (defaults to 'form'). --->
<cfparam name="attributes.layoutConfig" default=""><!--- @@type: Object @@help: This is a config object containing properties specific to the chosen layout (to be used in conjunction with the layout config value). For complete details regarding the valid config options for each layout type, see the layout class corresponding to the type specified: Ext.layout.Absolute Ext.layout.Accordion Ext.layout.AnchorLayout Ext.layout.BorderLayout Ext.layout.CardLayout Ext.layout.ColumnLayout Ext.layout.FitLayout Ext.layout.FormLayout Ext.layout.TableLayout --->
<cfparam name="attributes.listeners" default=""><!--- @@type: Object @@help: (optional) A config object containing one or more event handlers to be added to this object during initialization. This should be a valid listeners config object as specified in the addListener example for attaching multiple handlers at once. --->
<cfparam name="attributes.maskDisabled" default=""><!--- @@type: Boolean @@help: True to mask the panel when it is disabled, false to not mask it (defaults to true). Either way, the panel will always tell its contained elements to disable themselves when it is disabled, but masking the panel can provide an additional visual cue that the panel is disabled. --->
<cfparam name="attributes.minButtonWidth" default=""><!--- @@type: Number @@help: Minimum width in pixels of all buttons in this panel (defaults to 75) --->
<cfparam name="attributes.monitorResize" default=""><!--- @@type: Boolean @@help: True to automatically monitor window resize events to handle anything that is sensitive to the current size of the viewport. This value is typically managed by the chosen layout and should not need to be set manually. --->
<cfparam name="attributes.overCls" default=""><!--- @@type: String @@help: An optional extra CSS class that will be added to this component's Element when the mouse moves over the Element, and removed when the mouse moves out. (defaults to ''). This can be useful for adding customized "active" or "hover" styles to the component or any of its children using standard CSS rules. --->
<cfparam name="attributes.overClsJS" default=""><!--- @@type: JS @@help: An optional extra CSS class that will be added to this component's Element when the mouse moves over the Element, and removed when the mouse moves out. (defaults to ''). This can be useful for adding customized "active" or "hover" styles to the component or any of its children using standard CSS rules. --->
<cfparam name="attributes.pageX" default=""><!--- @@type: Number @@help: The page level x coordinate for this component if contained within a positioning container. --->
<cfparam name="attributes.pageY" default=""><!--- @@type: Number @@help: The page level y coordinate for this component if contained within a positioning container. --->
<cfparam name="attributes.plugins" default=""><!--- @@type: Object/Array @@help: An object or array of objects that will provide custom functionality for this component. The only requirement for a valid plugin is that it contain an init method that accepts a reference of type Ext.Component. When a component is created, if any plugins are available, the component will call the init method on each plugin, passing a reference to itself. Each plugin can then call methods or respond to events on the component as needed to provide its functionality. --->
<cfparam name="attributes.renderTo" default=""><!--- @@type: String @@help: The id of the node, a DOM node or an existing Element that will be the container to render this component into. Using this config, a call to render() is not required. --->
<cfparam name="attributes.renderToJS" default=""><!--- @@type: Mixed @@help: The id of the node, a DOM node or an existing Element that will be the container to render this component into. Using this config, a call to render() is not required. --->
<cfparam name="attributes.stateEvents" default=""><!--- @@type: Array @@help: An array of events that, when fired, should trigger this component to save its state (defaults to none). These can be any types of events supported by this component, including browser or custom events (e.g., ['click', 'customerchange']). See stateful for an explanation of saving and restoring Component state. --->
<cfparam name="attributes.stateId" default=""><!--- @@type: String @@help: The unique id for this component to use for state management purposes (defaults to the component id if one was set, otherwise null if the component is using a generated id). See stateful for an explanation of saving and restoring Component state. --->
<cfparam name="attributes.stateIdJS" default=""><!--- @@type: JS @@help: The unique id for this component to use for state management purposes (defaults to the component id if one was set, otherwise null if the component is using a generated id). See stateful for an explanation of saving and restoring Component state. --->
<cfparam name="attributes.stateful" default=""><!--- @@type: Boolean @@help: A flag which causes the Component to attempt to restore the state of internal properties from a saved state on startup. The component must have either a stateId or id assigned for state to be managed. Auto-generated ids are not guaranteed to be stable across page loads and cannot be relied upon to save and restore the same state for a component. For state saving to work, the state manager's provider must have been set to an implementation of Ext.state.Provider which overrides the set and get methods to save and recall name/value pairs. A built-in implementation, Ext.state.CookieProvider is available. To set the state provider for the current page: Ext.state.Manager.setProvider(new Ext.state.CookieProvider()); Components attempt to save state when one of the events listed in the stateEvents configuration fires. You can perform extra processing on state save and restore by attaching handlers to the beforestaterestore, staterestore, beforestatesave and statesave events --->
<cfparam name="attributes.style" default=""><!--- @@type: String @@help: A custom style specification to be applied to this component's Element. Should be a valid argument to Ext.Element.applyStyles. --->
<cfparam name="attributes.styleJS" default=""><!--- @@type: JS @@help: A custom style specification to be applied to this component's Element. Should be a valid argument to Ext.Element.applyStyles. --->
<cfparam name="attributes.tabTip" default=""><!--- @@type: String @@help: Adds a tooltip when mousing over the tab of a Ext.Panel which is an item of a Ext.TabPanel. Ext.QuickTips.init() must be called in order for the tips to render. --->
<cfparam name="attributes.tabTipJS" default=""><!--- @@type: JS @@help: Adds a tooltip when mousing over the tab of a Ext.Panel which is an item of a Ext.TabPanel. Ext.QuickTips.init() must be called in order for the tips to render. --->
<cfparam name="attributes.title" default=""><!--- @@type: String @@help: The title text to display in the panel header (defaults to ''). When a title is specified the header element will automatically be created and displayed unless header is explicitly set to false. If you don't want to specify a title at config time, but you may want one later, you must either specify a non-empty title (a blank space ' ' will do) or header:true so that the container element will get created. --->
<cfparam name="attributes.titleJS" default=""><!--- @@type: JS @@help: The title text to display in the panel header (defaults to ''). When a title is specified the header element will automatically be created and displayed unless header is explicitly set to false. If you don't want to specify a title at config time, but you may want one later, you must either specify a non-empty title (a blank space ' ' will do) or header:true so that the container element will get created. --->
<cfparam name="attributes.width" default=""><!--- @@type: Number @@help: The width of this component in pixels (defaults to auto). --->
<cfparam name="attributes.x" default=""><!--- @@type: Number @@help: The local x (left) coordinate for this component if contained within a positioning container. --->
<cfparam name="attributes.y" default=""><!--- @@type: Number @@help: The local y (top) coordinate for this component if contained within a positioning container. --->

<!--- custom attributes --->
<cfparam name="attributes.passThrough" default=""><!--- @@type: JS @@help: (ColdExt attribute) A comma separated list of JavaScript name:value pairs that will be written directly to the Ext component config. This is useful for storing custom properties in Ext components. --->
<cfparam name="attributes.var" default=""><!--- @@type: JS Variable Name @@help: (ColdExt attribute) The JavaScript variable name that this component will be assigned to. NOTE: You should only use the var attribute when this tags parent is the onReady tag. --->



<!--- arrays that may be populated by nested tags --->
<cfset thisTag.items = ArrayNew(1)>
<cfset thisTag.listeners = ArrayNew(1)>

<!--- process custom attributes --->
<!--- var --->
<cfset attributes.var = validateVarAttribute(parentTag)>




<cfelseif thisTag.executionMode eq "end">



<cfsavecontent variable="attributes._out">
<cfprocessingdirective suppresswhitespace="true">
<cfoutput>
	<cfif AttributeNotEmpty("var")>var #attributes.var# = </cfif>new Ext.form.FieldSet({
		<cfif AttributeNotEmpty("allowDomMove")>allowDomMove: #attributes.allowDomMove#,</cfif>
		<cfif AttributeNotEmpty("animCollapse")>animCollapse: #attributes.animCollapse#,</cfif>
		<cfif AttributeNotEmpty("autoDestroy")>autoDestroy: #attributes.autoDestroy#,</cfif>
		<cfif AttributeNotEmpty("autoEl")>autoEl: "#JSStringFormat(attributes.autoEl)#",</cfif>
		<cfif AttributeNotEmpty("autoElJS")>autoEl: #attributes.autoElJS#,</cfif>
		<cfif AttributeNotEmpty("autoHeight")>autoHeight: #attributes.autoHeight#,</cfif>
		<cfif AttributeNotEmpty("autoLoad")>autoLoad: "#JSStringFormat(attributes.autoLoad)#",</cfif>
		<cfif AttributeNotEmpty("autoLoadJS")>autoLoad: #attributes.autoLoadJS#,</cfif>
		<cfif AttributeNotEmpty("autoScroll")>autoScroll: #attributes.autoScroll#,</cfif>
		<cfif AttributeNotEmpty("autoShow")>autoShow: #attributes.autoShow#,</cfif>
		<cfif AttributeNotEmpty("autoWidth")>autoWidth: #attributes.autoWidth#,</cfif>
		<cfif AttributeNotEmpty("baseCls")>baseCls: "#JSStringFormat(attributes.baseCls)#",</cfif>
		<cfif AttributeNotEmpty("baseClsJS")>baseCls: #attributes.baseClsJS#,</cfif>
		<cfif AttributeNotEmpty("bodyCfg")>bodyCfg: #attributes.bodyCfg#,</cfif>
		<cfif AttributeNotEmpty("bodyStyle")>bodyStyle: "#JSStringFormat(attributes.bodyStyle)#",</cfif>
		<cfif AttributeNotEmpty("bodyStyleJS")>bodyStyle: #attributes.bodyStyleJS#,</cfif>
		<cfif AttributeNotEmpty("checkboxName")>checkboxName: "#JSStringFormat(attributes.checkboxName)#",</cfif>
		<cfif AttributeNotEmpty("checkboxNameJS")>checkboxName: #attributes.checkboxNameJS#,</cfif>
		<cfif AttributeNotEmpty("checkboxToggle")>checkboxToggle: "#JSStringFormat(attributes.checkboxToggle)#",</cfif>
		<cfif AttributeNotEmpty("checkboxToggleJS")>checkboxToggle: #attributes.checkboxToggleJS#,</cfif>
		<cfif AttributeNotEmpty("clearCls")>clearCls: "#JSStringFormat(attributes.clearCls)#",</cfif>
		<cfif AttributeNotEmpty("clearClsJS")>clearCls: #attributes.clearClsJS#,</cfif>
		<cfif AttributeNotEmpty("cls")>cls: "#JSStringFormat(attributes.cls)#",</cfif>
		<cfif AttributeNotEmpty("clsJS")>cls: #attributes.clsJS#,</cfif>
		<cfif AttributeNotEmpty("collapsed")>collapsed: #attributes.collapsed#,</cfif>
		<cfif AttributeNotEmpty("collapsedCls")>collapsedCls: "#JSStringFormat(attributes.collapsedCls)#",</cfif>
		<cfif AttributeNotEmpty("collapsedClsJS")>collapsedCls: #attributes.collapsedClsJS#,</cfif>
		<cfif AttributeNotEmpty("collapsible")>collapsible: #attributes.collapsible#,</cfif>
		<cfif AttributeNotEmpty("contentEl")>contentEl: "#JSStringFormat(attributes.contentEl)#",</cfif>
		<cfif AttributeNotEmpty("contentElJS")>contentEl: #attributes.contentElJS#,</cfif>
		<cfif AttributeNotEmpty("ctCls")>ctCls: "#JSStringFormat(attributes.ctCls)#",</cfif>
		<cfif AttributeNotEmpty("ctClsJS")>ctCls: #attributes.ctClsJS#,</cfif>
		<cfif AttributeNotEmpty("defaults")>defaults: #attributes.defaults#,</cfif>
		<cfif AttributeNotEmpty("disabled")>disabled: #attributes.disabled#,</cfif>
		<cfif AttributeNotEmpty("draggable")>draggable: #attributes.draggable#,</cfif>
		<cfif AttributeNotEmpty("fieldLabel")>fieldLabel: "#JSStringFormat(attributes.fieldLabel)#",</cfif>
		<cfif AttributeNotEmpty("fieldLabelJS")>fieldLabel: #attributes.fieldLabelJS#,</cfif>
		<cfif AttributeNotEmpty("height")>height: #attributes.height#,</cfif>
		<cfif AttributeNotEmpty("hidden")>hidden: #attributes.hidden#,</cfif>
		<cfif AttributeNotEmpty("hideBorders")>hideBorders: #attributes.hideBorders#,</cfif>
		<cfif AttributeNotEmpty("hideLabel")>hideLabel: #attributes.hideLabel#,</cfif>
		<cfif AttributeNotEmpty("hideMode")>hideMode: "#JSStringFormat(attributes.hideMode)#",</cfif>
		<cfif AttributeNotEmpty("hideModeJS")>hideMode: #attributes.hideModeJS#,</cfif>
		<cfif AttributeNotEmpty("hideParent")>hideParent: #attributes.hideParent#,</cfif>
		<cfif AttributeNotEmpty("html")>html: "#JSStringFormat(attributes.html)#",</cfif>
		<cfif AttributeNotEmpty("htmlJS")>html: #attributes.htmlJS#,</cfif>
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
		<cfif AttributeNotEmpty("labelWidth")>labelWidth: #attributes.labelWidth#,</cfif>
		<cfif AttributeNotEmpty("layout")>layout: "#JSStringFormat(attributes.layout)#",</cfif>
		<cfif AttributeNotEmpty("layoutJS")>layout: #attributes.layoutJS#,</cfif>
		<cfif AttributeNotEmpty("layoutConfig")>layoutConfig: #attributes.layoutConfig#,</cfif>
		<cfif AttributeNotEmpty("listeners")>listeners: #attributes.listeners#,</cfif>
		<cfif AttributeNotEmpty("maskDisabled")>maskDisabled: #attributes.maskDisabled#,</cfif>
		<cfif AttributeNotEmpty("minButtonWidth")>minButtonWidth: #attributes.minButtonWidth#,</cfif>
		<cfif AttributeNotEmpty("monitorResize")>monitorResize: #attributes.monitorResize#,</cfif>
		<cfif AttributeNotEmpty("overCls")>overCls: "#JSStringFormat(attributes.overCls)#",</cfif>
		<cfif AttributeNotEmpty("overClsJS")>overCls: #attributes.overClsJS#,</cfif>
		<cfif AttributeNotEmpty("pageX")>pageX: #attributes.pageX#,</cfif>
		<cfif AttributeNotEmpty("pageY")>pageY: #attributes.pageY#,</cfif>
		<cfif AttributeNotEmpty("plugins")>plugins: #attributes.plugins#,</cfif>
		<cfif AttributeNotEmpty("renderTo")>renderTo: "#JSStringFormat(attributes.renderTo)#",</cfif>
		<cfif AttributeNotEmpty("renderToJS")>renderTo: #attributes.renderToJS#,</cfif>
		<cfif AttributeNotEmpty("stateEvents")>stateEvents: #attributes.stateEvents#,</cfif>
		<cfif AttributeNotEmpty("stateId")>stateId: "#JSStringFormat(attributes.stateId)#",</cfif>
		<cfif AttributeNotEmpty("stateIdJS")>stateId: #attributes.stateIdJS#,</cfif>
		<cfif AttributeNotEmpty("stateful")>stateful: #attributes.stateful#,</cfif>
		<cfif AttributeNotEmpty("style")>style: "#JSStringFormat(attributes.style)#",</cfif>
		<cfif AttributeNotEmpty("styleJS")>style: #attributes.styleJS#,</cfif>
		<cfif AttributeNotEmpty("tabTip")>tabTip: "#JSStringFormat(attributes.tabTip)#",</cfif>
		<cfif AttributeNotEmpty("tabTipJS")>tabTip: #attributes.tabTipJS#,</cfif>
		<cfif AttributeNotEmpty("title")>title: "#JSStringFormat(attributes.title)#",</cfif>
		<cfif AttributeNotEmpty("titleJS")>title: #attributes.titleJS#,</cfif>
		<cfif AttributeNotEmpty("width")>width: #attributes.width#,</cfif>
		<cfif AttributeNotEmpty("x")>x: #attributes.x#,</cfif>
		<cfif AttributeNotEmpty("y")>y: #attributes.y#,</cfif>

		<cfif AttributeNotEmpty("passThrough")>#attributes.passThrough#,</cfif>

		<cfif arrayLen(thisTag.items)>items: [ #ArrayKeyToList(thisTag.items, "_out")# ],</cfif>
		<cfif arrayLen(thisTag.listeners)>listeners: { #ArrayKeyToList(thisTag.listeners, "_out")# },</cfif>


		dummy: true
	})<cfif AttributeNotEmpty("var")>;</cfif>
</cfoutput>
</cfprocessingdirective>
</cfsavecontent>

<cfassociate basetag="#parentTag#" datacollection="items">


</cfif>


<cfsetting enablecfoutputonly="false">