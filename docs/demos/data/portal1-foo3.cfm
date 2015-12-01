<!--- simulate request delay --->
<cfset thread = CreateObject("java", "java.lang.Thread")>
<cfset thread.sleep(2000)>
<cfoutput>
Dynamic content ###Int(Rand()*100)#...
</cfoutput>