
component {

    property name="leksemaId" type="numeric" default="0";
    
    public struct function init( required numeric id = 0) {

        if (arguments.id != 0) {
            q_leks_lekseme = queryExecute(
                sql = 'SELECT l.id as leksema_id, 
                            l.leksema, 
                            l.vrsta_reci_id, 
                            v.vrsta vrsta_reci, 
                            l.fon_akcenat_id, 
                            a.akcenat, 
                            akcentovani_slog
                        FROM leks_lekseme l
                        INNER JOIN vrste_reci v on v.id = l.vrsta_reci_id
                        INNER JOIN fon_akcenti a on a.id = l.fon_akcenat_id 
                        WHERE l.id = :id',
                params = {
                    id: {
                        value: "#arguments.id#",
                        type: "int"
                    }
                },
                options = {
                    datasource: "#application.datasource#"
                }
            );

            if (q_leks_lekseme.recordCount > 0) {
                variables.leksemaId = q_leks_lekseme.leksema_id;
                this.leksema = q_leks_lekseme.leksema;
                this.vrstaReciId = q_leks_lekseme.vrsta_reci_id;
                this.vrstaReci = q_leks_lekseme.vrsta_reci;
                this.fonAkcenatId = q_leks_lekseme.fon_akcenat_id;
                this.akcenat = q_leks_lekseme.akcenat;
                this.akcentovaniSlog = q_leks_lekseme.akcentovani_slog;
            }  else {
                variables.leksemaId = 0;
                this.leksema = "";
                this.vrstaReciId = 0;
                this.vrstaReci = "";
                this.fonAkcenatId = 0;
                this.akcenat = "";
                this.akcentovaniSlog = 0;
            }   
        }

        return this;
    }

    
    public void function save() {

        if(variables.leksemaId == 0){
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
                            '#this.leksema#',
                            '#this.vrstaReciId#',
                            '#this.fonAkcenatId#',
                            '#this.akcentovaniSlog#'
                        )",
                options = {
                    datasource: "#application.datasource#",
                    result:"result"
                }
            );

            variables.leksemaId = result.generatedKey
        } else {
            save_leks_leksema = queryExecute(
                sql = "UPDATE leks_lekseme 
                        SET leksema='#this.leksema#',
                            vrsta_reci_id='#this.vrstaReciId#',
                            fon_akcenat_id='#this.fonAkcenatId#',
                            akcentovani_slog='#this.akcentovaniSlog#'
                        WHERE id = :id",
                params = {
                    id: {
                        value: "#variables.leksemaId#",
                        type: "int"
                    }
                },
                options = {
                    datasource: "#application.datasource#"
                }
            );
        }

        this.init(variables.leksemaId)
        
    }

    // Getter and Setter for leksemaId
    public numeric function getLeksemaId() {
        return variables.leksemaId;
    }

    private void function setLeksemaId(numeric leksemaId) {
        variables.leksemaId = arguments.leksemaId;
    }


}