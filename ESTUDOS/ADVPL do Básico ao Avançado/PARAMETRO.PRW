#INCLUDE 'Protheus.ch'
#INCLUDE 'TbiConn.ch'
#INCLUDE 'TbiCode.ch'
#INCLUDE 'Totvs.ch'


/*/{Protheus.doc} User Function PARAMETRO
    (Aula de parâmetros)
    @type  User Function
    @author user Rogério
    @since 13/02/2023
  
    /*/
User Function PARAMETRO()

  Local dParam :=  ""






  PREPARE ENVIRONMENT EMPRESA "99" FILIAL "01" MODULO "FAT"

  dParam := GetMV("MV_ULMES")
  dParam += 90

  PUTMV("MV_ULMES", dParam)

  dParam := GetMV("MV_ULMES")

  MsgInfo(dParam)       

  RESET ENVIRONMENT


    
Return 
