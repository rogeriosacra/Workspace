#include "Protheus.ch"

//------------------------------------------------------------------------------------------
/*/{Protheus.doc} regua processa
regua para relatorios

@author    paulo.bindo
@version   11.3.10.201812061821
@since     21/06/2019
/*/

USER FUNCTION PBMsgRun()
	LOCAL nCnt := 0
	dbSelectArea("SX1")
	dbGoTop()
	MsgRun("Lendo arquivo, aguarde...","Título opcional",{||dbEval({|x| nCnt++}) })
	MsgInfo("FIM!!!, Total de "+AllTrim(Str(nCnt))+" registros",FunName())
RETURN()
