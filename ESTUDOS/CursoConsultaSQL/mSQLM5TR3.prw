#include 'protheus.ch'
#include 'parmtype.ch'
#include 'topconn.ch'

#DEFINE STR_PULA Chr(13)+Chr(10)

/*/{Protheus.doc} mSQLM5TR
Função para consulta genérica - cria tela de exibição com pesquisa. Permite copiar células e exportar os dados 
para arquivo .xml
@author Maicon Macedo
@since 27 jan. 2020
@version 1.0
/*/

User Function mSQLM5TR(cQryZZS,cQryCnd)
	Local cAlias				:= GetNextAlias()
	//Default
	Default cQryZZS		:= ""
	Default cQryCnd		:= ""
	//Private
	Private cConsulta	:= cQryZZS
	Private cCondicao	:= cQryCnd
	Private cQuery			:= ""
	Private cPsqusa		:= ""
	Private cGrpOd		:= ""
	
	BeginSQL Alias cAlias
			SELECT
				ZZS.ZZS_CODE ,
				ZZS.ZZS_TBMAIN ,
				ZZS.ZZS_CPESQ ,
				ISNULL(CONVERT (VARCHAR(8000), CONVERT (VARBINARY(8000), ZZS.ZZS_QUERY) ),'') ZZS_QUERY ,
				ISNULL(CONVERT (VARCHAR(8000), CONVERT (VARBINARY(8000), ZZS.ZZS_CNDCAO) ),'') ZZS_CNDCAO  ,
				ISNULL(CONVERT (VARCHAR(8000), CONVERT (VARBINARY(8000), ZZS.ZZS_ORDER) ),'') ZZS_ORDER 
			FROM
				%table:ZZS% ZZS
			WHERE
				ZZS.D_E_L_E_T_  = ' ' AND ZZS.ZZS_CODE = %Exp:cConsulta%
	EndSQL
	
	cQuery	:= (cAlias)->ZZS_QUERY
	cQuery	+= STR_PULA
	cQuery 	+= cCondicao
	
	cPsqusa	:= (cAlias)->ZZS_CPESQ
	cGrpOd	:= (cAlias)->ZZS_ORDER

	(cAlias)->(DbCloseArea())
	
	MnTTela(cQuery,cPsqusa,cGrpOd)
	
Return

Static Function MnTTela(cSentenca,cPesqui,cGrpOrd)
	Local aArea						:= GetArea()
	Local oAreaPesq
	Local oAreaDados
	Local oAreaAcao
	Local nTamBtn					:= 60
	Local oBtnExcl
	Local oBtnLimp
	Local oBtnFchr
	//Default
	DEFAULT cSentenca		:= ""
	DEFAULT cPesqui 			:= ""
	DEFAULT cGrpOrd			:= ""
	//Private
	Private cConsSQL			:= cSentenca
	Private cPsqsaSQL			:= cPesqui
	Private cOrdrsQL			:= cGrpOrd
	Private aEstrutr				:= {} // Estrutura da Grid - baseada na consulta QRY_TMP
	Private cQryNm				:= ""
	//MsDialog - por inteiro
	Private oDltTela
	Private nTelaLarg			:= 1000
	Private nTelaAltu				:= 0600
	//Area Pesquisa
	Private oGetPesq			:= Space(100)
	Private cGetPesq			:= Space(100)
	//Area dos Dados
	Private oMSNew	
	Private aCabecAux			:= {}
	Private aColsAux				:= {}
	
	//Chama a montagem da Estrutura do MSDialog na Area de Dados
	MnTEstr()
	
	DEFINE MSDIALOG oDlgTela TITLE "Consulta de Dados - "+cConsulta FROM 000, 000 TO nTelaAltu, nTelaLarg COLORS 0, 16777215 PIXEL STYLE DS_MODALFRAME
		@ 003,003 GROUP oAreaPesq TO 025, (nTelaLarg/2)-3 PROMPT "Pesquisar:" OF oDlgTela COLOR 0, 16777215 PIXEL
		@ 010,006 MSGET oGetPesq VAR cGetPesq SIZE (nTelaLarg/2)-12, 010 OF oDlgTela COLORS 0, 16777215 VALID (VldPesq()) PIXEL
		
		@ 028,003 GROUP oAreaDados TO (nTelaAltu/2)-28, (nTelaLarg/2)-3 PROMPT "Dados: " OF oDlgTela COLOR 0, 16777215 PIXEL
			oMSNew := MsNewGetDados():New(	035, 006,;
																					(nTelaAltu/2)-31,;
																					(nTelaLarg/2)-6,;
																					GD_INSERT+GD_DELETE+GD_UPDATE,;
																					"AllwaysTrue()",;
																					,"", , , ; //cTudoOk , Inici Campos, Alteracao, Congelamento
																					999,;
																					, , , ; // Campo Ok, Super Del, Delete
																					oDlgTela,;
																					aCabecAux,;	// Array do Cabeçalho
																					aColsAux	)	// Array das Colunas
			oMSNew:lActive := .F.
			
			PopDados()
			
		@ (nTelaAltu/2)-25, 003 GROUP oAreaAcao TO (nTelaAltu/2)-3 , (nTelaLarg/2)-3 PROMPT "Ações: " OF oDlgTela COLOR 0, 16777215 PIXEL
			@ (nTelaAltu/2)-19, (nTelaLarg/2)-((nTamBtn*1)+06) BUTTON oBtnExcl PROMPT "Exportar"		SIZE nTamBtn, 013	OF oDlgTela ACTION (GeraExcel()) 	PIXEL
			@ (nTelaAltu/2)-19, (nTelaLarg/2)-((nTamBtn*2)+09) BUTTON oBtnLimp PROMPT "Resetar"		SIZE nTamBtn, 013	OF oDlgTela ACTION (btReset()) 	PIXEL
			@ (nTelaAltu/2)-19, (nTelaLarg/2)-((nTamBtn*3)+12) BUTTON oBtnFchr PROMPT "Fechar"			SIZE nTamBtn, 013	OF oDlgTela ACTION (btFecha()) 	PIXEL
			
		oMSNew:oBrowse:SetFocus()
		
	ACTIVATE MSDIALOG oDlgTela CENTERED
	
	RestArea(aArea)
			
