#INCLUDE "rwmake.ch"
#INCLUDE "Protheus.ch"

/*/
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
�������������������������������������������������������������������������ͻ��
���Programa  �MT120TEL  � Autor � PAULO BINdO        � Data �  14/11/12   ���
�������������������������������������������������������������������������͹��
���Descricao � PONTO DE ENTRADA PARA A INCLUSAO DE CAMPOS NO CABECALHO    ���
���          � DO PEDIDO DE COMPRAS                                       ���
�������������������������������������������������������������������������͹��
���Uso       � AP6 IDE                                                    ���
�������������������������������������������������������������������������ͼ��
�����������������������������������������������������������������������������
�����������������������������������������������������������������������������
/*/

User Function MT120TEL()

Local oNewDialog  := PARAMIXB[1]
Local aPosGet     := PARAMIXB[2]
Local aObj        := PARAMIXB[3]
Local nOpcx       := PARAMIXB[4]
Local nReg        := PARAMIXB[5]     
Private aItems 	  := {"Sim","Nao"}
Public cFluxo	  := Iif(!INCLUI,Iif(SC7->C7_FLUXO == "S","Sim","Nao") ,"Nao")

@ 062,aPosGet[2,5] SAY   Alltrim(RetTitle("C7_FLUXO"))    OF oNewDialog PIXEL SIZE 045,10 
@ 062,aPosGet[2,6] COMBOBOX cFluxo ITEMS aItems   SIZE 45,006  When Iif(ALTERA,.F.,.T.) PIXEL OF oNewDialog  // HASBUTTON


Return
