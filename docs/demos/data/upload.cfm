<cfsetting enablecfoutputonly="true" showdebugoutput="false">

<cffile action="upload" destination="#GetTempDirectory()#" filefield="uploadFile" nameconflict="overwrite" result="uploaded">

<cfset message = "Received file '#form.documentTitle#' named '#JSStringFormat(uploaded.clientFile)#'">

<cfoutput>
{
	success: true,
	message: "#message#"
}
</cfoutput>

<cfsetting enablecfoutputonly="false">