#include "rwmake.ch"
#DEFINE ENTER Chr(13)+Chr(10)
/*
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Programa  �WFW120P   �Autor  �Ewerton C Tomaz     � Data �  04/04/03   ���
�������������������������������������������������������������������������͹��
���Desc.     � Ponto de Entrada no Pedido de Compra ap�s a gravacao       ���
���          �                                                            ���
�������������������������������������������������������������������������͹��
���Uso       � AP                                                        ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
*/

User Function WFW120P()


	Local aArea  := GetArea()
	Local aAreaC7  := SC7->(GetArea())


	//GRAVA CAMPOS CUSTOMIZADOS DO CABECALHO
	dbSelectArea("SC7")
	PedCo := SC7->C7_NUM
	dbSelectArea("SC7")
	dbSetOrder(1)
	dbSeek(xFilial()+cPedCo)
	While !Eof() .And. SC7->C7_NUM == cPedCo
		RecLock("SC7",.F.)
		SC7->C7_FLUXO := Iif(cFluxo == "Nao","N","S")
		SC7->(MsUnlock())
		dbSelectArea("SC7")
		dbSkip()
	End
	RestArea(aArea)
	RestArea(aAreaC7)
Return(.T.)
