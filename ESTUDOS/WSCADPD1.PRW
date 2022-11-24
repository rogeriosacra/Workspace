#INCLUDE"APWEBSRV.CH"
#INCLUDE"PROTHEUS.CH"
#INCLUDE"FWMVCDEF.CH"

//{PROTHEUS.DOC} WSCADPD1

//RdMake Web Service  SOAP para verificar se  produto existe ou não

//Definição das estruturas utilizadas.É de extrema importância fixar este modelo básico de estrutura do webservice
//A partir deste modelo é possível efetuar várias implementações 

WSSTRUCT  StructProduto // Definição da estrutura de retorno que será usada na montagem do objeto de retorno
    WSDATA cRETORNO AS String
    WSDATA cSTATUS  AS String
    WSDATA cCODIGO  AS String
    WSDATA cDESC    AS String Optional //Optional Indica que o retorno desta string não é obrigatório
 
ENDWSSTRUCT

WSSTRUCT StrSendProduto // Definição da estrutura de envio que será usada na montagem do objeto de envio
    WSDATA _cEmpresa AS String
    WSDATA _cFilial  AS String
    WSDATA _cCod     AS String
ENDWSSTRUCT

//Definição do WebService do envio de Mensagem
//Abaixo, na linha 28, temos a estrutura do produto que será retornada, e na 29, a estrutura que do envio que será feito ao webservice 
WSSERVICE WSCADPD1 DESCRIPTION "Produtos"//NOME DO WEBSERVICE=NOME DO FONTE, adicionando descrição
    WSDATA StrProduto  AS StructProduto // aqui, a estrutura criada na linha 11, estão sendo atribuida ao objeto StrProduto
    WSDATA StrSendProd AS StrSendProduto //aqui cria o objeto StrSendProd usando a estrutura StrSendProduto (linha 19) e toda sua estrutura
    WSMETHOD CAD1_PRODUTO DESCRIPTION "Método de Cadastro e Atualização de Produtos" //Tudo será executado através do método CAD1_PRODUTO
ENDWSSERVICE   

//Método
WSMETHOD CAD1_PRODUTO WSRECEIVE StrSendProd WSSEND StrProduto WSSERVICE WSCADPD1//Método CAD1_PRODUTO recebe StrSendProduto e retorna StrProduto
//Ainda sobre a linha 35, WSCADPD1 é o mesmo nome do arquivo .prw; o método CAD1_PRODUTO é o mesmo mencionado na linha 31
Local cCodProd //Declaração de variável que será usada no processo

//Prepara ambiente a ser processado
RpcSetEnv(::StrSendProd:_cEmpresa,::StrSendProd:_cFilial,,,"FAT",)//"FAT"-> ambiente a ser usadao. StrSendProd e StrSendProd mencionados nas linhas 29 e 30   O comando RpcSetEnv() é utilizado para abertura de ambiente em rotinas automáticas, permitindo definir a empresa e filial no qual desejamos fazer a inicialização do ambiente
//Validar código do produto, o mesmo é obrigatório
cCodProd := ::StrSendProd:cCod //Pega cCod da estrutura StrSendProd e atribui à variável cCodProd
IF Empty(cCodProd) .or. Alltrim(cCodProd) == '?' //Verifica se o código do produto está vazio ou se contém "?", e se for verdadeiro efetua so retornos abaixo
    //Há duas formas de utilizar um objeto: usando "::StrProduto" ou self:StrProduto 
    ::StrProduto:cRetorno := "É obrigatório informar o código do produto !" //Mensagem retornada Através da estrutra StrProduto/variável cRetorno
    ::StrProduto:cStatus  := "0"// Status retornado através da estrutura de retorno StrProduto/variável cStatus
    ::StrProduto:cCodigo  := cCodProd// Código do produto retornado através da estrutura de retorno StrProduto/variável cCodProd
Else
    DbSelectArea("SB1")//Abro o cadasro de produto
    SB1->(DbSetOrder(1))//Posiciona na ordem 1
    //Pesquisa se o produto existe
    IF  (DbSeek(xFilial("SB1")+cCodProd)) //Faz busca pela filial corrente e código do produto informado  
    ::StrProduto:cRetorno := "Produto localizado com sucesso!"//retorna mensagem de sucesso na localização do produto
    ::StrProduto:cStatus  := "1"//Atribui e retorna status "1" 
    ::StrProduto:cCodigo  := SB1->B1_COD // Pega código do produto do campo B1_COD atribui à variável/estrutura de retorno
    ::StrProduto:cDesc    := SB1->B1_DESC //Pega descrição do produto do campo B1_DESC atribui à variável/estrutura de retorno
    ELSE
    ::StrProduto:cRetorno := "Produto não localizado"//Caso não seja localizado o produto: retorna mensagem 
    ::StrProduto:cStatus  := "0"//retorna status "0"
    ::StrProduto:cCodigo  := "Não localizado"//retorna string com a mensagem de não localizado
    EndIf
ENDIF
Return .T.    


//Após compilar o webservice, ele aparecerá na lista de serviços ativos do portal do ws 
           





