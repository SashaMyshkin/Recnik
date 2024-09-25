<style>
    <cfinclude template="navbar.css">
</style>

<cfoutput>
    <nav class="navbar navbar-expand-sm navbar-dark fixed-top bg-dark">
        <div class="container-fluid">
            <a class="navbar-brand" href="##">
                <img src="#application.rootURL#/logo.jpeg" alt="Avatar Logo" style="width:45px;" class="rounded-pill star"> 
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="##boxMenu">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse justify-content-between" id="boxMenu">
                <ul class="navbar-nav text-center" style="">
                    
                </ul>
                <ul class="navbar-nav text-center">
                    <li class="nav-item">
                        <a class="nav-link" href="#application["rootURL"]#logout.cfm"> Излогуј се </a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <div style="height:70px"></div>
</cfoutput>