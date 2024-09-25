<cfif cgi.request_url.listContainsNoCase('https') eq '0'>
    <cfset application["root"] = "http://localhost:8888/Recnik/">
<cfelse>
    <cfset application["root"] = "https://teatar011.com/administracija/">
</cfif>

<cfset application.langs = ["sr-Cyrl"]>
<cfset application.lang = "sr-Cyrl">
<cfset application.modes = ["dev", "prod"]>
<cfset application.datasource = "recnik">