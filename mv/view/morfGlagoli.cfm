<style><cfinclude template="morfGlagoli.css"></style>
<cfoutput>
    <div class="container">
        <form method="POST" name="leksemaForm" id="leksemaForm" action="?q=#url.q#">
            <fieldset>
                <legend style="color:var(--gold-main)">Морфолошки детаљи</legend>
                <input type="hidden" value="mng_morf_glagoli" name="action">	
                <input type="hidden" value="#url.q#" name="leksema_id">	
                <input type="hidden" value="#attributes.morfGlagoli.morf_gl_id#" name="morf_gl_id">	
                <div class="row">
                    <div class="col-md-2">
                        <label for="infinitivna_osnova">Инфинитивна основа</label>
                        <input value="#attributes.morfGlagoli.infinitivna_osnova#" required type="text" class="form-control form-control-sm form-control-dark" id="infinitivna_osnova" name="infinitivna_osnova" placeholder="" <cfif url.q eq 0> disabled </cfif>>
                    </div>
                    <div class="col-md-2">
                        <label for="prezentska_osnova">Презентска основа</label>
                        <input value="#attributes.morfGlagoli.prezentska_osnova#" required type="text" class="form-control form-control-sm form-control-dark" id="prezentska_osnova" name="prezentska_osnova" placeholder="" <cfif url.q eq 0> disabled </cfif>>
                    </div>
                    <div class="col-md-2">
                        <label for="kat_gl_vid_id">Глаголски вид</label>
                        <select id="kat_gl_vid_id" name="kat_gl_vid_id" class="form-select form-select-sm form-select-dark" <cfif url.q eq 0> disabled </cfif> >
                            <cfloop query="#attributes.vidovi#">
                                <option value="#id#" <cfif id eq attributes.morfGlagoli.kat_gl_vid_id> selected </cfif> >#glagolski_vid#</option>
                            </cfloop>
                        </select>
                    </div>
                    <div class="col-md-2">
                        <label for="morf_gl_vrsta_id">Глаголска врста</label>
                        <select id="morf_gl_vrsta_id" name="morf_gl_vrsta_id" class="form-select form-select-sm form-select-dark" <cfif url.q eq 0> disabled </cfif>>
                            <cfloop query="#attributes.vrste#">
                                <option value="#id#" <cfif id eq attributes.morfGlagoli.morf_gl_vrsta_id> selected </cfif> >#glagolska_vrsta#</option>
                            </cfloop>
                        </select>
                    </div>
                    <div class="col-md-2">
                        <label>&nbsp;</label>
                        <button type="submit" class="btn btn-sm btn-secondary d-block" <cfif url.q eq 0> disabled </cfif>>Сачувај</button>
                    </div>
                </div>	
            </fieldset>
        </form>
        <hr>
    </div>
</cfoutput>