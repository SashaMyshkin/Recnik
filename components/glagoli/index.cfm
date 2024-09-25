<cfparam name="attributes.leksema_id" default="0">

<cfoutput>
    <form method="POST" name="leksemaForm" id="leksemaForm" action="?q=#url.q#">
        <input type="hidden" value="mngleks" name="action">	
        <input type="hidden" value="#url.q#" name="leksema_id">	
        <div class="row">
            <div class="col-md-2">
                <label for="pLeksema">Лексема</label>
                <input value="#leksema.leksema#" required type="text" class="form-control form-control-sm form-control-dark" id="pLeksema" name="pLeksema" placeholder="">
            </div>
            <div class="col-md-2">
                <label for="pLeksema">Врста речи</label>
                <select id="vrsta_reci_id" name="vrsta_reci_id" class="form-select form-select-sm form-select-dark" >
                    <cfloop query="#podaci.dohvatiVrsteReci()#">
                        <option value="#id#" <cfif id eq leksema.vrsta_reci_id> selected </cfif> >#vrsta#</option>
                    </cfloop>
                </select>
            </div>
            <div class="col-md-2">
                <label for="pLeksema">Акценат</label>
                <select id="fon_akcenat_id" name="fon_akcenat_id" class="form-select form-select-sm form-select-dark" >
                    <cfloop query="#podaci.dohvatiAkcente()#">
                        <option value="#id#" <cfif id eq leksema.fon_akcenat_id> selected </cfif> >#akcenat#</option>
                    </cfloop>
                </select>
            </div>
            <div class="col-md-2">
                <label for="pLeksema">Акцентовани слог</label>
                <input value="#leksema.akcentovani_slog#" required type="number" min="1" class="form-control form-control-sm form-control-dark" id="akcentovani_slog" name="akcentovani_slog" placeholder="">
            </div>
            <div class="col-md-2">
                <label>&nbsp;</label>
                <button type="submit" class="btn btn-sm btn-primary d-block">Сачувај лексему</button>
            </div>
        </div>	
    </form>
</cfoutput>

