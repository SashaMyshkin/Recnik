<cfif cgi.request_url.listContainsNoCase('https') eq '0'>
    <cfset application["rootURL"] = "http://localhost:8888/rc/">
    <cfset application["root"] = "\rc">
<cfelse>
    <cfset application["rootURL"] = "https://teatar011.com/rc/">
    <cfset application["root"] = "\rc">
</cfif>

<cfset application.langs = ["sr-Cyrl"]>
<cfset application.lang = "sr-Cyrl">
<cfset application.modes = ["dev", "prod"]>
<cfset application.datasource = "recnik">
<cfset application.view = "#application.root#\mv\view\">