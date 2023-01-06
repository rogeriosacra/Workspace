#INCLUDE 'totvs.ch'
#INCLUDE 'protheus.ch'

User Function ExDbStru()

Local nHandle  := TCLINK("MSSQL/DNS1", "127.0.0.1", 7890 )
Local cTable   := "ZZB990"
Local cRDD     := "TOPCONN"
Local aStruZZB := ZZB->(DbStruct())

DbUseArea(.T., cRDD, cTable , (cTable), .F., .T.)

MemoWrite("C:\temp\ESTRUTURAZZB.txt", VarInfo("aStruZZB", aStruZZB, , .F.))

DbCloseArea()

TCUnLink(nHandle) 

Return 
