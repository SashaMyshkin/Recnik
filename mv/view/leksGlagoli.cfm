<cfset IzraziModal = new rc.mv.model.leksGlagoliIzrazi()>

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
    </div>
</cfoutput>