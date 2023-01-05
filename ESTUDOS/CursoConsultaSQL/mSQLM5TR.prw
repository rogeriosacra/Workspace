#include 'protheus.ch'
#include 'parmtype.ch'
#include 'topconn.ch'

#DEFINE STR_PULA Chr(13)+Chr(10)

/*/{Protheus.doc} mSQLM5TR
Função para consulta genérica - cria tela de exibição com pesquisa. Permite copiar células e exportar os dados para arquivo .xml
@author Maicon Macedo
@since 27 jan. 2020
@version 1.0
/*/

User Function mSQLM5TR(cQryZZS,cQryCnd)//cQryZZS,cQryCnd variáveis passadas por parametro 
	Local cAlias				:= GetNextAlias()// Gera o proximo alias disponível automaticamente
	//Default
	Default cQryZZS		:= ""
	Default cQryCnd		:= ""
	//Private
	Private cConsulta	:= cQryZZS
	Private cCondicao	:= cQryCnd
	Private cQuery			:= ""
	Private cPsqusa		:= ""
	Private cGrpOd		:= ""
	
	BeginSQL Alias cAlias //Alias obtido automaticamente na linha 15
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

Static Function MnTTela()

Return

/*---------------------------------------------------------------------------------------------------------*
*	MnTEstr - Montagem da tela de dados
*---------------------------------------------------------------------------------------------------------*/
Static Function MnTEstr()

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

Return

/*---------------------------------------------------------------------------------------------------------*
*	
*---------------------------------------------------------------------------------------------------------*/
Static Function btFecha()

Return

/*---------------------------------------------------------------------------------------------------------*
*	
*---------------------------------------------------------------------------------------------------------*/
Static Function VldPesq()

Return lRet
