#include "protheus.ch

User Function TESTEVAR()

Local nNumero := 10.5
Local cNumero := ""
Local dData   := CtoD("01/12/2021")
Local cData :=''
Local sData :=''
Local cTexto := "AULA PRÁTICA"
Local cTexto2 := ""

cData := DToC(dData)
sData := DtoS(dData)
cNumero := cValtoChar(nNumero)
cTexto2 := SubStr(cTexto,1,5)//Ou Left(cTexto)
cTexto2 := Capital(cTexto2)
cTexto2 := Upper(cTexto2)
cTexto2 := Replace(cTexto2,"A","O")



Return



