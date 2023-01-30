#include 'protheus.ch'

User Function DECISAO()

	Local nCount    := nNumero := 0
	Local lContinua := .T.
	Local aArray1    := {0,0,0}
	Local aArray2   := {}
	Local aArray3   := Array(3,3)
	Local nPos      := 0
	Local nTamanho        := 0




	while lContinua
		nCount ++

		aArray1[1] := nCount
		aArray1[2] := nCount / 2
		aArray1[3] := nCount **2
		If nCount == 10
			lContinua := .F.
		EndIF

	endDo


	for nNumero := 1 to 10
		AADD(aArray2,{nNumero})
		Alert("valor de nNumero = "+cValtoChar(nNumero))
		IF nNumero == 7
			Alert("valor de nNumero = "+cValtoChar(nNumero)+" , saindo do laço For")
			Exit
		ENDIF
	
	next

	nTamanho := Len(aArray2)-1
	nPos:= AScan(aArray2,{| x | x[1] == 4 })
	Adel(aArray2,nPos)
	Asize(aArray2,nTamanho)







Return
