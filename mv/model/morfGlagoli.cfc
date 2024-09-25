
component {
    public query function dohvatiMorfoloskeDetalje() {

        // Execute the query
        q_morf_gl = queryExecute(
            sql = "
                SELECT m.id as morf_gl_id,
                    m.infinitivna_osnova,
                    m.prezentska_osnova,
                    m.kat_gl_vid_id,
                    v.vid as glagolski_vid,
                    m.morf_gl_vrsta_id,
                    vr.vrsta glagolska_vrsta
                FROM morf_gl m
                INNER JOIN kat_gl_vidovi v on v.id = m.kat_gl_vid_id
                INNER JOIN morf_gl_vrste vr on vr.id = m.morf_gl_vrsta_id
                WHERE 1=1 
                AND m.leks_leksema_id = :leksemaId",
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
        

        return q_morf_gl;
    }

    public number function sacuvaj() {
        
        if(form.morf_gl_id == ""){
            save_morf_gl = queryExecute(
                sql = "INSERT INTO morf_gl
                        (
                            leks_leksema_id, 
                            infinitivna_osnova, 
                            prezentska_osnova, 
                            kat_gl_vid_id, 
                            morf_gl_vrsta_id
                        ) 
                        VALUES 
                        ('#form.leksema_id#',
                        '#form.infinitivna_osnova#',
                        '#form.prezentska_osnova#',
                        '#form.kat_gl_vid_id#',
                        '#form.morf_gl_vrsta_id#')",
                options = {
                    datasource: "#application.datasource#",
                    result:"result"
                }
            );

            return result.generatedKey;

        } else {
            save_morf_gl = queryExecute(
                sql = "UPDATE morf_gl 
                        SET infinitivna_osnova='#form.infinitivna_osnova#',
                        prezentska_osnova='#form.prezentska_osnova#',
                        kat_gl_vid_id='#form.kat_gl_vid_id#',
                        morf_gl_vrsta_id='#form.morf_gl_vrsta_id#'
                        WHERE id = :id",
                params = {
                    id: {
                        value: "#form.morf_gl_id#",
                        type: "int"
                    }
                },
                options = {
                    datasource: "#application.datasource#"
                }
            );

            return form.morf_gl_id;
        }
    }
}