#INCLUDE 'protheus.ch'
#INCLUDE 'vkey.ch'
#INCLUDE 'Rwmake.ch'
#INCLUDE 'msmgadd.ch'
#INCLUDE 'tbiconn.ch'
#INCLUDE 'tbicode.ch'
#Include 'TopConn.ch'

//------------------------------------------------------------------------------------------
/*/{Protheus.doc} regua processa
regua para relatorios

@author    paulo.bindo
@version   11.3.10.201812061821
@since     21/06/2019
/*/

USER FUNCTION PBMsgRun()
	LOCAL nCnt := 0
	
	Prepare Environment  EMPRESA "99" FILIAL "01"  MODULO "FAT"
	
	dbSelectArea("SX1")
	dbGoTop()
	MsgRun("Lendo arquivo, aguarde...","Título opcional",{||dbEval({|x| nCnt++}) })
	MsgInfo("FIM!!!, Total de "+AllTrim(Str(nCnt))+" registros",FunName())
RETURN()
