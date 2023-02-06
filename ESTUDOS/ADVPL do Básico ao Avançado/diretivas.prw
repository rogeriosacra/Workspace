#INCLUDE 'Protheus.ch'

/*/{Protheus.doc} User Function DIRETIVA
description: Exercícios para diretivas de compilação
    @type  uSER Function
    @author Rogério Sacramento
    @since 06/02/2023
    @version version
    @param param_name, param_type, param_descr
    @return return_var, return_type, return_description
    @example
    (examples)
    @see (links_or_references)
    /*/
User Function DIRETIVA()

Local nValor1 := 25
Local nValor2 := 25
Local nResultado := 0


nResultado := Recebe(@nValor1,nValor2)

Alert(nResultado)

Return 


/*/{Protheus.doc} Recebe
description)
    @type  Static Function
    @Rogério
    @since 06/02/2023
    @version version
    @param param_name, param_type, param_descr
    @return return_var, return_type, return_description
    @example
    (examples)
    @see (links_or_references)
/*/
Static Function Recebe(nValorA,nValorB)

Local nRetorno := 0

nValor1 := 50

nRetorno := nValorA + nValorB
    
Return (nRetorno)
