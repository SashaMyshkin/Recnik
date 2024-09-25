<style><cfinclude template="listaReci.css"></style>
<cfoutput>
    <div class="container">
        <form method="POST" name="searchForm" id="searchForm" action="?q=" class="mt-3">
    
            <div class="row justify-content-between">
                <div class="col-md-2">
                    <input onkeydown="pretraga()" value="#form.leksema#" type="text" class="form-control form-control-sm form-control-dark" id="leksema" name="leksema" placeholder="Унесите реч за претрагу">
                </div>
                <div class="col-md-2">
                    <button type="button" onclick="location.href='#request.scriptName#?q=0'" class="btn btn-sm btn-success d-block">Нова лексема</button>
                </div>
            </div>
        </form>
    
        <table class="table table-sm table-dark table-striped table-hover caption-top mt-3">
            <!------caption class="text-light">Ukupno: <caption-------->
            <thead>
                <tr class="text-center">
                    <th scope="col">##</th>
                    <th scope="col">Реч</th>
                    <th scope="col">Врста речи</th>
                    <th scope="col">Акценат</th>
                    <th scope="col">Акцентовани слог</th>
                </tr>
            </thead>
            <tbody>
                <cfset count = 1>
                <cfloop query="#attributes.lekseme#">
                    <tr class="text-center" style="cursor:pointer" onclick="location.href='#request.scriptName#?q=#leksema_id#'">
                        <td>#count#</td>
                        <td>#leksema#</td>
                        <td>#vrsta_reci#</td>
                        <td>#akcenat#</td>
                        <td>#akcentovani_slog#.</td>
                    </tr>
                    <cfset count = count + 1>
                </cfloop>
            </tbody>
        </table>
    </div>
    <script><cfinclude template="listaReci.js"></script>
</cfoutput>
