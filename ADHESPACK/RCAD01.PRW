#include 'protheus.ch'
#include 'totvs.ch'



User Function RCAD01()//

_cTipo := M->B1_TIPO

IF LEN(ALLTRIM(M->B1_TIPO))>2 
	alert("O tipo do produto só pode conter 2 caracteres")
	_cTipo :=  ""
EndIf
    
Return(_cTipo)
