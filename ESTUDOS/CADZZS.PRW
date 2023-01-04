#INCLUDE 'PROTHEUS.CH'
#INCLUDE 'PARMTYPE.CH'
/*/{Protheus.doc} CADZZA
    (long_description)
    @type  Function
    @author RSB
    @since 21/11/2022
    @version version
    @param param_name, param_type, param_descr
    @return return_var, return_type, return_description
    @example
    (examples)
    @see (links_or_references)
    /*/
User Function CADZZS()

Local cAlias   := "ZZS"
Local ctitulo  := "Consulta SQL"
Local cVldExc  := ".T."
Local cVldALt  := ".T."

DbSelectArea(cAlias)
DbSetOrder(1)

Axcadastro(cAlias, cTitulo, cVldExc, cVldAlt)

    
Return 
