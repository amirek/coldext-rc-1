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
<cfparam name="attributes.name" default="timeField#Int(Rand()*1000)#">
<cfparam name="attributes.label" default="#SeparateCaps(attributes.name)#">
<cfparam name="attributes.fieldLabel" default="#attributes.label#">
<cfparam name="attributes.width" default="#Application.ColdExt.defaultFieldWidth#">

<!--- attributes --->
<cfparam name="attributes.allQuery" default=""><!--- @@type: String @@help: The text query to send to the server to return all records for the list with no filtering (defaults to '') --->
<cfparam name="attributes.allQueryJS" default=""><!--- @@type: JS @@help: The text query to send to the server to return all records for the list with no filtering (defaults to '') --->
<cfparam name="attributes.allowBlank" default=""><!--- @@type: Boolean @@help: False to validate that the value length > 0 (defaults to true) --->
<cfparam name="attributes.allowDomMove" default=""><!--- @@type: Boolean @@help: Whether the component can move the Dom node when rendering (defaults to true). --->
<cfparam name="attributes.altFormats" default=""><!--- @@type: String @@help: Multiple date formats separated by "|" to try when parsing a user input value and it doesn't match the defined format (defaults to 'g:ia|g:iA|g:i a|g:i A|h:i|g:i|H:i|ga|ha|gA|h a|g a|g A|gi|hi|gia|hia|g|H'). --->
<cfparam name="attributes.altFormatsJS" default=""><!--- @@type: JS @@help: Multiple date formats separated by "|" to try when parsing a user input value and it doesn't match the defined format (defaults to 'g:ia|g:iA|g:i a|g:i A|h:i|g:i|H:i|ga|ha|gA|h a|g a|g A|gi|hi|gia|hia|g|H'). --->
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
<cfparam name="attributes.displayField" default=""><!--- @@type: String @@help: The underlying data field name to bind to this ComboBox (defaults to undefined if mode = 'remote' or 'text' if transforming a select) --->
<cfparam name="attributes.displayFieldJS" default=""><!--- @@type: JS @@help: The underlying data field name to bind to this ComboBox (defaults to undefined if mode = 'remote' or 'text' if transforming a select) --->
<cfparam name="attributes.editable" default=""><!--- @@type: Boolean @@help: False to prevent the user from typing text directly into the field, just like a traditional select (defaults to true) --->
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
<cfparam name="attributes.forceSelection" default=""><!--- @@type: Boolean @@help: True to restrict the selected value to one of the values in the list, false to allow the user to set arbitrary text into the field (defaults to false) --->
<cfparam name="attributes.format" default=""><!--- @@type: String @@help: The default time format string which can be overriden for localization support. The format must be valid according to Date.parseDate (defaults to 'g:i A', e.g., '3:15 PM'). For 24-hour time format try 'H:i' instead. --->
<cfparam name="attributes.formatJS" default=""><!--- @@type: JS @@help: The default time format string which can be overriden for localization support. The format must be valid according to Date.parseDate (defaults to 'g:i A', e.g., '3:15 PM'). For 24-hour time format try 'H:i' instead. --->
<cfparam name="attributes.handleHeight" default=""><!--- @@type: Number @@help: The height in pixels of the dropdown list resize handle if resizable = true (defaults to 8) --->
<cfparam name="attributes.height" default=""><!--- @@type: Number @@help: The height of this component in pixels (defaults to auto). --->
<cfparam name="attributes.hidden" default=""><!--- @@type: Boolean @@help: Render this component hidden (default is false). --->
<cfparam name="attributes.hiddenId" default=""><!--- @@type: String @@help: If hiddenName is specified, hiddenId can also be provided to give the hidden field a unique id (defaults to the hiddenName). The hiddenId and combo id should be different, since no two DOM nodes should share the same id. --->
<cfparam name="attributes.hiddenIdJS" default=""><!--- @@type: JS @@help: If hiddenName is specified, hiddenId can also be provided to give the hidden field a unique id (defaults to the hiddenName). The hiddenId and combo id should be different, since no two DOM nodes should share the same id. --->
<cfparam name="attributes.hiddenName" default=""><!--- @@type: String @@help: If specified, a hidden form field with this name is dynamically generated to store the field's data value (defaults to the underlying DOM element's name). Required for the combo's value to automatically post during a form submission. Note that the hidden field's id will also default to this name if hiddenId is not specified. The combo's id and the hidden field's ids should be different, since no two DOM nodes should share the same id, so if the combo and hidden names are the same, you should specify a unique hiddenId. --->
<cfparam name="attributes.hiddenNameJS" default=""><!--- @@type: JS @@help: If specified, a hidden form field with this name is dynamically generated to store the field's data value (defaults to the underlying DOM element's name). Required for the combo's value to automatically post during a form submission. Note that the hidden field's id will also default to this name if hiddenId is not specified. The combo's id and the hidden field's ids should be different, since no two DOM nodes should share the same id, so if the combo and hidden names are the same, you should specify a unique hiddenId. --->
<cfparam name="attributes.hideLabel" default=""><!--- @@type: Boolean @@help: True to completely hide the label element (defaults to false). By default, even if you do not specify a fieldLabel the space will still be reserved so that the field will line up with other fields that do have labels. Setting this to true will cause the field to not reserve that space. This config is only used when this Component is rendered by a Container which has been configured to use the FormLayout layout manager. Example use:new Ext.FormPanel({    height: 100,    renderTo: Ext.getBody(),    items: [{        xtype: 'textfield'        hideLabel: true    }]}); --->
<cfparam name="attributes.hideMode" default=""><!--- @@type: String @@help: How this component should be hidden. Supported values are "visibility" (css visibility), "offsets" (negative offset position) and "display" (css display) - defaults to "display". For Containers which may be hidden and shown as part of a card layout Container such as a TabPanel, it is recommended that hideMode is configured as "offsets". This ensures that hidden Components still have height and width so that layout managers can perform measurements when calculating layouts. --->
<cfparam name="attributes.hideModeJS" default=""><!--- @@type: JS @@help: How this component should be hidden. Supported values are "visibility" (css visibility), "offsets" (negative offset position) and "display" (css display) - defaults to "display". For Containers which may be hidden and shown as part of a card layout Container such as a TabPanel, it is recommended that hideMode is configured as "offsets". This ensures that hidden Components still have height and width so that layout managers can perform measurements when calculating layouts. --->
<cfparam name="attributes.hideParent" default=""><!--- @@type: Boolean @@help: True to hide and show the component's container when hide/show is called on the component, false to hide and show the component itself (defaults to false). For example, this can be used as a shortcut for a hide button on a window by setting hide:true on the button when adding it to its parent container. --->
<cfparam name="attributes.hideTrigger" default=""><!--- @@type: Boolean @@help: True to hide the trigger element and display only the base text field (defaults to false) --->
<cfparam name="attributes.id" default=""><!--- @@type: String @@help: The unique id of this component (defaults to an auto-assigned id). You should assign an id if you need to be able to access the component later and you do not have an object reference available (e.g., using Ext.ComponentMgr.getCmp). Note that this id will also be used as the element id for the containing HTML element that is rendered to the page for this component. This allows you to write id-based CSS rules to style the specific instance of this component uniquely, and also to select sub-elements using this component's id as the parent. --->
<cfparam name="attributes.idJS" default=""><!--- @@type: JS @@help: The unique id of this component (defaults to an auto-assigned id). You should assign an id if you need to be able to access the component later and you do not have an object reference available (e.g., using Ext.ComponentMgr.getCmp). Note that this id will also be used as the element id for the containing HTML element that is rendered to the page for this component. This allows you to write id-based CSS rules to style the specific instance of this component uniquely, and also to select sub-elements using this component's id as the parent. --->
<cfparam name="attributes.increment" default=""><!--- @@type: Number @@help: The number of minutes between each time value in the list (defaults to 15). --->
<cfparam name="attributes.inputType" default=""><!--- @@type: String @@help: The type attribute for input fields -- e.g. radio, text, password, file (defaults to "text"). The types "file" and "password" must be used to render those field types currently -- there are no separate Ext components for those. Note that if you use inputType:'file', emptyText is not supported and should be avoided. --->
<cfparam name="attributes.inputTypeJS" default=""><!--- @@type: JS @@help: The type attribute for input fields -- e.g. radio, text, password, file (defaults to "text"). The types "file" and "password" must be used to render those field types currently -- there are no separate Ext components for those. Note that if you use inputType:'file', emptyText is not supported and should be avoided. --->
<cfparam name="attributes.invalidClass" default=""><!--- @@type: String @@help: The CSS class to use when marking a field invalid (defaults to "x-form-invalid") --->
<cfparam name="attributes.invalidClassJS" default=""><!--- @@type: JS @@help: The CSS class to use when marking a field invalid (defaults to "x-form-invalid") --->
<cfparam name="attributes.invalidText" default=""><!--- @@type: String @@help: The error text to display when the time in the field is invalid (defaults to '{value} is not a valid time'). --->
<cfparam name="attributes.invalidTextJS" default=""><!--- @@type: JS @@help: The error text to display when the time in the field is invalid (defaults to '{value} is not a valid time'). --->
<cfparam name="attributes.itemCls" default=""><!--- @@type: String @@help: An additional CSS class to apply to the wrapper's form item element of this field (defaults to the container's itemCls value if set, or ''). Since it is applied to the item wrapper, it allows you to write standard CSS rules that can apply to the field, the label (if specified) or any other element within the markup for the field. This config is only used when this Component is rendered by a Container which has been configured to use the FormLayout layout manager. Example use:// Apply a style to the field's label:    .required .x-form-item-label {font-weight:bold;color:red;}new Ext.FormPanel({    height: 100,    renderTo: Ext.getBody(),    items: [{        xtype: 'textfield',        fieldLabel: 'Name',        itemCls: 'required' //this label will be styled    },{        xtype: 'textfield',        fieldLabel: 'Favorite Color'    }]}); --->
<cfparam name="attributes.itemClsJS" default=""><!--- @@type: JS @@help: An additional CSS class to apply to the wrapper's form item element of this field (defaults to the container's itemCls value if set, or ''). Since it is applied to the item wrapper, it allows you to write standard CSS rules that can apply to the field, the label (if specified) or any other element within the markup for the field. This config is only used when this Component is rendered by a Container which has been configured to use the FormLayout layout manager. Example use:// Apply a style to the field's label:    .required .x-form-item-label {font-weight:bold;color:red;}new Ext.FormPanel({    height: 100,    renderTo: Ext.getBody(),    items: [{        xtype: 'textfield',        fieldLabel: 'Name',        itemCls: 'required' //this label will be styled    },{        xtype: 'textfield',        fieldLabel: 'Favorite Color'    }]}); --->
<cfparam name="attributes.itemSelector" default=""><!--- @@type: String @@help: This setting is required if a custom XTemplate has been specified in tpl which assigns a class other than 'x-combo-list-item' to dropdown list items. A simple CSS selector (e.g. div.some-class or span:first-child) that will be used to determine what nodes the DataView which handles the dropdown display will be working with. --->
<cfparam name="attributes.itemSelectorJS" default=""><!--- @@type: JS @@help: This setting is required if a custom XTemplate has been specified in tpl which assigns a class other than 'x-combo-list-item' to dropdown list items. A simple CSS selector (e.g. div.some-class or span:first-child) that will be used to determine what nodes the DataView which handles the dropdown display will be working with. --->
<cfparam name="attributes.labelSeparator" default=""><!--- @@type: String @@help: The standard separator to display after the text of each form label (defaults to the value of Ext.layout.FormLayout.labelSeparator, which is a colon ':' by default). To display no separator for this field's label specify empty string ''. This config is only used when this Component is rendered by a Container which has been configured to use the FormLayout layout manager. Example use:new Ext.FormPanel({    height: 100,    renderTo: Ext.getBody(),    items: [{        xtype: 'textfield',        fieldLabel: 'Name',        labelSeparator: '...'    }]}); --->
<cfparam name="attributes.labelSeparatorJS" default=""><!--- @@type: JS @@help: The standard separator to display after the text of each form label (defaults to the value of Ext.layout.FormLayout.labelSeparator, which is a colon ':' by default). To display no separator for this field's label specify empty string ''. This config is only used when this Component is rendered by a Container which has been configured to use the FormLayout layout manager. Example use:new Ext.FormPanel({    height: 100,    renderTo: Ext.getBody(),    items: [{        xtype: 'textfield',        fieldLabel: 'Name',        labelSeparator: '...'    }]}); --->
<cfparam name="attributes.labelStyle" default=""><!--- @@type: String @@help: A CSS style specification to apply directly to this field's label (defaults to the container's labelStyle value if set, or '').. This config is only used when this Component is rendered by a Container which has been configured to use the FormLayout layout manager. Example use:new Ext.FormPanel({    height: 100,    renderTo: Ext.getBody(),    items: [{        xtype: 'textfield',        fieldLabel: 'Name',        labelStyle: 'font-weight:bold;'    }]}); --->
<cfparam name="attributes.labelStyleJS" default=""><!--- @@type: JS @@help: A CSS style specification to apply directly to this field's label (defaults to the container's labelStyle value if set, or '').. This config is only used when this Component is rendered by a Container which has been configured to use the FormLayout layout manager. Example use:new Ext.FormPanel({    height: 100,    renderTo: Ext.getBody(),    items: [{        xtype: 'textfield',        fieldLabel: 'Name',        labelStyle: 'font-weight:bold;'    }]}); --->
<cfparam name="attributes.lazyInit" default=""><!--- @@type: Boolean @@help: True to not initialize the list for this combo until the field is focused (defaults to true) --->
<cfparam name="attributes.lazyRender" default=""><!--- @@type: Boolean @@help: True to prevent the ComboBox from rendering until requested (should always be used when rendering into an Ext.Editor, defaults to false). --->
<cfparam name="attributes.listAlign" default=""><!--- @@type: String @@help: A valid anchor position value. See Ext.Element.alignTo for details on supported anchor positions (defaults to 'tl-bl') --->
<cfparam name="attributes.listAlignJS" default=""><!--- @@type: JS @@help: A valid anchor position value. See Ext.Element.alignTo for details on supported anchor positions (defaults to 'tl-bl') --->
<cfparam name="attributes.listClass" default=""><!--- @@type: String @@help: CSS class to apply to the dropdown list element (defaults to '') --->
<cfparam name="attributes.listClassJS" default=""><!--- @@type: JS @@help: CSS class to apply to the dropdown list element (defaults to '') --->
<cfparam name="attributes.listWidth" default=""><!--- @@type: Number @@help: The width in pixels of the dropdown list (defaults to the width of the ComboBox field) --->
<cfparam name="attributes.listeners" default=""><!--- @@type: Object @@help: (optional) A config object containing one or more event handlers to be added to this object during initialization. This should be a valid listeners config object as specified in the addListener example for attaching multiple handlers at once. --->
<cfparam name="attributes.loadingText" default=""><!--- @@type: String @@help: The text to display in the dropdown list while data is loading. Only applies when mode = 'remote' (defaults to 'Loading...') --->
<cfparam name="attributes.loadingTextJS" default=""><!--- @@type: JS @@help: The text to display in the dropdown list while data is loading. Only applies when mode = 'remote' (defaults to 'Loading...') --->
<cfparam name="attributes.maskRe" default=""><!--- @@type: RegExp @@help: An input mask regular expression that will be used to filter keystrokes that don't match (defaults to null) --->
<cfparam name="attributes.maxHeight" default=""><!--- @@type: Number @@help: The maximum height in pixels of the dropdown list before scrollbars are shown (defaults to 300) --->
<cfparam name="attributes.maxLength" default=""><!--- @@type: Number @@help: Maximum input field length allowed (defaults to Number.MAX_VALUE) --->
<cfparam name="attributes.maxLengthText" default=""><!--- @@type: String @@help: Error text to display if the maximum length validation fails (defaults to "The maximum length for this field is {maxLength}") --->
<cfparam name="attributes.maxLengthTextJS" default=""><!--- @@type: JS @@help: Error text to display if the maximum length validation fails (defaults to "The maximum length for this field is {maxLength}") --->
<cfparam name="attributes.maxText" default=""><!--- @@type: String @@help: The error text to display when the time is after maxValue (defaults to 'The time in this field must be equal to or before {0}'). --->
<cfparam name="attributes.maxTextJS" default=""><!--- @@type: JS @@help: The error text to display when the time is after maxValue (defaults to 'The time in this field must be equal to or before {0}'). --->
<cfparam name="attributes.maxValue" default=""><!--- @@type: String @@help: The maximum allowed time. Can be either a Javascript date object with a valid time value or a string time in a valid format -- see format and altFormats (defaults to null). --->
<cfparam name="attributes.maxValueJS" default=""><!--- @@type: Date/String @@help: The maximum allowed time. Can be either a Javascript date object with a valid time value or a string time in a valid format -- see format and altFormats (defaults to null). --->
<cfparam name="attributes.minChars" default=""><!--- @@type: Number @@help: The minimum number of characters the user must type before autocomplete and typeahead activate (defaults to 4 if remote or 0 if local, does not apply if editable = false) --->
<cfparam name="attributes.minHeight" default=""><!--- @@type: Number @@help: The minimum height in pixels of the dropdown list when the list is constrained by its distance to the viewport edges (defaults to 90) --->
<cfparam name="attributes.minLength" default=""><!--- @@type: Number @@help: Minimum input field length required (defaults to 0) --->
<cfparam name="attributes.minLengthText" default=""><!--- @@type: String @@help: Error text to display if the minimum length validation fails (defaults to "The minimum length for this field is {minLength}") --->
<cfparam name="attributes.minLengthTextJS" default=""><!--- @@type: JS @@help: Error text to display if the minimum length validation fails (defaults to "The minimum length for this field is {minLength}") --->
<cfparam name="attributes.minListWidth" default=""><!--- @@type: Number @@help: The minimum width of the dropdown list in pixels (defaults to 70, will be ignored if listWidth has a higher value) --->
<cfparam name="attributes.minText" default=""><!--- @@type: String @@help: The error text to display when the date in the cell is before minValue (defaults to 'The time in this field must be equal to or after {0}'). --->
<cfparam name="attributes.minTextJS" default=""><!--- @@type: JS @@help: The error text to display when the date in the cell is before minValue (defaults to 'The time in this field must be equal to or after {0}'). --->
<cfparam name="attributes.minValue" default=""><!--- @@type: String @@help: The minimum allowed time. Can be either a Javascript date object with a valid time value or a string time in a valid format -- see format and altFormats (defaults to null). --->
<cfparam name="attributes.minValueJS" default=""><!--- @@type: Date/String @@help: The minimum allowed time. Can be either a Javascript date object with a valid time value or a string time in a valid format -- see format and altFormats (defaults to null). --->
<cfparam name="attributes.mode" default=""><!--- @@type: String @@help: Set to 'local' if the ComboBox loads local data (defaults to 'remote' which loads from the server) --->
<cfparam name="attributes.modeJS" default=""><!--- @@type: JS @@help: Set to 'local' if the ComboBox loads local data (defaults to 'remote' which loads from the server) --->
<cfparam name="attributes.msgFx" default=""><!--- @@type: String @@help: Experimental The effect used when displaying a validation message under the field (defaults to 'normal'). --->
<cfparam name="attributes.msgFxJS" default=""><!--- @@type: JS @@help: Experimental The effect used when displaying a validation message under the field (defaults to 'normal'). --->
<cfparam name="attributes.msgTarget" default=""><!--- @@type: String @@help: The location where error text should display. Should be one of the following values (defaults to 'qtip'): Value         Description-----------   ----------------------------------------------------------------------qtip          Display a quick tip when the user hovers over the fieldtitle         Display a default browser title attribute popupunder         Add a block div beneath the field containing the error textside          Add an error icon to the right of the field with a popup on hover[element id]  Add the error text directly to the innerHTML of the specified element --->
<cfparam name="attributes.msgTargetJS" default=""><!--- @@type: JS @@help: The location where error text should display. Should be one of the following values (defaults to 'qtip'): Value         Description-----------   ----------------------------------------------------------------------qtip          Display a quick tip when the user hovers over the fieldtitle         Display a default browser title attribute popupunder         Add a block div beneath the field containing the error textside          Add an error icon to the right of the field with a popup on hover[element id]  Add the error text directly to the innerHTML of the specified element --->
<cfparam name="attributes.name" default=""><!--- @@type: String @@help: The field's HTML name attribute (defaults to ""). --->
<cfparam name="attributes.nameJS" default=""><!--- @@type: JS @@help: The field's HTML name attribute (defaults to ""). --->
<cfparam name="attributes.overCls" default=""><!--- @@type: String @@help: An optional extra CSS class that will be added to this component's Element when the mouse moves over the Element, and removed when the mouse moves out. (defaults to ''). This can be useful for adding customized "active" or "hover" styles to the component or any of its children using standard CSS rules. --->
<cfparam name="attributes.overClsJS" default=""><!--- @@type: JS @@help: An optional extra CSS class that will be added to this component's Element when the mouse moves over the Element, and removed when the mouse moves out. (defaults to ''). This can be useful for adding customized "active" or "hover" styles to the component or any of its children using standard CSS rules. --->
<cfparam name="attributes.pageSize" default=""><!--- @@type: Number @@help: If greater than 0, a paging toolbar is displayed in the footer of the dropdown list and the filter queries will execute with page start and limit parameters. Only applies when mode = 'remote' (defaults to 0) --->
<cfparam name="attributes.pageX" default=""><!--- @@type: Number @@help: The page level x coordinate for this component if contained within a positioning container. --->
<cfparam name="attributes.pageY" default=""><!--- @@type: Number @@help: The page level y coordinate for this component if contained within a positioning container. --->
<cfparam name="attributes.plugins" default=""><!--- @@type: Object/Array @@help: An object or array of objects that will provide custom functionality for this component. The only requirement for a valid plugin is that it contain an init method that accepts a reference of type Ext.Component. When a component is created, if any plugins are available, the component will call the init method on each plugin, passing a reference to itself. Each plugin can then call methods or respond to events on the component as needed to provide its functionality. --->
<cfparam name="attributes.queryDelay" default=""><!--- @@type: Number @@help: The length of time in milliseconds to delay between the start of typing and sending the query to filter the dropdown list (defaults to 500 if mode = 'remote' or 10 if mode = 'local') --->
<cfparam name="attributes.queryParam" default=""><!--- @@type: String @@help: Name of the query as it will be passed on the querystring (defaults to 'query') --->
<cfparam name="attributes.queryParamJS" default=""><!--- @@type: JS @@help: Name of the query as it will be passed on the querystring (defaults to 'query') --->
<cfparam name="attributes.readOnly" default=""><!--- @@type: Boolean @@help: True to mark the field as readOnly in HTML (defaults to false) -- Note: this only sets the element's readOnly DOM attribute. --->
<cfparam name="attributes.regex" default=""><!--- @@type: RegExp @@help: A JavaScript RegExp object to be tested against the field value during validation (defaults to null). If available, this regex will be evaluated only after the basic validators all return true, and will be passed the current field value. If the test fails, the field will be marked invalid using regexText. --->
<cfparam name="attributes.regexText" default=""><!--- @@type: String @@help: The error text to display if regex is used and the test fails during validation (defaults to "") --->
<cfparam name="attributes.regexTextJS" default=""><!--- @@type: JS @@help: The error text to display if regex is used and the test fails during validation (defaults to "") --->
<cfparam name="attributes.renderTo" default=""><!--- @@type: String @@help: The id of the node, a DOM node or an existing Element that will be the container to render this component into. Using this config, a call to render() is not required. --->
<cfparam name="attributes.renderToJS" default=""><!--- @@type: Mixed @@help: The id of the node, a DOM node or an existing Element that will be the container to render this component into. Using this config, a call to render() is not required. --->
<cfparam name="attributes.resizable" default=""><!--- @@type: Boolean @@help: True to add a resize handle to the bottom of the dropdown list (defaults to false) --->
<cfparam name="attributes.selectOnFocus" default=""><!--- @@type: Boolean @@help: True to automatically select any existing field text when the field receives input focus (defaults to false) --->
<cfparam name="attributes.selectedClass" default=""><!--- @@type: String @@help: CSS class to apply to the selected item in the dropdown list (defaults to 'x-combo-selected') --->
<cfparam name="attributes.selectedClassJS" default=""><!--- @@type: JS @@help: CSS class to apply to the selected item in the dropdown list (defaults to 'x-combo-selected') --->
<cfparam name="attributes.shadow" default=""><!--- @@type: String @@help: True or "sides" for the default effect, "frame" for 4-way shadow, and "drop" for bottom-right --->
<cfparam name="attributes.shadowJS" default=""><!--- @@type: Boolean/String @@help: True or "sides" for the default effect, "frame" for 4-way shadow, and "drop" for bottom-right --->
<cfparam name="attributes.stateEvents" default=""><!--- @@type: Array @@help: An array of events that, when fired, should trigger this component to save its state (defaults to none). These can be any types of events supported by this component, including browser or custom events (e.g., ['click', 'customerchange']). See stateful for an explanation of saving and restoring Component state. --->
<cfparam name="attributes.stateId" default=""><!--- @@type: String @@help: The unique id for this component to use for state management purposes (defaults to the component id if one was set, otherwise null if the component is using a generated id). See stateful for an explanation of saving and restoring Component state. --->
<cfparam name="attributes.stateIdJS" default=""><!--- @@type: JS @@help: The unique id for this component to use for state management purposes (defaults to the component id if one was set, otherwise null if the component is using a generated id). See stateful for an explanation of saving and restoring Component state. --->
<cfparam name="attributes.stateful" default=""><!--- @@type: Boolean @@help: A flag which causes the Component to attempt to restore the state of internal properties from a saved state on startup. The component must have either a stateId or id assigned for state to be managed. Auto-generated ids are not guaranteed to be stable across page loads and cannot be relied upon to save and restore the same state for a component. For state saving to work, the state manager's provider must have been set to an implementation of Ext.state.Provider which overrides the set and get methods to save and recall name/value pairs. A built-in implementation, Ext.state.CookieProvider is available. To set the state provider for the current page: Ext.state.Manager.setProvider(new Ext.state.CookieProvider()); Components attempt to save state when one of the events listed in the stateEvents configuration fires. You can perform extra processing on state save and restore by attaching handlers to the beforestaterestore, staterestore, beforestatesave and statesave events --->
<cfparam name="attributes.store" default=""><!--- @@type: Ext.data.Store/Array @@help: The data source to which this combo is bound (defaults to undefined). This can be any Ext.data.Store subclass, a 1-dimensional array (e.g., ['Foo','Bar']) or a 2-dimensional array (e.g., [['f','Foo'],['b','Bar']]). Arrays will be converted to a Ext.data.SimpleStore internally. 1-dimensional arrays will automatically be expanded (each array item will be the combo value and text) and for multi-dimensional arrays, the value in index 0 of each item will be assumed to be the combo value, while the value at index 1 is assumed to be the combo text. --->
<cfparam name="attributes.stripCharsRe" default=""><!--- @@type: RegExp @@help: A JavaScript RegExp object used to strip unwanted content from the value before validation (defaults to null). --->
<cfparam name="attributes.style" default=""><!--- @@type: String @@help: A custom style specification to be applied to this component's Element. Should be a valid argument to Ext.Element.applyStyles. --->
<cfparam name="attributes.styleJS" default=""><!--- @@type: JS @@help: A custom style specification to be applied to this component's Element. Should be a valid argument to Ext.Element.applyStyles. --->
<cfparam name="attributes.tabIndex" default=""><!--- @@type: Number @@help: The tabIndex for this field. Note this only applies to fields that are rendered, not those which are built via applyTo (defaults to undefined). --->
<cfparam name="attributes.title" default=""><!--- @@type: String @@help: If supplied, a header element is created containing this text and added into the top of the dropdown list (defaults to undefined, with no header element) --->
<cfparam name="attributes.titleJS" default=""><!--- @@type: JS @@help: If supplied, a header element is created containing this text and added into the top of the dropdown list (defaults to undefined, with no header element) --->
<cfparam name="attributes.tpl" default=""><!--- @@type: String @@help: The template string, or Ext.XTemplate instance to use to display each item in the dropdown list. Use this to create custom UI layouts for items in the list.  If you wish to preserve the default visual look of list items, add the CSS class name x-combo-list-item to the template's container element.  The template must contain one or more substitution parameters using field names from the Combo's Store. An example of a custom template would be adding an ext:qtip attribute which might display other fields from the Store.  The dropdown list is displayed in a DataView. See Ext.DataView for details. --->
<cfparam name="attributes.tplJS" default=""><!--- @@type: String/Ext.XTemplate @@help: The template string, or Ext.XTemplate instance to use to display each item in the dropdown list. Use this to create custom UI layouts for items in the list.  If you wish to preserve the default visual look of list items, add the CSS class name x-combo-list-item to the template's container element.  The template must contain one or more substitution parameters using field names from the Combo's Store. An example of a custom template would be adding an ext:qtip attribute which might display other fields from the Store.  The dropdown list is displayed in a DataView. See Ext.DataView for details. --->
<cfparam name="attributes.transform" default=""><!--- @@type: String @@help: The id, DOM node or element of an existing HTML SELECT to convert to a ComboBox. Note that if you specify this and the combo is going to be in a Ext.form.BasicForm or Ext.form.FormPanel, you must also set lazyRender = true. --->
<cfparam name="attributes.transformJS" default=""><!--- @@type: Mixed @@help: The id, DOM node or element of an existing HTML SELECT to convert to a ComboBox. Note that if you specify this and the combo is going to be in a Ext.form.BasicForm or Ext.form.FormPanel, you must also set lazyRender = true. --->
<cfparam name="attributes.triggerAction" default=""><!--- @@type: String @@help: The action to execute when the trigger is clicked. Use 'all' to run the query specified by the allQuery config option (defaults to 'query') --->
<cfparam name="attributes.triggerActionJS" default=""><!--- @@type: JS @@help: The action to execute when the trigger is clicked. Use 'all' to run the query specified by the allQuery config option (defaults to 'query') --->
<cfparam name="attributes.triggerClass" default=""><!--- @@type: String @@help: A CSS class to apply to the trigger --->
<cfparam name="attributes.triggerClassJS" default=""><!--- @@type: JS @@help: A CSS class to apply to the trigger --->
<cfparam name="attributes.typeAhead" default=""><!--- @@type: Boolean @@help: True to populate and autoselect the remainder of the text being typed after a configurable delay (typeAheadDelay) if it matches a known value (defaults to false) --->
<cfparam name="attributes.typeAheadDelay" default=""><!--- @@type: Number @@help: The length of time in milliseconds to wait until the typeahead text is displayed if typeAhead = true (defaults to 250) --->
<cfparam name="attributes.validateOnBlur" default=""><!--- @@type: Boolean @@help: Whether the field should validate when it loses focus (defaults to true). --->
<cfparam name="attributes.validationDelay" default=""><!--- @@type: Number @@help: The length of time in milliseconds after user input begins until validation is initiated (defaults to 250) --->
<cfparam name="attributes.validationEvent" default=""><!--- @@type: String @@help: The event that should initiate field validation. Set to false to disable automatic validation (defaults to "keyup"). --->
<cfparam name="attributes.validationEventJS" default=""><!--- @@type: String/Boolean @@help: The event that should initiate field validation. Set to false to disable automatic validation (defaults to "keyup"). --->
<cfparam name="attributes.validator" default=""><!--- @@type: Function @@help: A custom validation function to be called during field validation (defaults to null). If specified, this function will be called only after the built-in validations (allowBlank, minLength, maxLength) and any configured vtype all return true. This function will be passed the current field value and expected to return boolean true if the value is valid or a string error message if invalid. --->
<cfparam name="attributes.value" default=""><!--- @@type: String @@help: A value to initialize this field with (defaults to undefined). --->
<cfparam name="attributes.valueJS" default=""><!--- @@type: Mixed @@help: A value to initialize this field with (defaults to undefined). --->
<cfparam name="attributes.valueField" default=""><!--- @@type: String @@help: The underlying data value name to bind to this ComboBox (defaults to undefined if mode = 'remote' or 'value' if transforming a select) Note: use of a valueField requires the user to make a selection in order for a value to be mapped. --->
<cfparam name="attributes.valueFieldJS" default=""><!--- @@type: JS @@help: The underlying data value name to bind to this ComboBox (defaults to undefined if mode = 'remote' or 'value' if transforming a select) Note: use of a valueField requires the user to make a selection in order for a value to be mapped. --->
<cfparam name="attributes.valueNotFoundText" default=""><!--- @@type: String @@help: When using a name/value combo, if the value passed to setValue is not found in the store, valueNotFoundText will be displayed as the field text if defined (defaults to undefined). If this defaut text is used, it means there is no value set and no validation will occur on this field. --->
<cfparam name="attributes.valueNotFoundTextJS" default=""><!--- @@type: JS @@help: When using a name/value combo, if the value passed to setValue is not found in the store, valueNotFoundText will be displayed as the field text if defined (defaults to undefined). If this defaut text is used, it means there is no value set and no validation will occur on this field. --->
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



