<cfsetting enablecfoutputonly="true" showdebugoutput="false">
<!---

	countries.cfm

	This code simulates data persistence that would normally be provided by
	a database layer, and called via a remotely accessible function in a CFC.
	This means that there is a lot of unnecessary processing happening here,
	such as paging and sorting, simply because there is no database backend
	for this demo data.

	The main requirements for implementing a service that can be used to
	provide data to both a grid and combobox include;

	- url/form scope variables for grid:
	    - start (paging)  - the row number to return as the first record
	    - limit (paging)  - the number of records to return for on page
	    - sort (sorting)  - the field to sort on
	    - dir (sorting)   - the direction of the sort
	    - query (search)  - the text from the ux:gridSearch text box
	    - fields (search) - JSON array of fields to search for ux:gridSearch
	    - filter[]        - an array used by the ux:gridFilters extension
	- url/form scope variables for combobox:
	    - query (filter)  - the filter text from the combobox for autosuggest

 --->


<!--- includes --->
<cfinclude template="querysim.cfm">


<!--- set defaults in url scope --->
<cfparam name="url.start" default="0">
<cfparam name="url.limit" default="1000">
<cfparam name="url.sort" default="country">
<cfparam name="url.dir" default="ASC">
<cfparam name="url.query" default="">
<cfparam name="url.fields" default="">
<!--- merge url scope into form scope without overwriting --->
<cfset form = StructAppend(form, url, false)>


<!--- define query columns --->
<cfset columns = "id,country,capital,continent,visited">


<!--- grid filter support --->
<!--- coldfusion doesn't handle HTML arrays so we need to count the filter[] struct keys --->
<cfset filterIndex = -1>
<cfloop condition="#StructKeyExists(form, 'filter[#filterIndex+1#][field]')#">
	<cfset filterIndex = filterIndex + 1>
</cfloop>



<!--- validate sort column and sort direction --->
<cfif not ListFindNoCase(columns, form.sort)><cfset form.sort = "country"></cfif>
<cfif not ListFindNoCase("ASC,DESC", form.dir)><cfset form.dir = "ASC"></cfif>


<!--- initialise our dataset and store it in the application scope --->
<!--- this can be reinitialised by appending ?qCountriesInit to the url of this page --->
<cfif not StructKeyExists(Application, "qCountries") OR StructKeyExists(url,"qCountriesInit")>
	<cfset Application.qCountries = querySim("
		#columns#
		AU|Australia|Canberra|Oceania|1
		CA|Canada|Ottawa|North America|0
		DK|Denmark|Copenhagen|Europe|0
		FR|France|Paris|Europe|1
		IN|India|New Delhi|Asia|0
		IE|Ireland|Dublin|Europe|0
		IT|Italy|Rome|Europe|1
		KZ|Kazakhstan|Astana|Asia|0
		MX|Mexico|Mexico City|North America|0
		NL|Netherlands|Amsterdam|Europe|1
		NZ|New Zealand|Wellington|Oceania|1
		SE|Sweden|Stockholm|Europe|0
		CH|Switzerland|Berne|Europe|1
		TH|Thailand|Bangkok|Asia|0
		US|United States|Washington, D.C.|North America|0
	")>
</cfif>


<!--- set up text searchable fields list --->
<cfif form.fields eq "">
	<!--- defaults --->
	<cfset form.fields = "id,capital,country,continent">
<cfelse>
	<!--- could deserialize JSON and use arrayToList, or just strip using regex --->
	<cfset form.fields = ReReplace(form.fields,"[\[\]\""]","","all")>
</cfif>


<!--- simulate sorting and filtering --->
<cfquery name="qSorted" dbtype="query">
	SELECT *
	FROM Application.qCountries
	WHERE 1=1
	<cfif form.query neq "">
		AND ( 1=0
		<!--- note: this is generic code for dealing with searchable fields --->
		<!--- take care that these are varchar columns, not numbers --->
		<cfloop list="#form.fields#" index="item">
			OR LOWER(#item#) LIKE '%#LCase(form.query)#%'
		</cfloop>
		)
	</cfif>
	<!--- grid filter support --->
	<!--- loop over the filter "array" using the filterIndex we set earlier --->
	<!--- each array index contains a field/value pair to include in our query --->
	<cfif filterIndex gt -1>
		<cfloop from="0" to="#filterIndex#" index="i">
			AND LOWER(#form["filter[#i#][field]"]#) LIKE '%#LCase(form["filter[#i#][data][value]"])#%'
		</cfloop>
	</cfif>
	ORDER BY #form.sort# #form.dir#
</cfquery>

<!--- simulate paging --->
<cfset qResult = QueryNew(columns)>
<cfoutput query="qSorted" startrow="#form.start+1#" maxrows="#form.limit#">
<cfset QueryAddRow(qResult)>
<cfset QuerySetCell(qResult,"id","#qSorted.id#")>
<cfset QuerySetCell(qResult,"country","#qSorted.country#")>
<cfset QuerySetCell(qResult,"capital","#qSorted.capital#")>
<cfset QuerySetCell(qResult,"continent","#qSorted.continent#")>
<cfset QuerySetCell(qResult,"visited","#qSorted.visited#")>
</cfoutput>


<!--- put data and total row count into a struct we can use client side --->
<cfset myResult = StructNew()>
<cfset myResult["query"] = qResult>
<cfif form.query neq "" OR filterIndex gt -1>
	<!--- filtered recordcount, used by combobox or gridfilters --->
	<cfset myResult["totalcount"] = qResult.recordCount>
<cfelse>
	<!--- unfiltered recordcount --->
	<cfset myResult["totalcount"] = qSorted.recordCount>
</cfif>


<!--- use cfjson serialization for compatibility --->
<cfobject name="json" component="coldext.json.json">

<cfoutput>
#json.encode(myResult,"array","lower")#
</cfoutput>


<cfsetting enablecfoutputonly="false">