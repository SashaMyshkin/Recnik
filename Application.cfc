<cfcomponent>
    <cfset this.name = "rc">
    <cfset this.locale = "sr_RS">
    <cfset this.timezone = "Europe/Belgrade">
    <cfset this.applicationTimeout = createTimeSpan(0, 0, 30, 0)>
    <cfset this.sessionManagement = true>
    <cfset this.sessionTimeout = createTimeSpan(0, 0, 30, 0)>
    <cfset this.clientManagement = true>
    <cfset this.clientTimeout = createTimeSpan(0, 0, 30, 0)>
    <cfset this.clientStorage = "cookie">
    <cfset this.loginstorage = "session">
    <cfset this.requestTimeout = createTimeSpan(0, 0, 0, 50)>
    <cfset this.charset.web = "UTF-8">
    <cfset this.charset.resource = "UTF-8">

    <cffunction name="onRequestStart">
        <cfargument name="targetPage" type="string" required="true">

        <cfinclude template="application.variables.cfm">

        <cflogin applicationtoken="#this.name#">
            <cfif not isDefined("cflogin")>
                <cfinclude template="loginForm.cfm">
                <cfreturn false>
            <cfelse>
                <cfif cflogin.name is "" OR cflogin.password is "">
                    <cfoutput>
                        <h2>You must enter text in both the User Name and Password fields.
                        </h2>
                    </cfoutput>
                    <cfinclude template="loginform.cfm">
                    <cfreturn false>
                <cfelse>
                    <cfquery name="loginQuery" datasource="#application.datasource#">
                        select `id`, `roles` from `users`
                        where 1 = 1
                        and `username` = <cfqueryparam value="#cflogin.name#" cfsqltype="CF_SQL_VARCHAR" maxlength="30">
                        and `password` = <cfqueryparam value="#hash(cflogin.password, 'SHA-256')#" cfsqltype="CF_SQL_VARCHAR" maxlength="64">
                    </cfquery>
                    <cfset session.userId = loginQuery.id>
                    <cfif loginQuery.Roles NEQ "">
                        <cfloginuser name="#cflogin.name#" Password = "#cflogin.password#" roles="#loginQuery.Roles#">
                    <cfelse>
                        <cfmodule template="loginform.cfm" text="Neispravni kredencijali.">
                        <cfreturn false>
                    </cfif> 
                </cfif>
            </cfif>
        </cflogin>
        <cfreturn true>
    </cffunction>

    <cffunction name="onRequest">
        <cfargument name = "targetPage" type="String" required=true/>

        <cfset request.scriptName = replace(cgi.SCRIPT_NAME, 'index.cfm', '')>

        <cfsavecontent variable="content">
            <!doctype html>
            <html lang="#session.defaultScript#">
                <head>
                    <cfmodule template="head.cfm" targetPage="#Arguments.targetPage#">
                </head>
                <body>
                    <cfmodule template="#application.view#\navbar.cfm">
                    <cfmodule template="#arguments.targetPage#" targetPage="#Arguments.targetPage#">
                </body>
            </html>   
        </cfsavecontent>
        <cfoutput>#content#</cfoutput>        
    </cffunction>

    <cffunction name="onSessionStart">
        <cfset session.lang = application.lang>
    </cffunction>

    <cffunction name="onApplicationStart">
        <cfset application.scripts = ["sr-Cyrl"]>
        <cfset application.lang = "sr-Cyrl">
    </cffunction>

    <cffunction name="onMissingTemplate">
        <cfargument name="targetPage" type="string" required=true/>
        <cfmodule template="404.cfm" targetPage="#targetPage#">
        <cfreturn true />
    </cffunction>

    <cffunction name="onError">
        <cfargument name="Exception" required=true/>
        <cfargument name="EventName" type="String"  required=true/>
        <cfmodule template="500.cfm" exception="#Exception#" eventname="#EventName#">
    </cffunction>
</cfcomponent>