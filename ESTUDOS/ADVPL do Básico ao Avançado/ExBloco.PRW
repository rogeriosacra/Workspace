#INCLUDE 'Protheus.ch'

/*/{Protheus.doc} ExBlodescription)
    @type  Function
    @author Rogerio SAcramento
    @since 30/01/2023
    @version version
    @param param_name, param_type, param_descr
    @return return_var, return_type, return_description
    @example
    (examples)
    @see (links_or_references)
    /*/
User  Function ExBloco()

Local nItem := 100
Local nValor:= 0

 bBloco := {|x| Y:=5, Z:= X*Y, K:= Z-Y-X, T:= k+nItem, U_Principal() }
 // O X entre pipes, é o parametro passado no eval -- Eval(bBloco,nItem) -- neste exemplo nItem será o X
 // As letras z, k e t, não precisam ser declaradas, sua função é servir de referência para receber os valores dos calculos
 // Dentro do Bloco é possível efetuar chamadas para outras funções 

 nValor := Eval(bBloco,nItem)

 MsgInfo("NValor = "+CvalTochar(nvalor))


    
Return 
