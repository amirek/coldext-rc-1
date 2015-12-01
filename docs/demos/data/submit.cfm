<cfsetting enablecfoutputonly="true" showdebugoutput="false">

<cfset message = "Hello " & form.firstName & ", form submitted!">

<cfoutput>
{
	success: true,
	message: "#message#"
}
</cfoutput>

<cfsetting enablecfoutputonly="false">