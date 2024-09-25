<cfset leksemaModel = new Recnik.mv.model.leksema()>
<cfset vrsteReciModel = new Recnik.mv.model.vrsteReci()>
<cfset AkcentiModel = new Recnik.mv.model.akcenti()>

<cfparam name="url.q" default="">
<cfparam name="form.leksema" default="">
<cfparam name="form.per_page" default="10">
<cfparam name="form.page_number" default="1">
<cfparam name="form.action" default="">

<cfoutput>

    <cfif form.action eq "mngleks">
        <cfset url.q = leksemaModel.sacuvaj()>
    </cfif>

    <cfif url.q eq "">
        <cfmodule template="#application.view#\h1.cfm" naslov = "Претрага">
        <cfmodule template="#application.view#\listaReci.cfm" lekseme = "#leksemaModel.dohvatiLekseme()#">
    <cfelse>
        <cfset leksema = leksemaModel.dohvatiLeksemu()> 
        <cfmodule template="#application.view#\h1.cfm" naslov = "#ucFirst(leksema.leksema)#">
        <cfmodule template="#application.view#\leksema.cfm" 
        leksema = "#leksema#" 
        vrsteReci = "#vrsteReciModel.dohvatiVrsteReci()#"
        akcenti = "#AkcentiModel.dohvatiAkcente()#">
    </cfif>

</cfoutput>