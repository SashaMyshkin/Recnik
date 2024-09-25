<cfset leksemaModel = new rc.mv.model.leksema()>
<cfset vrsteReciModel = new rc.mv.model.vrsteReci()>
<cfset akcentiModel = new rc.mv.model.akcenti()>
<cfset vidoviModel = new rc.mv.model.glagolskiVidovi()>
<cfset vrsteModel = new rc.mv.model.glagolskeVrste()>
<cfset morfGlagoliModel = new rc.mv.model.morfGlagoli()>

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

    <!-----Dodavanje ili izmena morfoloških detalja glagola---->
    <cfif form.action eq "mng_morf_glagoli">
        <cfset morfGlagoliModel.sacuvaj()>
    </cfif>

    <!------Za slučaj da nije definisan pk, onda prikazujemo listu reči------>
    <cfif url.q eq "">

        <!------Naslov------>
        <cfmodule template="#application.view#\h1.cfm" naslov = "Претрага">

        <!----Templejt za listu reči----->
        <cfmodule template="#application.view#\listaReci.cfm" lekseme = "#leksemaModel.dohvatiLekseme()#">
    <cfelse>
        <cfset leksema = leksemaModel.dohvatiLeksemu()> 

        <!----Kad je url.q jednako 0, znači da unosimo nov podatak----->
        <cfif url.q eq 0>
            <cfset naslov = "Новa лексема">
        <cfelse>
            <cfset naslov = ucFirst(leksema.leksema)>
        </cfif>
        <!------Naslov------>
        <cfmodule template="#application.view#\h1.cfm" naslov = "#naslov#">
        
        <!------Templejtu za prikaz lekseme prosleđujemo objekat leksema i spisak akcenata i vrsta reči------>
        <cfmodule template="#application.view#\leksema.cfm" 
        leksema = "#leksema#" 
        vrsteReci = "#vrsteReciModel.dohvatiVrsteReci()#"
        akcenti = "#akcentiModel.dohvatiAkcente()#">

        <!----U zavisnosti od vrste reči prikazujemo značenja, primere i izraze---->
        <cfswitch expression="#leksema.vrsta_reci_id#">
            <cfcase value="5">
                <cfmodule template="#application.view#\morfGlagoli.cfm" 
                vidovi = "#vidoviModel.dohvatiGlagolskeVidove()#"
                vrste ="#vrsteModel.dohvatiGlagolskeVrste()#"
                morfGlagoli ="#morfGlagoliModel.dohvatiMorfoloskeDetalje()#">
            </cfcase>
        </cfswitch>

        <div class="container mt-2">
            <button class="btn btn-secondary btn-sm" type="button" onclick="location.href='#request.scriptName#'">Назад</button>
        </div>
       
    </cfif>

</cfoutput>