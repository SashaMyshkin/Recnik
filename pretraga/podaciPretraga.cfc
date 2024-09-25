
component {
    
    public query function dohvatiLekseme() {

        sql = "
            SELECT l.id as leksema_id, 
                l.leksema, 
                l.vrsta_reci_id, 
                v.vrsta vrsta_reci, 
                l.fon_akcenat_id, 
                a.akcenat, 
                akcentovani_slog
            FROM leks_lekseme l
            INNER JOIN vrste_reci v on v.id = l.vrsta_reci_id
            INNER JOIN fon_akcenti a on a.id = l.fon_akcenat_id
            WHERE 1=1 ";

        // Add the condition if form.leksema is not empty
        if (form.leksema neq "") {
            sql &= " AND l.leksema LIKE :leksema";
        }

        // Append ORDER BY, LIMIT, and OFFSET
        sql &= " ORDER BY l.leksema
                LIMIT #form.per_page#
                OFFSET #(form.page_number - 1) * form.per_page#";

        // Initialize params
        params = {};

        // Add parameter if form.leksema is not empty
        if (form.leksema neq "") {
            params["leksema"] = {
                value: "%" & form.leksema & "%",
                type: "varchar"
            };
        }

        // Execute the query
        q_leks_lekseme = queryExecute(
            sql = sql,
            params = params,
            options = {
                datasource = application.datasource
            }
        );
        

        return q_leks_lekseme;
    }

    
    public query function dohvatiLeksemu() {

        // Execute the query
        q_leks_leksema = queryExecute(
            sql = "
                SELECT l.id as leksema_id, 
                    l.leksema, 
                    l.vrsta_reci_id, 
                    v.vrsta vrsta_reci, 
                    l.fon_akcenat_id, 
                    a.akcenat, 
                    akcentovani_slog
                FROM leks_lekseme l
                INNER JOIN vrste_reci v on v.id = l.vrsta_reci_id
                INNER JOIN fon_akcenti a on a.id = l.fon_akcenat_id
                WHERE 1=1 
                AND l.id = :leksemaId",
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
        

        return q_leks_leksema;
    }

    public query function dohvatiAkcente() {

        q_fon_akcenti = queryExecute(
            sql = "SELECT id, akcenat FROM fon_akcenti",
            options = {
                datasource = application.datasource
            }
        );
        

        return q_fon_akcenti;
    }

    public query function dohvatiVrsteReci() {
        
        q_vrste_reci = queryExecute(
            sql = "SELECT id, vrsta FROM vrste_reci",
            options = {
                datasource = application.datasource
            }
        );
        

        return q_vrste_reci;
    }

    public number function save() {
        
        if(form.leksema_id == 0){
            save_leks_leksema = queryExecute(
                sql = "INSERT INTO leks_lekseme
                        (
                            leksema, 
                            vrsta_reci_id, 
                            fon_akcenat_id, 
                            akcentovani_slog
                        ) 
                        VALUES 
                        (
                            '#form.pLeksema#',
                            '#form.vrsta_reci_id#',
                            '#form.fon_akcenat_id#',
                            '#form.akcentovani_slog#'
                        )",
                options = {
                    datasource: "#application.datasource#",
                    result:"result"
                }
            );

            return result.generatedKey;

        } else {
            save_leks_leksema = queryExecute(
                sql = "UPDATE leks_lekseme 
                        SET leksema='#form.pLeksema#',
                            vrsta_reci_id='#form.vrsta_reci_id#',
                            fon_akcenat_id='#form.fon_akcenat_id#',
                            akcentovani_slog='#form.akcentovani_slog#'
                        WHERE id = :id",
                params = {
                    id: {
                        value: "#form.leksema_id#",
                        type: "int"
                    }
                },
                options = {
                    datasource: "#application.datasource#"
                }
            );

            return form.leksema_id;
        }
    }



    
}