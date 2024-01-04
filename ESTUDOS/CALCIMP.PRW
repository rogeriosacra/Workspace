#INCLUDE "TOTVS.CH"
#INCLUDE "PROTHEUS.CH"

User Function CALCIMP()

Local nValProd := 0
Local nValImp  := 0
Local nTaxaImp := 60

nValProd := Val(FwInputBox("Digite o valor do produto em R$...", ""))
nTaxaImp := Val(FwInputBox("Digite o % da alíquota do imposto...", ""))

nValImp := Calc(nValProd,nTaxaImp)


MsgAlert("Valor do produto=  " + Cvaltochar(nValProd) + " / Valor da alíquota=  ";
          +Cvaltochar(nTaxaImp)+ " / Valor do imposto= " +Cvaltochar(nValImp) )
Return

Static Function Calc(nValProd1,nTaxaImp2)

Local nResult  := 0


nResult  := nValProd1 * (nTaxaImp2/100)


Return (nResult)
