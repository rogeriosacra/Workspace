#INCLUDE 'PROTHEUS.CH'
#INCLUDE 'PARMTYPE.CH'
// PROGRAMA TROCA CONTEÚDO DE DUAS VARIÁVEIS

USER FUNCTION TROCVA()

Local nA   := 10
Local nB   := 20


MsgInfo(" Variável A vale"+CValToChar(nA))

MsgInfo(" Variável B vale"+CValToChar(nB))

MsgInfo("Agora, os valores das variáveis serão trocados, observe: ")

nA = nA+nB 
nB = nA-nB
nA = nA-nB

MsgInfo(" Variável A vale"+CValToChar(nA))

MsgInfo(" Variável B vale"+CValToChar(nB))


Return
