
component {
    public query function dohvatiGlagolskeVidove() {

        q_kat_gl_vidovi = queryExecute(
            sql = "SELECT id, vid glagolski_vid FROM kat_gl_vidovi",
            options = {
                datasource = application.datasource
            }
        );
        
        return q_kat_gl_vidovi;
    }
}