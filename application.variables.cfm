<cfif cgi.request_url.listContainsNoCase('https') eq '0'>
    <cfset application["rootURL"] = "http://localhost:8888/Recnik/">
    <cfset application["root"] = "\Recnik">
<cfelse>
    <cfset application["rootURL"] = "https://teatar011.com/Recnik/">
    <cfset application["root"] = "\Recnik">
</cfif>

<cfset application.langs = ["sr-Cyrl"]>
<cfset application.lang = "sr-Cyrl">
<cfset application.modes = ["dev", "prod"]>
<cfset application.datasource = "recnik">
<cfset application.view = "#application.root#\mv\view\">