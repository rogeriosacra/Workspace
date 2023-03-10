/*
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������Ŀ��
���Fun��o    �PACK      � Autor � Emerson/Vicente       � Data � 16.12.99 ���
�������������������������������������������������������������������������Ĵ��
���Descri��o �Rotina RDMAKE para eliminar os registros deletados do banco ���
�������������������������������������������������������������������������Ĵ��
��� Uso      �RDMake <Programa.Ext> -w                                    ���
�������������������������������������������������������������������������Ĵ��
��� Exemplo  �RDMake Pack.prw                                             ���
��������������������������������������������������������������������������ٱ�
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
*/
@ 96,42 TO 323,505 DIALOG oDlg5 TITLE "Rotina de Pack"
@ 8,10 TO 84,222
@ 91,168 BMPBUTTON TYPE 1 ACTION Execute(OkProc)
@ 91,196 BMPBUTTON TYPE 2 ACTION Close(oDlg5)
@ 23,14 SAY "Este programa ira fazer um pack em todos arquivos abertos pelo Advanced."
ACTIVATE DIALOG oDlg5
Return nil

Function OkProc
Close(oDlg5)
Processa( {|| Execute(RunProc) } )
Return

/*
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������Ŀ��
���Fun��o    �RunProc   � Autor � Ary Medeiros          � Data � 15.02.96 ���
�������������������������������������������������������������������������Ĵ��
���Descri��o �Executa o Processamento                                     ���
��������������������������������������������������������������������������ٱ�
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
*/  
Function RunProc

dbSelectArea("SX2")
nRecnoSX2 := SX2->(Recno())
dbGoTop()
ProcRegua(reccount())
While !Eof()
	If Select(SX2->X2_CHAVE) > 0
		cQuery := 'SELECT MAX(R_E_C_N_O_) RECNO FROM ' + SX2->X2_ARQUIVO
		dbUseArea(.T., "TOPCONN", TCGenQry(,,cQuery), 'CONT', .F., .T.)
		nCont := 1
		While nCont <= CONT->RECNO
			cQuery := "DELETE FROM "+SX2->X2_ARQUIVO
			cQuery := cQuery + " WHERE D_E_L_E_T_ = '*'"
			cQuery := cQuery + "   AND R_E_C_N_O_ between "+Str(nCont)+" AND "+Str(nCont+1024)
			nCont := nCont + 1024
		   TCSQLEXEC(cQuery)
		Enddo
      dbSelectArea("CONT")
      dbCloseArea()
	Endif
   dbSelectArea("SX2")
	dbSkip()
   incproc()
Enddo
return