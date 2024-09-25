<cfset leksemaModel = new Recnik.mv.model.leksema()>
<cfset vrsteReciModel = new Recnik.mv.model.vrsteReci()>
<cfset AkcentiModel = new Recnik.mv.model.akcenti()>

<cfparam name="url.q" default="">
<cfparam name="form.leksema" default="">
<cfparam name="form.per_page" default="10">
<cfparam name="form.page_number" default="1">
<cfparam name="form.action" default="">

<cfoutput>

    <cfif url.q eq "">
        <cfmodule template="#application.view#\listaReci.cfm" lekseme = "#leksemaModel.dohvatiLekseme()#">
    <cfelse>
        <cfmodule template="#application.view#\leksema.cfm" 
        leksema = "#leksemaModel.dohvatiLeksemu()#" 
        vrsteReci = "#vrsteReciModel.dohvatiVrsteReci()#"
        akcenti = "#AkcentiModel.dohvatiAkcente()#">
    </cfif>

</cfoutput>