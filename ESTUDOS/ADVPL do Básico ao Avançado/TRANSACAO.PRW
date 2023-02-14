#INCLUDE 'Protheus.ch'
#INCLUDE 'TbiConn.ch'
#INCLUDE 'TbiCode.ch'
#INCLUDE 'Totvs.ch'
/*/{Protheus.doc} User Function TRANSACAO
Teste de controle de transação)
    @type  User Function
    @author Rogério Sacramento
    @since 13/02/2023
    @version version
    @param param_name, param_type, param_descr
    @return return_var, return_type, return_description
    @example
    (examples)
    @see (links_or_references)
    /*/
User Function TRANSACAO()

	Local cArea    := "SZ1"
	Local cCliente := "001"
	Local cLoja    := "01"
	Local cNomeClie := ""
	Local cCodProd := ""


//Emula abertura do Protheus

	RpcSetType(3)
	PREPARE ENVIRONMENT EMPRESA "99" FILIAL "01" MODULO "FAT"

	DbSelectArea(cArea)
	DbSetOrder(1)// Opação ao dbsetorder: DBORDERNICKNAME("Z1CLIENTE") UTILIZA O NICKNAME DO INDICE
	DbGotop()


	/*If DbSeek(xFilial()+Padr(cCliente,6)+cLoja)
		MsgAlert("Cliente "+cCliente+" já cadastrado, o registro será deletad0")
		RecLock("SZ1",.F.)
		DbDelete()
		MSUNLOCK()
	else*/
    BEGIN TRANSACTION
		RecLock("SZ1",.T.)
		Z1_FILIAL  := xFilial()
		Z1_CLIENTE := GetSx8Num("SA1","A1_COD")
		Z1_LOJA    := "01"
		Z1_PRODUTO := "000001"
		Z1_UM      := "UN"
		Z1_UMCLI   := "CX"
		Z1_TIPO    := "D"
		Z1_FATOR   := 100.00
        MSUNLOCK()
    END TRANSACTION    
		ConfirmSX8()
	//EndIF
    BEGINTRAN()
    RecLock("SZ1",.T.)
		Z1_FILIAL  := xFilial()
		Z1_CLIENTE := GetSx8Num("SA1","A1_COD")
		Z1_LOJA    := "01"
		Z1_PRODUTO := "000001"
		Z1_UM      := "UN"
		Z1_UMCLI   := "CX"
		Z1_TIPO    := "D"
		Z1_FATOR   := 100.00
		MSUNLOCK()
    DISARMTRANSACTION()    
	ENDTRAN()
    ConfirmSX8()
    MsUnlockAll()


	/*DbSelectArea("SA1")
	DbSetOrder(1)// Opação ao dbsetorder: DBORDERNICKNAME("Z1CLIENTE") UTILIZA O NICKNAME DO INDICE
	DbGotop()

	If DbSeek(xFilial()+Padr(cCliente,6)+cLoja)
		cNomeClie := SA1->A1_NOME
		MsgInfo("Nome do Cliente : "+cNomeClie)
	else
		cNomeClie := "Cliente não localizado"
		MsgInfo("Nome do Cliente : "+cNomeClie)
	EndIf


	cCodProd := FwInputBox("Informe o código do produto",)

	DbSelectArea("SB1")
	DbSetOrder(1)// Opação ao dbsetorder: DBORDERNICKNAME("Z1CLIENTE") UTILIZA O NICKNAME DO INDICE
	DbGotop()

	If DbSeek(xFilial()+(cCodProd))
		cCodProd := SB1->B1_COD
		cNomeProd := SB1->B1_DESC
		MsgInfo("Produto ja cadastrado, codigo : "+cCodProd+" , descricao do produto : "+cNomeProd)

	else
		cNomeClie := "Produto não localizado"
		MsgInfo("Descrição do produto : "+cNomeProd)

	EndIf*/

	RESET ENVIRONMENT


Return


    
Return 
