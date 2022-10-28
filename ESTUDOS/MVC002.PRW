#include 'protheus.ch'
#include 'parmtype.ch'
#include 'FwMvcDef.ch'

/*/{Protheus.doc} MVC002
//TODO Tela de cadastro em MVC com duas entidades
@author Rcti treinamentos
@version 1.0
@see www.rctitreinamentos.com.br

@type function
/*/
user function MVC002()
	Local aArea := GetArea()
	Local oBrowse := FwMBrowse():New()
	
	oBrowse:SetAlias("ZZB")
	oBrowse:SetDescription  ("Albuns")
	
	// definindo as legendas
	oBrowse:AddLegend("ZZB->ZZB_TIPO == '1'","GREEN", "CD") //vrede
	oBrowse:AddLegend("ZZB->ZZB_TIPO == '2'","BLUE", "DVD") //azul
	//ativa o browse
	oBrowse:Activate()
	RestArea(aArea)
		
return Nil

Static Function MenuDef()

	Local aRotina := FwMvcMenu("MVC002")

Return aRotina

Static Function ModelDef()
	Local oModel := MPFormModel():New("XMVC003",,,,)
	Local oStPai := FWFormStruct(1,"ZZB")
	Local oStFilho := FWFormStruct(1,"ZZA")
	
	oModel:AddFields("ZZBMASTER",,oStPai)
	oModel:AddGrid('ZZADETAIL','ZZBMASTER',oStFilho,,,,,)
	
	oModel:SetRelation('ZZADETAIL',{{'ZZA_FILIAL','xFilial("ZZA")'},{'ZZA_CODALB','ZZB_COD'}},ZZA->(IndexKey(1)))
	
		oModel:SetPrimaryKey({"ZZA_FILIAL",""})
		
	oModel:SetDescription("Modelo 3")
	oModel:GetModel('ZZBMASTER'):SetDescription('Modelo albuns')
	oModel:GetModel('ZZADETAIL'):SetDescription('Modelo musicas')

Return oModel

Static Function ViewDef()
	local oView := Nil
	Local oModel := FWLoadModel("MVC002")
	Local oStPai := FwFormStruct(2,"ZZB")
	Local oStFilho := FwFormStruct(2,"ZZA")
	
	oView := FWFormView():New()
	oView:SetModel(oModel) 
	
	oView:AddField('VIEW_ZZB',oStPai,'ZZBMASTER')
	oView:AddGrid('VIEW_ZZA',oStFilho,'ZZADETAIL')
	
	oView:CreateHorizontalBox('CABEC',40)
	oView:CreateHorizontalBox('GRID',60)
	
	oView:SetOwnerView('VIEW_ZZB','CABEC')
	oView:SetOwnerView('VIEW_ZZA','GRID')
	
	oView:EnableTitleView("VIEW_ZZB",'Cabeçalho')
	oView:EnableTitleView("VIEW_ZZA",'Grid')


Return oView





/*#include 'protheus.ch'
#include 'parmtype.ch'
#include 'FwMvcDef.ch'

/***	RCTI Treinamentos
****	ADVPL - Avançando com MVC
***/
/*user function MVC002()
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
/*Static Function MenuDef()

    Local aRotina := {}
          aRotina := FwMvcMenu("MVC002")  

          Add OPTION aRotina TITLE 'Informacao' ACTION 'U_INFMVC()'	OPERATION 6 ACCESS 0

          Return aRotina
// Criando a Model DEF
/*
Static Function ModelDef()
	Local oModel := MPFORMMODEL():New("XMVC003",,,,)
	Local oStPai := FwFormStruct(1,"ZZB")
    Local oStFilho := FwFormStruct(1,"ZZA")

    oModel:AddFields("ZZBMASTER",,oStPai)
    oModel:AddGrid("ZZADETAIL","ZZBMASTER",oStFilho,,,,,)
    oModel:SetRelation("ZZADETAIL",{{'ZZA_FILIAL','xFilial("ZZA")'},{"ZZA_CODALB",'ZZB_COD'} },ZZA->(IndexKey(1) ))
    oModel:SetPrimaryKey({'ZZA_FILIAL','ZZA_COD'})
		// Adicionando descricao ao modelo de dados.
/*	oModel:SetDescription("<b>Modelo 3 ")
    oModel:GetModel("ZZBMASTER"):SetDescription("Cabeçalho Tabela ZZB")
    oModel:GetModel("ZZADETAIL"):SetDescription("Grid Tabela ZZA")


	Return oModel

//ViewDEf
/*Static Function ViewDef()
	local oView := Nil
	Local oModel := FWLoadModel("MVC002")
	Local oStPai := FwFormStruct(2,"ZZB")
    Local oStFilho := FwFormStruct(2,"ZZA")

    //oStzzB:RemoveField("ZZB_USER")
	
/*	oView := FWFormView():New() //construindo o modelo de dados
	
	oView:SetModel(oModel) //Passando o modelo de dados informado
	
	oView:AddField("VIEW_ZZB", oStPai, "ZZBMASTER")
    oView:AddField("VIEW_ZZA", oStFilho, "ZZADETAIL")
	
	oView:CreateHorizontalBox("CABEÇALHO",40) //Criando um container com o identificador TELA
    oView:CreateHorizontalBox("GRID",60)

    oView:SetOwnerView("VIEW_ZZB","CABEÇALHO") //adicionando o formulário da inerface ao container
    oView:SetOwnerView("VIEW_ZZA","GRID") 
	
	
	oView:EnableTitleView("VIEW_ZZB",'CABECALHO') //Adicionando titulo ao formulário
    oView:EnableTitleView("VIEW_ZZA",'GRIDD')
	
	oView:SetCloseOnOk({||.T.}) //força o fechamento da janela
	

//retornando o objeto view
//Return oView
