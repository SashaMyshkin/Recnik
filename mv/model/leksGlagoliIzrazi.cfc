
component {
    public query function dohvatiIzraze(leks_gl_znacenje_id) {

        // Execute the query
        q_leks_gl_izrazi = queryExecute(
            sql = "SELECT id, leks_gl_znacenje_id, izraz, objasnjenje 
            FROM leks_gl_izrazi 
            WHERE 1=1
            AND leks_gl_znacenje_id = :leks_gl_znacenje_id",
            params = {
                leks_gl_znacenje_id: {
                    value: "#arguments.leks_gl_znacenje_id#",
                    type: "int"
                }
            },
            options = {
                datasource = application.datasource
            }
        );
        

        return q_leks_gl_izrazi;
    }
}