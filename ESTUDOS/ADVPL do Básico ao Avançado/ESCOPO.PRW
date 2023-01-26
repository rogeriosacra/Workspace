#INCLUDE "protheus.ch"

//atividade escopo de variáveis

Static cTexto := "ESTATICA"

User Function Principal()
	Local nNumero := 10
	Private dData := Date()

    Filha()

RETURN


Static Function Filha()
	Local nNumero := 20
	Private lContinua := .T.
	Public aDados := {1,3,7}

	cTexto += " NOVAMENTE"+Space(10)
	dData := dData + nNumero
	dData += nNumero


    U_Secundaria()

RETURN


User Function Secundaria()
	Local nNumero := 30
	
	aDados := {0,0,0}
	nResto := nNumero % 4
	cTexto := cTexto - " SEM ESPACO"

RETURN

