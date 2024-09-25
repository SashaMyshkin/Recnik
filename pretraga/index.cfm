


<cfparam name="url.q" default="">
<cfparam name="form.leksema" default="">
<cfparam name="form.per_page" default="10">
<cfparam name="form.page_number" default="1">
<cfparam name="form.action" default="">

<cfset podaci = createObject('component', 'podaciPretraga')>

<cfif form.action eq "mngleks">
	<cfset url.q = podaci.save()>
</cfif>

<cfoutput>
	
	<style>
		<cfinclude template="styles.css">
	</style>

	
	<div class="container">
		<p class="mt-2 mb-1">
			<b>Претрага</b>
		</p>
		<hr>
		<div class="container">
			<form method="POST" name="searchForm" id="searchForm" action="?q=">

				<div class="row justify-content-between">
					<div class="col-md-2">
						<input onkeydown="pretraga()" value="#form.leksema#" type="text" class="form-control form-control-sm form-control-dark" id="leksema" name="leksema" placeholder="Унесите реч за претрагу">
					</div>
					<div class="col-md-2">
						<button type="button" onclick="location.href='#request.scriptName#?q=0'" class="btn btn-sm btn-success d-block">Нова лексема</button>
					</div>
				</div>
			</form>
		</div>

		<cfif url.q eq "">
			
			<div class="container mt-2">
				<table class="table table-sm table-dark table-striped table-hover caption-top">
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
						<cfloop query="#podaci.dohvatiLekseme()#">
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
		<cfelse>
			<cfset leksema = podaci.dohvatiLeksemu()>
			<hr>
			<div class="container">
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
				
			</div>
		</cfif>
    </div>
	
	<script>
		const pretraga = globals.debounce(
			()=>document.querySelector('##searchForm').submit(),
			500
		)

		document.addEventListener('DOMContentLoaded', function() {
			const leksemaInput = document.querySelector('##leksema');
			leksemaInput.focus();
			leksemaInput.setSelectionRange(leksemaInput.value.length, leksemaInput.value.length);
		});
	</script>
		
</cfoutput>
