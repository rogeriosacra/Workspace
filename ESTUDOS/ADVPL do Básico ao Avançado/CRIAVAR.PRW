
//Bibliotecas
#Include "Protheus.ch"
#Include "TOTVS.ch"
#Include "PARMTYPE.ch"

 
/*/{Protheus.doc} zTeste
Fun��o de Teste
@type function
@author Terminal de Informa��o
@since 13/11/2016
@version 1.0
    @example
    u_zTeste()
/*/
  
User Function zTeste()
    Local aArea   := GetArea()
    Local cCodPed := ""

    dbSelectArea("SC5")
     
    //Chamando a cria��o da vari�vel C5_NUM
    cCodPed := CriaVar("C5_NUM")
     
    //Mostrando a vari�vel criada pelo CriaVar
    MsgInfo("cCodPed: "+cCodPed, "Aten��o")
         
    RestArea(aArea)
Return