Return

/*---------------------------------------------------------------------------------------------------------*
*	MnTEstr - Montagem da tela de dados
*---------------------------------------------------------------------------------------------------------*/
Static Function MnTEstr()
	Local aAreaX3		:= SX3->(GetArea())
	Local cQuery		:= ""
	Local nAtual			:= 0

	//Definir como zero os valores das Colunas e do Cabeçalho
	aCabecAux 	:= {}
	aColsAux		:= {}
	
	//Sentença SQL = SELECT + FROM + WHERE + GROUP BY / ORDER BY
	cQuery := cConsSQL + " " + cOrdrSQL
	
	If Select ("QRY_TMP") <> 0
		DbSelectArea("QRY_TMP")
		DbCloseArea()
	EndIf
	
	TCQuery cQuery New Alias "QRY_TMP"
	
	aEstrutr := QRY_TMP->(DbStruct())
	
	QRY_TMP->(DbCloseArea())
	
	DbSelectArea("SX3")
	SX3->(DbSetOrder(2))
	SX3->(DbGoTop())
	
	For nAtual := 1 To Len(aEstrutr)
		cCampoAtu := aEstrutr[nAtual][1]
		
		If SX3->(DbSeek(cCampoAtu))
			aAdd(aCabecAux, { X3Titulo(),;
												cCampoAtu,;
												PesqPict(SX3->X3_ARQUIVO, cCampoAtu),;
												SX3->X3_TAMANHO,;
												SX3->X3_DECIMAL,;
												".F.",;
												".F.",;
												SX3->X3_TIPO,;
												"",;
												"" 	}	)
		Else
			aAdd(aCabecAux, { Capital(StrTran(cCampoAtu, '_', ' ')),;
												cCampoAtu,;
												"",;
												aEstrutr[nAtual][3],;
												aEstrutr[nAtual][4],;
												".F.",;
												".F.",;
												aEstrutr[nAtual][2],;
												"",;
												"" 	}	)
		EndIf
	
	Next
	
	RestArea(aAreaX3)

Return

/*---------------------------------------------------------------------------------------------------------*
*	Função PodDados - para popular os dados da grid da tela
*---------------------------------------------------------------------------------------------------------*/
Static Function PopDados()
	
Return

/*---------------------------------------------------------------------------------------------------------*
*	
*---------------------------------------------------------------------------------------------------------*/
Static Function GeraExcel()

Return Nil

/*---------------------------------------------------------------------------------------------------------*
*	
*---------------------------------------------------------------------------------------------------------*/
Static Function btReset()
  cGetPesq := Space(100)
  oGetPesq:refresh()

  PopDados()

  oGetPesq:SetFocus()

Return

/*---------------------------------- -----------------------------------------------------------------------*
*	
*---------------------------------------------------------------------------------------------------------*/
Static Function btFecha()

  oDlgTela:End()// Faz encerramento da aplicação, através do botão fechar da MSdialog, que contém a chamada para esta função




Return

/*---------------------------------------------------------------------------------------------------------*
*	
*---------------------------------------------------------------------------------------------------------*/
Static Function VldPesq()

Return lRet
