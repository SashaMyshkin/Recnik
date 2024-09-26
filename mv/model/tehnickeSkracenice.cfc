
component {
    public query function dohvatiTehnickeSkracenice() {

        q_tehnicke_skracenice = queryExecute(
            sql = "SELECT id, skracenica, objasnjenje FROM tehnicke_skracenice ORDER BY skracenica",
            options = {
                datasource = application.datasource
            }
        );
        
        return q_tehnicke_skracenice;
    }
}