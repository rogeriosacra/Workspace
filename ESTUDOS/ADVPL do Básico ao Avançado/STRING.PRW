#include "protheus.ch

User Function TESTEVAR()

Local nNumero := 10.5
Local cNumero := ""
Local dData   := CtoD("01/12/2021")
Local cData :=''
Local sData :=''
Local cTexto := "AULA PRÁTICA"
Local cTexto2 := ""
Local nTotal := Abs(100-900)
Local nNumero1 
Local nNumero2
//Local nNumero1 := 100-35.7

cData := DToC(dData)
sData := DtoS(dData)
cNumero := cValtoChar(nNumero)
cTexto2 := SubStr(cTexto,1,5)//Ou Left(cTexto)
cTexto2 := Capital(cTexto2)
cTexto2 := Upper(cTexto2)
cTexto2 := Replace(cTexto2,"A","O")
nNumero1 := 100-35.7
nNumero1 := Int(nNumero1)
nNumero2 := 333-54.978
NOROUND( nNumero2,1 )
ROUND( nNumero2,1 )
VALTYPE(nNumero1)
VALTYPE(dData)
Type("nNUmero2")
Alert("Valor de nTotal é: "+CValToChar(nTotal))



Return



