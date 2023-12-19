#INCLUDE 'Protheus.ch'
#INCLUDE 'TbiConn.ch'
#INCLUDE 'TbiCode.ch'
#INCLUDE 'Totvs.ch'
#include "protheus.ch"
#include "vkey.ch"
#include "Rwmake.ch"
#INCLUDE "JPEG.ch"
#include "msmgadd.ch"

USER FUNCTION TSTFUN()

Local   nResultado := 0
Private nValor1    := 10
Private nValor2    := 20


    RpcSetType(3)

	PREPARE ENVIRONMENT EMPRESA "99" FILIAL "01" MODULO "FAT"

    nResultado := Filha(@nValor1,nValor2)
    
    MSGINFO("resultado = "+cValToChar(nresultado))

    RESET ENVIRONMENT
Return

STATIC FUNCTION FILHA()

Local nConta := 0
nValor1 := 1


nConta := nValor1 * nValor2


Return(nConta)
