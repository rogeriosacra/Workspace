#Include "Protheus.ch"

/*/
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Programa  �MBrwSZ1    Autor � Paulo Bindo        � Data �  26/10/21   ���
�������������������������������������������������������������������������͹��
���Descricao � cadastro SZ1 COM MBRWOSE                                   ���
���          �                                                            ���
�������������������������������������������������������������������������͹��
���Uso       � AP6 IDE                                                    ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
/*/

User Function MBrZ1()
	Local cAlias := "SZ1"
	Local aCores := {}
	Local cFiltra := ""

	Private cCadastro := "Cadastro de UM por Cliente"
	Private aRotina := {}
	Private aIndexSZ1 := {}
	Private bFiltraBrw:={||}

//BOTOES MENU
	AADD(aRotina,{"Pesquisar" ,"PesqBrw" ,0,1})		//AADD(aRotina,{"Pesquisar" ,"AxPesqui",0,1})
	AADD(aRotina,{"Visualizar","AxVisual" ,0,2})
	AADD(aRotina,{"Incluir" ,"U_Inclui" ,0,3})		//AADD(aRotina,{"Incluir" ,"AxInclui",0,3})
	AADD(aRotina,{"Alterar" ,"U_Altera" ,0,4})  	//AADD(aRotina,{"Alterar" ,"AxAltera" ,0,4})
	AADD(aRotina,{"Excluir" ,"U_Deleta" ,0,5})		//AADD(aRotina,{"Excluir" ,"AxDeleta",0,5})
	//AADD(aRotina,{"Legenda" ,"U_Legenda" ,0,3}) Exclui o bot�o de legenda do usu�rio
	If Retcodusr() # "000000" // Condi��o para ter acesso ao bot�o da fun��o de regua PbMsgRUN
		AADD(aRotina,{"Processa" ,"U_PBMsgRun()" ,0,6})
	EndIf
//CORES LEGENDA
	AADD(aCores,{"Z1_TIPO == 'M'" ,"BR_VERDE" })
	AADD(aCores,{"Z1_TIPO == 'D'" ,"BR_AMARELO" })
	AADD(aCores,{"Z1_TIPO == 'S'" ,"BR_VERMELHO" })

	dbSelectArea(cAlias)
	dbSetOrder(1)
//+------------------------------------------------------------
//| Cria o filtro na MBrowse utilizando a fun��o FilBrowse
//+------------------------------------------------------------

	cFiltra	:= ' SZ1->Z1_FATOR > 10 '
	bFiltraBrw 	:={ || FilBrowse(cAlias,@aIndexSZ1,@cFiltra) }
	Eval(bFiltraBrw)
	dbSelectArea(cAlias)
	dbGoTop()
	mBrowse(6,1,22,75,cAlias,,,,,,aCores)
//+------------------------------------------------
//| Deleta o filtro utilizado na fun��o FilBrowse
//+------------------------------------------------
	EndFilBrw(cAlias,aIndexSZ1)
Return Nil

/*/
	�����������������������������������������������������������������������������
	�����������������������������������������������������������������������������
	�������������������������������������������������������������������������ͻ��
	���Programa  � BInclui    Autor � Paulo Bindo        � Data �  26/10/21   ���
	�������������������������������������������������������������������������͹��
	���Descricao � ROTINA INCLUSAO                                            ���
	���          �                                                            ���
	�������������������������������������������������������������������������͹��
	���Uso       � AP6 IDE                                                    ���
	�������������������������������������������������������������������������ͼ��
	�����������������������������������������������������������������������������
	�����������������������������������������������������������������������������
/*/

User Function Inclui(cAlias,nReg,nOpc)
	Local nOpcao := 0

	nOpcao := AxInclui(cAlias,nReg,nOpc)
	If nOpcao == 1
		MsgInfo("Inclus�o efetuada com sucesso!")
	Else
		MsgInfo("Inclus�o cancelada!")
	Endif

Return Nil


/*/
	�����������������������������������������������������������������������������
	�����������������������������������������������������������������������������
	�������������������������������������������������������������������������ͻ��
	���Programa  � BAltera    Autor � Paulo Bindo        � Data �  26/10/21   ���
	�������������������������������������������������������������������������͹��
	���Descricao � ROTINA ALTERACAO                                           ���
	���          �                                                            ���
	�������������������������������������������������������������������������͹��
	���Uso       � AP6 IDE                                                    ���
	�������������������������������������������������������������������������ͼ��
	�����������������������������������������������������������������������������
	�����������������������������������������������������������������������������
/*/
User Function Altera(cAlias,nReg,nOpc)
	Local nOpcao := 0
	nOpcao := AxAltera(cAlias,nReg,nOpc)
	If nOpcao == 1
		MsgInfo("Altera��o efetuada com sucesso!")
	Else
		MsgInfo("Altera��o cancelada!")
	Endif
Return Nil

/*/
	�����������������������������������������������������������������������������
	�����������������������������������������������������������������������������
	�������������������������������������������������������������������������ͻ��
	���Programa  � BDeleta    Autor � Paulo Bindo        � Data �  26/10/21   ���
	�������������������������������������������������������������������������͹��
	���Descricao � ROTINA EXCLUSAO                                            ���
	���          �                                                            ���
	�������������������������������������������������������������������������͹��
	���Uso       � AP6 IDE                                                    ���
	�������������������������������������������������������������������������ͼ��
	�����������������������������������������������������������������������������
	�����������������������������������������������������������������������������
/*/
User Function Deleta(cAlias,nReg,nOpc)
	Local nOpcao := 0
	nOpcao := AxDeleta(cAlias,nReg,nOpc)
	If nOpcao == 1
		MsgInfo("Exclus�o efetuada com sucesso!")
	Else
		MsgInfo("Exclus�o cancelada!")
	Endif
Return Nil

/*/
	�����������������������������������������������������������������������������
	�����������������������������������������������������������������������������
	�������������������������������������������������������������������������ͻ��
	���Programa  � BLegenda   Autor � Paulo Bindo        � Data �  26/10/21   ���
	�������������������������������������������������������������������������͹��
	���Descricao � ROTINA LEGENDA                                             ���
	���          �                                                            ���
	�������������������������������������������������������������������������͹��
	���Uso       � AP6 IDE                                                    ���
	�������������������������������������������������������������������������ͼ��
	�����������������������������������������������������������������������������
	�����������������������������������������������������������������������������
/*/

User Function Legenda()
	Local ALegenda := {}

	AADD(aLegenda,{"BR_VERDE" ,"Multiplica" })
	AADD(aLegenda,{"BR_AMARELO" ,"Divide" })
	AADD(aLegenda,{"BR_VERMELHO" ,"Subtrai" })
	BrwLegenda(cCadastro, "Legenda", aLegenda)
Return Nil
