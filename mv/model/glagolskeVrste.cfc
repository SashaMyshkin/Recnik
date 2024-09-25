
component {
    public query function dohvatiGlagolskeVrste() {

        q_morf_gl_vrste = queryExecute(
            sql = "SELECT id, vrsta glagolska_vrsta FROM morf_gl_vrste",
            options = {
                datasource = application.datasource
            }
        );
        
        return q_morf_gl_vrste;
    }
}