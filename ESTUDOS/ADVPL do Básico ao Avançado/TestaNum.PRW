#Include 'Protheus.ch'

User Function TestaNum()

nNumero := 0

MsgInfo("Este programa verifica se um número é par ou ímpar")

nNumero:= Val(FwInputBox("Digite um número: ", ""))

If (nNumero % 2) = 0
  MsgInfo(" Número "+nNumero+" é par")
Else
  MsgInfo(" Número "+nNumero+" é ímpar")
EndIf

Return
