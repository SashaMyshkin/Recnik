
component {
    public query function dohvatiGlagolskaZnacenja() {

        // Execute the query
        q_leks_gl_znacenja = queryExecute(
            sql = "
                SELECT zn.id znacenje_id,
                        zn.znacenje,
                        povratna_zamenica,
                        zn.tehnicka_skracenica_id,
                        ts.skracenica,
                        ts.objasnjenje,
                        zn.kategorija
                FROM leks_gl_znacenja zn
                LEFT JOIN tehnicke_skracenice ts on ts.id = zn.tehnicka_skracenica_id
                WHERE 1=1 
                AND zn.leks_leksema_id = :leksemaId 
                ORDER BY zn.kategorija",
            params = {
                leksemaId: {
                    value: "#url.q#",
                    type: "int"
                }
            },
            options = {
                datasource = application.datasource
            }
        );
        

        return q_leks_gl_znacenja;
    }
}