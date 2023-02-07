#INCLUDE 'protheus.ch'
#INCLUDE 'vkey.ch'
#INCLUDE 'Rwmake.ch'
#INCLUDE 'msmgadd.ch'
#INCLUDE 'tbiconn.ch'
#INCLUDE 'tbicode.ch'
#Include 'TopConn.ch'

/*/{Protheus.doc} User Function CmdDB
description)
    @type  Function
    @author user
    @since 06/02/2023
    @version version
    @param param_name, param_type, param_descr
    @return return_var, return_type, return_description
    @example
    (examples)
    @see (links_or_references)
    /*/
User Function CmdDB()

Local cCliente := "000001"
Local cLoja := "01"
Local cArea := "SZ1"
Local cProduto := "000001"
RpcSetType(3)
Prepare Environment  EMPRESA "99" FILIAL "01"  MODULO "FAT"

//SZ1->(GetArea())
DbSelectArea(cArea)
DbSetOrder(1)// Opação ao dbsetorder: DBORDERNICKNAME("Z1CLIENTE") UTILIZA O NICKNAME DO INDICE
DbGotop()
If DbSeek(xFilial()+cCliente+cLoja) 
    Alert("Achou")
    RecLock("SZ1",.F.)
    Z1_FATOR := 100
    MSUNLOCK()
else
    RecLock("SZ1",.T.)
    Z1_FILIAL  := xFilial()
    Z1_CLIENTE := "000001"
    Z1_LOJA    := "01"
    Z1_PRODUTO := "000001"
    Z1_UM      := "UN"
    Z1_UMCLI   := "CX"
    Z1_TIPO    := "D"
    Z1_FATOR   := 100.00
    MSUNLOCK()
EndIF

DbSelectArea("SZ1")
DbSetOrder(2)
DbGotop()

If DbSeek(xFilial()+cProduto) 
    Alert("Achou")
    RecLock("SZ1",.F.)
    DbDelete()
    MSUNLOCK()
else
    Alert("DBSEEK não localizou nada")
EndIF 

Reset Environment

Return 

