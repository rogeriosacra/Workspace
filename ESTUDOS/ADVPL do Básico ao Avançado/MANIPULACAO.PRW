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
User Function manipulacao()

Local cArea := "SZ1"
Local cCliente := "001"
Local cLoja := "01"
Local cNomeCli := ""
Local cCodProd := ""


//Emula abertura do Protheus

 RpcSetType(3)
 PREPARE ENVIRONMENT EMPRESA "99" FILIAL "01" MODULO "FAT"

DbSelectArea(cArea)
DbSetOrder(1)// Opação ao dbsetorder: DBORDERNICKNAME("Z1CLIENTE") UTILIZA O NICKNAME DO INDICE
DbGotop()


If DbSeek(xFilial()+cCliente+cLoja) 
    MsgAlert("Cliente "+cCliente+" já cadastrado, o registro será deletad0")
    RecLock("SZ1",.F.)
    DbDelete()
    MSUNLOCK()
else
    RecLock("SZ1",.T.)
    Z1_FILIAL  := xFilial()
    Z1_CLIENTE := cCliente
    Z1_LOJA    := "01"
    Z1_PRODUTO := "000001"
    Z1_UM      := "UN"
    Z1_UMCLI   := "CX"
    Z1_TIPO    := "D"
    Z1_FATOR   := 100.00
    MSUNLOCK()
EndIF

DbSelectArea("SA1")
DbSetOrder(1)// Opação ao dbsetorder: DBORDERNICKNAME("Z1CLIENTE") UTILIZA O NICKNAME DO INDICE
DbGotop()

If DbSeek(xFilial()+cCliente+cLoja)
    cNomeClie := SA1->A1_NOME 
    MsgInfo("Nome do Cliente : "+cNomeCli)
else
    cNomeClie := "Cliente não localizado"
    MsgInfo("Nome do Cliente : "+cNomeCli)  
EndIf   


cCodProd := FwInputBox("Informe o código do produto",)

DbSelectArea("SB1")
DbSetOrder(1)// Opação ao dbsetorder: DBORDERNICKNAME("Z1CLIENTE") UTILIZA O NICKNAME DO INDICE
DbGotop()

If DbSeek(xFilial()+cCodProd) 
    cCodProd := SB1->B1_COD
    cNomeProd := SB1->B1_DESC 
    MsgInfo("Produto já cadastrado, código : "+cCodProd+" , descrição do produto : "+cNomeProd)
      
else
    cNomeClie := "Produto não localizado"
    MsgInfo("Descrição do produto : "+cNomeProd)

EndIf 

RESET ENVIRONMENT

   
Return 

