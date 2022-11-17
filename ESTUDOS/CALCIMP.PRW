#INCLUDE "TOTVS.CH"
#INCLUDE "PROTHEUS.CH"

User Function CALCIMP()

nValProd := 0
nValImp  := 0
nTaxaImp := 60

nValProd := Val(FwInputBox("Digite o valor do produto em R$...", ""))
nTaxaImp := Val(FwInputBox("Digite o % da alíquota do imposto...", ""))
nValImp  := nValProd * (nTaxaImp/100)

MsgAlert("Valor do produto=  " + Cvaltochar(nValProd) + " / Valor da alíquota=  ";
          +Cvaltochar(nTaxaImp)+ " / Valor do imposto= " +Cvaltochar(nValImp) )
Return
