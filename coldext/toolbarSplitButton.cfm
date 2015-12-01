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
<cfparam name="attributes.allowDepress" default=""><!--- @@type: Boolean @@help: False to not allow a pressed Button to be depressed (defaults to undefined). Only valid when enableToggle is true. --->
<cfparam name="attributes.allowDomMove" default=""><!--- @@type: Boolean @@help: Whether the component can move the Dom node when rendering (defaults to true). --->
<cfparam name="attributes.applyTo" default=""><!--- @@type: String @@help: The id of the node, a DOM node or an existing Element corresponding to a DIV that is already present in the document that specifies some structural markup for this component. When applyTo is used, constituent parts of the component can also be specified by id or CSS class name within the main element, and the component being created may attempt to create its subcomponents from that markup if applicable. Using this config, a call to render() is not required. If applyTo is specified, any value passed for renderTo will be ignored and the target element's parent node will automatically be used as the component's container. --->
<cfparam name="attributes.applyToJS" default=""><!--- @@type: Mixed @@help: The id of the node, a DOM node or an existing Element corresponding to a DIV that is already present in the document that specifies some structural markup for this component. When applyTo is used, constituent parts of the component can also be specified by id or CSS class name within the main element, and the component being created may attempt to create its subcomponents from that markup if applicable. Using this config, a call to render() is not required. If applyTo is specified, any value passed for renderTo will be ignored and the target element's parent node will automatically be used as the component's container. --->
<cfparam name="attributes.arrowHandler" default=""><!--- @@type: Function @@help: A function called when the arrow button is clicked (can be used instead of click event) --->
<cfparam name="attributes.arrowTooltip" default=""><!--- @@type: String @@help: The title attribute of the arrow --->
<cfparam name="attributes.arrowTooltipJS" default=""><!--- @@type: JS @@help: The title attribute of the arrow --->
<cfparam name="attributes.autoEl" default=""><!--- @@type: String @@help: A tag name or DomHelper spec to create an element with. This is intended to create shorthand utility components inline via JSON. It should not be used for higher level components which already create their own elements. Example usage: {xtype:'box', autoEl: 'div', cls:'my-class'}{xtype:'box', autoEl: {tag:'blockquote', html:'autoEl is cool!'}} // with DomHelper --->
<cfparam name="attributes.autoElJS" default=""><!--- @@type: String/Object @@help: A tag name or DomHelper spec to create an element with. This is intended to create shorthand utility components inline via JSON. It should not be used for higher level components which already create their own elements. Example usage: {xtype:'box', autoEl: 'div', cls:'my-class'}{xtype:'box', autoEl: {tag:'blockquote', html:'autoEl is cool!'}} // with DomHelper --->
<cfparam name="attributes.autoShow" default=""><!--- @@type: Boolean @@help: True if the component should check for hidden classes (e.g. 'x-hidden' or 'x-hide-display') and remove them on render (defaults to false). --->
<cfparam name="attributes.buttonSelector" default=""><!--- @@type: String @@help: (Optional) A DomQuery selector which is used to extract the active, clickable element from the DOM structure created. When a custom template is used, you must ensure that this selector results in the selection of a focussable element. Defaults to "button:first-child". --->
<cfparam name="attributes.buttonSelectorJS" default=""><!--- @@type: JS @@help: (Optional) A DomQuery selector which is used to extract the active, clickable element from the DOM structure created. When a custom template is used, you must ensure that this selector results in the selection of a focussable element. Defaults to "button:first-child". --->
<cfparam name="attributes.clearCls" default=""><!--- @@type: String @@help: The CSS class used to provide field clearing (defaults to 'x-form-clear-left'). This config is only used when this Component is rendered by a Container which has been configured to use the FormLayout layout manager. --->
<cfparam name="attributes.clearClsJS" default=""><!--- @@type: JS @@help: The CSS class used to provide field clearing (defaults to 'x-form-clear-left'). This config is only used when this Component is rendered by a Container which has been configured to use the FormLayout layout manager. --->
<cfparam name="attributes.clickEvent" default=""><!--- @@type: String @@help: The type of event to map to the button's event handler (defaults to 'click') --->
<cfparam name="attributes.clickEventJS" default=""><!--- @@type: JS @@help: The type of event to map to the button's event handler (defaults to 'click') --->
<cfparam name="attributes.cls" default=""><!--- @@type: String @@help: An optional extra CSS class that will be added to this component's Element (defaults to ''). This can be useful for adding customized styles to the component or any of its children using standard CSS rules. --->
<cfparam name="attributes.clsJS" default=""><!--- @@type: JS @@help: An optional extra CSS class that will be added to this component's Element (defaults to ''). This can be useful for adding customized styles to the component or any of its children using standard CSS rules. --->
<cfparam name="attributes.ctCls" default=""><!--- @@type: String @@help: An optional extra CSS class that will be added to this component's container (defaults to ''). This can be useful for adding customized styles to the container or any of its children using standard CSS rules. --->
<cfparam name="attributes.ctClsJS" default=""><!--- @@type: JS @@help: An optional extra CSS class that will be added to this component's container (defaults to ''). This can be useful for adding customized styles to the container or any of its children using standard CSS rules. --->
<cfparam name="attributes.disabled" default=""><!--- @@type: Boolean @@help: Render this component disabled (default is false). --->
<cfparam name="attributes.disabledClass" default=""><!--- @@type: String @@help: CSS class added to the component when it is disabled (defaults to "x-item-disabled"). --->
<cfparam name="attributes.disabledClassJS" default=""><!--- @@type: JS @@help: CSS class added to the component when it is disabled (defaults to "x-item-disabled"). --->
<cfparam name="attributes.enableToggle" default=""><!--- @@type: Boolean @@help: True to enable pressed/not pressed toggling (defaults to false) --->
<cfparam name="attributes.fieldLabel" default=""><!--- @@type: String @@help: The label text to display next to this Component (defaults to '') This config is only used when this Component is rendered by a Container which has been configured to use the FormLayout layout manager. Example use:new Ext.FormPanel({    height: 100,    renderTo: Ext.getBody(),    items: [{        xtype: 'textfield',        fieldLabel: 'Name'    }]}); --->
<cfparam name="attributes.fieldLabelJS" default=""><!--- @@type: JS @@help: The label text to display next to this Component (defaults to '') This config is only used when this Component is rendered by a Container which has been configured to use the FormLayout layout manager. Example use:new Ext.FormPanel({    height: 100,    renderTo: Ext.getBody(),    items: [{        xtype: 'textfield',        fieldLabel: 'Name'    }]}); --->
<cfparam name="attributes.handleMouseEvents" default=""><!--- @@type: Boolean @@help: False to disable visual cues on mouseover, mouseout and mousedown (defaults to true) --->
<cfparam name="attributes.handler" default=""><!--- @@type: Function @@help: A function called when the button is clicked (can be used instead of click event) --->
<cfparam name="attributes.hidden" default=""><!--- @@type: Boolean @@help: Render this component hidden (default is false). --->
<cfparam name="attributes.hideLabel" default=""><!--- @@type: Boolean @@help: True to completely hide the label element (defaults to false). By default, even if you do not specify a fieldLabel the space will still be reserved so that the field will line up with other fields that do have labels. Setting this to true will cause the field to not reserve that space. This config is only used when this Component is rendered by a Container which has been configured to use the FormLayout layout manager. Example use:new Ext.FormPanel({    height: 100,    renderTo: Ext.getBody(),    items: [{        xtype: 'textfield'        hideLabel: true    }]}); --->
<cfparam name="attributes.hideMode" default=""><!--- @@type: String @@help: How this component should be hidden. Supported values are "visibility" (css visibility), "offsets" (negative offset position) and "display" (css display) - defaults to "display". For Containers which may be hidden and shown as part of a card layout Container such as a TabPanel, it is recommended that hideMode is configured as "offsets". This ensures that hidden Components still have height and width so that layout managers can perform measurements when calculating layouts. --->
<cfparam name="attributes.hideModeJS" default=""><!--- @@type: JS @@help: How this component should be hidden. Supported values are "visibility" (css visibility), "offsets" (negative offset position) and "display" (css display) - defaults to "display". For Containers which may be hidden and shown as part of a card layout Container such as a TabPanel, it is recommended that hideMode is configured as "offsets". This ensures that hidden Components still have height and width so that layout managers can perform measurements when calculating layouts. --->
<cfparam name="attributes.hideParent" default=""><!--- @@type: Boolean @@help: True to hide and show the component's container when hide/show is called on the component, false to hide and show the component itself (defaults to false). For example, this can be used as a shortcut for a hide button on a window by setting hide:true on the button when adding it to its parent container. --->
<cfparam name="attributes.icon" default=""><!--- @@type: String @@help: The path to an image to display in the button (the image will be set as the background-image CSS property of the button by default, so if you want a mixed icon/text button, set cls:"x-btn-text-icon") --->
<cfparam name="attributes.iconJS" default=""><!--- @@type: JS @@help: The path to an image to display in the button (the image will be set as the background-image CSS property of the button by default, so if you want a mixed icon/text button, set cls:"x-btn-text-icon") --->
<cfparam name="attributes.iconCls" default=""><!--- @@type: String @@help: A css class which sets a background image to be used as the icon for this button --->
<cfparam name="attributes.iconClsJS" default=""><!--- @@type: JS @@help: A css class which sets a background image to be used as the icon for this button --->
<cfparam name="attributes.id" default=""><!--- @@type: String @@help: The unique id of this component (defaults to an auto-assigned id). You should assign an id if you need to be able to access the component later and you do not have an object reference available (e.g., using Ext.ComponentMgr.getCmp). Note that this id will also be used as the element id for the containing HTML element that is rendered to the page for this component. This allows you to write id-based CSS rules to style the specific instance of this component uniquely, and also to select sub-elements using this component's id as the parent. --->
<cfparam name="attributes.idJS" default=""><!--- @@type: JS @@help: The unique id of this component (defaults to an auto-assigned id). You should assign an id if you need to be able to access the component later and you do not have an object reference available (e.g., using Ext.ComponentMgr.getCmp). Note that this id will also be used as the element id for the containing HTML element that is rendered to the page for this component. This allows you to write id-based CSS rules to style the specific instance of this component uniquely, and also to select sub-elements using this component's id as the parent. --->
<cfparam name="attributes.itemCls" default=""><!--- @@type: String @@help: An additional CSS class to apply to the wrapper's form item element of this field (defaults to the container's itemCls value if set, or ''). Since it is applied to the item wrapper, it allows you to write standard CSS rules that can apply to the field, the label (if specified) or any other element within the markup for the field. This config is only used when this Component is rendered by a Container which has been configured to use the FormLayout layout manager. Example use:// Apply a style to the field's label:    .required .x-form-item-label {font-weight:bold;color:red;}new Ext.FormPanel({    height: 100,    renderTo: Ext.getBody(),    items: [{        xtype: 'textfield',        fieldLabel: 'Name',        itemCls: 'required' //this label will be styled    },{        xtype: 'textfield',        fieldLabel: 'Favorite Color'    }]}); --->
<cfparam name="attributes.itemClsJS" default=""><!--- @@type: JS @@help: An additional CSS class to apply to the wrapper's form item element of this field (defaults to the container's itemCls value if set, or ''). Since it is applied to the item wrapper, it allows you to write standard CSS rules that can apply to the field, the label (if specified) or any other element within the markup for the field. This config is only used when this Component is rendered by a Container which has been configured to use the FormLayout layout manager. Example use:// Apply a style to the field's label:    .required .x-form-item-label {font-weight:bold;color:red;}new Ext.FormPanel({    height: 100,    renderTo: Ext.getBody(),    items: [{        xtype: 'textfield',        fieldLabel: 'Name',        itemCls: 'required' //this label will be styled    },{        xtype: 'textfield',        fieldLabel: 'Favorite Color'    }]}); --->
<cfparam name="attributes.labelSeparator" default=""><!--- @@type: String @@help: The standard separator to display after the text of each form label (defaults to the value of Ext.layout.FormLayout.labelSeparator, which is a colon ':' by default). To display no separator for this field's label specify empty string ''. This config is only used when this Component is rendered by a Container which has been configured to use the FormLayout layout manager. Example use:new Ext.FormPanel({    height: 100,    renderTo: Ext.getBody(),    items: [{        xtype: 'textfield',        fieldLabel: 'Name',        labelSeparator: '...'    }]}); --->
<cfparam name="attributes.labelSeparatorJS" default=""><!--- @@type: JS @@help: The standard separator to display after the text of each form label (defaults to the value of Ext.layout.FormLayout.labelSeparator, which is a colon ':' by default). To display no separator for this field's label specify empty string ''. This config is only used when this Component is rendered by a Container which has been configured to use the FormLayout layout manager. Example use:new Ext.FormPanel({    height: 100,    renderTo: Ext.getBody(),    items: [{        xtype: 'textfield',        fieldLabel: 'Name',        labelSeparator: '...'    }]}); --->
<cfparam name="attributes.labelStyle" default=""><!--- @@type: String @@help: A CSS style specification to apply directly to this field's label (defaults to the container's labelStyle value if set, or '').. This config is only used when this Component is rendered by a Container which has been configured to use the FormLayout layout manager. Example use:new Ext.FormPanel({    height: 100,    renderTo: Ext.getBody(),    items: [{        xtype: 'textfield',        fieldLabel: 'Name',        labelStyle: 'font-weight:bold;'    }]}); --->
<cfparam name="attributes.labelStyleJS" default=""><!--- @@type: JS @@help: A CSS style specification to apply directly to this field's label (defaults to the container's labelStyle value if set, or '').. This config is only used when this Component is rendered by a Container which has been configured to use the FormLayout layout manager. Example use:new Ext.FormPanel({    height: 100,    renderTo: Ext.getBody(),    items: [{        xtype: 'textfield',        fieldLabel: 'Name',        labelStyle: 'font-weight:bold;'    }]}); --->
<cfparam name="attributes.listeners" default=""><!--- @@type: Object @@help: (optional) A config object containing one or more event handlers to be added to this object during initialization. This should be a valid listeners config object as specified in the addListener example for attaching multiple handlers at once. --->
<cfparam name="attributes.menu" default=""><!--- @@type: String @@help: Standard menu attribute consisting of a reference to a menu object, a menu id or a menu config blob (defaults to undefined). --->
<cfparam name="attributes.menuJS" default=""><!--- @@type: Mixed @@help: Standard menu attribute consisting of a reference to a menu object, a menu id or a menu config blob (defaults to undefined). --->
<cfparam name="attributes.menuAlign" default=""><!--- @@type: String @@help: The position to align the menu to (see Ext.Element.alignTo for more details, defaults to 'tl-bl?'). --->
<cfparam name="attributes.menuAlignJS" default=""><!--- @@type: JS @@help: The position to align the menu to (see Ext.Element.alignTo for more details, defaults to 'tl-bl?'). --->
<cfparam name="attributes.minWidth" default=""><!--- @@type: Number @@help: The minimum width for this button (used to give a set of buttons a common width) --->
<cfparam name="attributes.overCls" default=""><!--- @@type: String @@help: An optional extra CSS class that will be added to this component's Element when the mouse moves over the Element, and removed when the mouse moves out. (defaults to ''). This can be useful for adding customized "active" or "hover" styles to the component or any of its children using standard CSS rules. --->
<cfparam name="attributes.overClsJS" default=""><!--- @@type: JS @@help: An optional extra CSS class that will be added to this component's Element when the mouse moves over the Element, and removed when the mouse moves out. (defaults to ''). This can be useful for adding customized "active" or "hover" styles to the component or any of its children using standard CSS rules. --->
<cfparam name="attributes.plugins" default=""><!--- @@type: Object/Array @@help: An object or array of objects that will provide custom functionality for this component. The only requirement for a valid plugin is that it contain an init method that accepts a reference of type Ext.Component. When a component is created, if any plugins are available, the component will call the init method on each plugin, passing a reference to itself. Each plugin can then call methods or respond to events on the component as needed to provide its functionality. --->
<cfparam name="attributes.pressed" default=""><!--- @@type: Boolean @@help: True to start pressed (only if enableToggle = true) --->
<cfparam name="attributes.renderTo" default=""><!--- @@type: String @@help: The id of the node, a DOM node or an existing Element that will be the container to render this component into. Using this config, a call to render() is not required. --->
<cfparam name="attributes.renderToJS" default=""><!--- @@type: Mixed @@help: The id of the node, a DOM node or an existing Element that will be the container to render this component into. Using this config, a call to render() is not required. --->
<cfparam name="attributes.repeat" default=""><!--- @@type: Boolean/Object @@help: True to repeat fire the click event while the mouse is down. This can also be an Ext.util.ClickRepeater config object (defaults to false). --->
<cfparam name="attributes.scope" default=""><!--- @@type: Object @@help: The scope of the handler --->
<cfparam name="attributes.stateEvents" default=""><!--- @@type: Array @@help: An array of events that, when fired, should trigger this component to save its state (defaults to none). These can be any types of events supported by this component, including browser or custom events (e.g., ['click', 'customerchange']). See stateful for an explanation of saving and restoring Component state. --->
<cfparam name="attributes.stateId" default=""><!--- @@type: String @@help: The unique id for this component to use for state management purposes (defaults to the component id if one was set, otherwise null if the component is using a generated id). See stateful for an explanation of saving and restoring Component state. --->
<cfparam name="attributes.stateIdJS" default=""><!--- @@type: JS @@help: The unique id for this component to use for state management purposes (defaults to the component id if one was set, otherwise null if the component is using a generated id). See stateful for an explanation of saving and restoring Component state. --->
<cfparam name="attributes.stateful" default=""><!--- @@type: Boolean @@help: A flag which causes the Component to attempt to restore the state of internal properties from a saved state on startup. The component must have either a stateId or id assigned for state to be managed. Auto-generated ids are not guaranteed to be stable across page loads and cannot be relied upon to save and restore the same state for a component. For state saving to work, the state manager's provider must have been set to an implementation of Ext.state.Provider which overrides the set and get methods to save and recall name/value pairs. A built-in implementation, Ext.state.CookieProvider is available. To set the state provider for the current page: Ext.state.Manager.setProvider(new Ext.state.CookieProvider()); Components attempt to save state when one of the events listed in the stateEvents configuration fires. You can perform extra processing on state save and restore by attaching handlers to the beforestaterestore, staterestore, beforestatesave and statesave events --->
<cfparam name="attributes.style" default=""><!--- @@type: String @@help: A custom style specification to be applied to this component's Element. Should be a valid argument to Ext.Element.applyStyles. --->
<cfparam name="attributes.styleJS" default=""><!--- @@type: JS @@help: A custom style specification to be applied to this component's Element. Should be a valid argument to Ext.Element.applyStyles. --->
<cfparam name="attributes.tabIndex" default=""><!--- @@type: Number @@help: Set a DOM tabIndex for this button (defaults to undefined) --->
<cfparam name="attributes.template" default=""><!--- @@type: Ext.Template @@help: (Optional) An Ext.Template with which to create the Button's main element. This Template must contain numeric substitution parameter 0 if it is to display the text property. Changing the template could require code modifications if required elements (e.g. a button) aren't present. --->
<cfparam name="attributes.text" default=""><!--- @@type: String @@help: The button text --->
<cfparam name="attributes.textJS" default=""><!--- @@type: JS @@help: The button text --->
<cfparam name="attributes.toggleGroup" default=""><!--- @@type: String @@help: The group this toggle button is a member of (only 1 per group can be pressed) --->
<cfparam name="attributes.toggleGroupJS" default=""><!--- @@type: JS @@help: The group this toggle button is a member of (only 1 per group can be pressed) --->
<cfparam name="attributes.toggleHandler" default=""><!--- @@type: Function @@help: Function called when a Button with enableToggle set to true is clicked. Two arguments are passed: button : Ext.Buttonthis Button object state : BooleanThe next state if the Button, true means pressed. --->
<cfparam name="attributes.tooltip" default=""><!--- @@type: String @@help: The tooltip for the button - can be a string or QuickTips config object --->
<cfparam name="attributes.tooltipJS" default=""><!--- @@type: String/Object @@help: The tooltip for the button - can be a string or QuickTips config object --->
<cfparam name="attributes.tooltipType" default=""><!--- @@type: String @@help: The type of tooltip to use. Either "qtip" (default) for QuickTips or "title" for title attribute. --->
<cfparam name="attributes.tooltipTypeJS" default=""><!--- @@type: JS @@help: The type of tooltip to use. Either "qtip" (default) for QuickTips or "title" for title attribute. --->
<cfparam name="attributes.type" default=""><!--- @@type: String @@help: submit, reset or button - defaults to 'button' --->
<cfparam name="attributes.typeJS" default=""><!--- @@type: JS @@help: submit, reset or button - defaults to 'button' --->
<cfparam name="attributes.xtype" default=""><!--- @@type: String @@help: The registered xtype to create. This config option is not used when passing a config object into a constructor. This config option is used only when lazy instantiation is being used, and a child item of a Container is being specified not as a fully instantiated Component, but as a Component config object. The xtype will be looked up at render time up to determine what type of child Component to create. The predefined xtypes are listed here.  If you subclass Components to create your own Components, you may register them using Ext.ComponentMgr.registerType in order to be able to take advantage of lazy instantiation and rendering. --->
<cfparam name="attributes.xtypeJS" default=""><!--- @@type: JS @@help: The registered xtype to create. This config option is not used when passing a config object into a constructor. This config option is used only when lazy instantiation is being used, and a child item of a Container is being specified not as a fully instantiated Component, but as a Component config object. The xtype will be looked up at render time up to determine what type of child Component to create. The predefined xtypes are listed here.  If you subclass Components to create your own Components, you may register them using Ext.ComponentMgr.registerType in order to be able to take advantage of lazy instantiation and rendering. --->

