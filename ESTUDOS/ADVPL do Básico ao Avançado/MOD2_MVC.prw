//Bibliotecas
#Include 'Protheus.ch'
#Include 'FWMVCDef.ch'
  
//Vari�veis Est�ticas
Static cTitulo := "Cadastro de Usuarios x Rotinas"
  
/*/{Protheus.doc} MOD2_MVC
Fun��o para cadastros de Usuarios x Rotinas
@author Paulo Bindo
@since 13/09/2021
@version 1.0
/*/
 
User Function MOD2_MVC()
    Local aArea   := GetArea()
    Local oBrowse
      
    //Cria um browse para a SZB
    oBrowse := FWMBrowse():New()
    oBrowse:SetAlias("SZB")
    oBrowse:SetDescription(cTitulo)
    oBrowse:Activate()
      
    RestArea(aArea)
Return Nil
 


/*/{Protheus.doc} MenuDef
menu
@author Paulo Bindo
@since 13/09/2021
@version 1.0
/*/
Static Function MenuDef()
    Local aRotina := {}
      
    //Adicionando op��es
    ADD OPTION aRotina TITLE 'Visualizar' ACTION 'VIEWDEF.MOD2_MVC' OPERATION MODEL_OPERATION_VIEW   ACCESS 0 //OPERATION 1
    ADD OPTION aRotina TITLE 'Incluir'    ACTION 'VIEWDEF.MOD2_MVC' OPERATION MODEL_OPERATION_INSERT ACCESS 0 //OPERATION 3
    ADD OPTION aRotina TITLE 'Alterar'    ACTION 'VIEWDEF.MOD2_MVC' OPERATION MODEL_OPERATION_UPDATE ACCESS 0 //OPERATION 4
    ADD OPTION aRotina TITLE 'Excluir'    ACTION 'VIEWDEF.MOD2_MVC' OPERATION MODEL_OPERATION_DELETE ACCESS 0 //OPERATION 5
    ADD OPTION aRotina TITLE 'Copiar'     ACTION 'VIEWDEF.MOD2_MVC' OPERATION 9 ACCESS 0
Return aRotina
 
/*/{Protheus.doc} model

@author Paulo Bindo
@since 13/09/2021
@version 1.0
/*/

Static Function ModelDef()
    //Na montagem da estrutura do Modelo de dados, o cabe�alho filtrar� e exibir� somente 2 campos, j� a grid ir� carregar a estrutura inteira conforme fun��o fModStruct
    Local oModel      := NIL
    Local oStruCab     := FWFormStruct(1, 'SZB', {|cCampo| AllTRim(cCampo) $ "ZB_CODUSU;ZB_NOMEUSU;"})
    Local oStruGrid := fModStruct()
 
    //Monta o modelo de dados, e na P�s Valida��o, informa a fun��o fValidGrid
    oModel := MPFormModel():New('MOD2MVCM', /*bPreValidacao*/, {|oModel| fValidGrid(oModel)}, /*bCommit*/, /*bCancel*/ )
 
    //Agora, define no modelo de dados, que ter� um Cabe�alho e uma Grid apontando para estruturas acima
    oModel:AddFields('MdFieldSZB', NIL, oStruCab)
    oModel:AddGrid('MdGridSZB', 'MdFieldSZB', oStruGrid, , )
 
    //Monta o relacionamento entre Grid e Cabe�alho, as express�es da Esquerda representam o campo da Grid e da direita do Cabe�alho
    oModel:SetRelation('MdGridSZB', {;
            {'ZB_FILIAL', 'xFilial("SZB")'},;
            {"ZB_CODUSU",  "ZB_CODUSU"};
            }, SZB->(IndexKey(1)))
     
    //Definindo outras informa��es do Modelo e da Grid
    oModel:GetModel("MdGridSZB"):SetMaxLine(9999)
    oModel:SetDescription(cTitulo)
    oModel:SetPrimaryKey({"ZB_FILIAL", "ZB_CODUSU", "ZB_FUNCAO"})
 
Return oModel
 

