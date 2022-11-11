#INCLUDE "APWEBSRV.CH"
#INCLUDE "PROTHEUS.CH"

/*
{PROTHEUS.DOC} WSCADPD1
RDMAKE Web Service que verifica se o produto existe ou não
@Autor: Rogério Sacramento
@Data: 11.11.2022
@Versão: 1
@Projeto: Curso Ws IV2
*/
--------------------------------------------------------------------------------
//Definição das estruturas utilizadas
WSSTRUCT StructProduto
    WSDATA cRetorno As String
    WSDATA cStatus  As String
    WSDATA cCodigo  As String
ENDWSSTRUCT

WSSTRUCT StrSendProduto 
    WSDATA _cEmpresa As String
    WSDATA _cFilial  As String
    WSDATA cCod      As String
ENDWSSTRUCT

//Definição do Web Service de envio de mensagem
WSSERVICE WSCADPD1 DESCRIPTION "Produtos" 
    WSDATA StrProduto  As StructProduto
    WSDATA StrSendProd As StrSendProduto
    WSMETHOD CAD1_PRODUTO DESCRIPTION "Método de Cadastro e Atualização de Produtos" 
ENDWSSERVICE

//Método
WSMETHOD CAD1_PRODUTO WSRECEIVE StrSendProd WSSEND StrProduto WSSERVICE WSCADPD1
Local cCodProd
//Prepara o ambiente a ser processado
RpcSetEnv(::StrSendProd:_cEmpresa,::StrSendProd:_cFilial,,,"FAT",)
//Validar código de produto, processo obrigatório
cCodProd := ::StrSendProd:cCod
If Empty(cCodProd) .Or. AllTrim(cCodProd) == "?"
    ::StrSendProd:cRetorno := "O Código de Produto não foi informado. "
    ::StrSendProd:cStatus  := "0"
    ::StrSendProd:cCodigo  := cCodProd 
Else
    DbSelectArea("SB1")
    SB1->(DbSetOrder(1))  
    //Pesquisa se o produto existe      
