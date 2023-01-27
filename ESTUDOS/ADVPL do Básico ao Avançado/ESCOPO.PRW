#INCLUDE "protheus.ch"

//atividade escopo de variáveis

Static cTexto := "ESTATICA"

User Function Principal()
	Local nNumero := 10
	Private dData := Date()

	MSgInfo("Verificando se nNumero >= 10.5")

	If nNumero >= 10.5
	Alert("OK, maior que 10.5 = "+CValToChar(nNumero))
	Else 
	Alert("OK, Menor que 10.5 = "+CValToChar(nNumero))
	Endif

    //Filha()
    
RETURN


Static Function Filha()
	Local nNumero := 20
	Private lContinua := .T.
	Public aDados := {1,3,7}

	cTexto += " NOVAMENTE"+Space(10)
	dData := dData + nNumero
	dData += nNumero

	MSgInfo("Verificando se !lContinua é falsa...")

	If !lContinua
		Alert("OK, lContinua é falsa!")
	else
		Alert("OK, lContinua é verdadeia!")	
	EndIF


    U_Secundaria()

RETURN


Static Function Secundaria()
	Local nNumero := 30
	
	aDados := {0,0,0}
	nResto := nNumero % 4
	cTexto := cTexto - " SEM ESPACO"

	If "ATEU" $ cTexto
		Alert("Ateu contido!")
	else
		Alert("Ateu não Contido!")	
	ENDIF

	U_TestaText()


RETURN

Static Function TestaText()

Local cEst := ""

cEst := FwInputBox("Escolha um estado: SP ou RJ", "")

IF cEst $ "RJ|SP"
   MsgInfo("Estado escolhido: "+cEst+"- válido!")
else
   MsgInfo("Estado escolhido: "+cEst+"- inválido!")       
EndIF


Return