<!--- custom attributes --->
<cfparam name="attributes.passThrough" default=""><!--- @@type: JS @@help: (ColdExt attribute) A comma separated list of JavaScript name:value pairs that will be written directly to the Ext component config. This is useful for storing custom properties in Ext components. --->
<cfparam name="attributes.var" default=""><!--- @@type: JS Variable Name @@help: (ColdExt attribute) The JavaScript variable name that this component will be assigned to. NOTE: You should only use the var attribute when this tags parent is the onReady tag. --->



<!--- arrays that may be populated by nested tags --->
<cfset thisTag.handler = ArrayNew(1)>
<cfset thisTag.listeners = ArrayNew(1)>
<cfset thisTag.menu = ArrayNew(1)>
<cfset thisTag.tooltip = ArrayNew(1)>

<!--- process custom attributes --->
<!--- var --->
<cfset attributes.var = validateVarAttribute(parentTag)>

<!--- support formPanel standardSubmit --->
<cfif AttributeEquals("type", "submit")>
<cftry>
	<cfset _form = getBaseTagData("CF_FORMPANEL")>
	<cfif TrueFalseFormat(_form.attributes.standardSubmit)>
		<cfif _form.attributes.var neq "">
			<cfset _formName = _form.attributes.var>
		<cfelseif _form.attributes.id neq "">
			<cfset _formName = _form.attributes.id>
		<cfelse>
			<cfthrow type="ColdExt" message="formPanel is missing id attribute">
		</cfif>
		<cfmodule template="handler.cfm" type="submit" form="#_formName#" />
	</cfif>
	<cfcatch type="ColdExt">
		<cfrethrow>
	</cfcatch>
	<cfcatch></cfcatch>