<!--- arrays that may be populated by nested tags --->
<cfset thisTag.listeners = ArrayNew(1)>
<cfset thisTag.tpl = ArrayNew(1)>

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
	<cfif AttributeNotEmpty("var")>var #attributes.var# = </cfif>new Ext.form.TimeField({
		<cfif AttributeNotEmpty("allQuery")>allQuery: "#JSStringFormat(attributes.allQuery)#",</cfif>
		<cfif AttributeNotEmpty("allQueryJS")>allQuery: #attributes.allQueryJS#,</cfif>
		<cfif AttributeNotEmpty("allowBlank")>allowBlank: #attributes.allowBlank#,</cfif>
		<cfif AttributeNotEmpty("allowDomMove")>allowDomMove: #attributes.allowDomMove#,</cfif>
		<cfif AttributeNotEmpty("altFormats")>altFormats: "#JSStringFormat(attributes.altFormats)#",</cfif>
		<cfif AttributeNotEmpty("altFormatsJS")>altFormats: #attributes.altFormatsJS#,</cfif>
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
		<cfif AttributeNotEmpty("displayField")>displayField: "#JSStringFormat(attributes.displayField)#",</cfif>
		<cfif AttributeNotEmpty("displayFieldJS")>displayField: #attributes.displayFieldJS#,</cfif>
		<cfif AttributeNotEmpty("editable")>editable: #attributes.editable#,</cfif>
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
		<cfif AttributeNotEmpty("forceSelection")>forceSelection: #attributes.forceSelection#,</cfif>
		<cfif AttributeNotEmpty("format")>format: "#JSStringFormat(attributes.format)#",</cfif>
		<cfif AttributeNotEmpty("formatJS")>format: #attributes.formatJS#,</cfif>
		<cfif AttributeNotEmpty("handleHeight")>handleHeight: #attributes.handleHeight#,</cfif>
		<cfif AttributeNotEmpty("height")>height: #attributes.height#,</cfif>
		<cfif AttributeNotEmpty("hidden")>hidden: #attributes.hidden#,</cfif>
		<cfif AttributeNotEmpty("hiddenId")>hiddenId: "#JSStringFormat(attributes.hiddenId)#",</cfif>
		<cfif AttributeNotEmpty("hiddenIdJS")>hiddenId: #attributes.hiddenIdJS#,</cfif>
		<cfif AttributeNotEmpty("hiddenName")>hiddenName: "#JSStringFormat(attributes.hiddenName)#",</cfif>
		<cfif AttributeNotEmpty("hiddenNameJS")>hiddenName: #attributes.hiddenNameJS#,</cfif>
		<cfif AttributeNotEmpty("hideLabel")>hideLabel: #attributes.hideLabel#,</cfif>
		<cfif AttributeNotEmpty("hideMode")>hideMode: "#JSStringFormat(attributes.hideMode)#",</cfif>
		<cfif AttributeNotEmpty("hideModeJS")>hideMode: #attributes.hideModeJS#,</cfif>
		<cfif AttributeNotEmpty("hideParent")>hideParent: #attributes.hideParent#,</cfif>
		<cfif AttributeNotEmpty("hideTrigger")>hideTrigger: #attributes.hideTrigger#,</cfif>
		<cfif AttributeNotEmpty("id")>id: "#JSStringFormat(attributes.id)#",</cfif>
		<cfif AttributeNotEmpty("idJS")>id: #attributes.idJS#,</cfif>
		<cfif AttributeNotEmpty("increment")>increment: #attributes.increment#,</cfif>
		<cfif AttributeNotEmpty("inputType")>inputType: "#JSStringFormat(attributes.inputType)#",</cfif>
		<cfif AttributeNotEmpty("inputTypeJS")>inputType: #attributes.inputTypeJS#,</cfif>
		<cfif AttributeNotEmpty("invalidClass")>invalidClass: "#JSStringFormat(attributes.invalidClass)#",</cfif>
		<cfif AttributeNotEmpty("invalidClassJS")>invalidClass: #attributes.invalidClassJS#,</cfif>
		<cfif AttributeNotEmpty("invalidText")>invalidText: "#JSStringFormat(attributes.invalidText)#",</cfif>
		<cfif AttributeNotEmpty("invalidTextJS")>invalidText: #attributes.invalidTextJS#,</cfif>
		<cfif AttributeNotEmpty("itemCls")>itemCls: "#JSStringFormat(attributes.itemCls)#",</cfif>
		<cfif AttributeNotEmpty("itemClsJS")>itemCls: #attributes.itemClsJS#,</cfif>
		<cfif AttributeNotEmpty("itemSelector")>itemSelector: "#JSStringFormat(attributes.itemSelector)#",</cfif>
		<cfif AttributeNotEmpty("itemSelectorJS")>itemSelector: #attributes.itemSelectorJS#,</cfif>
		<cfif AttributeNotEmpty("labelSeparator")>labelSeparator: "#JSStringFormat(attributes.labelSeparator)#",</cfif>
		<cfif AttributeNotEmpty("labelSeparatorJS")>labelSeparator: #attributes.labelSeparatorJS#,</cfif>
		<cfif AttributeNotEmpty("labelStyle")>labelStyle: "#JSStringFormat(attributes.labelStyle)#",</cfif>
		<cfif AttributeNotEmpty("labelStyleJS")>labelStyle: #attributes.labelStyleJS#,</cfif>
		<cfif AttributeNotEmpty("lazyInit")>lazyInit: #attributes.lazyInit#,</cfif>
		<cfif AttributeNotEmpty("lazyRender")>lazyRender: #attributes.lazyRender#,</cfif>
		<cfif AttributeNotEmpty("listAlign")>listAlign: "#JSStringFormat(attributes.listAlign)#",</cfif>
		<cfif AttributeNotEmpty("listAlignJS")>listAlign: #attributes.listAlignJS#,</cfif>
		<cfif AttributeNotEmpty("listClass")>listClass: "#JSStringFormat(attributes.listClass)#",</cfif>
		<cfif AttributeNotEmpty("listClassJS")>listClass: #attributes.listClassJS#,</cfif>
		<cfif AttributeNotEmpty("listWidth")>listWidth: #attributes.listWidth#,</cfif>
		<cfif AttributeNotEmpty("listeners")>listeners: #attributes.listeners#,</cfif>
		<cfif AttributeNotEmpty("loadingText")>loadingText: "#JSStringFormat(attributes.loadingText)#",</cfif>
		<cfif AttributeNotEmpty("loadingTextJS")>loadingText: #attributes.loadingTextJS#,</cfif>
		<cfif AttributeNotEmpty("maskRe")>maskRe: #attributes.maskRe#,</cfif>
		<cfif AttributeNotEmpty("maxHeight")>maxHeight: #attributes.maxHeight#,</cfif>
		<cfif AttributeNotEmpty("maxLength")>maxLength: #attributes.maxLength#,</cfif>
		<cfif AttributeNotEmpty("maxLengthText")>maxLengthText: "#JSStringFormat(attributes.maxLengthText)#",</cfif>
		<cfif AttributeNotEmpty("maxLengthTextJS")>maxLengthText: #attributes.maxLengthTextJS#,</cfif>
		<cfif AttributeNotEmpty("maxText")>maxText: "#JSStringFormat(attributes.maxText)#",</cfif>
		<cfif AttributeNotEmpty("maxTextJS")>maxText: #attributes.maxTextJS#,</cfif>
		<cfif AttributeNotEmpty("maxValue")>maxValue: "#JSStringFormat(attributes.maxValue)#",</cfif>
		<cfif AttributeNotEmpty("maxValueJS")>maxValue: #attributes.maxValueJS#,</cfif>
		<cfif AttributeNotEmpty("minChars")>minChars: #attributes.minChars#,</cfif>
		<cfif AttributeNotEmpty("minHeight")>minHeight: #attributes.minHeight#,</cfif>
		<cfif AttributeNotEmpty("minLength")>minLength: #attributes.minLength#,</cfif>
		<cfif AttributeNotEmpty("minLengthText")>minLengthText: "#JSStringFormat(attributes.minLengthText)#",</cfif>
		<cfif AttributeNotEmpty("minLengthTextJS")>minLengthText: #attributes.minLengthTextJS#,</cfif>
		<cfif AttributeNotEmpty("minListWidth")>minListWidth: #attributes.minListWidth#,</cfif>
		<cfif AttributeNotEmpty("minText")>minText: "#JSStringFormat(attributes.minText)#",</cfif>
		<cfif AttributeNotEmpty("minTextJS")>minText: #attributes.minTextJS#,</cfif>
		<cfif AttributeNotEmpty("minValue")>minValue: "#JSStringFormat(attributes.minValue)#",</cfif>
		<cfif AttributeNotEmpty("minValueJS")>minValue: #attributes.minValueJS#,</cfif>
		<cfif AttributeNotEmpty("mode")>mode: "#JSStringFormat(attributes.mode)#",</cfif>
		<cfif AttributeNotEmpty("modeJS")>mode: #attributes.modeJS#,</cfif>
		<cfif AttributeNotEmpty("msgFx")>msgFx: "#JSStringFormat(attributes.msgFx)#",</cfif>
		<cfif AttributeNotEmpty("msgFxJS")>msgFx: #attributes.msgFxJS#,</cfif>
		<cfif AttributeNotEmpty("msgTarget")>msgTarget: "#JSStringFormat(attributes.msgTarget)#",</cfif>
		<cfif AttributeNotEmpty("msgTargetJS")>msgTarget: #attributes.msgTargetJS#,</cfif>
		<cfif AttributeNotEmpty("name")>name: "#JSStringFormat(attributes.name)#",</cfif>
		<cfif AttributeNotEmpty("nameJS")>name: #attributes.nameJS#,</cfif>
		<cfif AttributeNotEmpty("overCls")>overCls: "#JSStringFormat(attributes.overCls)#",</cfif>
		<cfif AttributeNotEmpty("overClsJS")>overCls: #attributes.overClsJS#,</cfif>
		<cfif AttributeNotEmpty("pageSize")>pageSize: #attributes.pageSize#,</cfif>
		<cfif AttributeNotEmpty("pageX")>pageX: #attributes.pageX#,</cfif>
		<cfif AttributeNotEmpty("pageY")>pageY: #attributes.pageY#,</cfif>
		<cfif AttributeNotEmpty("plugins")>plugins: #attributes.plugins#,</cfif>
		<cfif AttributeNotEmpty("queryDelay")>queryDelay: #attributes.queryDelay#,</cfif>
		<cfif AttributeNotEmpty("queryParam")>queryParam: "#JSStringFormat(attributes.queryParam)#",</cfif>
		<cfif AttributeNotEmpty("queryParamJS")>queryParam: #attributes.queryParamJS#,</cfif>
		<cfif AttributeNotEmpty("readOnly")>readOnly: #attributes.readOnly#,</cfif>
		<cfif AttributeNotEmpty("regex")>regex: #attributes.regex#,</cfif>
		<cfif AttributeNotEmpty("regexText")>regexText: "#JSStringFormat(attributes.regexText)#",</cfif>
		<cfif AttributeNotEmpty("regexTextJS")>regexText: #attributes.regexTextJS#,</cfif>
		<cfif AttributeNotEmpty("renderTo")>renderTo: "#JSStringFormat(attributes.renderTo)#",</cfif>
		<cfif AttributeNotEmpty("renderToJS")>renderTo: #attributes.renderToJS#,</cfif>
		<cfif AttributeNotEmpty("resizable")>resizable: #attributes.resizable#,</cfif>
		<cfif AttributeNotEmpty("selectOnFocus")>selectOnFocus: #attributes.selectOnFocus#,</cfif>
		<cfif AttributeNotEmpty("selectedClass")>selectedClass: "#JSStringFormat(attributes.selectedClass)#",</cfif>
		<cfif AttributeNotEmpty("selectedClassJS")>selectedClass: #attributes.selectedClassJS#,</cfif>
		<cfif AttributeNotEmpty("shadow")>shadow: "#JSStringFormat(attributes.shadow)#",</cfif>
		<cfif AttributeNotEmpty("shadowJS")>shadow: #attributes.shadowJS#,</cfif>
		<cfif AttributeNotEmpty("stateEvents")>stateEvents: #attributes.stateEvents#,</cfif>
		<cfif AttributeNotEmpty("stateId")>stateId: "#JSStringFormat(attributes.stateId)#",</cfif>
		<cfif AttributeNotEmpty("stateIdJS")>stateId: #attributes.stateIdJS#,</cfif>
		<cfif AttributeNotEmpty("stateful")>stateful: #attributes.stateful#,</cfif>
		<cfif AttributeNotEmpty("store")>store: #attributes.store#,</cfif>
		<cfif AttributeNotEmpty("stripCharsRe")>stripCharsRe: #attributes.stripCharsRe#,</cfif>
		<cfif AttributeNotEmpty("style")>style: "#JSStringFormat(attributes.style)#",</cfif>
		<cfif AttributeNotEmpty("styleJS")>style: #attributes.styleJS#,</cfif>
		<cfif AttributeNotEmpty("tabIndex")>tabIndex: #attributes.tabIndex#,</cfif>
		<cfif AttributeNotEmpty("title")>title: "#JSStringFormat(attributes.title)#",</cfif>
		<cfif AttributeNotEmpty("titleJS")>title: #attributes.titleJS#,</cfif>
		<cfif AttributeNotEmpty("tpl")>tpl: "#JSStringFormat(attributes.tpl)#",</cfif>
		<cfif AttributeNotEmpty("tplJS")>tpl: #attributes.tplJS#,</cfif>
		<cfif AttributeNotEmpty("transform")>transform: "#JSStringFormat(attributes.transform)#",</cfif>
		<cfif AttributeNotEmpty("transformJS")>transform: #attributes.transformJS#,</cfif>
		<cfif AttributeNotEmpty("triggerAction")>triggerAction: "#JSStringFormat(attributes.triggerAction)#",</cfif>
		<cfif AttributeNotEmpty("triggerActionJS")>triggerAction: #attributes.triggerActionJS#,</cfif>
		<cfif AttributeNotEmpty("triggerClass")>triggerClass: "#JSStringFormat(attributes.triggerClass)#",</cfif>
		<cfif AttributeNotEmpty("triggerClassJS")>triggerClass: #attributes.triggerClassJS#,</cfif>
		<cfif AttributeNotEmpty("typeAhead")>typeAhead: #attributes.typeAhead#,</cfif>
		<cfif AttributeNotEmpty("typeAheadDelay")>typeAheadDelay: #attributes.typeAheadDelay#,</cfif>
		<cfif AttributeNotEmpty("validateOnBlur")>validateOnBlur: #attributes.validateOnBlur#,</cfif>
		<cfif AttributeNotEmpty("validationDelay")>validationDelay: #attributes.validationDelay#,</cfif>
		<cfif AttributeNotEmpty("validationEvent")>validationEvent: "#JSStringFormat(attributes.validationEvent)#",</cfif>
		<cfif AttributeNotEmpty("validationEventJS")>validationEvent: #attributes.validationEventJS#,</cfif>
		<cfif AttributeNotEmpty("validator")>validator: #attributes.validator#,</cfif>
		<cfif AttributeNotEmpty("value")>value: "#JSStringFormat(attributes.value)#",</cfif>
		<cfif AttributeNotEmpty("valueJS")>value: #attributes.valueJS#,</cfif>
		<cfif AttributeNotEmpty("valueField")>valueField: "#JSStringFormat(attributes.valueField)#",</cfif>
		<cfif AttributeNotEmpty("valueFieldJS")>valueField: #attributes.valueFieldJS#,</cfif>
		<cfif AttributeNotEmpty("valueNotFoundText")>valueNotFoundText: "#JSStringFormat(attributes.valueNotFoundText)#",</cfif>
		<cfif AttributeNotEmpty("valueNotFoundTextJS")>valueNotFoundText: #attributes.valueNotFoundTextJS#,</cfif>
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
		<cfif arrayLen(thisTag.tpl)>tpl: #thisTag.tpl[1]._out#,</cfif>


		dummy: true
	})<cfif AttributeNotEmpty("var")>;</cfif>
</cfoutput>
</cfprocessingdirective>
</cfsavecontent>

<cfassociate basetag="#parentTag#" datacollection="#_collection#">


</cfif>


<cfsetting enablecfoutputonly="false">