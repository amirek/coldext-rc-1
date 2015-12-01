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


<!--- setup --->
<cfset _bNameOnly = StructCount(attributes) eq 1 AND AttributeNotEmpty("name")>


<!--- attributes --->
<cfparam name="attributes.convert" default=""><!--- @@type: Function @@help: (Optional) A function which converts the value provided by the Reader into an object that will be stored in the Record. It is passed the following parameters: * v : Mixed The data value as read by the Reader. * rec : Mixed The data object containting the row as read by the Reader. Depending on Reader type, this could be an Array, an object, or an XML element. --->
<cfparam name="attributes.dateFormat" default=""><!--- @@type: String @@help: (Optional) A format String for the Date.parseDate function. --->
<cfparam name="attributes.dateFormatJS" default=""><!--- @@type: JS @@help: (Optional) A format String for the Date.parseDate function. --->
<cfparam name="attributes.mapping" default=""><!--- @@type: String @@help: (Optional) A path specification for use by the Ext.data.Reader implementation that is creating the Record to access the data value from the data object. If an Ext.data.JsonReader is being used, then this is a string containing the javascript expression to reference the data relative to the record item's root. If an Ext.data.XmlReader is being used, this is an Ext.DomQuery path to the data item relative to the record element. If the mapping expression is the same as the field name, this may be omitted. --->
<cfparam name="attributes.mappingJS" default=""><!--- @@type: JS @@help: (Optional) A path specification for use by the Ext.data.Reader implementation that is creating the Record to access the data value from the data object. If an Ext.data.JsonReader is being used, then this is a string containing the javascript expression to reference the data relative to the record item's root. If an Ext.data.XmlReader is being used, this is an Ext.DomQuery path to the data item relative to the record element. If the mapping expression is the same as the field name, this may be omitted. --->
<cfparam name="attributes.name" default=""><!--- @@type: String @@help: The name by which the field is referenced within the Record. This is referenced by, for example the dataIndex property in column definition objects passed to Ext.grid.ColumnModel --->
<cfparam name="attributes.nameJS" default=""><!--- @@type: JS @@help: The name by which the field is referenced within the Record. This is referenced by, for example the dataIndex property in column definition objects passed to Ext.grid.ColumnModel --->
<cfparam name="attributes.sortDir" default=""><!--- @@type: String @@help: (Optional) Initial direction to sort. "ASC" or "DESC" --->
<cfparam name="attributes.sortDirJS" default=""><!--- @@type: JS @@help: (Optional) Initial direction to sort. "ASC" or "DESC" --->
<cfparam name="attributes.sortType" default=""><!--- @@type: String @@help: (Optional) A member of Ext.data.SortTypes. --->
<cfparam name="attributes.sortTypeJS" default=""><!--- @@type: Mixed @@help: (Optional) A member of Ext.data.SortTypes. --->
<cfparam name="attributes.type" default=""><!--- @@type: String @@help: (Optional) The data type for conversion to displayable value. Possible values are * auto (Default, implies no conversion) * string * int * float * boolean * date --->
<cfparam name="attributes.typeJS" default=""><!--- @@type: JS @@help: (Optional) The data type for conversion to displayable value. Possible values are * auto (Default, implies no conversion) * string * int * float * boolean * date --->

<!--- custom attributes --->
<cfparam name="attributes.passThrough" default=""><!--- @@type: JS @@help: (ColdExt attribute) A comma separated list of JavaScript name:value pairs that will be written directly to the Ext component config. This is useful for storing custom properties in Ext components. --->


</cfif>



<cfif thisTag.executionMode eq "end" OR NOT thisTag.hasEndTag>

<cfsavecontent variable="attributes._out">
<cfprocessingdirective suppresswhitespace="true">
	<cfif _bNameOnly>
		<cfoutput>"#attributes.name#"</cfoutput>
	<cfelse>
		<cfoutput>{
			<cfif AttributeNotEmpty("convert")>convert: #attributes.convert#,</cfif>
			<cfif AttributeNotEmpty("dateFormat")>dateFormat: "#JSStringFormat(attributes.dateFormat)#",</cfif>
			<cfif AttributeNotEmpty("dateFormatJS")>dateFormat: #attributes.dateFormatJS#,</cfif>
			<cfif AttributeNotEmpty("mapping")>mapping: "#JSStringFormat(attributes.mapping)#",</cfif>
			<cfif AttributeNotEmpty("mappingJS")>mapping: #attributes.mappingJS#,</cfif>
			<cfif AttributeNotEmpty("sortDir")>sortDir: "#JSStringFormat(attributes.sortDir)#",</cfif>
			<cfif AttributeNotEmpty("sortDirJS")>sortDir: #attributes.sortDirJS#,</cfif>
			<cfif AttributeNotEmpty("sortType")>sortType: "#JSStringFormat(attributes.sortType)#",</cfif>
			<cfif AttributeNotEmpty("sortTypeJS")>sortType: #attributes.sortTypeJS#,</cfif>
			<cfif AttributeNotEmpty("type")>type: "#JSStringFormat(attributes.type)#",</cfif>
			<cfif AttributeNotEmpty("typeJS")>type: #attributes.typeJS#,</cfif>
			<cfif AttributeNotEmpty("passThrough")>#attributes.passThrough#,</cfif>
			name: "#attributes.name#"
		}</cfoutput>
	</cfif>
</cfprocessingdirective>
</cfsavecontent>

<cfassociate basetag="#parentTag#" datacollection="fields">


</cfif>


<cfsetting enablecfoutputonly="false">