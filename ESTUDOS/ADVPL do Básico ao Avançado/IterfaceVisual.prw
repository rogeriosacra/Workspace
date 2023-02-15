#INCLUDE 'rwmake.ch'
#INCLUDE 'Protheus.ch'

/*/{Protheus.doc} User Function 
    (long_description)
    @type  Function
    @author user
    @since 14/02/2023
    @version version
    @param param_name, param_type, param_descr
    @return return_var, return_type, return_description
    @example
    (examples)
    @see (links_or_references)
    /*/
User Function IVisual()

Local oDlg
Local cTitulo := "Aula MsDialog"
Local cTexto  := "Cnpj"
Local cCGC    := SPACE(13)
Local nOPca   := 0


    DEFINE MSDIALOG oDlg TITLE cTitulo FROM 000,000 to 080,300 PIXEL
    @ 001,001 SAY cTexto SIZE 55,07 OF oDlg PIXEL
    @ 010,010 MSGET cCGC SIZE 55,11 OF oDlg PIXEL PICTURE "@R 99.999.999/9999-99" VALID !VAZIO()
    DEFINE SBUTTON FROM 010,120 TYPE 1 ACtION(nOpca := 1,oDlg:End()) ENABLE OF oDLG
    DEFINE SBUTTON FROM 020,120 TYPE 2 ACtION(nOpca := 2,oDlg:End()) ENABLE OF oDLG
    ACTIVATE MSDIALOG oDlg CENTERED

    IF nOpca == 2
        Return
    EndIF

    MSgInfo("CNPJ digitado foi: "+cCGC)

Return 
