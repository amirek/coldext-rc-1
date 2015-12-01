<cfcomponent output="false">

<!---

	This is an example of using a CFC method to return results to a JSON store.

	This CFC is particularly empty because all the hard work is already done
	in the contries.cfm file so I have chosen to reuse it rather than just
	duplicating code for no extra benefit. The main thing to note is that when
	using remote CFCs you can use the returnFormat="plain" attribute to stop CF
	from returning WDDX and instead return plain text. In this case our data
	has already been serialised into JSON, we aren't using CF8 to do native
	JSON serialization because it doesn't support the format expected by Ext,
	which is why the returnFormat is "plain" and not "json".

 --->

<cffunction name="getCountries" access="remote" returnFormat="plain">
	<cfsavecontent variable="out"><cfinclude template="countries.cfm"></cfsavecontent>
	<cfreturn out>
</cffunction>

</cfcomponent>