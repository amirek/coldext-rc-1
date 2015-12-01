<cfsetting enablecfoutputonly="true" showdebugoutput="false">

<!--- use cfjson for deserialization for compatibility --->
<cfobject name="json" component="coldext.json.json">
<cfset data = json.decode(form.data)>

<!--- simulate database update... --->
<cfloop from="1" to="#Application.qCountries.recordCount#" index="row">
	<!--- loop over updated records --->
	<cfloop from="1" to="#arrayLen(data.records)#" index="i">
		<cfif Application.qCountries.id[row] eq data.records[i].id>
			<cfset QuerySetCell(Application.qCountries,"country","#data.records[i].country#",row)>
			<cfset QuerySetCell(Application.qCountries,"capital","#data.records[i].capital#",row)>
			<cfset QuerySetCell(Application.qCountries,"continent","#data.records[i].continent#",row)>
		</cfif>
	</cfloop>
</cfloop>

<cfoutput>
{
	success: true,
	message: "Countries Updated!"
}
</cfoutput>

<cfsetting enablecfoutputonly="false">