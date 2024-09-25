
component {
    public query function dohvatiVrsteReci() {
        
        q_vrste_reci = queryExecute(
            sql = "SELECT id, vrsta FROM vrste_reci",
            options = {
                datasource = application.datasource
            }
        );
        

        return q_vrste_reci;
    }
}