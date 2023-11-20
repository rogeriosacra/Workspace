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

Local cTitulo := "Aula MsDialog"
Local cTexto  := "Cnpj"
Local cCGC    := SPACE(13)
Local nOPca   := 0
Private oDlg


    DEFINE MSDIALOG oDlg TITLE cTitulo FROM 000,000 to 080,300 PIXEL
    @ 001,001 SAY cTexto SIZE 55,07 OF oDlg PIXEL
   // @ 010,010 MSGET cCGC SIZE 55,11 OF oDlg PIXEL PICTURE "@R 99.999.999/9999-99" VALID !VAZIO() // Valid-> método para validação de conteúdo de campo, usando a função !vazio()
    @ 010,010 MSGET cCGC SIZE 55,11 OF oDlg PIXEL PICTURE "@R 99.999.999/9999-99" VALID ACGC(@cCGC) // Esta linha faz a mesma coisa que ainha comentada acima, apenas tem validação diferente
    DEFINE SBUTTON FROM 010,120 TYPE 1 ACtION(nOpca := 1,oDlg:End()) ENABLE OF oDLG /// nopca := 1 se clicar no botão ok
    DEFINE SBUTTON FROM 020,120 TYPE 2 ACtION(nOpca := 2,oDlg:End()) ENABLE OF oDLG // nopca := 2 se clicar no botão cancelar
    ACTIVATE MSDIALOG oDlg CENTERED

    IF nOpca == 2
        Return
    EndIF

    MSgInfo("CNPJ recebido foi: "+cCGC)

Return 

//*******************************************************

Static Function ACGC(cCGC)

If cCGC # '11111111111'
    MSgAlert("Atenção erro na digitação do CGC: "+cCGC)
    cCGC := '11111111111'
    oDlg:refresh()
End If

MSgAlert("cCGC alterado: "+cCGC)


Return

