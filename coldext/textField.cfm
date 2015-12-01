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
<cfparam name="attributes.name" default="textField#Int(Rand()*1000)#">
<cfparam name="attributes.label" default="#SeparateCaps(attributes.name)#">
<cfparam name="attributes.fieldLabel" default="#attributes.label#">
<cfparam name="attributes.width" default="#Application.ColdExt.defaultFieldWidth#">

<!--- attributes --->
<cfparam name="attributes.allowBlank" default=""><!--- @@type: Boolean @@help: False to validate that the value length > 0 (defaults to true) --->
<cfparam name="attributes.allowDomMove" default=""><!--- @@type: Boolean @@help: Whether the component can move the Dom node when rendering (defaults to true). --->
<cfparam name="attributes.applyTo" default=""><!--- @@type: String @@help: The id of the node, a DOM node or an existing Element corresponding to a DIV that is already present in the document that specifies some structural markup for this component. When applyTo is used, constituent parts of the component can also be specified by id or CSS class name within the main element, and the component being created may attempt to create its subcomponents from that markup if applicable. Using this config, a call to render() is not required. If applyTo is specified, any value passed for renderTo will be ignored and the target element's parent node will automatically be used as the component's container. --->
<cfparam name="attributes.applyToJS" default=""><!--- @@type: Mixed @@help: The id of the node, a DOM node or an existing Element corresponding to a DIV that is already present in the document that specifies some structural markup for this component. When applyTo is used, constituent parts of the component can also be specified by id or CSS class name within the main element, and the component being created may attempt to create its subcomponents from that markup if applicable. Using this config, a call to render() is not required. If applyTo is specified, any value passed for renderTo will be ignored and the target element's parent node will automatically be used as the component's container. --->
<cfparam name="attributes.autoCreate" default=""><!--- @@type: String @@help: A DomHelper element spec, or true for a default element spec (defaults to {tag: "input", type: "text", size: "20", autocomplete: "off"}) --->
<cfparam name="attributes.autoCreateJS" default=""><!--- @@type: String/Object @@help: A DomHelper element spec, or true for a default element spec (defaults to {tag: "input", type: "text", size: "20", autocomplete: "off"}) --->
<cfparam name="attributes.autoEl" default=""><!--- @@type: String @@help: A tag name or DomHelper spec to create an element with. This is intended to create shorthand utility components inline via JSON. It should not be used for higher level components which already create their own elements. Example usage: {xtype:'box', autoEl: 'div', cls:'my-class'}{xtype:'box', autoEl: {tag:'blockquote', html:'autoEl is cool!'}} // with DomHelper --->
<cfparam name="attributes.autoElJS" default=""><!--- @@type: String/Object @@help: A tag name or DomHelper spec to create an element with. This is intended to create shorthand utility components inline via JSON. It should not be used for higher level components which already create their own elements. Example usage: {xtype:'box', autoEl: 'div', cls:'my-class'}{xtype:'box', autoEl: {tag:'blockquote', html:'autoEl is cool!'}} // with DomHelper --->
<cfparam name="attributes.autoHeight" default=""><!--- @@type: Boolean @@help: True to use height:'auto', false to use fixed height (defaults to false). Note: Although many components inherit this config option, not all will function as expected with a height of 'auto'. Setting autoHeight:true means that the browser will manage height based on the element's contents, and that Ext will not manage it at all. --->
<cfparam name="attributes.autoShow" default=""><!--- @@type: Boolean @@help: True if the component should check for hidden classes (e.g. 'x-hidden' or 'x-hide-display') and remove them on render (defaults to false). --->
<cfparam name="attributes.autoWidth" default=""><!--- @@type: Boolean @@help: True to use width:'auto', false to use fixed width (defaults to false). Note: Although many components inherit this config option, not all will function as expected with a width of 'auto'. Setting autoWidth:true means that the browser will manage width based on the element's contents, and that Ext will not manage it at all. --->
<cfparam name="attributes.blankText" default=""><!--- @@type: String @@help: Error text to display if the allow blank validation fails (defaults to "This field is required") --->
<cfparam name="attributes.blankTextJS" default=""><!--- @@type: JS @@help: Error text to display if the allow blank validation fails (defaults to "This field is required") --->
<cfparam name="attributes.clearCls" default=""><!--- @@type: String @@help: The CSS class used to provide field clearing (defaults to 'x-form-clear-left'). This config is only used when this Component is rendered by a Container which has been configured to use the FormLayout layout manager. --->
<cfparam name="attributes.clearClsJS" default=""><!--- @@type: JS @@help: The CSS class used to provide field clearing (defaults to 'x-form-clear-left'). This config is only used when this Component is rendered by a Container which has been configured to use the FormLayout layout manager. --->
<cfparam name="attributes.cls" default=""><!--- @@type: String @@help: An optional extra CSS class that will be added to this component's Element (defaults to ''). This can be useful for adding customized styles to the component or any of its children using standard CSS rules. --->
<cfparam name="attributes.clsJS" default=""><!--- @@type: JS @@help: An optional extra CSS class that will be added to this component's Element (defaults to ''). This can be useful for adding customized styles to the component or any of its children using standard CSS rules. --->
<cfparam name="attributes.ctCls" default=""><!--- @@type: String @@help: An optional extra CSS class that will be added to this component's container (defaults to ''). This can be useful for adding customized styles to the container or any of its children using standard CSS rules. --->
<cfparam name="attributes.ctClsJS" default=""><!--- @@type: JS @@help: An optional extra CSS class that will be added to this component's container (defaults to ''). This can be useful for adding customized styles to the container or any of its children using standard CSS rules. --->
<cfparam name="attributes.disableKeyFilter" default=""><!--- @@type: Boolean @@help: True to disable input keystroke filtering (defaults to false) --->
<cfparam name="attributes.disabled" default=""><!--- @@type: Boolean @@help: Render this component disabled (default is false). --->
<cfparam name="attributes.disabledClass" default=""><!--- @@type: String @@help: CSS class added to the component when it is disabled (defaults to "x-item-disabled"). --->
<cfparam name="attributes.disabledClassJS" default=""><!--- @@type: JS @@help: CSS class added to the component when it is disabled (defaults to "x-item-disabled"). --->
<cfparam name="attributes.emptyClass" default=""><!--- @@type: String @@help: The CSS class to apply to an empty field to style the emptyText (defaults to 'x-form-empty-field'). This class is automatically added and removed as needed depending on the current field value. --->
<cfparam name="attributes.emptyClassJS" default=""><!--- @@type: JS @@help: The CSS class to apply to an empty field to style the emptyText (defaults to 'x-form-empty-field'). This class is automatically added and removed as needed depending on the current field value. --->
<cfparam name="attributes.emptyText" default=""><!--- @@type: String @@help: The default text to place into an empty field (defaults to null). Note that this value will be submitted to the server if this field is enabled and configured with a name. --->
<cfparam name="attributes.emptyTextJS" default=""><!--- @@type: JS @@help: The default text to place into an empty field (defaults to null). Note that this value will be submitted to the server if this field is enabled and configured with a name. --->
<cfparam name="attributes.fieldClass" default=""><!--- @@type: String @@help: The default CSS class for the field (defaults to "x-form-field") --->
<cfparam name="attributes.fieldClassJS" default=""><!--- @@type: JS @@help: The default CSS class for the field (defaults to "x-form-field") --->
<cfparam name="attributes.fieldLabel" default=""><!--- @@type: String @@help: The label text to display next to this Component (defaults to '') This config is only used when this Component is rendered by a Container which has been configured to use the FormLayout layout manager. Example use:new Ext.FormPanel({    height: 100,    renderTo: Ext.getBody(),    items: [{        xtype: 'textfield',        fieldLabel: 'Name'    }]}); --->
<cfparam name="attributes.fieldLabelJS" default=""><!--- @@type: JS @@help: The label text to display next to this Component (defaults to '') This config is only used when this Component is rendered by a Container which has been configured to use the FormLayout layout manager. Example use:new Ext.FormPanel({    height: 100,    renderTo: Ext.getBody(),    items: [{        xtype: 'textfield',        fieldLabel: 'Name'    }]}); --->
<cfparam name="attributes.focusClass" default=""><!--- @@type: String @@help: The CSS class to use when the field receives focus (defaults to "x-form-focus") --->
<cfparam name="attributes.focusClassJS" default=""><!--- @@type: JS @@help: The CSS class to use when the field receives focus (defaults to "x-form-focus") --->
<cfparam name="attributes.grow" default=""><!--- @@type: Boolean @@help: True if this field should automatically grow and shrink to its content --->
<cfparam name="attributes.growMax" default=""><!--- @@type: Number @@help: The maximum width to allow when grow = true (defaults to 800) --->
<cfparam name="attributes.growMin" default=""><!--- @@type: Number @@help: The minimum width to allow when grow = true (defaults to 30) --->
<cfparam name="attributes.height" default=""><!--- @@type: Number @@help: The height of this component in pixels (defaults to auto). --->
<cfparam name="attributes.hidden" default=""><!--- @@type: Boolean @@help: Render this component hidden (default is false). --->
<cfparam name="attributes.hideLabel" default=""><!--- @@type: Boolean @@help: True to completely hide the label element (defaults to false). By default, even if you do not specify a fieldLabel the space will still be reserved so that the field will line up with other fields that do have labels. Setting this to true will cause the field to not reserve that space. This config is only used when this Component is rendered by a Container which has been configured to use the FormLayout layout manager. Example use:new Ext.FormPanel({    height: 100,    renderTo: Ext.getBody(),    items: [{        xtype: 'textfield'        hideLabel: true    }]}); --->
<cfparam name="attributes.hideMode" default=""><!--- @@type: String @@help: How this component should be hidden. Supported values are "visibility" (css visibility), "offsets" (negative offset position) and "display" (css display) - defaults to "display". For Containers which may be hidden and shown as part of a card layout Container such as a TabPanel, it is recommended that hideMode is configured as "offsets". This ensures that hidden Components still have height and width so that layout managers can perform measurements when calculating layouts. --->
<cfparam name="attributes.hideModeJS" default=""><!--- @@type: JS @@help: How this component should be hidden. Supported values are "visibility" (css visibility), "offsets" (negative offset position) and "display" (css display) - defaults to "display". For Containers which may be hidden and shown as part of a card layout Container such as a TabPanel, it is recommended that hideMode is configured as "offsets". This ensures that hidden Components still have height and width so that layout managers can perform measurements when calculating layouts. --->
<cfparam name="attributes.hideParent" default=""><!--- @@type: Boolean @@help: True to hide and show the component's container when hide/show is called on the component, false to hide and show the component itself (defaults to false). For example, this can be used as a shortcut for a hide button on a window by setting hide:true on the button when adding it to its parent container. --->
<cfparam name="attributes.id" default=""><!--- @@type: String @@help: The unique id of this component (defaults to an auto-assigned id). You should assign an id if you need to be able to access the component later and you do not have an object reference available (e.g., using Ext.ComponentMgr.getCmp). Note that this id will also be used as the element id for the containing HTML element that is rendered to the page for this component. This allows you to write id-based CSS rules to style the specific instance of this component uniquely, and also to select sub-elements using this component's id as the parent. --->
<cfparam name="attributes.idJS" default=""><!--- @@type: JS @@help: The unique id of this component (defaults to an auto-assigned id). You should assign an id if you need to be able to access the component later and you do not have an object reference available (e.g., using Ext.ComponentMgr.getCmp). Note that this id will also be used as the element id for the containing HTML element that is rendered to the page for this component. This allows you to write id-based CSS rules to style the specific instance of this component uniquely, and also to select sub-elements using this component's id as the parent. --->
<cfparam name="attributes.inputType" default=""><!--- @@type: String @@help: The type attribute for input fields -- e.g. radio, text, password, file (defaults to "text"). The types "file" and "password" must be used to render those field types currently -- there are no separate Ext components for those. Note that if you use inputType:'file', emptyText is not supported and should be avoided. --->
<cfparam name="attributes.inputTypeJS" default=""><!--- @@type: JS @@help: The type attribute for input fields -- e.g. radio, text, password, file (defaults to "text"). The types "file" and "password" must be used to render those field types currently -- there are no separate Ext components for those. Note that if you use inputType:'file', emptyText is not supported and should be avoided. --->
<cfparam name="attributes.invalidClass" default=""><!--- @@type: String @@help: The CSS class to use when marking a field invalid (defaults to "x-form-invalid") --->
<cfparam name="attributes.invalidClassJS" default=""><!--- @@type: JS @@help: The CSS class to use when marking a field invalid (defaults to "x-form-invalid") --->
<cfparam name="attributes.invalidText" default=""><!--- @@type: String @@help: The error text to use when marking a field invalid and no message is provided (defaults to "The value in this field is invalid") --->
<cfparam name="attributes.invalidTextJS" default=""><!--- @@type: JS @@help: The error text to use when marking a field invalid and no message is provided (defaults to "The value in this field is invalid") --->
<cfparam name="attributes.itemCls" default=""><!--- @@type: String @@help: An additional CSS class to apply to the wrapper's form item element of this field (defaults to the container's itemCls value if set, or ''). Since it is applied to the item wrapper, it allows you to write standard CSS rules that can apply to the field, the label (if specified) or any other element within the markup for the field. This config is only used when this Component is rendered by a Container which has been configured to use the FormLayout layout manager. Example use:// Apply a style to the field's label:    .required .x-form-item-label {font-weight:bold;color:red;}new Ext.FormPanel({    height: 100,    renderTo: Ext.getBody(),    items: [{        xtype: 'textfield',        fieldLabel: 'Name',        itemCls: 'required' //this label will be styled    },{        xtype: 'textfield',        fieldLabel: 'Favorite Color'    }]}); --->
<cfparam name="attributes.itemClsJS" default=""><!--- @@type: JS @@help: An additional CSS class to apply to the wrapper's form item element of this field (defaults to the container's itemCls value if set, or ''). Since it is applied to the item wrapper, it allows you to write standard CSS rules that can apply to the field, the label (if specified) or any other element within the markup for the field. This config is only used when this Component is rendered by a Container which has been configured to use the FormLayout layout manager. Example use:// Apply a style to the field's label:    .required .x-form-item-label {font-weight:bold;color:red;}new Ext.FormPanel({    height: 100,    renderTo: Ext.getBody(),    items: [{        xtype: 'textfield',        fieldLabel: 'Name',        itemCls: 'required' //this label will be styled    },{        xtype: 'textfield',        fieldLabel: 'Favorite Color'    }]}); --->
<cfparam name="attributes.labelSeparator" default=""><!--- @@type: String @@help: The standard separator to display after the text of each form label (defaults to the value of Ext.layout.FormLayout.labelSeparator, which is a colon ':' by default). To display no separator for this field's label specify empty string ''. This config is only used when this Component is rendered by a Container which has been configured to use the FormLayout layout manager. Example use:new Ext.FormPanel({    height: 100,    renderTo: Ext.getBody(),    items: [{        xtype: 'textfield',        fieldLabel: 'Name',        labelSeparator: '...'    }]}); --->
<cfparam name="attributes.labelSeparatorJS" default=""><!--- @@type: JS @@help: The standard separator to display after the text of each form label (defaults to the value of Ext.layout.FormLayout.labelSeparator, which is a colon ':' by default). To display no separator for this field's label specify empty string ''. This config is only used when this Component is rendered by a Container which has been configured to use the FormLayout layout manager. Example use:new Ext.FormPanel({    height: 100,    renderTo: Ext.getBody(),    items: [{        xtype: 'textfield',        fieldLabel: 'Name',        labelSeparator: '...'    }]}); --->
<cfparam name="attributes.labelStyle" default=""><!--- @@type: String @@help: A CSS style specification to apply directly to this field's label (defaults to the container's labelStyle value if set, or '').. This config is only used when this Component is rendered by a Container which has been configured to use the FormLayout layout manager. Example use:new Ext.FormPanel({    height: 100,    renderTo: Ext.getBody(),    items: [{        xtype: 'textfield',        fieldLabel: 'Name',        labelStyle: 'font-weight:bold;'    }]}); --->
<cfparam name="attributes.labelStyleJS" default=""><!--- @@type: JS @@help: A CSS style specification to apply directly to this field's label (defaults to the container's labelStyle value if set, or '').. This config is only used when this Component is rendered by a Container which has been configured to use the FormLayout layout manager. Example use:new Ext.FormPanel({    height: 100,    renderTo: Ext.getBody(),    items: [{        xtype: 'textfield',        fieldLabel: 'Name',        labelStyle: 'font-weight:bold;'    }]}); --->
<cfparam name="attributes.listeners" default=""><!--- @@type: Object @@help: (optional) A config object containing one or more event handlers to be added to this object during initialization. This should be a valid listeners config object as specified in the addListener example for attaching multiple handlers at once. --->
<cfparam name="attributes.maskRe" default=""><!--- @@type: RegExp @@help: An input mask regular expression that will be used to filter keystrokes that don't match (defaults to null) --->
<cfparam name="attributes.maxLength" default=""><!--- @@type: Number @@help: Maximum input field length allowed (defaults to Number.MAX_VALUE) --->
<cfparam name="attributes.maxLengthText" default=""><!--- @@type: String @@help: Error text to display if the maximum length validation fails (defaults to "The maximum length for this field is {maxLength}") --->
<cfparam name="attributes.maxLengthTextJS" default=""><!--- @@type: JS @@help: Error text to display if the maximum length validation fails (defaults to "The maximum length for this field is {maxLength}") --->
<cfparam name="attributes.minLength" default=""><!--- @@type: Number @@help: Minimum input field length required (defaults to 0) --->
<cfparam name="attributes.minLengthText" default=""><!--- @@type: String @@help: Error text to display if the minimum length validation fails (defaults to "The minimum length for this field is {minLength}") --->
<cfparam name="attributes.minLengthTextJS" default=""><!--- @@type: JS @@help: Error text to display if the minimum length validation fails (defaults to "The minimum length for this field is {minLength}") --->
<cfparam name="attributes.msgFx" default=""><!--- @@type: String @@help: Experimental The effect used when displaying a validation message under the field (defaults to 'normal'). --->
<cfparam name="attributes.msgFxJS" default=""><!--- @@type: JS @@help: Experimental The effect used when displaying a validation message under the field (defaults to 'normal'). --->
<cfparam name="attributes.msgTarget" default=""><!--- @@type: String @@help: The location where error text should display. Should be one of the following values (defaults to 'qtip'): Value         Description-----------   ----------------------------------------------------------------------qtip          Display a quick tip when the user hovers over the fieldtitle         Display a default browser title attribute popupunder         Add a block div beneath the field containing the error textside          Add an error icon to the right of the field with a popup on hover[element id]  Add the error text directly to the innerHTML of the specified element --->
<cfparam name="attributes.msgTargetJS" default=""><!--- @@type: JS @@help: The location where error text should display. Should be one of the following values (defaults to 'qtip'): Value         Description-----------   ----------------------------------------------------------------------qtip          Display a quick tip when the user hovers over the fieldtitle         Display a default browser title attribute popupunder         Add a block div beneath the field containing the error textside          Add an error icon to the right of the field with a popup on hover[element id]  Add the error text directly to the innerHTML of the specified element --->
<cfparam name="attributes.name" default=""><!--- @@type: String @@help: The field's HTML name attribute (defaults to ""). --->
<cfparam name="attributes.nameJS" default=""><!--- @@type: JS @@help: The field's HTML name attribute (defaults to ""). --->
<cfparam name="attributes.overCls" default=""><!--- @@type: String @@help: An optional extra CSS class that will be added to this component's Element when the mouse moves over the Element, and removed when the mouse moves out. (defaults to ''). This can be useful for adding customized "active" or "hover" styles to the component or any of its children using standard CSS rules. --->
<cfparam name="attributes.overClsJS" default=""><!--- @@type: JS @@help: An optional extra CSS class that will be added to this component's Element when the mouse moves over the Element, and removed when the mouse moves out. (defaults to ''). This can be useful for adding customized "active" or "hover" styles to the component or any of its children using standard CSS rules. --->
<cfparam name="attributes.pageX" default=""><!--- @@type: Number @@help: The page level x coordinate for this component if contained within a positioning container. --->
<cfparam name="attributes.pageY" default=""><!--- @@type: Number @@help: The page level y coordinate for this component if contained within a positioning container. --->
<cfparam name="attributes.plugins" default=""><!--- @@type: Object/Array @@help: An object or array of objects that will provide custom functionality for this component. The only requirement for a valid plugin is that it contain an init method that accepts a reference of type Ext.Component. When a component is created, if any plugins are available, the component will call the init method on each plugin, passing a reference to itself. Each plugin can then call methods or respond to events on the component as needed to provide its functionality. --->
<cfparam name="attributes.readOnly" default=""><!--- @@type: Boolean @@help: True to mark the field as readOnly in HTML (defaults to false) -- Note: this only sets the element's readOnly DOM attribute. --->
<cfparam name="attributes.regex" default=""><!--- @@type: RegExp @@help: A JavaScript RegExp object to be tested against the field value during validation (defaults to null). If available, this regex will be evaluated only after the basic validators all return true, and will be passed the current field value. If the test fails, the field will be marked invalid using regexText. --->
<cfparam name="attributes.regexText" default=""><!--- @@type: String @@help: The error text to display if regex is used and the test fails during validation (defaults to "") --->
<cfparam name="attributes.regexTextJS" default=""><!--- @@type: JS @@help: The error text to display if regex is used and the test fails during validation (defaults to "") --->
<cfparam name="attributes.renderTo" default=""><!--- @@type: String @@help: The id of the node, a DOM node or an existing Element that will be the container to render this component into. Using this config, a call to render() is not required. --->
<cfparam name="attributes.renderToJS" default=""><!--- @@type: Mixed @@help: The id of the node, a DOM node or an existing Element that will be the container to render this component into. Using this config, a call to render() is not required. --->
<cfparam name="attributes.selectOnFocus" default=""><!--- @@type: Boolean @@help: True to automatically select any existing field text when the field receives input focus (defaults to false) --->
<cfparam name="attributes.stateEvents" default=""><!--- @@type: Array @@help: An array of events that, when fired, should trigger this component to save its state (defaults to none). These can be any types of events supported by this component, including browser or custom events (e.g., ['click', 'customerchange']). See stateful for an explanation of saving and restoring Component state. --->
<cfparam name="attributes.stateId" default=""><!--- @@type: String @@help: The unique id for this component to use for state management purposes (defaults to the component id if one was set, otherwise null if the component is using a generated id). See stateful for an explanation of saving and restoring Component state. --->
<cfparam name="attributes.stateIdJS" default=""><!--- @@type: JS @@help: The unique id for this component to use for state management purposes (defaults to the component id if one was set, otherwise null if the component is using a generated id). See stateful for an explanation of saving and restoring Component state. --->
<cfparam name="attributes.stateful" default=""><!--- @@type: Boolean @@help: A flag which causes the Component to attempt to restore the state of internal properties from a saved state on startup. The component must have either a stateId or id assigned for state to be managed. Auto-generated ids are not guaranteed to be stable across page loads and cannot be relied upon to save and restore the same state for a component. For state saving to work, the state manager's provider must have been set to an implementation of Ext.state.Provider which overrides the set and get methods to save and recall name/value pairs. A built-in implementation, Ext.state.CookieProvider is available. To set the state provider for the current page: Ext.state.Manager.setProvider(new Ext.state.CookieProvider()); Components attempt to save state when one of the events listed in the stateEvents configuration fires. You can perform extra processing on state save and restore by attaching handlers to the beforestaterestore, staterestore, beforestatesave and statesave events --->
<cfparam name="attributes.stripCharsRe" default=""><!--- @@type: RegExp @@help: A JavaScript RegExp object used to strip unwanted content from the value before validation (defaults to null). --->
<cfparam name="attributes.style" default=""><!--- @@type: String @@help: A custom style specification to be applied to this component's Element. Should be a valid argument to Ext.Element.applyStyles. --->
<cfparam name="attributes.styleJS" default=""><!--- @@type: JS @@help: A custom style specification to be applied to this component's Element. Should be a valid argument to Ext.Element.applyStyles. --->
<cfparam name="attributes.tabIndex" default=""><!--- @@type: Number @@help: The tabIndex for this field. Note this only applies to fields that are rendered, not those which are built via applyTo (defaults to undefined). --->
<cfparam name="attributes.validateOnBlur" default=""><!--- @@type: Boolean @@help: Whether the field should validate when it loses focus (defaults to true). --->
<cfparam name="attributes.validationDelay" default=""><!--- @@type: Number @@help: The length of time in milliseconds after user input begins until validation is initiated (defaults to 250) --->
<cfparam name="attributes.validationEvent" default=""><!--- @@type: String @@help: The event that should initiate field validation. Set to false to disable automatic validation (defaults to "keyup"). --->
<cfparam name="attributes.validationEventJS" default=""><!--- @@type: String/Boolean @@help: The event that should initiate field validation. Set to false to disable automatic validation (defaults to "keyup"). --->
<cfparam name="attributes.validator" default=""><!--- @@type: Function @@help: A custom validation function to be called during field validation (defaults to null). If specified, this function will be called only after the built-in validations (allowBlank, minLength, maxLength) and any configured vtype all return true. This function will be passed the current field value and expected to return boolean true if the value is valid or a string error message if invalid. --->
<cfparam name="attributes.value" default=""><!--- @@type: String @@help: A value to initialize this field with (defaults to undefined). --->
<cfparam name="attributes.valueJS" default=""><!--- @@type: Mixed @@help: A value to initialize this field with (defaults to undefined). --->
<cfparam name="attributes.vtype" default=""><!--- @@type: String @@help: A validation type name as defined in Ext.form.VTypes (defaults to null) --->
<cfparam name="attributes.vtypeJS" default=""><!--- @@type: JS @@help: A validation type name as defined in Ext.form.VTypes (defaults to null) --->
<cfparam name="attributes.vtypeText" default=""><!--- @@type: String @@help: A custom error message to display in place of the default message provided for the vtype currently set for this field (defaults to ''). Only applies if vtype is set, else ignored. --->
<cfparam name="attributes.vtypeTextJS" default=""><!--- @@type: JS @@help: A custom error message to display in place of the default message provided for the vtype currently set for this field (defaults to ''). Only applies if vtype is set, else ignored. --->
<cfparam name="attributes.width" default=""><!--- @@type: Number @@help: The width of this component in pixels (defaults to auto). --->
<cfparam name="attributes.x" default=""><!--- @@type: Number @@help: The local x (left) coordinate for this component if contained within a positioning container. --->
<cfparam name="attributes.xtype" default=""><!--- @@type: String @@help: The registered xtype to create. This config option is not used when passing a config object into a constructor. This config option is used only when lazy instantiation is being used, and a child item of a Container is being specified not as a fully instantiated Component, but as a Component config object. The xtype will be looked up at render time up to determine what type of child Component to create. The predefined xtypes are listed here.  If you subclass Components to create your own Components, you may register them using Ext.ComponentMgr.registerType in order to be able to take advantage of lazy instantiation and rendering. --->
<cfparam name="attributes.xtypeJS" default=""><!--- @@type: JS @@help: The registered xtype to create. This config option is not used when passing a config object into a constructor. This config option is used only when lazy instantiation is being used, and a child item of a Container is being specified not as a fully instantiated Component, but as a Component config object. The xtype will be looked up at render time up to determine what type of child Component to create. The predefined xtypes are listed here.  If you subclass Components to create your own Components, you may register them using Ext.ComponentMgr.registerType in order to be able to take advantage of lazy instantiation and rendering. --->
<cfparam name="attributes.y" default=""><!--- @@type: Number @@help: The local y (top) coordinate for this component if contained within a positioning container. --->

