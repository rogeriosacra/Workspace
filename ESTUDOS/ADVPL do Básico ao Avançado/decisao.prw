#include 'protheus.ch'

User Function DECISAO()

	Local nCount := nNumero := 0
	Local lContinua := .T.


	while lContinua := .T.
		For nCount = 0  to ncount =10 step 1
			Alert(nCount)
			nCount ++
			IF nCount == 10
				lContinua := .F.
			EndIF

		Next

	endDo


	for nNumero := 0 to 10
		IF nNumero == 7
			Exit
		ENDIF

	next









Return
