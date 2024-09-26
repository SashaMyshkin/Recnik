<cfset IzraziModal = new rc.mv.model.leksGlagoliIzrazi()>
<cfset tehnSkraceniceModal = new rc.mv.model.tehnickeSkracenice()>

<cfoutput>
    <div class="container">
        <form method="POST" name="znacenjaForm" id="znacenjaForm" action="?q=#url.q#">
            <fieldset>
                <legend style="color:var(--gold-main)">Значења</legend>
                
                <cfset count = 1>
                <cfloop query="#attributes.znacenja#">
                    <cfset izrazi = IzraziModal.dohvatiIzraze(znacenje_id)>

                    <cfif izrazi.recordCount eq 0>
                        <p>
                            #count#)
                            <cfif povratna_zamenica eq 1> <small><i>&##126; се</i></small> </cfif> 
                            <cfif skracenica neq "">
                                <span title="#objasnjenje#" style="font-size:0.7rem">(#skracenica#)</span>
                            </cfif>
                            #znacenje#
                        </p>
                    <cfelse>
                        <details>
                            <summary>
                                #count#) 
                                <cfif povratna_zamenica eq 1> <small><i>&##126; се</i></small> </cfif> 
                                <cfif skracenica neq "">
                                    <span title="#objasnjenje#" style="font-size:0.7rem">(#skracenica#)</span>
                                </cfif>
                                #znacenje#
                            </summary>
                            <cfloop query="#izrazi#">
                                <span style="font-size:0.8rem"><i>#izraz#</i> <cfif objasnjenje neq "">(#objasnjenje#)</cfif></span><br>
                            </cfloop>
                        </details>
                    </cfif>

                    
                    <cfset count = count + 1>
                </cfloop>
            </fieldset>
        </form>

        <p class="mt-2">
            <button class="btn btn-secondary btn-sm" type="button" id="znacenjeButton">Додај значење</button>
            <button class="btn btn-secondary btn-sm" type="button" id="primeriButton">Додај пример</button>
            <button class="btn btn-secondary btn-sm" type="button" id="izraziButton">Додај израз</button>
        </p>

        <div class="modal fade" id="znacenjeModal" tabindex="-1" aria-labelledby="znacenjeModalLabel" aria-hidden="true">
            <div class="modal-dialog ">
                <div class="modal-content bg-dark">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="znacenjeModalLabel">Значење глагола</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form method="POST" name="znacenjaForm" id="znacenjaForm" action="?q=#url.q#">
                            <input type="hidden" value="mng_znacenje_glagoli" name="action">
                            <input type="hidden" value="" name="znacenje_id">
                            <input type="hidden" value="#url.q#" name="leksema_id">	
                            <div class="row">
                                <div class="col-md-12">
                                    <label for="znacenje">Значење</label>
                                    <textarea id="znacenje" name="infinitivna_osnova" value="" required type="text" class="form-control form-control-sm form-control-dark"  placeholder="" ></textarea>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <label for="tehnicka_skracenica_id">Техничка скраћеница</label>
                                <select id="tehnicka_skracenica_id" name="tehnicka_skracenica_id" class="form-select form-select-sm form-select-dark"  >
                                    <option value="" ></option>
                                    <cfloop query="#tehnSkraceniceModal.dohvatiTehnickeSkracenice()#">
                                        <option value="#id#" >#skracenica# - #objasnjenje#</option>
                                    </cfloop>
                                </select>
                            </div>
                            <div class="col-md-12">
                                <label for="kategorija">Категорија</label>
                                <input value="" required type="text" class="form-control form-control-sm form-control-dark" id="kategorija" name="kategorija" placeholder="" >
                            </div>
                            <div class="col-md-12">
                                <label for="">&nbsp;</label>
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" value="" name="povratna_zamenica" id="povratna_zamenica">
                                    <label class="form-check-label" for="povratna_zamenica">
                                        Повратна заменица
                                    </label>
                                </div>
                            </div>

                            

                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary btn-sm" data-bs-dismiss="modal">Затвори</button>
                        <button type="button" class="btn btn-primary btn-sm">Сачувај</button>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal fade" id="primeriModal" tabindex="-1" aria-labelledby="primeriModalLabel" aria-hidden="true">
            <div class="modal-dialog ">
                <div class="modal-content bg-dark">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="primeriModalLabel">Примери</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                    ...
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary btn-sm" data-bs-dismiss="modal">Затвори</button>
                        <button type="button" class="btn btn-primary btn-sm">Сачувај</button>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal fade" id="izraziModal" tabindex="-1" aria-labelledby="izraziModalLabel" aria-hidden="true">
            <div class="modal-dialog ">
                <div class="modal-content bg-dark">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="izraziModalLabel">Изрази</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                    ...
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary btn-sm" data-bs-dismiss="modal">Затвори</button>
                        <button type="button" class="btn btn-primary btn-sm">Сачувај</button>
                    </div>
                </div>
            </div>
        </div>
        
        <hr>
    </div>

    <script>
        <cfinclude template="leksGlagoli.js">
    </script>
</cfoutput>