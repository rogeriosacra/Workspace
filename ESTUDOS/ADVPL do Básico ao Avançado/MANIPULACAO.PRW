#INCLUDE 'Protheus.ch'
#INCLUDE 'TbiConn.ch'
#INCLUDE 'TbiCode.ch'
#INCLUDE 'Totvs.ch'



/*/{Protheus.doc} User Function manipulcao
description)
    @type  Function
    @author user
    @since 09/02/2023
    @version version
    @param param_name, param_type, param_descr
    @return return_var, return_type, return_description
    @example
    (examples)
    @see (links_or_references)
    /*/
User Function manipulcao()

Local cArea := "SZ1"
Local cCliente := "000001"
Local cLoja := "01"


//Emula abertura do Protheus

 RpcSetType(3)
 PREPARE ENVIRONMENT EMPRESA "99" FILIAL "01" MODULO "FAT"

DbSelectArea(cArea)
DbSetOrder(1)// Opação ao dbsetorder: DBORDERNICKNAME("Z1CLIENTE") UTILIZA O NICKNAME DO INDICE
DbGotop()


If DbSeek(xFilial()+cCliente+cLoja) 
    MsgAlert("Cliente já cadastrado, apenas o fator será atualizado")
    RecLock("SZ1",.F.) 
    Z1_FATOR   := 1.00 
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

   
Return 

