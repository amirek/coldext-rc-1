<cfsetting enablecfoutputonly="true" showdebugoutput="false">

<cfparam name="url.node" default="root">
<!--- merge url scope into form scope without overwriting --->
<cfset form = StructAppend(form, url, false)>

<cfset nodes = "">

<cfswitch expression="#form.node#">
	<cfcase value="root">
		<cfset nodes = "[
			{
				id: '/home',
				text: 'Home',
				leaf: false
			},{
				id: '/utility',
				text: 'Utility',
				leaf: false
			},{
				id: '/trash',
				text: 'Trash',
				leaf: false
			}
		]">
	</cfcase>
	<cfcase value="/home">
		<cfset nodes = "[
			{
				id: '/home/products',
				text: 'Products',
				leaf: false
			},{
				id: '/home/services',
				text: 'Services',
				leaf: false
			},{
				id: '/home/contact',
				text: 'Contact Us',
				leaf: true
			}
		]">
	</cfcase>
	<cfcase value="/home/products">
		<!--- simulate request delay --->
		<cfset thread = CreateObject("java", "java.lang.Thread")>
		<cfset thread.sleep(500)>
		<cfset nodes = "[
			{
				id: '/home/products/awesomeofier',
				text: 'Awesome-O-fier',
				leaf: true
			},{
				id: '/home/products/coolotron',
				text: 'Cool-O-tron',
				leaf: true
			}
		]">
	</cfcase>
	<cfcase value="/home/services">
		<!--- simulate request delay --->
		<cfset thread = CreateObject("java", "java.lang.Thread")>
		<cfset thread.sleep(750)>
		<cfset nodes = "[
			{
				id: '/home/services/fudging',
				text: 'Fudging',
				leaf: true
			},{
				id: '/home/services/stuff',
				text: 'Stuffing',
				leaf: true
			},{
				id: '/home/services/twiddling',
				text: 'Twiddling',
				leaf: true
			},{
				id: '/home/services/breaking',
				text: 'Breaking',
				leaf: true
			}
		]">
	</cfcase>
	<cfcase value="/utility">
		<cfset nodes = "[
			{
				id: '/utility/form',
				text: 'Form',
				leaf: true
			}
		]">
	</cfcase>
</cfswitch>

<cfoutput>#nodes#</cfoutput>

<cfsetting enablecfoutputonly="false" showdebugoutput="true">