<cfcomponent output="false">

	<cfset this.Name = "ColdExtDemos">


	<cffunction name="onApplicationStart" returntype="void">
		<cfset ColdExtConfig()>
	</cffunction>

	<cffunction name="onRequestStart" returntype="void" output="false">
		<cfargument name="page" type="string" required="true">

		<cfif StructKeyExists(url, "initColdExt")>
			<cfset ColdExtConfig()>
		</cfif>
		
		<cfset application.appPath = "/docs">
		
	</cffunction>


	<cffunction name="ColdExtConfig">
		<cfimport prefix="ext" taglib="/coldext">
		<ext:config />
	</cffunction>


</cfcomponent>