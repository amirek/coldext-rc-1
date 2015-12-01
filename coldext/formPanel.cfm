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
<cfparam name="attributes.labelWidth" default="#Application.ColdExt.defaultLabelWidth#">
<cfparam name="attributes.width" default="#Application.ColdExt.defaultFormPanelWidth#">

<!--- attributes --->
<cfparam name="attributes.activeItem" default=""><!--- @@type: String @@help: A string component id or the numeric index of the component that should be initially activated within the container's layout on render. For example, activeItem: 'item-1' or activeItem: 0 (index 0 = the first item in the container's collection). activeItem only applies to layout styles that can display items one at a time (like Ext.layout.Accordion, Ext.layout.CardLayout and Ext.layout.FitLayout). Related to Ext.layout.ContainerLayout.activeItem. --->
<cfparam name="attributes.activeItemJS" default=""><!--- @@type: String/Number @@help: A string component id or the numeric index of the component that should be initially activated within the container's layout on render. For example, activeItem: 'item-1' or activeItem: 0 (index 0 = the first item in the container's collection). activeItem only applies to layout styles that can display items one at a time (like Ext.layout.Accordion, Ext.layout.CardLayout and Ext.layout.FitLayout). Related to Ext.layout.ContainerLayout.activeItem. --->
<cfparam name="attributes.allowDomMove" default=""><!--- @@type: Boolean @@help: Whether the component can move the Dom node when rendering (defaults to true). --->
<cfparam name="attributes.animCollapse" default=""><!--- @@type: Boolean @@help: True to animate the transition when the panel is collapsed, false to skip the animation (defaults to true if the Ext.Fx class is available, otherwise false). --->
<cfparam name="attributes.animFloat" default=""><!--- @@type: Boolean @@help: When a collapsed region's bar is clicked, the region's panel will be displayed as a floated panel that will close again once the user mouses out of that panel (or clicks out if autoHide = false). Setting animFloat to false will prevent the open and close of these floated panels from being animated (defaults to true). --->
<cfparam name="attributes.applyTo" default=""><!--- @@type: String @@help: The id of the node, a DOM node or an existing Element corresponding to a DIV that is already present in the document that specifies some structural markup for this component. When applyTo is used, constituent parts of the component can also be specified by id or CSS class name within the main element, and the component being created may attempt to create its subcomponents from that markup if applicable. Using this config, a call to render() is not required. If applyTo is specified, any value passed for renderTo will be ignored and the target element's parent node will automatically be used as the component's container. --->
<cfparam name="attributes.applyToJS" default=""><!--- @@type: Mixed @@help: The id of the node, a DOM node or an existing Element corresponding to a DIV that is already present in the document that specifies some structural markup for this component. When applyTo is used, constituent parts of the component can also be specified by id or CSS class name within the main element, and the component being created may attempt to create its subcomponents from that markup if applicable. Using this config, a call to render() is not required. If applyTo is specified, any value passed for renderTo will be ignored and the target element's parent node will automatically be used as the component's container. --->
<cfparam name="attributes.autoDestroy" default=""><!--- @@type: Boolean @@help: If true the container will automatically destroy any contained component that is removed from it, else destruction must be handled manually (defaults to true). --->
<cfparam name="attributes.autoEl" default=""><!--- @@type: String @@help: A tag name or DomHelper spec to create an element with. This is intended to create shorthand utility components inline via JSON. It should not be used for higher level components which already create their own elements. Example usage: {xtype:'box', autoEl: 'div', cls:'my-class'}{xtype:'box', autoEl: {tag:'blockquote', html:'autoEl is cool!'}} // with DomHelper --->
<cfparam name="attributes.autoElJS" default=""><!--- @@type: String/Object @@help: A tag name or DomHelper spec to create an element with. This is intended to create shorthand utility components inline via JSON. It should not be used for higher level components which already create their own elements. Example usage: {xtype:'box', autoEl: 'div', cls:'my-class'}{xtype:'box', autoEl: {tag:'blockquote', html:'autoEl is cool!'}} // with DomHelper --->
<cfparam name="attributes.autoHeight" default=""><!--- @@type: Boolean @@help: True to use height:'auto', false to use fixed height (defaults to false). Note: Although many components inherit this config option, not all will function as expected with a height of 'auto'. Setting autoHeight:true means that the browser will manage height based on the element's contents, and that Ext will not manage it at all. --->
<cfparam name="attributes.autoHide" default=""><!--- @@type: Boolean @@help: When a collapsed region's bar is clicked, the region's panel will be displayed as a floated panel. If autoHide is true, the panel will automatically hide after the user mouses out of the panel. If autoHide is false, the panel will continue to display until the user clicks outside of the panel (defaults to true). --->
<cfparam name="attributes.autoLoad" default=""><!--- @@type: String @@help: A valid url spec according to the Updater Ext.Updater.update method. If autoLoad is not null, the panel will attempt to load its contents immediately upon render. The URL will become the default URL for this panel's body element, so it may be refreshed at any time. --->
<cfparam name="attributes.autoLoadJS" default=""><!--- @@type: Object/String/Function @@help: A valid url spec according to the Updater Ext.Updater.update method. If autoLoad is not null, the panel will attempt to load its contents immediately upon render. The URL will become the default URL for this panel's body element, so it may be refreshed at any time. --->
<cfparam name="attributes.autoScroll" default=""><!--- @@type: Boolean @@help: True to use overflow:'auto' on the panel's body element and show scroll bars automatically when necessary, false to clip any overflowing content (defaults to false). --->
<cfparam name="attributes.autoShow" default=""><!--- @@type: Boolean @@help: True if the component should check for hidden classes (e.g. 'x-hidden' or 'x-hide-display') and remove them on render (defaults to false). --->
<cfparam name="attributes.autoWidth" default=""><!--- @@type: Boolean @@help: True to use width:'auto', false to use fixed width (defaults to false). Note: Although many components inherit this config option, not all will function as expected with a width of 'auto'. Setting autoWidth:true means that the browser will manage width based on the element's contents, and that Ext will not manage it at all. --->
<cfparam name="attributes.baseCls" default=""><!--- @@type: String @@help: The base CSS class to apply to this panel's element (defaults to 'x-panel'). --->
<cfparam name="attributes.baseClsJS" default=""><!--- @@type: JS @@help: The base CSS class to apply to this panel's element (defaults to 'x-panel'). --->
<cfparam name="attributes.baseParams" default=""><!--- @@type: Object @@help: Parameters to pass with all requests. e.g. baseParams: {id: '123', foo: 'bar'}. --->
<cfparam name="attributes.bbar" default=""><!--- @@type: Object/Array @@help: The bottom toolbar of the panel. This can be either an Ext.Toolbar object or an array of buttons/button configs to be added to the toolbar. Note that this is not available as a property after render. To access the bottom toolbar after render, use getBottomToolbar. --->
<cfparam name="attributes.bodyBorder" default=""><!--- @@type: Boolean @@help: True to display an interior border on the body element of the panel, false to hide it (defaults to true). This only applies when border == true. If border == true and bodyBorder == false, the border will display as a 1px wide inset border, giving the entire body element an inset appearance. --->
<cfparam name="attributes.bodyCfg" default=""><!--- @@type: Object @@help: A DomHelper configuration object specifying the element structure of this Panel's body Element. This may be used to force the body Element to use a different form of markup than is created automatically. An example of this might be to create a child Panel containing custom content, such as a header, or forcing centering of all Panel content by having the body be a  element:new Ext.Panel({    title: 'New Message',    collapsible: true,    renderTo: Ext.getBody(),    width: 400,    bodyCfg: {        tag: 'center',        cls: 'x-panel-body'    },    items: [{        border: false,        header: false,        bodyCfg: {tag: 'h2', html: 'Message'}    }, {        xtype: 'textarea',        style: {            width: '95%',            marginBottom: '10px'        }    },        new Ext.Button({            text: 'Send',            minWidth: '100',            style: {                marginBottom: '10px'            }        })    ]}); --->
<cfparam name="attributes.bodyStyle" default=""><!--- @@type: String @@help: Custom CSS styles to be applied to the body element in the format expected by Ext.Element.applyStyles (defaults to null). --->
<cfparam name="attributes.bodyStyleJS" default=""><!--- @@type: String/Object/Function @@help: Custom CSS styles to be applied to the body element in the format expected by Ext.Element.applyStyles (defaults to null). --->
<cfparam name="attributes.border" default=""><!--- @@type: Boolean @@help: True to display the borders of the panel's body element, false to hide them (defaults to true). By default, the border is a 2px wide inset border, but this can be further altered by setting bodyBorder to false. --->
<cfparam name="attributes.bufferResize" default=""><!--- @@type: Boolean/Number @@help: When set to true (100 milliseconds) or a number of milliseconds, the layout assigned for this container will buffer the frequency it calculates and does a re-layout of components. This is useful for heavy containers or containers with a large quantity of sub-components for which frequent layout calls would be expensive. --->
<cfparam name="attributes.buttonAlign" default=""><!--- @@type: String @@help: Valid values are "left," "center" and "right" (defaults to "center") --->
<cfparam name="attributes.buttonAlignJS" default=""><!--- @@type: JS @@help: Valid values are "left," "center" and "right" (defaults to "center") --->
<cfparam name="attributes.buttons" default=""><!--- @@type: Array @@help: An array of Ext.Buttons or Ext.Button configs used to add buttons to the footer of this FormPanel. Buttons in the footer of a FormPanel may be configured with the option formBind: true. This causes the form's valid state monitor task to enable/disable those Buttons depending on the form's valid/invalid state. --->
<cfparam name="attributes.clearCls" default=""><!--- @@type: String @@help: The CSS class used to provide field clearing (defaults to 'x-form-clear-left'). This config is only used when this Component is rendered by a Container which has been configured to use the FormLayout layout manager. --->
<cfparam name="attributes.clearClsJS" default=""><!--- @@type: JS @@help: The CSS class used to provide field clearing (defaults to 'x-form-clear-left'). This config is only used when this Component is rendered by a Container which has been configured to use the FormLayout layout manager. --->
<cfparam name="attributes.cls" default=""><!--- @@type: String @@help: An optional extra CSS class that will be added to this component's Element (defaults to ''). This can be useful for adding customized styles to the component or any of its children using standard CSS rules. --->
<cfparam name="attributes.clsJS" default=""><!--- @@type: JS @@help: An optional extra CSS class that will be added to this component's Element (defaults to ''). This can be useful for adding customized styles to the component or any of its children using standard CSS rules. --->
<cfparam name="attributes.cmargins" default=""><!--- @@type: Object @@help: An object containing margins to apply to the region when in the collapsed state in the format:{    top: (top margin),    right: (right margin),    bottom: (bottom margin)    left: (left margin),} May also be a string containing space-separated, numeric margin values. The order of the sides associated with each value matches the way CSS processes margin values.  If there is only one value, it applies to all sides. If there are two values, the top and bottom borders are set to the first value and the right and left are set to the second. If there are three values, the top is set to the first value, the left and right are set to the second, and the bottom is set to the third. If there are four values, they apply to the top, right, bottom, and left, respectively. --->
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
<cfparam name="attributes.contentEl" default=""><!--- @@type: String @@help: The id of an existing HTML node to use as the panel's body content (defaults to ''). The specified Element is appended to the Panel's body Element by the Panel's afterRender method after any configured HTML has been inserted, and so the document will not contain this HTML at the time the render event is fired. --->
<cfparam name="attributes.contentElJS" default=""><!--- @@type: JS @@help: The id of an existing HTML node to use as the panel's body content (defaults to ''). The specified Element is appended to the Panel's body Element by the Panel's afterRender method after any configured HTML has been inserted, and so the document will not contain this HTML at the time the render event is fired. --->
<cfparam name="attributes.ctCls" default=""><!--- @@type: String @@help: An optional extra CSS class that will be added to this component's container (defaults to ''). This can be useful for adding customized styles to the container or any of its children using standard CSS rules. --->
<cfparam name="attributes.ctClsJS" default=""><!--- @@type: JS @@help: An optional extra CSS class that will be added to this component's container (defaults to ''). This can be useful for adding customized styles to the container or any of its children using standard CSS rules. --->
<cfparam name="attributes.defaultType" default=""><!--- @@type: String @@help: The default xtype of child Components to create in this Container when a child item is specified as a raw configuration object, rather than as an instantiated Component. Defaults to 'panel'. --->
<cfparam name="attributes.defaultTypeJS" default=""><!--- @@type: JS @@help: The default xtype of child Components to create in this Container when a child item is specified as a raw configuration object, rather than as an instantiated Component. Defaults to 'panel'. --->
<cfparam name="attributes.defaults" default=""><!--- @@type: Object @@help: A config object that will be applied to all components added to this container either via the items config or via the add or insert methods. The defaults config can contain any number of name/value property pairs to be added to each item, and should be valid for the types of items being added to the container. For example, to automatically apply padding to the body of each of a set of contained Ext.Panel items, you could pass: defaults: {bodyStyle:'padding:15px'}. --->
<cfparam name="attributes.disabled" default=""><!--- @@type: Boolean @@help: Render this component disabled (default is false). --->
<cfparam name="attributes.disabledClass" default=""><!--- @@type: String @@help: CSS class added to the component when it is disabled (defaults to "x-item-disabled"). --->
<cfparam name="attributes.disabledClassJS" default=""><!--- @@type: JS @@help: CSS class added to the component when it is disabled (defaults to "x-item-disabled"). --->
<cfparam name="attributes.draggable" default=""><!--- @@type: Boolean @@help: True to enable dragging of this Panel (defaults to false). For custom drag/drop implementations, an Ext.Panel.DD config could also be passed in this config instead of true. Ext.Panel.DD is an internal, undocumented class which moves a proxy Element around in place of the Panel's element, but provides no other behaviour during dragging or on drop. It is a subclass of Ext.dd.DragSource, so behaviour may be added by implementing the interface methods of Ext.dd.DragDrop eg: new Ext.Panel({    title: 'Drag me',    x: 100,    y: 100,    renderTo: Ext.getBody(),    floating: true,    frame: true,    width: 400,    height: 200,    draggable: {//      Config option of Ext.Panel.DD class.//      It's a floating Panel, so do not show a placeholder proxy in the original position.        insertProxy: false,//      Called for each mousemove event while dragging the DD object.        onDrag : function(e){//          Record the x,y position of the drag proxy so that we can//          position the Panel at end of drag.            var pel = this.proxy.getEl();            this.x = pel.getLeft(true);            this.y = pel.getTop(true);//          Keep the Shadow aligned if there is one.            var s = this.panel.getEl().shadow;            if (s) {                s.realign(this.x, this.y, pel.getWidth(), pel.getHeight());            }        },//      Called on the mouseup event.        endDrag : function(e){            this.panel.setPosition(this.x, this.y);        }    }}).show(); --->
<cfparam name="attributes.elements" default=""><!--- @@type: String @@help: A comma-delimited list of panel elements to initialize when the panel is rendered. Normally, this list will be generated automatically based on the items added to the panel at config time, but sometimes it might be useful to make sure a structural element is rendered even if not specified at config time (for example, you may want to add a button or toolbar dynamically after the panel has been rendered). Adding those elements to this list will allocate the required placeholders in the panel when it is rendered. Valid values are header tbar (top bar) body (required) bbar (bottom bar) footer  Defaults to 'body'. --->
<cfparam name="attributes.elementsJS" default=""><!--- @@type: JS @@help: A comma-delimited list of panel elements to initialize when the panel is rendered. Normally, this list will be generated automatically based on the items added to the panel at config time, but sometimes it might be useful to make sure a structural element is rendered even if not specified at config time (for example, you may want to add a button or toolbar dynamically after the panel has been rendered). Adding those elements to this list will allocate the required placeholders in the panel when it is rendered. Valid values are header tbar (top bar) body (required) bbar (bottom bar) footer  Defaults to 'body'. --->
<cfparam name="attributes.errorReader" default=""><!--- @@type: DataReader @@help: An Ext.data.DataReader (e.g. Ext.data.XmlReader) to be used to read field error messages returned from "submit" actions. This is completely optional as there is built-in support for processing JSON. The Records which provide messages for the invalid Fields must use the Field name (or id) as the Record ID, and must contain a field called "msg" which contains the error message. The errorReader does not have to be a full-blown implementation of a DataReader. It simply needs to implement a read(xhr) function which returns an Array of Records in an object with the following structure:{    records: recordArray} --->
<cfparam name="attributes.extraCls" default=""><!--- @@type: String @@help: An optional extra CSS class that will be added to the container (defaults to ''). This can be useful for adding customized styles to the container or any of its children using standard CSS rules. --->
<cfparam name="attributes.extraClsJS" default=""><!--- @@type: JS @@help: An optional extra CSS class that will be added to the container (defaults to ''). This can be useful for adding customized styles to the container or any of its children using standard CSS rules. --->
<cfparam name="attributes.fieldLabel" default=""><!--- @@type: String @@help: The label text to display next to this Component (defaults to '') This config is only used when this Component is rendered by a Container which has been configured to use the FormLayout layout manager. Example use:new Ext.FormPanel({    height: 100,    renderTo: Ext.getBody(),    items: [{        xtype: 'textfield',        fieldLabel: 'Name'    }]}); --->
<cfparam name="attributes.fieldLabelJS" default=""><!--- @@type: JS @@help: The label text to display next to this Component (defaults to '') This config is only used when this Component is rendered by a Container which has been configured to use the FormLayout layout manager. Example use:new Ext.FormPanel({    height: 100,    renderTo: Ext.getBody(),    items: [{        xtype: 'textfield',        fieldLabel: 'Name'    }]}); --->
<cfparam name="attributes.fileUpload" default=""><!--- @@type: Boolean @@help: Set to true if this form is a file upload. File uploads are not performed using normal "Ajax" techniques, that is they are not performed using XMLHttpRequests. Instead the form is submitted in the standard manner with the DOM  element temporarily modified to have its target set to refer to a dynamically generated, hidden  which is inserted into the document but removed after the return data has been gathered. The server response is parsed by the browser to create the document for the IFRAME. If the server is using JSON to send the return object, then the Content-Type header must be set to "text/html" in order to tell the browser to insert the text unchanged into the document body. Characters which are significant to an HTML parser must be sent as HTML entities, so encode "<" as "&lt;", "&" as "&amp;" etc. The response text is retrieved from the document, and a fake XMLHttpRequest object is created containing a responseText property in order to conform to the requirements of event handlers and callbacks. Be aware that file upload packets are sent with the content type multipart/form and some server technologies (notably JEE) may require some custom processing in order to retrieve parameter names and parameter values from the packet content. --->
<cfparam name="attributes.floatable" default=""><!--- @@type: Boolean @@help: True to allow clicking a collapsed region's bar to display the region's panel floated above the layout, false to force the user to fully expand a collapsed region by clicking the expand button to see it again (defaults to true). --->
<cfparam name="attributes.floating" default=""><!--- @@type: Boolean @@help: True to float the panel (absolute position it with automatic shimming and shadow), false to display it inline where it is rendered (defaults to false). Note that by default, setting floating to true will cause the panel to display at negative offsets so that it is hidden -- because the panel is absolute positioned, the position must be set explicitly after render (e.g., myPanel.setPosition(100,100);). Also, when floating a panel you should always assign a fixed width, otherwise it will be auto width and will expand to fill to the right edge of the viewport. --->
<cfparam name="attributes.footer" default=""><!--- @@type: Boolean @@help: True to create the footer element explicitly, false to skip creating it. By default, when footer is not specified, if one or more buttons have been added to the panel the footer will be created automatically, otherwise it will not. --->
<cfparam name="attributes.formId" default=""><!--- @@type: String @@help: (optional) The id of the FORM tag (defaults to an auto-generated id). --->
<cfparam name="attributes.formIdJS" default=""><!--- @@type: JS @@help: (optional) The id of the FORM tag (defaults to an auto-generated id). --->
<cfparam name="attributes.frame" default=""><!--- @@type: Boolean @@help: True to render the panel with custom rounded borders, false to render with plain 1px square borders (defaults to false). --->
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
<cfparam name="attributes.itemCls" default=""><!--- @@type: String @@help: A css class to apply to the x-form-item of fields. This property cascades to child containers. --->
<cfparam name="attributes.itemClsJS" default=""><!--- @@type: JS @@help: A css class to apply to the x-form-item of fields. This property cascades to child containers. --->
<cfparam name="attributes.items" default=""><!--- @@type: String @@help: A single item, or an array of child Components to be added to this container. Each item can be any type of object based on Ext.Component. Component config objects may also be specified in order to avoid the overhead of constructing a real Component object if lazy rendering might mean that the added Component will not be rendered immediately. To take advantage of this "lazy instantiation", set the Ext.Component.xtype config property to the registered type of the Component wanted. For a list of all available xtypes, see Ext.Component. If a single item is being passed, it should be passed directly as an object reference (e.g., items: {...}). Multiple items should be passed as an array of objects (e.g., items: [{...}, {...}]). --->
<cfparam name="attributes.itemsJS" default=""><!--- @@type: Mixed @@help: A single item, or an array of child Components to be added to this container. Each item can be any type of object based on Ext.Component. Component config objects may also be specified in order to avoid the overhead of constructing a real Component object if lazy rendering might mean that the added Component will not be rendered immediately. To take advantage of this "lazy instantiation", set the Ext.Component.xtype config property to the registered type of the Component wanted. For a list of all available xtypes, see Ext.Component. If a single item is being passed, it should be passed directly as an object reference (e.g., items: {...}). Multiple items should be passed as an array of objects (e.g., items: [{...}, {...}]). --->
<cfparam name="attributes.keys" default=""><!--- @@type: Object/Array @@help: A KeyMap config object (in the format expected by Ext.KeyMap.addBinding used to assign custom key handling to this panel (defaults to null). --->
<cfparam name="attributes.labelAlign" default=""><!--- @@type: String @@help: Valid values are "left," "top" and "right" (defaults to "left"). This property cascades to child containers and can be overridden on any child container (e.g., a fieldset can specify a different labelAlign for its fields). --->
<cfparam name="attributes.labelAlignJS" default=""><!--- @@type: JS @@help: Valid values are "left," "top" and "right" (defaults to "left"). This property cascades to child containers and can be overridden on any child container (e.g., a fieldset can specify a different labelAlign for its fields). --->
<cfparam name="attributes.labelSeparator" default=""><!--- @@type: String @@help: The standard separator to display after the text of each form label (defaults to the value of Ext.layout.FormLayout.labelSeparator, which is a colon ':' by default). To display no separator for this field's label specify empty string ''. This config is only used when this Component is rendered by a Container which has been configured to use the FormLayout layout manager. Example use:new Ext.FormPanel({    height: 100,    renderTo: Ext.getBody(),    items: [{        xtype: 'textfield',        fieldLabel: 'Name',        labelSeparator: '...'    }]}); --->
<cfparam name="attributes.labelSeparatorJS" default=""><!--- @@type: JS @@help: The standard separator to display after the text of each form label (defaults to the value of Ext.layout.FormLayout.labelSeparator, which is a colon ':' by default). To display no separator for this field's label specify empty string ''. This config is only used when this Component is rendered by a Container which has been configured to use the FormLayout layout manager. Example use:new Ext.FormPanel({    height: 100,    renderTo: Ext.getBody(),    items: [{        xtype: 'textfield',        fieldLabel: 'Name',        labelSeparator: '...'    }]}); --->
<cfparam name="attributes.labelStyle" default=""><!--- @@type: String @@help: A CSS style specification to apply directly to this field's label (defaults to the container's labelStyle value if set, or '').. This config is only used when this Component is rendered by a Container which has been configured to use the FormLayout layout manager. Example use:new Ext.FormPanel({    height: 100,    renderTo: Ext.getBody(),    items: [{        xtype: 'textfield',        fieldLabel: 'Name',        labelStyle: 'font-weight:bold;'    }]}); --->
<cfparam name="attributes.labelStyleJS" default=""><!--- @@type: JS @@help: A CSS style specification to apply directly to this field's label (defaults to the container's labelStyle value if set, or '').. This config is only used when this Component is rendered by a Container which has been configured to use the FormLayout layout manager. Example use:new Ext.FormPanel({    height: 100,    renderTo: Ext.getBody(),    items: [{        xtype: 'textfield',        fieldLabel: 'Name',        labelStyle: 'font-weight:bold;'    }]}); --->
<cfparam name="attributes.labelWidth" default=""><!--- @@type: Number @@help: The width of labels. This property cascades to child containers and can be overridden on any child container (e.g., a fieldset can specify a different labelWidth for its fields). --->
<cfparam name="attributes.layoutConfig" default=""><!--- @@type: Object @@help: This is a config object containing properties specific to the chosen layout (to be used in conjunction with the layout config value). For complete details regarding the valid config options for each layout type, see the layout class corresponding to the type specified: Ext.layout.Absolute Ext.layout.Accordion Ext.layout.AnchorLayout Ext.layout.BorderLayout Ext.layout.CardLayout Ext.layout.ColumnLayout Ext.layout.FitLayout Ext.layout.FormLayout Ext.layout.TableLayout --->
<cfparam name="attributes.listeners" default=""><!--- @@type: Object @@help: (optional) A config object containing one or more event handlers to be added to this object during initialization. This should be a valid listeners config object as specified in the addListener example for attaching multiple handlers at once. --->
<cfparam name="attributes.margins" default=""><!--- @@type: String @@help: An object containing margins to apply to the region when in the expanded state in the format:{    top: (top margin),    right: (right margin),    bottom: (bottom margin)    left: (left margin),} May also be a string containing space-separated, numeric margin values. The order of the sides associated with each value matches the way CSS processes margin values:  If there is only one value, it applies to all sides. If there are two values, the top and bottom borders are set to the first value and the right and left are set to the second. If there are three values, the top is set to the first value, the left and right are set to the second, and the bottom is set to the third. If there are four values, they apply to the top, right, bottom, and left, respectively. --->
<cfparam name="attributes.marginsJS" default=""><!--- @@type: Object @@help: An object containing margins to apply to the region when in the expanded state in the format:{    top: (top margin),    right: (right margin),    bottom: (bottom margin)    left: (left margin),} May also be a string containing space-separated, numeric margin values. The order of the sides associated with each value matches the way CSS processes margin values:  If there is only one value, it applies to all sides. If there are two values, the top and bottom borders are set to the first value and the right and left are set to the second. If there are three values, the top is set to the first value, the left and right are set to the second, and the bottom is set to the third. If there are four values, they apply to the top, right, bottom, and left, respectively. --->
<cfparam name="attributes.maskDisabled" default=""><!--- @@type: Boolean @@help: True to mask the panel when it is disabled, false to not mask it (defaults to true). Either way, the panel will always tell its contained elements to disable themselves when it is disabled, but masking the panel can provide an additional visual cue that the panel is disabled. --->
<cfparam name="attributes.method" default=""><!--- @@type: String @@help: The request method to use (GET or POST) for form actions if one isn't supplied in the action options. --->
<cfparam name="attributes.methodJS" default=""><!--- @@type: JS @@help: The request method to use (GET or POST) for form actions if one isn't supplied in the action options. --->
<cfparam name="attributes.minButtonWidth" default=""><!--- @@type: Number @@help: Minimum width of all buttons in pixels (defaults to 75) --->
<cfparam name="attributes.minHeight" default=""><!--- @@type: Number @@help: The minimum allowable height in pixels for this region (defaults to 50) --->
<cfparam name="attributes.minWidth" default=""><!--- @@type: Number @@help: The minimum allowable width in pixels for this region (defaults to 50) --->
<cfparam name="attributes.monitorPoll" default=""><!--- @@type: Number @@help: The milliseconds to poll valid state, ignored if monitorValid is not true (defaults to 200) --->
<cfparam name="attributes.monitorResize" default=""><!--- @@type: Boolean @@help: True to automatically monitor window resize events to handle anything that is sensitive to the current size of the viewport. This value is typically managed by the chosen layout and should not need to be set manually. --->
<cfparam name="attributes.monitorValid" default=""><!--- @@type: Boolean @@help: If true, the form monitors its valid state client-side and regularly fires the clientvalidation event passing that state. When monitoring valid state, the FormPanel enables/disables any of its configured buttons which have been configured with formBind: true depending on whether the form is valid or not. --->
<cfparam name="attributes.overCls" default=""><!--- @@type: String @@help: An optional extra CSS class that will be added to this component's Element when the mouse moves over the Element, and removed when the mouse moves out. (defaults to ''). This can be useful for adding customized "active" or "hover" styles to the component or any of its children using standard CSS rules. --->
<cfparam name="attributes.overClsJS" default=""><!--- @@type: JS @@help: An optional extra CSS class that will be added to this component's Element when the mouse moves over the Element, and removed when the mouse moves out. (defaults to ''). This can be useful for adding customized "active" or "hover" styles to the component or any of its children using standard CSS rules. --->
<cfparam name="attributes.pageX" default=""><!--- @@type: Number @@help: The page level x coordinate for this component if contained within a positioning container. --->
<cfparam name="attributes.pageY" default=""><!--- @@type: Number @@help: The page level y coordinate for this component if contained within a positioning container. --->
<cfparam name="attributes.plugins" default=""><!--- @@type: Object/Array @@help: An object or array of objects that will provide custom functionality for this component. The only requirement for a valid plugin is that it contain an init method that accepts a reference of type Ext.Component. When a component is created, if any plugins are available, the component will call the init method on each plugin, passing a reference to itself. Each plugin can then call methods or respond to events on the component as needed to provide its functionality. --->
<cfparam name="attributes.reader" default=""><!--- @@type: DataReader @@help: An Ext.data.DataReader (e.g. Ext.data.XmlReader) to be used to read data when executing "load" actions. This is optional as there is built-in support for processing JSON. --->
<cfparam name="attributes.renderHidden" default=""><!--- @@type: Boolean @@help: True to hide each contained item on render (defaults to false). --->
<cfparam name="attributes.renderTo" default=""><!--- @@type: String @@help: The id of the node, a DOM node or an existing Element that will be the container to render this component into. Using this config, a call to render() is not required. --->
<cfparam name="attributes.renderToJS" default=""><!--- @@type: Mixed @@help: The id of the node, a DOM node or an existing Element that will be the container to render this component into. Using this config, a call to render() is not required. --->
<cfparam name="attributes.shadow" default=""><!--- @@type: String @@help: True (or a valid Ext.Shadow Ext.Shadow.mode value) to display a shadow behind the panel, false to display no shadow (defaults to 'sides'). Note that this option only applies when floating = true. --->
<cfparam name="attributes.shadowJS" default=""><!--- @@type: Boolean/String @@help: True (or a valid Ext.Shadow Ext.Shadow.mode value) to display a shadow behind the panel, false to display no shadow (defaults to 'sides'). Note that this option only applies when floating = true. --->
<cfparam name="attributes.shadowOffset" default=""><!--- @@type: Number @@help: The number of pixels to offset the shadow if displayed (defaults to 4). Note that this option only applies when floating = true. --->
<cfparam name="attributes.shim" default=""><!--- @@type: Boolean @@help: False to disable the iframe shim in browsers which need one (defaults to true). Note that this option only applies when floating = true. --->
<cfparam name="attributes.split" default=""><!--- @@type: Boolean @@help: True to display a Ext.SplitBar between this region and its neighbor, allowing the user to resize the regions dynamically (defaults to false). When split == true, it is common to specify a minSize and maxSize for the BoxComponent representing the region. These are not native configs of BoxComponent, and are used only by this class. --->
<cfparam name="attributes.splitTip" default=""><!--- @@type: String @@help: The tooltip to display when the user hovers over a non-collapsible region's split bar (defaults to "Drag to resize."). Only applies if useSplitTips = true. --->
<cfparam name="attributes.splitTipJS" default=""><!--- @@type: JS @@help: The tooltip to display when the user hovers over a non-collapsible region's split bar (defaults to "Drag to resize."). Only applies if useSplitTips = true. --->
<cfparam name="attributes.standardSubmit" default=""><!--- @@type: Boolean @@help: If set to true, standard HTML form submits are used instead of XHR (Ajax) style form submissions. (defaults to false) Note: When using standardSubmit, any the options to submit are ignored because Ext's Ajax infrastracture is bypassed. To pass extra parameters, you will need to create hidden fields within the form. --->
<cfparam name="attributes.stateEvents" default=""><!--- @@type: Array @@help: An array of events that, when fired, should trigger this component to save its state (defaults to none). These can be any types of events supported by this component, including browser or custom events (e.g., ['click', 'customerchange']). See stateful for an explanation of saving and restoring Component state. --->
<cfparam name="attributes.stateId" default=""><!--- @@type: String @@help: The unique id for this component to use for state management purposes (defaults to the component id if one was set, otherwise null if the component is using a generated id). See stateful for an explanation of saving and restoring Component state. --->
<cfparam name="attributes.stateIdJS" default=""><!--- @@type: JS @@help: The unique id for this component to use for state management purposes (defaults to the component id if one was set, otherwise null if the component is using a generated id). See stateful for an explanation of saving and restoring Component state. --->
<cfparam name="attributes.stateful" default=""><!--- @@type: Boolean @@help: A flag which causes the Component to attempt to restore the state of internal properties from a saved state on startup. The component must have either a stateId or id assigned for state to be managed. Auto-generated ids are not guaranteed to be stable across page loads and cannot be relied upon to save and restore the same state for a component. For state saving to work, the state manager's provider must have been set to an implementation of Ext.state.Provider which overrides the set and get methods to save and recall name/value pairs. A built-in implementation, Ext.state.CookieProvider is available. To set the state provider for the current page: Ext.state.Manager.setProvider(new Ext.state.CookieProvider()); Components attempt to save state when one of the events listed in the stateEvents configuration fires. You can perform extra processing on state save and restore by attaching handlers to the beforestaterestore, staterestore, beforestatesave and statesave events --->
<cfparam name="attributes.style" default=""><!--- @@type: String @@help: A custom style specification to be applied to this component's Element. Should be a valid argument to Ext.Element.applyStyles. --->
<cfparam name="attributes.styleJS" default=""><!--- @@type: JS @@help: A custom style specification to be applied to this component's Element. Should be a valid argument to Ext.Element.applyStyles. --->
<cfparam name="attributes.tabTip" default=""><!--- @@type: String @@help: Adds a tooltip when mousing over the tab of a Ext.Panel which is an item of a Ext.TabPanel. Ext.QuickTips.init() must be called in order for the tips to render. --->
<cfparam name="attributes.tabTipJS" default=""><!--- @@type: JS @@help: Adds a tooltip when mousing over the tab of a Ext.Panel which is an item of a Ext.TabPanel. Ext.QuickTips.init() must be called in order for the tips to render. --->
<cfparam name="attributes.tbar" default=""><!--- @@type: Object/Array @@help: The top toolbar of the panel. This can be either an Ext.Toolbar object or an array of buttons/button configs to be added to the toolbar. Note that this is not available as a property after render. To access the top toolbar after render, use getTopToolbar. --->
<cfparam name="attributes.timeout" default=""><!--- @@type: Number @@help: Timeout for form actions in seconds (default is 30 seconds). --->
<cfparam name="attributes.title" default=""><!--- @@type: String @@help: The title text to display in the panel header (defaults to ''). When a title is specified the header element will automatically be created and displayed unless header is explicitly set to false. If you don't want to specify a title at config time, but you may want one later, you must either specify a non-empty title (a blank space ' ' will do) or header:true so that the container element will get created. --->
<cfparam name="attributes.titleJS" default=""><!--- @@type: JS @@help: The title text to display in the panel header (defaults to ''). When a title is specified the header element will automatically be created and displayed unless header is explicitly set to false. If you don't want to specify a title at config time, but you may want one later, you must either specify a non-empty title (a blank space ' ' will do) or header:true so that the container element will get created. --->
<cfparam name="attributes.titleCollapse" default=""><!--- @@type: Boolean @@help: True to allow expanding and collapsing the panel (when collapsible = true) by clicking anywhere in the header bar, false to allow it only by clicking to tool button (defaults to false). --->
<cfparam name="attributes.tools" default=""><!--- @@type: Array @@help: An array of tool button configs to be added to the header tool area. When rendered, each tool is stored as an Element referenced by a public property called tools. Each tool config may contain the following properties:  id : StringRequired. The type of tool to create. Values may be toggle (Created by default when collapsible is true) close minimize maximize restore gear pin unpin right left up down refresh minus plus help search save print  handler : FunctionRequired. The function to call when clicked. Arguments passed are: event : Ext.EventObjectThe click event. toolEl : Ext.ElementThe tool Element. Panel : Ext.PanelThe host Panel  scope : ObjectThe scope in which to call the handler. qtip : String/ObjectA tip string, or a config argument to Ext.QuickTip.register hidden : BooleanTrue to initially render hidden. on : ObjectA listener config object specifiying event listeners in the format of an argument to addListener  Example usage: tools:[{    id:'refresh',    qtip: 'Refresh form Data',    // hidden:true,    handler: function(event, toolEl, panel){        // refresh logic    }}] Note that apart from the toggle tool which is provided when a panel is collapsible, these tools only provide the visual button. Any required functionality must be provided by adding handlers that implement the necessary behavior. --->
<cfparam name="attributes.trackResetOnLoad" default=""><!--- @@type: Boolean @@help: If set to true, form.reset() resets to the last loaded or setValues() data instead of when the form was first created. --->
<cfparam name="attributes.url" default=""><!--- @@type: String @@help: The URL to use for form actions if one isn't supplied in the action options. --->
<cfparam name="attributes.urlJS" default=""><!--- @@type: JS @@help: The URL to use for form actions if one isn't supplied in the action options. --->
<cfparam name="attributes.useSplitTips" default=""><!--- @@type: Boolean @@help: True to display a tooltip when the user hovers over a region's split bar (defaults to false). The tooltip text will be the value of either splitTip or collapsibleSplitTip as appropriate. --->
<cfparam name="attributes.width" default=""><!--- @@type: Number @@help: The width of this component in pixels (defaults to auto). --->
<cfparam name="attributes.x" default=""><!--- @@type: Number @@help: The local x (left) coordinate for this component if contained within a positioning container. --->
<cfparam name="attributes.xtype" default=""><!--- @@type: String @@help: The registered xtype to create. This config option is not used when passing a config object into a constructor. This config option is used only when lazy instantiation is being used, and a child item of a Container is being specified not as a fully instantiated Component, but as a Component config object. The xtype will be looked up at render time up to determine what type of child Component to create. The predefined xtypes are listed here.  If you subclass Components to create your own Components, you may register them using Ext.ComponentMgr.registerType in order to be able to take advantage of lazy instantiation and rendering. --->
<cfparam name="attributes.xtypeJS" default=""><!--- @@type: JS @@help: The registered xtype to create. This config option is not used when passing a config object into a constructor. This config option is used only when lazy instantiation is being used, and a child item of a Container is being specified not as a fully instantiated Component, but as a Component config object. The xtype will be looked up at render time up to determine what type of child Component to create. The predefined xtypes are listed here.  If you subclass Components to create your own Components, you may register them using Ext.ComponentMgr.registerType in order to be able to take advantage of lazy instantiation and rendering. --->
<cfparam name="attributes.y" default=""><!--- @@type: Number @@help: The local y (top) coordinate for this component if contained within a positioning container. --->

<!--- custom attributes --->
<cfparam name="attributes.passThrough" default=""><!--- @@type: JS @@help: (ColdExt attribute) A comma separated list of JavaScript name:value pairs that will be written directly to the Ext component config. This is useful for storing custom properties in Ext components. --->
<cfparam name="attributes.var" default=""><!--- @@type: JS Variable Name @@help: (ColdExt attribute) The JavaScript variable name that this component will be assigned to. NOTE: You should only use the var attribute when this tags parent is the onReady tag. --->
<cfparam name="attributes.padding" default="#Application.ColdExt.defaultFormPanelPadding#"><!--- @@type: Number @@help: (ColdExt attribute) The number of pixels to use as padding for the bodyStyle --->



<!--- arrays that may be populated by nested tags --->
<cfset thisTag.baseParams = ArrayNew(1)>
<cfset thisTag.bbar = ArrayNew(1)>
<cfset thisTag.buttons = ArrayNew(1)>
<cfset thisTag.items = ArrayNew(1)>
<cfset thisTag.listeners = ArrayNew(1)>
<cfset thisTag.reader = ArrayNew(1)>
<cfset thisTag.tbar = ArrayNew(1)>
<cfset thisTag.tools = ArrayNew(1)>

<!--- process custom attributes --->
<!--- var --->
<cfset attributes.var = validateVarAttribute(parentTag)>

<!--- padding -> bodyStyle --->
<cfif attributes.padding neq "">
	<cfif attributes.bodyStyle neq "">
		<cfset attributes.bodyStyle = ", " & attributes.bodyStyle>
	</cfif>
	<cfset attributes.bodyStyle = "padding: #attributes.padding#px; " & attributes.bodyStyle>
</cfif>

<!--- check for closing tag --->
<cfif not thisTag.hasEndTag>
	<cfthrow message="formPanel missing closing tag">
</cfif>



<cfelseif thisTag.executionMode eq "end">

<cfset _html = JSStringFormat(trim(thisTag.GeneratedContent))>
<cfset thisTag.GeneratedContent = "">


<cfsavecontent variable="attributes._out">
<cfprocessingdirective suppresswhitespace="true">
<cfoutput>
	<cfif AttributeNotEmpty("var")>var #attributes.var# = </cfif>new Ext.form.FormPanel({
		<cfif AttributeNotEmpty("activeItem")>activeItem: "#JSStringFormat(attributes.activeItem)#",</cfif>
		<cfif AttributeNotEmpty("activeItemJS")>activeItem: #attributes.activeItemJS#,</cfif>
		<cfif AttributeNotEmpty("allowDomMove")>allowDomMove: #attributes.allowDomMove#,</cfif>
		<cfif AttributeNotEmpty("animCollapse")>animCollapse: #attributes.animCollapse#,</cfif>
		<cfif AttributeNotEmpty("animFloat")>animFloat: #attributes.animFloat#,</cfif>
		<cfif AttributeNotEmpty("applyTo")>applyTo: "#JSStringFormat(attributes.applyTo)#",</cfif>
		<cfif AttributeNotEmpty("applyToJS")>applyTo: #attributes.applyToJS#,</cfif>
		<cfif AttributeNotEmpty("autoDestroy")>autoDestroy: #attributes.autoDestroy#,</cfif>
		<cfif AttributeNotEmpty("autoEl")>autoEl: "#JSStringFormat(attributes.autoEl)#",</cfif>
		<cfif AttributeNotEmpty("autoElJS")>autoEl: #attributes.autoElJS#,</cfif>
		<cfif AttributeNotEmpty("autoHeight")>autoHeight: #attributes.autoHeight#,</cfif>
		<cfif AttributeNotEmpty("autoHide")>autoHide: #attributes.autoHide#,</cfif>
		<cfif AttributeNotEmpty("autoLoad")>autoLoad: "#JSStringFormat(attributes.autoLoad)#",</cfif>
		<cfif AttributeNotEmpty("autoLoadJS")>autoLoad: #attributes.autoLoadJS#,</cfif>
		<cfif AttributeNotEmpty("autoScroll")>autoScroll: #attributes.autoScroll#,</cfif>
		<cfif AttributeNotEmpty("autoShow")>autoShow: #attributes.autoShow#,</cfif>
		<cfif AttributeNotEmpty("autoWidth")>autoWidth: #attributes.autoWidth#,</cfif>
		<cfif AttributeNotEmpty("baseCls")>baseCls: "#JSStringFormat(attributes.baseCls)#",</cfif>
		<cfif AttributeNotEmpty("baseClsJS")>baseCls: #attributes.baseClsJS#,</cfif>
		<cfif AttributeNotEmpty("baseParams")>baseParams: #attributes.baseParams#,</cfif>
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
		<cfif AttributeNotEmpty("cls")>cls: "#JSStringFormat(attributes.cls)#",</cfif>
		<cfif AttributeNotEmpty("clsJS")>cls: #attributes.clsJS#,</cfif>
		<cfif AttributeNotEmpty("cmargins")>cmargins: #attributes.cmargins#,</cfif>
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
		<cfif AttributeNotEmpty("contentEl")>contentEl: "#JSStringFormat(attributes.contentEl)#",</cfif>
		<cfif AttributeNotEmpty("contentElJS")>contentEl: #attributes.contentElJS#,</cfif>
		<cfif AttributeNotEmpty("ctCls")>ctCls: "#JSStringFormat(attributes.ctCls)#",</cfif>
		<cfif AttributeNotEmpty("ctClsJS")>ctCls: #attributes.ctClsJS#,</cfif>
		<cfif AttributeNotEmpty("defaultType")>defaultType: "#JSStringFormat(attributes.defaultType)#",</cfif>
		<cfif AttributeNotEmpty("defaultTypeJS")>defaultType: #attributes.defaultTypeJS#,</cfif>
		<cfif AttributeNotEmpty("defaults")>defaults: #attributes.defaults#,</cfif>
		<cfif AttributeNotEmpty("disabled")>disabled: #attributes.disabled#,</cfif>
		<cfif AttributeNotEmpty("disabledClass")>disabledClass: "#JSStringFormat(attributes.disabledClass)#",</cfif>
		<cfif AttributeNotEmpty("disabledClassJS")>disabledClass: #attributes.disabledClassJS#,</cfif>
		<cfif AttributeNotEmpty("draggable")>draggable: #attributes.draggable#,</cfif>
		<cfif AttributeNotEmpty("elements")>elements: "#JSStringFormat(attributes.elements)#",</cfif>
		<cfif AttributeNotEmpty("elementsJS")>elements: #attributes.elementsJS#,</cfif>
		<cfif AttributeNotEmpty("errorReader")>errorReader: #attributes.errorReader#,</cfif>
		<cfif AttributeNotEmpty("extraCls")>extraCls: "#JSStringFormat(attributes.extraCls)#",</cfif>
		<cfif AttributeNotEmpty("extraClsJS")>extraCls: #attributes.extraClsJS#,</cfif>
		<cfif AttributeNotEmpty("fieldLabel")>fieldLabel: "#JSStringFormat(attributes.fieldLabel)#",</cfif>
		<cfif AttributeNotEmpty("fieldLabelJS")>fieldLabel: #attributes.fieldLabelJS#,</cfif>
		<cfif AttributeNotEmpty("fileUpload")>fileUpload: #attributes.fileUpload#,</cfif>
		<cfif AttributeNotEmpty("floatable")>floatable: #attributes.floatable#,</cfif>
		<cfif AttributeNotEmpty("floating")>floating: #attributes.floating#,</cfif>
		<cfif AttributeNotEmpty("footer")>footer: #attributes.footer#,</cfif>
		<cfif AttributeNotEmpty("formId")>formId: "#JSStringFormat(attributes.formId)#",</cfif>
		<cfif AttributeNotEmpty("formIdJS")>formId: #attributes.formIdJS#,</cfif>
		<cfif AttributeNotEmpty("frame")>frame: #attributes.frame#,</cfif>
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
		<cfif AttributeNotEmpty("html")>html: "#JSStringFormat(attributes.html)#",</cfif>
		<cfif AttributeNotEmpty("htmlJS")>html: #attributes.htmlJS#,</cfif>
		<cfif AttributeNotEmpty("iconCls")>iconCls: "#JSStringFormat(attributes.iconCls)#",</cfif>
		<cfif AttributeNotEmpty("iconClsJS")>iconCls: #attributes.iconClsJS#,</cfif>
		<cfif AttributeNotEmpty("id")>id: "#JSStringFormat(attributes.id)#",</cfif>
		<cfif AttributeNotEmpty("idJS")>id: #attributes.idJS#,</cfif>
		<cfif AttributeNotEmpty("itemCls")>itemCls: "#JSStringFormat(attributes.itemCls)#",</cfif>
		<cfif AttributeNotEmpty("itemClsJS")>itemCls: #attributes.itemClsJS#,</cfif>
		<cfif AttributeNotEmpty("items")>items: "#JSStringFormat(attributes.items)#",</cfif>
		<cfif AttributeNotEmpty("itemsJS")>items: #attributes.itemsJS#,</cfif>
		<cfif AttributeNotEmpty("keys")>keys: #attributes.keys#,</cfif>
		<cfif AttributeNotEmpty("labelAlign")>labelAlign: "#JSStringFormat(attributes.labelAlign)#",</cfif>
		<cfif AttributeNotEmpty("labelAlignJS")>labelAlign: #attributes.labelAlignJS#,</cfif>
		<cfif AttributeNotEmpty("labelSeparator")>labelSeparator: "#JSStringFormat(attributes.labelSeparator)#",</cfif>
		<cfif AttributeNotEmpty("labelSeparatorJS")>labelSeparator: #attributes.labelSeparatorJS#,</cfif>
		<cfif AttributeNotEmpty("labelStyle")>labelStyle: "#JSStringFormat(attributes.labelStyle)#",</cfif>
		<cfif AttributeNotEmpty("labelStyleJS")>labelStyle: #attributes.labelStyleJS#,</cfif>
		<cfif AttributeNotEmpty("labelWidth")>labelWidth: #attributes.labelWidth#,</cfif>
		<cfif AttributeNotEmpty("layoutConfig")>layoutConfig: #attributes.layoutConfig#,</cfif>
		<cfif AttributeNotEmpty("listeners")>listeners: #attributes.listeners#,</cfif>
		<cfif AttributeNotEmpty("margins")>margins: "#JSStringFormat(attributes.margins)#",</cfif>
		<cfif AttributeNotEmpty("marginsJS")>margins: #attributes.marginsJS#,</cfif>
		<cfif AttributeNotEmpty("maskDisabled")>maskDisabled: #attributes.maskDisabled#,</cfif>
		<cfif AttributeNotEmpty("method")>method: "#JSStringFormat(attributes.method)#",</cfif>
		<cfif AttributeNotEmpty("methodJS")>method: #attributes.methodJS#,</cfif>
		<cfif AttributeNotEmpty("minButtonWidth")>minButtonWidth: #attributes.minButtonWidth#,</cfif>
		<cfif AttributeNotEmpty("minHeight")>minHeight: #attributes.minHeight#,</cfif>
		<cfif AttributeNotEmpty("minWidth")>minWidth: #attributes.minWidth#,</cfif>
		<cfif AttributeNotEmpty("monitorPoll")>monitorPoll: #attributes.monitorPoll#,</cfif>
		<cfif AttributeNotEmpty("monitorResize")>monitorResize: #attributes.monitorResize#,</cfif>
		<cfif AttributeNotEmpty("monitorValid")>monitorValid: #attributes.monitorValid#,</cfif>
		<cfif AttributeNotEmpty("overCls")>overCls: "#JSStringFormat(attributes.overCls)#",</cfif>
		<cfif AttributeNotEmpty("overClsJS")>overCls: #attributes.overClsJS#,</cfif>
		<cfif AttributeNotEmpty("pageX")>pageX: #attributes.pageX#,</cfif>
		<cfif AttributeNotEmpty("pageY")>pageY: #attributes.pageY#,</cfif>
		<cfif AttributeNotEmpty("plugins")>plugins: #attributes.plugins#,</cfif>
		<cfif AttributeNotEmpty("reader")>reader: #attributes.reader#,</cfif>
		<cfif AttributeNotEmpty("renderHidden")>renderHidden: #attributes.renderHidden#,</cfif>
		<cfif AttributeNotEmpty("renderTo")>renderTo: "#JSStringFormat(attributes.renderTo)#",</cfif>
		<cfif AttributeNotEmpty("renderToJS")>renderTo: #attributes.renderToJS#,</cfif>
		<cfif AttributeNotEmpty("shadow")>shadow: "#JSStringFormat(attributes.shadow)#",</cfif>
		<cfif AttributeNotEmpty("shadowJS")>shadow: #attributes.shadowJS#,</cfif>
		<cfif AttributeNotEmpty("shadowOffset")>shadowOffset: #attributes.shadowOffset#,</cfif>
		<cfif AttributeNotEmpty("shim")>shim: #attributes.shim#,</cfif>
		<cfif AttributeNotEmpty("split")>split: #attributes.split#,</cfif>
		<cfif AttributeNotEmpty("splitTip")>splitTip: "#JSStringFormat(attributes.splitTip)#",</cfif>
		<cfif AttributeNotEmpty("splitTipJS")>splitTip: #attributes.splitTipJS#,</cfif>
		<cfif AttributeNotEmpty("standardSubmit")>standardSubmit: #attributes.standardSubmit#,</cfif>
		<cfif AttributeNotEmpty("stateEvents")>stateEvents: #attributes.stateEvents#,</cfif>
		<cfif AttributeNotEmpty("stateId")>stateId: "#JSStringFormat(attributes.stateId)#",</cfif>
		<cfif AttributeNotEmpty("stateIdJS")>stateId: #attributes.stateIdJS#,</cfif>
		<cfif AttributeNotEmpty("stateful")>stateful: #attributes.stateful#,</cfif>
		<cfif AttributeNotEmpty("style")>style: "#JSStringFormat(attributes.style)#",</cfif>
		<cfif AttributeNotEmpty("styleJS")>style: #attributes.styleJS#,</cfif>
		<cfif AttributeNotEmpty("tabTip")>tabTip: "#JSStringFormat(attributes.tabTip)#",</cfif>
		<cfif AttributeNotEmpty("tabTipJS")>tabTip: #attributes.tabTipJS#,</cfif>
		<cfif AttributeNotEmpty("tbar")>tbar: #attributes.tbar#,</cfif>
		<cfif AttributeNotEmpty("timeout")>timeout: #attributes.timeout#,</cfif>
		<cfif AttributeNotEmpty("title")>title: "#JSStringFormat(attributes.title)#",</cfif>
		<cfif AttributeNotEmpty("titleJS")>title: #attributes.titleJS#,</cfif>
		<cfif AttributeNotEmpty("titleCollapse")>titleCollapse: #attributes.titleCollapse#,</cfif>
		<cfif AttributeNotEmpty("tools")>tools: #attributes.tools#,</cfif>
		<cfif AttributeNotEmpty("trackResetOnLoad")>trackResetOnLoad: #attributes.trackResetOnLoad#,</cfif>
		<cfif AttributeNotEmpty("url")>url: "#JSStringFormat(attributes.url)#",</cfif>
		<cfif AttributeNotEmpty("urlJS")>url: #attributes.urlJS#,</cfif>
		<cfif AttributeNotEmpty("useSplitTips")>useSplitTips: #attributes.useSplitTips#,</cfif>
		<cfif AttributeNotEmpty("width")>width: #attributes.width#,</cfif>
		<cfif AttributeNotEmpty("x")>x: #attributes.x#,</cfif>
		<cfif AttributeNotEmpty("xtype")>xtype: "#JSStringFormat(attributes.xtype)#",</cfif>
		<cfif AttributeNotEmpty("xtypeJS")>xtype: #attributes.xtypeJS#,</cfif>
		<cfif AttributeNotEmpty("y")>y: #attributes.y#,</cfif>

		<cfif AttributeNotEmpty("passThrough")>#attributes.passThrough#,</cfif>

		<cfif arrayLen(thisTag.baseParams)>baseParams: { #ArrayKeyToList(thisTag.baseParams, "_out")# },</cfif>
		<cfif arrayLen(thisTag.bbar)>bbar: #thisTag.bbar[1]._out#,</cfif>
		<cfif arrayLen(thisTag.buttons)>buttons: [ #ArrayKeyToList(thisTag.buttons, "_out")# ],</cfif>
		<cfif arrayLen(thisTag.items)>items: [ #ArrayKeyToList(thisTag.items, "_out")# ],</cfif>
		<cfif arrayLen(thisTag.listeners)>listeners: { #ArrayKeyToList(thisTag.listeners, "_out")# },</cfif>
		<cfif arrayLen(thisTag.reader)>reader: #thisTag.reader[1]._out#,</cfif>
		<cfif arrayLen(thisTag.tbar)>tbar: #thisTag.tbar[1]._out#,</cfif>
		<cfif arrayLen(thisTag.tools)>tools: [ #ArrayKeyToList(thisTag.tools, "_out")# ],</cfif>

		<cfif AttributeNotEmpty("url")>
		url: "#attributes.url#",
		method: "post",
		</cfif>

		<!--- html content --->
		<cfif AttributeNotEmpty("html")>html: "#JSStringFormat(attributes.html)#",
		<cfelseif AttributeNotEmpty("htmlJS")>html: #attributes.html#,
		<cfelseif len(_html)>html: "#_html#",</cfif>

		dummy: true
	})<cfif AttributeNotEmpty("var")>;</cfif>
</cfoutput>
</cfprocessingdirective>
</cfsavecontent>

<cfassociate basetag="#parentTag#" datacollection="items">


</cfif>


<cfsetting enablecfoutputonly="false">