<cfsetting enablecfoutputonly="true" showdebugoutput="false">
<!---

	countries-simple.cfm

	This is a simplified version of countries.cfm which does not do remote
	sorting, paging or filtering. For more advanced examples see
	countries.cfm.

 --->

<!--- includes --->
<cfinclude template="querysim.cfm">


<!--- this is our dummy query object, because we have no database back end for these examples --->
<!--- this is where you would put your <cfquery> --->
<cfif not StructKeyExists(Application, "qCountries") OR StructKeyExists(url,"qCountriesInit")>
	<cfset Application.qCountries = querySim("
		id,country,capital,continent,visited
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


<!--- put data and total row count into a struct we can use client side --->
<cfset myResult = StructNew()>
<cfset myResult["query"] = Application.qCountries>
<cfset myResult["totalcount"] = Application.qCountries.recordCount>


<!--- use cfjson serialization for compatibility --->
<cfobject name="json" component="coldext.json.json">

<cfoutput>
#json.encode(myResult,"array","lower")#
</cfoutput>


<cfsetting enablecfoutputonly="false">