</cftry>
</cfif>




<cfelseif thisTag.executionMode eq "end">



<cfsavecontent variable="attributes._out">
<cfprocessingdirective suppresswhitespace="true">
<cfoutput>
	<cfif AttributeNotEmpty("var")>var #attributes.var# = </cfif>new Ext.Toolbar.SplitButton({
		<cfif AttributeNotEmpty("allowDepress")>allowDepress: #attributes.allowDepress#,</cfif>
		<cfif AttributeNotEmpty("allowDomMove")>allowDomMove: #attributes.allowDomMove#,</cfif>
		<cfif AttributeNotEmpty("applyTo")>applyTo: "#JSStringFormat(attributes.applyTo)#",</cfif>
		<cfif AttributeNotEmpty("applyToJS")>applyTo: #attributes.applyToJS#,</cfif>
		<cfif AttributeNotEmpty("arrowHandler")>arrowHandler: #attributes.arrowHandler#,</cfif>
		<cfif AttributeNotEmpty("arrowTooltip")>arrowTooltip: "#JSStringFormat(attributes.arrowTooltip)#",</cfif>
		<cfif AttributeNotEmpty("arrowTooltipJS")>arrowTooltip: #attributes.arrowTooltipJS#,</cfif>
		<cfif AttributeNotEmpty("autoEl")>autoEl: "#JSStringFormat(attributes.autoEl)#",</cfif>
		<cfif AttributeNotEmpty("autoElJS")>autoEl: #attributes.autoElJS#,</cfif>
		<cfif AttributeNotEmpty("autoShow")>autoShow: #attributes.autoShow#,</cfif>
		<cfif AttributeNotEmpty("buttonSelector")>buttonSelector: "#JSStringFormat(attributes.buttonSelector)#",</cfif>
		<cfif AttributeNotEmpty("buttonSelectorJS")>buttonSelector: #attributes.buttonSelectorJS#,</cfif>
		<cfif AttributeNotEmpty("clearCls")>clearCls: "#JSStringFormat(attributes.clearCls)#",</cfif>
		<cfif AttributeNotEmpty("clearClsJS")>clearCls: #attributes.clearClsJS#,</cfif>
		<cfif AttributeNotEmpty("clickEvent")>clickEvent: "#JSStringFormat(attributes.clickEvent)#",</cfif>
		<cfif AttributeNotEmpty("clickEventJS")>clickEvent: #attributes.clickEventJS#,</cfif>
		<cfif AttributeNotEmpty("cls")>cls: "#JSStringFormat(attributes.cls)#",</cfif>
		<cfif AttributeNotEmpty("clsJS")>cls: #attributes.clsJS#,</cfif>
		<cfif AttributeNotEmpty("ctCls")>ctCls: "#JSStringFormat(attributes.ctCls)#",</cfif>
		<cfif AttributeNotEmpty("ctClsJS")>ctCls: #attributes.ctClsJS#,</cfif>
		<cfif AttributeNotEmpty("disabled")>disabled: #attributes.disabled#,</cfif>
		<cfif AttributeNotEmpty("disabledClass")>disabledClass: "#JSStringFormat(attributes.disabledClass)#",</cfif>
		<cfif AttributeNotEmpty("disabledClassJS")>disabledClass: #attributes.disabledClassJS#,</cfif>
		<cfif AttributeNotEmpty("enableToggle")>enableToggle: #attributes.enableToggle#,</cfif>
		<cfif AttributeNotEmpty("fieldLabel")>fieldLabel: "#JSStringFormat(attributes.fieldLabel)#",</cfif>
		<cfif AttributeNotEmpty("fieldLabelJS")>fieldLabel: #attributes.fieldLabelJS#,</cfif>
		<cfif AttributeNotEmpty("handleMouseEvents")>handleMouseEvents: #attributes.handleMouseEvents#,</cfif>
		<cfif AttributeNotEmpty("handler")>handler: #attributes.handler#,</cfif>
		<cfif AttributeNotEmpty("hidden")>hidden: #attributes.hidden#,</cfif>
		<cfif AttributeNotEmpty("hideLabel")>hideLabel: #attributes.hideLabel#,</cfif>
		<cfif AttributeNotEmpty("hideMode")>hideMode: "#JSStringFormat(attributes.hideMode)#",</cfif>
		<cfif AttributeNotEmpty("hideModeJS")>hideMode: #attributes.hideModeJS#,</cfif>
		<cfif AttributeNotEmpty("hideParent")>hideParent: #attributes.hideParent#,</cfif>
		<cfif AttributeNotEmpty("icon")>icon: "#JSStringFormat(attributes.icon)#",</cfif>
		<cfif AttributeNotEmpty("iconJS")>icon: #attributes.iconJS#,</cfif>
		<cfif AttributeNotEmpty("iconCls")>iconCls: "#JSStringFormat(attributes.iconCls)#",</cfif>
		<cfif AttributeNotEmpty("iconClsJS")>iconCls: #attributes.iconClsJS#,</cfif>
		<cfif AttributeNotEmpty("id")>id: "#JSStringFormat(attributes.id)#",</cfif>
		<cfif AttributeNotEmpty("idJS")>id: #attributes.idJS#,</cfif>
		<cfif AttributeNotEmpty("itemCls")>itemCls: "#JSStringFormat(attributes.itemCls)#",</cfif>
		<cfif AttributeNotEmpty("itemClsJS")>itemCls: #attributes.itemClsJS#,</cfif>
		<cfif AttributeNotEmpty("labelSeparator")>labelSeparator: "#JSStringFormat(attributes.labelSeparator)#",</cfif>
		<cfif AttributeNotEmpty("labelSeparatorJS")>labelSeparator: #attributes.labelSeparatorJS#,</cfif>
		<cfif AttributeNotEmpty("labelStyle")>labelStyle: "#JSStringFormat(attributes.labelStyle)#",</cfif>
		<cfif AttributeNotEmpty("labelStyleJS")>labelStyle: #attributes.labelStyleJS#,</cfif>
		<cfif AttributeNotEmpty("listeners")>listeners: #attributes.listeners#,</cfif>
		<cfif AttributeNotEmpty("menu")>menu: "#JSStringFormat(attributes.menu)#",</cfif>
		<cfif AttributeNotEmpty("menuJS")>menu: #attributes.menuJS#,</cfif>
		<cfif AttributeNotEmpty("menuAlign")>menuAlign: "#JSStringFormat(attributes.menuAlign)#",</cfif>
		<cfif AttributeNotEmpty("menuAlignJS")>menuAlign: #attributes.menuAlignJS#,</cfif>
		<cfif AttributeNotEmpty("minWidth")>minWidth: #attributes.minWidth#,</cfif>
		<cfif AttributeNotEmpty("overCls")>overCls: "#JSStringFormat(attributes.overCls)#",</cfif>
		<cfif AttributeNotEmpty("overClsJS")>overCls: #attributes.overClsJS#,</cfif>
		<cfif AttributeNotEmpty("plugins")>plugins: #attributes.plugins#,</cfif>
		<cfif AttributeNotEmpty("pressed")>pressed: #attributes.pressed#,</cfif>
		<cfif AttributeNotEmpty("renderTo")>renderTo: "#JSStringFormat(attributes.renderTo)#",</cfif>
		<cfif AttributeNotEmpty("renderToJS")>renderTo: #attributes.renderToJS#,</cfif>
		<cfif AttributeNotEmpty("repeat")>repeat: #attributes.repeat#,</cfif>
		<cfif AttributeNotEmpty("scope")>scope: #attributes.scope#,</cfif>
		<cfif AttributeNotEmpty("stateEvents")>stateEvents: #attributes.stateEvents#,</cfif>
		<cfif AttributeNotEmpty("stateId")>stateId: "#JSStringFormat(attributes.stateId)#",</cfif>
		<cfif AttributeNotEmpty("stateIdJS")>stateId: #attributes.stateIdJS#,</cfif>
		<cfif AttributeNotEmpty("stateful")>stateful: #attributes.stateful#,</cfif>
		<cfif AttributeNotEmpty("style")>style: "#JSStringFormat(attributes.style)#",</cfif>
		<cfif AttributeNotEmpty("styleJS")>style: #attributes.styleJS#,</cfif>
		<cfif AttributeNotEmpty("tabIndex")>tabIndex: #attributes.tabIndex#,</cfif>
		<cfif AttributeNotEmpty("template")>template: #attributes.template#,</cfif>
		<cfif AttributeNotEmpty("text")>text: "#JSStringFormat(attributes.text)#",</cfif>
		<cfif AttributeNotEmpty("textJS")>text: #attributes.textJS#,</cfif>
		<cfif AttributeNotEmpty("toggleGroup")>toggleGroup: "#JSStringFormat(attributes.toggleGroup)#",</cfif>
		<cfif AttributeNotEmpty("toggleGroupJS")>toggleGroup: #attributes.toggleGroupJS#,</cfif>
		<cfif AttributeNotEmpty("toggleHandler")>toggleHandler: #attributes.toggleHandler#,</cfif>
		<cfif AttributeNotEmpty("tooltip")>tooltip: "#JSStringFormat(attributes.tooltip)#",</cfif>
		<cfif AttributeNotEmpty("tooltipJS")>tooltip: #attributes.tooltipJS#,</cfif>
		<cfif AttributeNotEmpty("tooltipType")>tooltipType: "#JSStringFormat(attributes.tooltipType)#",</cfif>
		<cfif AttributeNotEmpty("tooltipTypeJS")>tooltipType: #attributes.tooltipTypeJS#,</cfif>
		<cfif AttributeNotEmpty("type")>type: "#JSStringFormat(attributes.type)#",</cfif>
		<cfif AttributeNotEmpty("typeJS")>type: #attributes.typeJS#,</cfif>
		<cfif AttributeNotEmpty("xtype")>xtype: "#JSStringFormat(attributes.xtype)#",</cfif>
		<cfif AttributeNotEmpty("xtypeJS")>xtype: #attributes.xtypeJS#,</cfif>

		<cfif AttributeNotEmpty("passThrough")>#attributes.passThrough#,</cfif>

		<cfif arrayLen(thisTag.handler)>handler: #thisTag.handler[1]._out#,</cfif>
		<cfif arrayLen(thisTag.listeners)>listeners: { #ArrayKeyToList(thisTag.listeners, "_out")# },</cfif>
		<cfif arrayLen(thisTag.menu)>menu: #thisTag.menu[1]._out#,</cfif>
		<cfif arrayLen(thisTag.tooltip)>tooltip: #thisTag.tooltip[1]._out#,</cfif>

		<!--- TODO: review this --->
		<cfif AttributeNotEmpty("icon")>
			icon: "#attributes.icon#",
			<cfif AttributeNotEmpty("text")>
				<cfset attributes.cls = trim("x-btn-text-icon " & attributes.cls)>
			<cfelse>
				<cfset attributes.cls = trim("x-btn-icon " & attributes.cls)>
			</cfif>
		</cfif>
		<cfif attributes.cls neq "">cls: "#attributes.cls#",</cfif>

		dummy: true
	})<cfif AttributeNotEmpty("var")>;</cfif>
</cfoutput>
</cfprocessingdirective>
</cfsavecontent>

<cfassociate basetag="#parentTag#" datacollection="items">


</cfif>


<cfsetting enablecfoutputonly="false">