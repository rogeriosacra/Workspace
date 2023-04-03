
//Bibliotecas
#Include "Protheus.ch"
#Include "TOTVS.ch"
#Include "PARMTYPE.ch"

 
/*/{Protheus.doc} zTeste
Função de Teste
@type function
@author Terminal de Informação
@since 13/11/2016
@version 1.0
    @example
    u_zTeste()
/*/
  
User Function zTeste()
    Local aArea   := GetArea()
    Local cCodPed := ""

    dbSelectArea("SC5")
     
    //Chamando a criação da variável C5_NUM
    cCodPed := CriaVar("C5_NUM")
     
    //Mostrando a variável criada pelo CriaVar
    MsgInfo("cCodPed: "+cCodPed, "Atenção")
         
    RestArea(aArea)
Return
