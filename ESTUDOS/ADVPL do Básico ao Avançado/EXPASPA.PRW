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

Local := nQuantidade
Local := nValor

RpcSetType(3)

PREPARE ENVIRONMENT EMPRESA "99" FILIAL "01" MODULO "FAT"

Calc(nQuantidade,nValor)

Alert(nResultado)

RESET ENVIRONMENT
    
Return 


User Function Calc(nQuantidade,nValor)

Local nResultado := 0

nResultado := nQuantidade * nValor

Return (nResultado)