/*/{Protheus.doc} viewdef
menu
@author Paulo Bindo
@since 13/09/2021
@version 1.0
/*/
Static Function ViewDef()
    //Na montagem da estrutura da visualiza��o de dados, vamos chamar o modelo criado anteriormente, no cabe�alho vamos mostrar somente 2 campos, e na grid vamos carregar conforme a fun��o fViewStruct
    Local oView        := NIL
    Local oModel    := FWLoadModel('MOD2_MVC')
    Local oStruCab  := FWFormStruct(2, "SZB", {|cCampo| AllTRim(cCampo) $ "ZB_CODUSU;ZB_NOMEUSU;"})
    Local oStruGRID := fViewStruct()
 
    //Define que no cabe�alho n�o ter� separa��o de abas (SXA)
    oStruCab:SetNoFolder()
 
    //Cria o View
    oView:= FWFormView():New() 
    oView:SetModel(oModel)              
 
    //Cria uma �rea de Field vinculando a estrutura do cabe�alho com MDFieldSZB, e uma Grid vinculando com MdGridSZB
    oView:AddField('VIEW_SZB', oStruCab, 'MdFieldSZB')
    oView:AddGrid ('GRID_SZB', oStruGRID, 'MdGridSZB' )
 
    //O cabe�alho (MAIN) ter� 25% de tamanho, e o restante de 75% ir� para a GRID
    oView:CreateHorizontalBox("MAIN", 25)
    oView:CreateHorizontalBox("GRID", 75)
 
    //Vincula o MAIN com a VIEW_SZB e a GRID com a GRID_SZB
    oView:SetOwnerView('VIEW_SZB', 'MAIN')
    oView:SetOwnerView('GRID_SZB', 'GRID')
    oView:EnableControlBar(.T.)
 
    //Define o campo incremental da grid como o SZB_ITEM
    oView:AddIncrementField('GRID_SZB', 'ZB_ITEM')
Return oView
 
 /*/{Protheus.doc} fModStruct
Fun��o chamada para montar o modelo de dados da Grid
@author Paulo Bindo
@since 13/09/2021
@version 1.0
/*/

Static Function fModStruct()
    Local oStruct
    oStruct := FWFormStruct(1, 'SZB', {|cCampo| !AllTRim(cCampo) $ "ZB_CODUSU;ZB_NOMEUSU;"})
Return oStruct
 

  /*/{Protheus.doc} fViewStruct
Fun��o chamada para montar a visualiza��o de dados da Grid
@author Paulo Bindo
@since 13/09/2021
@version 1.0
/*/

Static Function fViewStruct()
    Local cCampoCom := "ZB_CODUSU;ZB_NOMEUSU;"
    Local oStruct
 
    //Ir� filtrar, e trazer todos os campos, menos os que tiverem na vari�vel cCampoCom
    oStruct := FWFormStruct(2, "SZB", {|cCampo| !(Alltrim(cCampo) $ cCampoCom)})
Return oStruct
 

/*/{Protheus.doc} fValidGrid
Fun��o que faz a valida��o da grid
@author Paulo Bindo
@since 13/09/2021
@version 1.0
/*/

Static Function fValidGrid(oModel)
    Local lRet     := .T.
    Local nDeletados := 0
    Local nLinAtual :=0
    Local oModelGRID := oModel:GetModel('MdGridSZB')
    //Local oModelMain := oModel:GetModel('MdFieldSZB')
    //Local nValorMain := oModelMain:GetValue("ZB_VALOR")
    //Local nValorGrid := 0
    //Local cPictVlr   := PesqPict('SZB', 'ZB_VALOR')
 
    //Percorrendo todos os itens da grid
    For nLinAtual := 1 To oModelGRID:Length() 
        //Posiciona na linha
        oModelGRID:GoLine(nLinAtual) 
         
        //Se a linha for excluida, incrementa a vari�vel de deletados, sen�o ir� incrementar o valor digitado em um campo na grid
        If oModelGRID:IsDeleted()
            nDeletados++
        Else
//            nValorGrid += NoRound(oModelGRID:GetValue("SZB_TCOMB"), 4)
        EndIf
    Next nLinAtual
 
    //Se o tamanho da Grid for igual ao n�mero de itens deletados, acusa uma falha
    If oModelGRID:Length()==nDeletados
        lRet :=.F.
        Help( , , 'Dados Inv�lidos' , , 'A grid precisa ter pelo menos 1 linha sem ser excluida!', 1, 0, , , , , , {"Inclua uma linha v�lida!"})
    EndIf
 /*
    If lRet
        //Se o valor digitado no cabe�alho (valor da NF), n�o bater com o valor de todos os abastecimentos digitados (valor dos itens da Grid), ir� mostrar uma mensagem alertando, por�m ir� permitir salvar (do contr�rio, seria necess�rio alterar lRet para falso)
        If nValorMain != nValorGrid
            //lRet := .F.
            MsgAlert("O valor do cabe�alho (" + Alltrim(Transform(nValorMain, cPictVlr)) + ") tem que ser igual o valor dos itens (" + Alltrim(Transform(nValorGrid, cPictVlr)) + ")!", "Aten��o")
        EndIf
    EndIf
 */
Return lRet
