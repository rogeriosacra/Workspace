#Include 'Protheus.ch'
#include "rwmake.ch"
#include "TbiConn.ch"
#include "TbiCode.ch"


User Function Blocos()

	Local nItem := 450
	Local nResultado := 0
    Local nResultado2 := 0
	Local bBloco1 := {||}
	Local E, Z, R

	bBloco1 := {|H| E:=15, Z:=30, R:= E*Z-H }
    nResultado := Eval(bBloco1,nItem)
    Alert(nResultado)
/* No exemplo, tanto acima quanto abaixo, note que 1) houve a declaração da variável tipo bloco de cod L8
   Em seguida, são determinados os parâmetros do bloco: entre pipes o parâmetro H usado na chamada do bloco
   junto com a função eval; Em seguida, o Bloco é excutado pela função Eval(bBloco1,nItem), onde nItem
   fará o papel de H dentro da execução do bloco de codigo

*/    

    bBloco2 := {|I| E:=15, Z:=30, R:= E*Z-I }
    nResultado2 := Eval(bBloco2,600)
    Alert(nResultado2)


Return



User Function Filha()
// Exemplo de uso da função AEVAL()
Local aCampos := {}
Local aTitulos := {}
Local Nx := 0

RpcSetType(3)

PREPARE ENVIRONMENT EMPRESA "99" FILIAL "01" MODULO "Fat"

AADD(aCampoS,"C5_FILIAL")
AADD(aCampoS,"C5_NUM")



SX3->(DbSetOrder(2))
For Nx:= 1 To Len(aCampos)
Sx3->(DbSeek(aCampos,[nx]))
AADD(aTitulos,Alltrim(SX3->X3_TITULO))
Next nx

//O trecho acima pode ser reescrito da forma abaixo e teremos os mesmo resultados 

aTitulos := {}
SX3->(DbGoTop())
aEval(aCampos,{|X|SX3->(DbSeek(X)),AADD(aTitulos,Alltrim(SX3->X3_TITULO))})

RESET ENVIRONMENT


Return

