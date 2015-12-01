<cfsetting enablecfoutputonly="true">
<!---

	ColdExt RC 1, Copyright (c) 2008, Justin Carter

	You may use ColdExt under any terms that satisfy the Ext JS license
	http://extjs.com/license

	Additionally you may modify the ColdExt CFML source code to suit
	your needs, as long as you do not modify this copyright notice.

 --->


<!--- ColdExt functions declared --->
<cfset request._coldext_functions = true>


<!--- attributes scope functions --->

<cffunction name="AttributeEquals" output="false">
	<cfargument name="k" type="string" required="true">
	<cfargument name="v" type="any" required="true">
	<cfreturn StructKeyExists(attributes, k) AND attributes[k] eq v>
</cffunction>

<cffunction name="AttributeEmpty" output="false">
	<cfargument name="k" type="string" required="true">
	<cfreturn not (StructKeyExists(attributes, k) AND attributes[k] neq "")>
</cffunction>

<cffunction name="AttributeNotEmpty" output="false">
	<cfargument name="k" type="string" required="true">
	<cfreturn StructKeyExists(attributes, k) AND attributes[k] neq "">
</cffunction>


<!--- generic scope/struct functions --->

<cffunction name="StructKeyEquals" output="false">
	<cfargument name="st" type="struct" required="true">
	<cfargument name="k" type="string" required="true">
	<cfargument name="v" type="any" required="true">
	<cfreturn StructKeyExists(st, k) AND st[k] eq v>
</cffunction>


<!--- array functions --->

<cffunction name="ArrayKeyToList" output="false">
	<cfargument name="a" type="array" required="true">
	<cfargument name="k" type="string" required="true">
	<cfset l = "">
	<cfloop index="i" from="1" to="#arrayLen(a)#">
		<cfset l = ListAppend(l, a[i][k])>
	</cfloop>
	<cfreturn l>
</cffunction>


<!--- other --->

<cffunction name="SeparateCaps" output="false">
	<cfargument name="s" type="string" required="true">
	<cfreturn Trim(REReplace(s,"(fld)*(^.|[A-Z0-9])"," \u\2","all"))>
</cffunction>

<cffunction name="TrueFalseFormat" output="false">
	<cfargument name="b" type="any" required="true">
	<cfif YesNoFormat(b)>
		<cfreturn true>
	<cfelse>
		<cfreturn false>
	</cfif>
</cffunction>


<!--- coldext tag name functions --->

<cffunction name="getColdExtParentTag" output="false">
	<cfargument name="list" type="string" required="true">
	<cfreturn ListGetAt(REReplace(list, "(CF[A-Z]+)", "", "all"), 2)>
</cffunction>

<cffunction name="getThisTagName" output="false">
	<cfreturn Replace(ListGetAt(getBaseTagList(), 1), "CF_", "")>
</cffunction>


<!--- coldext var attribute function --->

<cffunction name="validateVarAttribute" returntype="string" output="false">
	<cfargument name="parentTag" type="string" required="true">
	<cfif parentTag eq "CF_ONREADY">
		<cfif AttributeEmpty("var")>
			<cfreturn getThisTagName() & Int(Rand()*1000)>
		<cfelse>
			<cfreturn attributes.var>
		</cfif>
	<cfelse>
		<cfif AttributeNotEmpty("var") OR AttributeNotEmpty("renderTo") OR AttributeNotEmpty("renderToJS")>
			<cfthrow message="Attribute validation error in #getThisTagName()# tag: 'var', 'renderTo' and 'renderToJS' can only be used when the parent of this tag is ext:onReady">
		</cfif>
		<cfreturn "">
	</cfif>
</cffunction>


<cffunction name="includeResources" output="true">
	<cfargument name="out" type="string" required="true">
	<cfif NOT StructKeyEquals(GetHttpRequestData().headers, "X-Requested-With", "XMLHTTPRequest")>
		<cfif StructKeyExists(request, "_coldext_loadingMask")>
			<cfoutput>#out#</cfoutput>
		<cfelse>
			<cfhtmlhead text="#out#">
		</cfif>
	</cfif>
</cffunction>


<cfsetting enablecfoutputonly="false">