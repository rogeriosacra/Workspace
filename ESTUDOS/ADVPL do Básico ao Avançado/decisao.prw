#include 'protheus.ch'

User Function DECISAO()

	Local nCount := nNumero := 0
	Local lContinua := .T.


	while lContinua 
		For nCount := 0  to  10 
			Alert("valor de nCount = "+cValtoChar(nCount))			
			IF nCount == 10
				lContinua := .F.
			EndIF

		Next

	endDo


	for nNumero := 0 to 10
        Alert("valor de nNumero = "+cValtoChar(nNumero))
		IF nNumero == 7
			Exit
		ENDIF

	next









Return
