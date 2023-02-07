#INCLUDE 'protheus.ch'
#INCLUDE 'vkey.ch'
#INCLUDE 'Rwmake.ch'
#INCLUDE 'msmgadd.ch'
#INCLUDE 'tbiconn.ch'
#INCLUDE 'tbicode.ch'

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

Local cCliente := "002"
Local cLoja := "01"
RpcSetType(3)
Prepare Environment  EMPRESA "99" FILIAL "01"  MODULO "FAT"

//SZ1->(GetArea())
DbSelectArea("SZ1")
DbSetOrder(1)

If DbSeek(xFilial()+cCliente+cLoja) 
    Alert("Achou")
    RecLock("SZ1",.F.)
    Z1_FATOR := 100
    MSUNLOCK()
else
    RecLock("SZ1",.T.)
    Z1_FILIAL  := xFilial()
    Z1_CLIENTE := "002"
    Z1_LOJA    := "01"
    Z1_PRODUTO := "006"
    Z1_UM      := "UN"
    Z1_UMCLI   := "CX"
    Z1_TIPO    := "D"
    Z1_FATOR   := "100"
    MSUNLOCK()
EndIF

DbSelectArea("SZ1")
DbSetOrder(1)

If DbSeek(xFilial()+cCliente+cLoja) 
    Alert("Achou")
    RecLock("SZ1",.F.)
    DbDelete()
    MSUNLOCK()
else
    Alert("DBSEEK não localizou nada")
EndIF 

Reset Environment

Return 
