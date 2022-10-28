#INCLUDE 'Parmtype.ch'
#INCLUDE 'Protheus.ch'
// PROGRAMA 

USER FUNCTION CALCOM()


Local nVendaBase := 1500
Local nVendaPadrao := 0
Local nVendaSuperior := 0
Local nComissaoPad := 0
Local nComissaoSup := 0
Local nSalarioFix := 1000
Local nVendas := 2000
Local nSalarioTotal := 0
Local nComissaoInf := 0
local nValorAcima := 0


//Neste trecho eu poderia usar uma MSDIALOG PARA ATRIBUIR VALORES As VARI·VEis declaradas 
// Abaixo, um IF para classificar as vendas entre nVendaPadrao, ou seja ate 1500 ou nVendaSuperior, acima de 1500

If (nVendas <= nVendabase) 
    nVendaPadrao   := nVendas
Else 
    nVendaSuperior := nVendas
    nValorAcima := nVendas-nVendabase
ENDIF

MsgInfo("O valor das vendas classificadas como Padr„o (atÈ R$ 1500, comiss. 3%) È = R$ "+CValToChar(nVendaPadrao))
MsgInfo("O valor das vendas classificadas como Superior (acima de R$ 1500, comiss. 5% ) È = R$ "+CValtochar(nVendaSuperior))
MsgInfo("O valor base da comiss„o 5% È = R$ "+CValToChar(nValorAcima))
//calculanndo o valor da comiss„o

If (nVendas=nVendaPadrao)
nComissaoPad := (nVendaPadrao) * (3/100)
Else
nComissaoSup := (5/100) * (nVendaSuperior - nVendabase) 
nComissaoInf := (nVendaBase) * 3/100
MsgInfo("Valor da comiss„o Superior = R$ " + CvalToChar(nComissaoSup))
MsgInfo("Valor da comiss„o Inferior = R$ " + CvalToChar(nComissaoInf))

EndIf
//MsgAlert("Comiss„o Padrao"+ cValtoChar(nComissaoPad))
//MsgAlert("Comiss„o Padrao"+ CValToChar(nComissaoSupr))

If (nComissaoPad <> 0)
nSalarioTotal := (nSalarioFix+nComissaoPad)

MsgInfo("O valor da comiss„o padr„o È de R$ "+ Cvaltochar(nComissaoPad))
elseif (nComissaoSup<>0)
nSalarioTotal :=  (nComissaoSup + nSalarioFix + nComissaoInf)// + nComissaoInf) 
MsgInfo("O valor da comiss„o superior as vendas R$ 1500 È de R$ "+ Cvaltochar(nComissaoSup))
 
Endif 


//MsgInfo("O valor da comiss„o È de R$"+ Cvaltochar(nComissaoPad))
MsgInfo("O valor das vendas È de R$ "+ Cvaltochar(nVendas)+"; O sal·rio fixo È de R$ "+ Cvaltochar(nSalarioFix)+;
"; O sal·rio total È de R$ "+ Cvaltochar(nSalariototal)+"; O valor de venda que excede a R$ 1500 foi de R$ "+ Cvaltochar(nValorAcima),"TOTAIS")
//MsgInfo("O sal·rio fixo È de R$ "+ Cvaltochar(nSalarioFix))
//MsgInfo("O sal·rio total È de R$ "+ Cvaltochar(nSalariototal))
//MsgInfo("O valor de venda que excede a R$ 1500 foi de R$ "+ Cvaltochar(nValorAcima))

Return

