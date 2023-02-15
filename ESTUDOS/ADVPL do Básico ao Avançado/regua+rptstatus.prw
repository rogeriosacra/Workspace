#include "Protheus.ch"

//------------------------------------------------------------------------------------------
/*/{Protheus.doc} regua rptstatus
regua para relatorios

@author    paulo.bindo
@version   11.3.10.201812061821
@since     21/06/2019
/*/


User Function PBRpt()
	Local aSay := {}
	Local aButton := {}
	Local nOpc := 0
	Local cTitulo := "Exemplo de Funções"
	Local cDesc1 := "Este programa exemplifica a utilização da função Processa() em conjunto"
	Local cDesc2 := "com as funções de incremento ProcRegua() e IncProc()"
	
	
    AADD( aSay, cDesc1 )
	AADD( aSay, cDesc2 )
	AADD( aButton, { 1, .T., {|| nOpc := 1, FechaBatch() }} )
	AADD( aButton, { 2, .T., {|| FechaBatch() }} )
	FormBatch( cTitulo, aSay, aButton )
	If nOpc <> 1
		Return 
	Endif
	RptStatus({|lEnd|RunProc(@lEnd)}, "Aguarde...","Executando rotina.", .T. )
Return 


//******************************************************************

Static Function RunProc(lEnd)
	Local nCnt := nIcr := 0
    Local cCancel := "Cancelado pelo usuario"

// este trecho diz respeito a contagem dos registros que será armazenada em nCnt, para em seguida setar o tamanho da regua, na linha 49 
	dbSelectArea("SX5")
	dbSetOrder(1)
	dbSeek(xFilial("SX5")+"01",.T.)
	While !Eof() .And. X5_FILIAL == xFilial("SX5") .And. X5_TABELA <= "99"
		nCnt++
		dbSkip()
	End

SetRegua(nCnt)
//Este trecho diz respeito ao incremento da regua conforme é lido cada registro
	dbSeek(xFilial("SX5")+"01",.T.)
	While !Eof() .And. X5_FILIAL == xFilial("SX5") .And. X5_TABELA <= "99"
		IncRegua()
		nIcr++
		If lEnd
			MsgInfo(cCancel,"Fim")
			Exit
		Endif
		dbSkip()
	End

	Alert(nIcr) //Usei esta variáve somente para verificar se o numero de incrmento era igual o numero de registro.Confirmado.
Return
