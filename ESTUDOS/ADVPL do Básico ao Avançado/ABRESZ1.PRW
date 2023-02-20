// #########################################################################################
// Projeto:
// Modulo :
// Fonte  : ABRESZ1.prw
// -----------+-------------------+---------------------------------------------------------
// Data       | Autor             | Descricao
// -----------+-------------------+---------------------------------------------------------
// 21/06/2019 | paulo.bindo       | Gerado com auxílio do Assistente de Código do TDS.
// -----------+-------------------+---------------------------------------------------------
#INCLUDE 'Protheus.ch'
#INCLUDE 'TbiConn.ch'
#INCLUDE 'TbiCode.ch'
#INCLUDE 'Totvs.ch'
#include "protheus.ch"
#include "vkey.ch"
#include "Rwmake.ch"
#INCLUDE "JPEG.ch"
#include "msmgadd.ch"
//------------------------------------------------------------------------------------------
/*/{Protheus.doc} ABRESZ1
Manutenção de dados em SB1-Descricao Generica do Produto.

@author    paulo.bindo
@version   11.3.10.201812061821
@since     21/06/2019
/*/

User Function ABRESZ1()

	Private cCadastro := "Cadastro UM Cliente"

	Private aRotina := { {"Pesquisar","AxPesqui",0,1} ,;
	{"Visualizar","AxVisual",0,2} ,;
	{"Alterar","AxAltera",0,4} ,;
	{"Incluir","AxInclui",0,3} ,;
	{"Excluir","AxDeleta",0,5}}

	Private cDelFunc := ".T." // Validacao para a exclusao. Pode-se utilizar ExecBlock

	Private cString := "SZ1"
	Private cCondicao	:= ""
	Private aIndSB1		:= {}
    Private cCampo
    Private aCampos := {}

	dbSelectArea("SZ1")
	dbSetOrder(1)

	
     //Abre o browse


	//ASort(aCampos,,,{|x,y|x[1]<y[1]})
	//Abre tabela SZ1

	dbSelectArea(cString)
	mBrowse( 6,1,22,75,cString,aCampos,cCampo)

	/*RpcSetType(3)

	PREPARE ENVIRONMENT EMPRESA "99" FILIAL "01" MODULO "FAT"

    Ffilha()

	RESET ENVIRONMENT*/
Return

//Função Filha para Explicar StatIc Function


/*User Function Ffilha()

Local aCampos := {}
Local aTitulos := {}
Local Nx := 0



AADD(aCampoS,"C5_FILIAL")
AADD(aCampoS,"C5_NUM") */



/*SX3->(DbSetOrder(2))
For Nx:= 1 To Len(aCampos)
Sx3->(DbSeek(aCampos,[nx]))
AADD(aTitulos,Alltrim(SX3->X3_TITULO))
Next nx

//O trecho acima pode ser reescrito da forma abaixo e teremos os mesmo resultados 

aTitulos := {}
SX3->(DbGoTop())
aEval(aCampos,{|X|SX3->(DbSeek(X)),AADD(aTitulos,Alltrim(SX3->X3_TITULO))})

Return




