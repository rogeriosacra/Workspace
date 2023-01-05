
#include "protheus.ch"
User Function Janela()
 Local aSize := {}
 Local bOk := {|| }
 Local bCancel:= {|| }
aSize := MsAdvSize(.F.)
 /*
 MsAdvSize (http://tdn.totvs.com/display/public/mp/MsAdvSize+-+Dimensionamento+de+Janelas)
 aSize[1] = 1 -> Linha inicial �rea trabalho.
 aSize[2] = 2 -> Coluna inicial �rea trabalho.
 aSize[3] = 3 -> Linha final �rea trabalho.
 aSize[4] = 4 -> Coluna final �rea trabalho.
 aSize[5] = 5 -> Coluna final dialog (janela).
 aSize[6] = 6 -> Linha final dialog (janela).
 aSize[7] = 7 -> Linha inicial dialog (janela).
 */
Define MsDialog oDialog TITLE "Titulo" STYLE DS_MODALFRAME From aSize[7],0 To aSize[6],aSize[5] OF oMainWnd PIXEL
 //Se n�o utilizar o MsAdvSize, pode-se utilizar a propriedade lMaximized igual a T para maximizar a janela
 //oDialog:lMaximized := .T. //Maximiza a janela
 //Usando o estilo STYLE DS_MODALFRAME, remove o bot�o X
/*
seu codigo
*/
ACTIVATE MSDIALOG oDialog ON INIT EnchoiceBar(oDialog, bOk , bCancel) CENTERED
Return

/*
MSDIALOG()
Skip to end of metadata
Tempo aproximado para leitura: 1 minuto
Go to start of metadata
Sintaxe

 

DEFINE MSDIALOG oObjetoDLG TITLE cTitulo FROM nLinIni,nColIni TO nLinFim,nColFim OF oObjetoRef UNIDADE

 

Prop�sito

 

Define o componente b�sico da interface visual, sobre o qual ser�o definidos os demais componentes.

 

Argumentos

 

< oObjetoDLG >

 

Posi��o do objeto Say em fun��o da janela na qual ele ser� definido.

 

< cTitulo >

 

T�tulo da janela de di�logo.

 

< nLinIni >

 

Posi��o inicial da linha da janela.

 

< nColIni >

 

Posi��o inicial da coluna da janela.

 

< nLinFim >

 

Posi��o final da linha da janela.

 

< nColFim >

 

Posi��o final da coluna da janela.

 

< oObjetoRef >

 

Nome do objeto dialog no qual a janela ser� definida.

 

< UNIDADE >

 

Unidade de medida das dimens�es da janela. O mais comum � em pixels.

 

Utiliza��o

 

O componente MSDIALOG() � uma janela de aplica��o, dentro da qual s�o constru�das as demais interfaces, como telas, bot�es, valida��es, etc.

 

Exemplos

 

DEFINE MSDIALOG oDlg TITLE cTitulo FROM 000,000 TO 080,300 PIXEL

 

ACTIVATE MSDIALOG oDlg CENTERED

 

3 pessoas gostam disto
Sem r�tulos
2 Coment�rios
�cone de usu�rio: rodrigo.araujo@marel.com
Rodrigo Araujo
Segue um exemplo mais completo:
*/
