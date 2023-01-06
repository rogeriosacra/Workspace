/*
#INCLUDE 'PROTHEUS.CH'
#INCLUDE 'FWMVCDEF.CH'
#INCLUDE 'PARMTYPE.CH'

USER FUNCTION MVC001()

LOCAL oBrowse:= FwmBrowse():New()
      oBrowse:SetAlias("ZZB")
      oBrowse:SetDescription("Albuns")
      
      // Legendas
      oBrowse:AddLegend("ZZB->ZZB_TIPO == '1'","GREEN","CD")
      oBrowse:AddLegend("ZZB->ZZB_TIPO == '2'","RED","DVD")
      

      oBrowse:Activate()

      Return 

{Protheus.doc} MenuDef()escription)
    @type  Function
    @author Rogerio Sacramento
    @since 04/02/2022
    @version version
    @param param_name, param_type, param_descr
    @return return_var, return_type, return_description
    @example
    (examples)
    @see (links_or_references)
    
Static Function MenuDef()

    aRotina := {}

    Add Option aRotina TITLE 'Visualizar' Action 'ViewDef.Mvc001' Operation 2 Access 0
    Add Option aRotina TITLE 'Incluir'    Action 'ViewDef.Mvc001' Operation 3 Access 0
    Add Option aRotina TITLE 'Alterar'    Action 'ViewDef.Mvc001' Operation 4 Access 0

    /* 1 - Pesquisar
       2 - Visulaizar
       3 - Incluir
       4 - Alterar
       5 - Excluir
       6 - User Functio
       7 - Copiar
       
    
Return aRotina


{Protheus.doc} ModelDef
description)
    @typeunction
    @author user
    @since 04/02/2022   
    @version version
    @param param_name, param_type, param_descr
    @return return_var, return_type, return_description
    @example
    (examples)
    @see (links_or_references)

Static Function ModelDef()

Local oModel := NIL
Local oStZZB := FwformStruct(1,"ZZB")
     //Instanciando o modelo de dados
oModel := MpFormModel():New("ZZBMODELLM",,,,)
   // Atribuindo formulário para estrutura de dados oStZZB, para tal, criar o ID FORMZZB
oModel:AddFields("FORMZZB",,oStZZB)
   // Definindo a chave primaria para o modelo de dados
oModel:SetPrimaryKey({'ZZB_FILIAL','ZZB_COD'})

  //Adicionando Descrição ao modelo
oModel:SetDescription("Modelo de Dados")
oModel:GetModel("FORMZZB"):SetDescription("Formulario de cadastro")

Return oModel


Static function VIEWDEF()

Local aStruzzb := ZZB->(DbStruct())
Local oView    := Nil
Local oModel   := FwLoadModel("MVC001")//MVC001, nome do fonte, e não nome da função
local oStZZb   := FwformStruct(2,"ZZB")

oView := FWFormView():New()//Constroi modelo de dados
oView :SetModel(oModel)//Passando o modelo de dados
 oView:AddFieldS("VIEW_ZZB", oStZZB, "FORMZZB")//
oView :CreateHorizontalBox("TELA",100)//painel para armazenar os componentes na tela com ID "TELA"
oView :EnableTitleView("VIEW_ZZB",'Dados View')//Adicionando titulo ao formulário
oView :SetCloseOnOk({||.T.})//Força o fechamento da janela clicando em Ok
oView :SetOwnerView("VIEW_ZZB","TELA")//Adiciona o formulario da interface ao container

Return oView
*/

#include 'protheus.ch'
#include 'parmtype.ch'
#include 'FwMvcDef.ch'

/***	RCTI Treinamentos
****	ADVPL - Avançando com MVC
***/
user function MVC001()
	Local aArea := GetArea()
	Local oBrowse := FwMBrowse():New()
	
	oBrowse:SetAlias("ZZB")
	oBrowse:SetDescription  ("Albuns")
	
	// legendas
	oBrowse:AddLegend("ZZB->ZZB_TIPO == '1'","GREEN", "CD") //vrede
	oBrowse:AddLegend("ZZB->ZZB_TIPO == '2'","BLUE", "DVD") //azul
	
	oBrowse:Activate()
	RestArea(aArea)
return Nil

// Construção da MenuDef
Static Function MenuDef()

    Local aRotina := {}
          aRotina := FwMvcMenu("MVC001")  

    Add OPTION aRotina TITLE 'Informacao' ACTION 'U_INFMVC()'     		OPERATION 6 ACCESS 0
        
    //1-PESQ, 2-VISU, 3-INC, 4-ALT,5-EXCLU, 6 OUTRAS, 7-COP
	//Outra maneira de fazer com For/Next seria: 
    //Local aRotinaAux := FwMvcmenu()
    //Local aRotina := {}
    // For Nx := 1 to Len(aRotinaAux)
    // AADD(aRotina, aRotinaAux[Nx])
    // Next    
    
    /*Local aRotina := {}
	
		Add OPTION aRotina TITLE 'Visualizar' ACTION 'VIEWDEF.MVC001'  		OPERATION 2 ACCESS 0
		Add OPTION aRotina TITLE 'Incluir'    ACTION 'VIEWDEF.MVC001'  		OPERATION 3 ACCESS 0
		Add OPTION aRotina TITLE 'Alterar'    ACTION 'VIEWDEF.MVC001' 		OPERATION 4 ACCESS 0
		Add OPTION aRotina TITLE 'Excluir' 	  ACTION 'VIEWDEF.MVC001'     	OPERATION 5 ACCESS 0
		Add OPTION aRotina TITLE 'Informacao' ACTION 'U_INFMVC()'     		OPERATION 6 ACCESS 0*/
/*
1- pesquisar
2- visualizar
3- incluir
4- alterar
5- excluir
7- copiar
*/

Return aRotina
// Criando a Model DEF, nela é definido o modelo de dados, regras de negocio.

Static Function ModelDef()
	Local oModel := Nil
	Local oStZZB := FWFormStruct(1,"ZZB") //1-criar estrutura
	
	//Instanciando o modelo de dados
	oModel := MPFormModel():New("ZMODELLM", , , ,)
	//Atribuindo formulario para o modelo de dados.
	oModel:AddFields("FORMZZB",,oStZZB)
	//chave primaria da rotina
	oModel:SetPrimaryKey({'ZZB_FILIAL','ZZB_COD'})
	
	// Adicionando descricao ao modelo de dados.
	oModel:SetDescription("Modelo de dados")
	
	oModel:GetModel("FORMZZB"):SetDescription("Formulário de cadastro")
	
Return oModel

//ViewDEf
Static Function ViewDef()
	local oView := Nil
	Local oModel := FWLoadModel("MVC001")// PODERIA SER CARREGADO UM MODELO DE DADOS DE OUTRO FONTE ALÉM DO "MVC001"
	Local oStZZB := FwFormStruct(2,"ZZB")

    oStzzB:RemoveField("ZZB_USER")
	
	oView := FWFormView():New() //construindo o modelo de dados
	
	oView:SetModel(oModel) //Passando o modelo de dados informado
	
	oView:AddField("VIEW_ZZB", oStZZB, "FORMZZB")
	
	oView:CreateHorizontalBox("TELA",100) //Criando um container com o identificador TELA
	
	oView:EnableTitleView("VIEW_ZZB",'Dados View') //Adicionando titulo ao formulário
	
	oView:SetCloseOnOk({||.T.}) //força o fechamento da janela
	
	oView:SetOwnerView("VIEW_ZZB","TELA") //adicionando o formulário da inerface ao container
	
//retornando o objeto view
Return oView
