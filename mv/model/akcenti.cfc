
component {
    public query function dohvatiAkcente() {

        q_fon_akcenti = queryExecute(
            sql = "SELECT id, akcenat FROM fon_akcenti",
            options = {
                datasource = application.datasource
            }
        );
        
        return q_fon_akcenti;
    }
}