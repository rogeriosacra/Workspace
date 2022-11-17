#INCLUDE"APWEBSRV.CH"
#INCLUDE"PROTHEUS.CH"
#INCLUDE"FWMVCDEF.CH"

//{PROTHEUS.DOC} WSCADPD1

//RdMake Web Service  SOAP para verificar se  produto existe ou não

//Definição das estruturas utilizadas 

WSSTRUCT  StructProduto 
    WSDATA cRETORNO AS String
    WSDATA cSTATUS  AS String
    WSDATA cCODIGO  AS String
    WSDATA cDESC    AS String Optional

ENDWSSTRUCT

WSSTRUCT StrSendProdut
    WSDATA _cEmpresa AS String
    WSDATA _cFilial  AS String
    WSDATA _cCod     AS String
ENDWSSTRUCT

//Definição do WebService do envio de Mensagem

WSSERVICE WSCADPD1 DESCRIPTION "Produtos"//NOME DO WEBSERVICE=NOME DO FONTE
    WSDATA StrProduto  AS StructProduto 
    WSDATA StrSendProd AS StrSendProduto
    WSMETHOD CAD1_PRODUTO DESCRIPTION "Método de Cadastro de Atualização de Produtos"
ENDWSSERVICE   

//Método
WSMETHOD CAD1_PRODUTO WSRECEIVE StrSendProduto WSSEND StrProduto WSSERVICE WSCADPD1
Local cCodProd

//Prepara ambiente a ser processado
RpcSetEnv(::StrSendProd:_cEmpresa;::StrSendProd:_cFilial,,,"FAT",)//O comando RpcSetEnv() é utilizado para abertura de ambiente em rotinas automáticas, permitindo definir a empresa e filial no qual desejamos fazer a inicialização do ambiente
//Validar código do produto, o mesmo é obrigatório
cCodProd := ::StrSendProd:cCod
IF Empty(cCodProd) .or. Alltrim(cCodProd) == '?'
    ::StrProduto:cRetorno := "É obrigatório informar o código do produto !"
    ::StrProduto:cStatus  := "0"
    ::StrProduto:cCodigo  := cCodProd
Else
    DbSelectArea("SB1")
    SB1->DbSetOrder(1)
    //Pesquisa se o produto existe
    IF  (DbSeek(xFilial("SB1")+cCodProd))   
    ::StrProduto:cRetorno := "Produto localizado com sucesso!"
    ::StrProduto:cStatus  := "1"
    ::StrProduto:cCodigo  := SB1->B1_COD 
    ::StrProduto:cDesc    := SB1->B1_DESC 
    ELSE
    ::StrProduto:cRetorno := "Produto não localizado"
    ::StrProduto:cStatus  := "0"
    ::StrProduto:cCodigo  := "Não localizado"
    EndIf
ENDIF
Return .T.    

           





