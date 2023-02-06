#Include 'Protheus.ch'
#Include 'totvs.ch'

/*/{Protheus.doc} User Function ExPassaara
    (exemplo de passagem de parâmetro para função )
    @type  Function
    @Rogério Curso ADVPL
    @since 06/02/2023
    @version version
    @param param_name, param_type, param_descr
    @return return_var, return_type, return_description
    @example
       /*/
User Function ExPasPa()

Local nQuantidade1 := 100
Local nValor1 := 100
Local nresultado1 := 0

RpcSetType(3)


nResultado1 := Calc(nQuantidade1,nValor1)

Alert(nResultado1)

    
Return 


Static Function Calc(nQuantidade1,nValor1)

Local nResultado := 0

nResultado1 := nQuantidade1 * nValor1

Return (nResultado)
