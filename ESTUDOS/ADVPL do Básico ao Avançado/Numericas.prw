#include 'Protheus.ch'

User Function NUMERICAS()

	Local nNumero := 13
	Local nResultado := 0
	Local cTexto := "O tipo da variável confere"
    Local cTexto2 := "O tipo da variável não confere"
	Local aArray := {}


	nNumero := 13/2
	nResultado := nNumero
	Round(nResultado,2)

    Alert("Valor de nResultado = "+cValtochar(nResultado))

	If Valtype(nNUmero) == "N"
		MsgInfo(ctexto)
	else
        MsgAlert(cTexto2)  
	EndIF

    If Valtype(cTexto) == "C"
		MsgInfo(ctexto)
	else
        MsgAlert(cTexto2)  
	EndIF

       If Valtype(aArray) == "A"
		MsgInfo(ctexto)
	else
        MsgAlert(cTexto2)  
	EndIF

        If Valtype(nResultado) == "N"
		MsgInfo(ctexto)
	else
        MsgAlert(cTexto2)  
	EndIF


Return