<!--- custom attributes --->
<cfparam name="attributes.passThrough" default=""><!--- @@type: JS @@help: (ColdExt attribute) A comma separated list of JavaScript name:value pairs that will be written directly to the Ext component config. This is useful for storing custom properties in Ext components. --->
<cfparam name="attributes.var" default=""><!--- @@type: JS Variable Name @@help: (ColdExt attribute) The JavaScript variable name that this component will be assigned to. NOTE: You should only use the var attribute when this tags parent is the onReady tag. --->
<cfparam name="attributes.anchor" default=""><!--- TODO: missing from docs? --->
<cfparam name="attributes.required" default="">



<!--- arrays that may be populated by nested tags --->
<cfset thisTag.listeners = ArrayNew(1)>

<!--- process custom attributes --->
<!--- var --->
<cfset attributes.var = validateVarAttribute(parentTag)>



</cfif>


<cfif thisTag.executionMode eq "end" OR NOT thisTag.hasEndTag>

<!--- determine data collection to use for cfassociate --->
<cfset _collection = "items">
<cfif ListFind("CF_GRIDCOLUMN", parentTag)>
	<cfset _collection = "editor">
</cfif>


<cfsavecontent variable="attributes._out">
<cfprocessingdirective suppresswhitespace="true">
<cfoutput>
	<cfif AttributeNotEmpty("var")>var #attributes.var# = </cfif>new Ext.form.TextField({
		<cfif AttributeNotEmpty("allowBlank")>allowBlank: #attributes.allowBlank#,</cfif>
		<cfif AttributeNotEmpty("allowDomMove")>allowDomMove: #attributes.allowDomMove#,</cfif>
		<cfif AttributeNotEmpty("applyTo")>applyTo: "#JSStringFormat(attributes.applyTo)#",</cfif>
		<cfif AttributeNotEmpty("applyToJS")>applyTo: #attributes.applyToJS#,</cfif>
		<cfif AttributeNotEmpty("autoCreate")>autoCreate: "#JSStringFormat(attributes.autoCreate)#",</cfif>
		<cfif AttributeNotEmpty("autoCreateJS")>autoCreate: #attributes.autoCreateJS#,</cfif>
		<cfif AttributeNotEmpty("autoEl")>autoEl: "#JSStringFormat(attributes.autoEl)#",</cfif>
		<cfif AttributeNotEmpty("autoElJS")>autoEl: #attributes.autoElJS#,</cfif>
		<cfif AttributeNotEmpty("autoHeight")>autoHeight: #attributes.autoHeight#,</cfif>
		<cfif AttributeNotEmpty("autoShow")>autoShow: #attributes.autoShow#,</cfif>
		<cfif AttributeNotEmpty("autoWidth")>autoWidth: #attributes.autoWidth#,</cfif>
		<cfif AttributeNotEmpty("blankText")>blankText: "#JSStringFormat(attributes.blankText)#",</cfif>
		<cfif AttributeNotEmpty("blankTextJS")>blankText: #attributes.blankTextJS#,</cfif>
		<cfif AttributeNotEmpty("clearCls")>clearCls: "#JSStringFormat(attributes.clearCls)#",</cfif>
		<cfif AttributeNotEmpty("clearClsJS")>clearCls: #attributes.clearClsJS#,</cfif>
		<cfif AttributeNotEmpty("cls")>cls: "#JSStringFormat(attributes.cls)#",</cfif>
		<cfif AttributeNotEmpty("clsJS")>cls: #attributes.clsJS#,</cfif>
		<cfif AttributeNotEmpty("ctCls")>ctCls: "#JSStringFormat(attributes.ctCls)#",</cfif>
		<cfif AttributeNotEmpty("ctClsJS")>ctCls: #attributes.ctClsJS#,</cfif>
		<cfif AttributeNotEmpty("disableKeyFilter")>disableKeyFilter: #attributes.disableKeyFilter#,</cfif>
		<cfif AttributeNotEmpty("disabled")>disabled: #attributes.disabled#,</cfif>
		<cfif AttributeNotEmpty("disabledClass")>disabledClass: "#JSStringFormat(attributes.disabledClass)#",</cfif>
		<cfif AttributeNotEmpty("disabledClassJS")>disabledClass: #attributes.disabledClassJS#,</cfif>
		<cfif AttributeNotEmpty("emptyClass")>emptyClass: "#JSStringFormat(attributes.emptyClass)#",</cfif>
		<cfif AttributeNotEmpty("emptyClassJS")>emptyClass: #attributes.emptyClassJS#,</cfif>
		<cfif AttributeNotEmpty("emptyText")>emptyText: "#JSStringFormat(attributes.emptyText)#",</cfif>
		<cfif AttributeNotEmpty("emptyTextJS")>emptyText: #attributes.emptyTextJS#,</cfif>
		<cfif AttributeNotEmpty("fieldClass")>fieldClass: "#JSStringFormat(attributes.fieldClass)#",</cfif>
		<cfif AttributeNotEmpty("fieldClassJS")>fieldClass: #attributes.fieldClassJS#,</cfif>
		<cfif AttributeNotEmpty("fieldLabel")>fieldLabel: "#JSStringFormat(attributes.fieldLabel)#",</cfif>
		<cfif AttributeNotEmpty("fieldLabelJS")>fieldLabel: #attributes.fieldLabelJS#,</cfif>
		<cfif AttributeNotEmpty("focusClass")>focusClass: "#JSStringFormat(attributes.focusClass)#",</cfif>
		<cfif AttributeNotEmpty("focusClassJS")>focusClass: #attributes.focusClassJS#,</cfif>
		<cfif AttributeNotEmpty("grow")>grow: #attributes.grow#,</cfif>
		<cfif AttributeNotEmpty("growMax")>growMax: #attributes.growMax#,</cfif>
		<cfif AttributeNotEmpty("growMin")>growMin: #attributes.growMin#,</cfif>
		<cfif AttributeNotEmpty("height")>height: #attributes.height#,</cfif>
		<cfif AttributeNotEmpty("hidden")>hidden: #attributes.hidden#,</cfif>
		<cfif AttributeNotEmpty("hideLabel")>hideLabel: #attributes.hideLabel#,</cfif>
		<cfif AttributeNotEmpty("hideMode")>hideMode: "#JSStringFormat(attributes.hideMode)#",</cfif>
		<cfif AttributeNotEmpty("hideModeJS")>hideMode: #attributes.hideModeJS#,</cfif>
		<cfif AttributeNotEmpty("hideParent")>hideParent: #attributes.hideParent#,</cfif>
		<cfif AttributeNotEmpty("id")>id: "#JSStringFormat(attributes.id)#",</cfif>
		<cfif AttributeNotEmpty("idJS")>id: #attributes.idJS#,</cfif>
		<cfif AttributeNotEmpty("inputType")>inputType: "#JSStringFormat(attributes.inputType)#",</cfif>
		<cfif AttributeNotEmpty("inputTypeJS")>inputType: #attributes.inputTypeJS#,</cfif>
		<cfif AttributeNotEmpty("invalidClass")>invalidClass: "#JSStringFormat(attributes.invalidClass)#",</cfif>
		<cfif AttributeNotEmpty("invalidClassJS")>invalidClass: #attributes.invalidClassJS#,</cfif>
		<cfif AttributeNotEmpty("invalidText")>invalidText: "#JSStringFormat(attributes.invalidText)#",</cfif>
		<cfif AttributeNotEmpty("invalidTextJS")>invalidText: #attributes.invalidTextJS#,</cfif>
		<cfif AttributeNotEmpty("itemCls")>itemCls: "#JSStringFormat(attributes.itemCls)#",</cfif>
		<cfif AttributeNotEmpty("itemClsJS")>itemCls: #attributes.itemClsJS#,</cfif>
		<cfif AttributeNotEmpty("labelSeparator")>labelSeparator: "#JSStringFormat(attributes.labelSeparator)#",</cfif>
		<cfif AttributeNotEmpty("labelSeparatorJS")>labelSeparator: #attributes.labelSeparatorJS#,</cfif>
		<cfif AttributeNotEmpty("labelStyle")>labelStyle: "#JSStringFormat(attributes.labelStyle)#",</cfif>
		<cfif AttributeNotEmpty("labelStyleJS")>labelStyle: #attributes.labelStyleJS#,</cfif>
		<cfif AttributeNotEmpty("listeners")>listeners: #attributes.listeners#,</cfif>
		<cfif AttributeNotEmpty("maskRe")>maskRe: #attributes.maskRe#,</cfif>
		<cfif AttributeNotEmpty("maxLength")>maxLength: #attributes.maxLength#,</cfif>
		<cfif AttributeNotEmpty("maxLengthText")>maxLengthText: "#JSStringFormat(attributes.maxLengthText)#",</cfif>
		<cfif AttributeNotEmpty("maxLengthTextJS")>maxLengthText: #attributes.maxLengthTextJS#,</cfif>
		<cfif AttributeNotEmpty("minLength")>minLength: #attributes.minLength#,</cfif>
		<cfif AttributeNotEmpty("minLengthText")>minLengthText: "#JSStringFormat(attributes.minLengthText)#",</cfif>
		<cfif AttributeNotEmpty("minLengthTextJS")>minLengthText: #attributes.minLengthTextJS#,</cfif>
		<cfif AttributeNotEmpty("msgFx")>msgFx: "#JSStringFormat(attributes.msgFx)#",</cfif>
		<cfif AttributeNotEmpty("msgFxJS")>msgFx: #attributes.msgFxJS#,</cfif>
		<cfif AttributeNotEmpty("msgTarget")>msgTarget: "#JSStringFormat(attributes.msgTarget)#",</cfif>
		<cfif AttributeNotEmpty("msgTargetJS")>msgTarget: #attributes.msgTargetJS#,</cfif>
		<cfif AttributeNotEmpty("name")>name: "#JSStringFormat(attributes.name)#",</cfif>
		<cfif AttributeNotEmpty("nameJS")>name: #attributes.nameJS#,</cfif>
		<cfif AttributeNotEmpty("overCls")>overCls: "#JSStringFormat(attributes.overCls)#",</cfif>
		<cfif AttributeNotEmpty("overClsJS")>overCls: #attributes.overClsJS#,</cfif>
		<cfif AttributeNotEmpty("pageX")>pageX: #attributes.pageX#,</cfif>
		<cfif AttributeNotEmpty("pageY")>pageY: #attributes.pageY#,</cfif>
		<cfif AttributeNotEmpty("plugins")>plugins: #attributes.plugins#,</cfif>
		<cfif AttributeNotEmpty("readOnly")>readOnly: #attributes.readOnly#,</cfif>
		<cfif AttributeNotEmpty("regex")>regex: #attributes.regex#,</cfif>
		<cfif AttributeNotEmpty("regexText")>regexText: "#JSStringFormat(attributes.regexText)#",</cfif>
		<cfif AttributeNotEmpty("regexTextJS")>regexText: #attributes.regexTextJS#,</cfif>
		<cfif AttributeNotEmpty("renderTo")>renderTo: "#JSStringFormat(attributes.renderTo)#",</cfif>
		<cfif AttributeNotEmpty("renderToJS")>renderTo: #attributes.renderToJS#,</cfif>
		<cfif AttributeNotEmpty("selectOnFocus")>selectOnFocus: #attributes.selectOnFocus#,</cfif>
		<cfif AttributeNotEmpty("stateEvents")>stateEvents: #attributes.stateEvents#,</cfif>
		<cfif AttributeNotEmpty("stateId")>stateId: "#JSStringFormat(attributes.stateId)#",</cfif>
		<cfif AttributeNotEmpty("stateIdJS")>stateId: #attributes.stateIdJS#,</cfif>
		<cfif AttributeNotEmpty("stateful")>stateful: #attributes.stateful#,</cfif>
		<cfif AttributeNotEmpty("stripCharsRe")>stripCharsRe: #attributes.stripCharsRe#,</cfif>
		<cfif AttributeNotEmpty("style")>style: "#JSStringFormat(attributes.style)#",</cfif>
		<cfif AttributeNotEmpty("styleJS")>style: #attributes.styleJS#,</cfif>
		<cfif AttributeNotEmpty("tabIndex")>tabIndex: #attributes.tabIndex#,</cfif>
		<cfif AttributeNotEmpty("validateOnBlur")>validateOnBlur: #attributes.validateOnBlur#,</cfif>
		<cfif AttributeNotEmpty("validationDelay")>validationDelay: #attributes.validationDelay#,</cfif>
		<cfif AttributeNotEmpty("validationEvent")>validationEvent: "#JSStringFormat(attributes.validationEvent)#",</cfif>
		<cfif AttributeNotEmpty("validationEventJS")>validationEvent: #attributes.validationEventJS#,</cfif>
		<cfif AttributeNotEmpty("validator")>validator: #attributes.validator#,</cfif>
		<cfif AttributeNotEmpty("value")>value: "#JSStringFormat(attributes.value)#",</cfif>
		<cfif AttributeNotEmpty("valueJS")>value: #attributes.valueJS#,</cfif>
		<cfif AttributeNotEmpty("vtype")>vtype: "#JSStringFormat(attributes.vtype)#",</cfif>
		<cfif AttributeNotEmpty("vtypeJS")>vtype: #attributes.vtypeJS#,</cfif>
		<cfif AttributeNotEmpty("vtypeText")>vtypeText: "#JSStringFormat(attributes.vtypeText)#",</cfif>
		<cfif AttributeNotEmpty("vtypeTextJS")>vtypeText: #attributes.vtypeTextJS#,</cfif>
		<cfif AttributeNotEmpty("width")>width: #attributes.width#,</cfif>
		<cfif AttributeNotEmpty("x")>x: #attributes.x#,</cfif>
		<cfif AttributeNotEmpty("xtype")>xtype: "#JSStringFormat(attributes.xtype)#",</cfif>
		<cfif AttributeNotEmpty("xtypeJS")>xtype: #attributes.xtypeJS#,</cfif>
		<cfif AttributeNotEmpty("y")>y: #attributes.y#,</cfif>

		<cfif AttributeNotEmpty("passThrough")>#attributes.passThrough#,</cfif>

		<cfif arrayLen(thisTag.listeners)>listeners: { #ArrayKeyToList(thisTag.listeners, "_out")# },</cfif>

		<!--- TODO: MISSING FORM DOCS? --->
		<cfif AttributeNotEmpty("anchor")>anchor: "#JSStringFormat(attributes.anchor)#",</cfif>

		<cfif AttributeNotEmpty("required")>allowBlank: #TrueFalseFormat(not attributes.required)#,</cfif>

		dummy: true
	})<cfif AttributeNotEmpty("var")>;</cfif>
</cfoutput>
</cfprocessingdirective>
</cfsavecontent>

<cfassociate basetag="#parentTag#" datacollection="#_collection#">


</cfif>


<cfsetting enablecfoutputonly="false">