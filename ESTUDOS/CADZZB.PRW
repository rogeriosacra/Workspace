#INCLUDE 'PROTHEUS.CH'
#INCLUDE 'PARMTYPE.CH'
/*/{Protheus.doc} CADZZB
    (long_description)
    @type  Function
    @author RSB
    @since 07/02/2022
    @version version
    @param param_name, param_type, param_descr
    @return return_var, return_type, return_description
    @example
    (examples)
    @see (links_or_references)
    /*/
User Function CADZZB()

Local cAlias   := "ZZB"
Local ctitulo  := "Cadastro de Albuns Musicais"
Local cVldExc  := ".T."
Local cVldALt  := ".T."

Axcadastro(cAlias, cTitulo, cVldExc, cVldAlt)

    
Return 
