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
User Function CADSZ1()

Local cAlias   := "SZ1"
Local ctitulo  := "Cadastro Un.Medidas"
Local cVldExc  := ".T."
Local cVldALt  := ".T."

Axcadastro(cAlias, cTitulo, cVldExc, cVldAlt)

    
Return 
