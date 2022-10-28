#INCLUDE 'PROTHEUS.CH'
#INCLUDE 'PARMTYPE.CH'

User Function INFMVC()

Local cMessage  := "<b>Meu Primieiro Fonte em MVC"
Local cMessage2 := '<b>Este é meu primeiro programa desenvolvido no padrão MVC '
Local cTitle    := "Alerta"

MsgAlert(cMessage, cTitle)
MsgInfo(cMessage2 , cTitle)

Return 
