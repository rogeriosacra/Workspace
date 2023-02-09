#include "protheus.ch"
#include "vkey.ch"
#include "Rwmake.ch"
#include "msmgadd.ch"
#include "TbiConn.ch"
#include "TbiCode.ch"

#DEFINE ENTER Chr(13)+Chr(10)

//------------------------------------------------------------------------------------------
/*/{Protheus.doc} ABRESZ1
Manutenção de dados em SB1-Descricao Generica do Produto.

@author    paulo.bindo
@version   11.3.10.201812061821
@since     21/06/2019
/*/


User Function softl()
	Local xx		:= 0

	If SELECT("SX6") >0
		ALERT("PROTHEUS ABERTO")
	Else
		RpcSetType(3)
		PREPARE ENVIRONMENT EMPRESA "99" FILIAL "01" MODULO "FAT"
	EndIf



	dbSelectArea("SA1")
	dbSetOrder(1)

	BEGINTRAN()

	For xx:= 1 To 10

		cNumero := Getsx8num()

			RecLock("SA1", .T.)
			A1_FILIAL	:= xFilial()
			A1_COD		:= cNumero
			A1_LOJA		:= "01"
			A1_NOME		:= "TESTE DE NUMERACAO "+cValToChar(xx)
			A1_PESSOA	:= "F"
			A1_NREDUZ	:= "TESTE"+cValToChar(xx)
			A1_END		:= "RUA TESTE"
			A1_BAIRRO	:= "TESTE"
			A1_TIPO		:= "F"
			A1_EST		:= "SP"
			A1_COD_MUN 	:= "00105"
			A1_MUN		:= "ADAMANTINA                                                  "
			A1_NATUREZ	:= "1.00001   "
			MsUnlock()

			If cNumero == "000010"
				RollBackSx8()
				DisarmTransaction()
			else
				Confirmsx8()	
			EndIf

	Next

	ENDTRAN()
	MsUnlockAll()

	RESET ENVIRONMENT

Return



