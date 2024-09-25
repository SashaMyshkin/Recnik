<cfset leksemaModel = new Recnik.mv.model.leksema()>
<cfset vrsteReciModel = new Recnik.mv.model.vrsteReci()>
<cfset AkcentiModel = new Recnik.mv.model.akcenti()>

<cfparam name="url.q" default="">
<cfparam name="form.leksema" default="">
<cfparam name="form.per_page" default="10">
<cfparam name="form.page_number" default="1">
<cfparam name="form.action" default="">

<cfoutput>

    <!-----Dodavanje nove lekseme ili promena podataka postojeće---->
    <cfif form.action eq "mngleks">
        <cfset url.q = leksemaModel.sacuvaj()>
    </cfif>

    <!------Za slučaj da nije definisan pk, onda prikazujemo listu reči------>
    <cfif url.q eq "">

        <!------Naslov------>
        <cfmodule template="#application.view#\h1.cfm" naslov = "Претрага">

        <!----Templejt za listu reči----->
        <cfmodule template="#application.view#\listaReci.cfm" lekseme = "#leksemaModel.dohvatiLekseme()#">
    <cfelse>
        <cfset leksema = leksemaModel.dohvatiLeksemu()> 

        <!------Naslov------>
        <cfmodule template="#application.view#\h1.cfm" naslov = "#ucFirst(leksema.leksema)#">
        
        <!------Templejtu za prikaz lekseme prosleđujemo objekat leksema i spisak akcenata i vrsta reči------>
        <cfmodule template="#application.view#\leksema.cfm" 
        leksema = "#leksema#" 
        vrsteReci = "#vrsteReciModel.dohvatiVrsteReci()#"
        akcenti = "#AkcentiModel.dohvatiAkcente()#">
    </cfif>

</cfoutput>