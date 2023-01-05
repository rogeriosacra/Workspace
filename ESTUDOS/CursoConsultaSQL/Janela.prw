
#include "protheus.ch"
User Function Janela()
 Local aSize := {}
 Local bOk := {|| }
 Local bCancel:= {|| }
aSize := MsAdvSize(.F.)
 /*
 MsAdvSize (http://tdn.totvs.com/display/public/mp/MsAdvSize+-+Dimensionamento+de+Janelas)
 aSize[1] = 1 -> Linha inicial área trabalho.
 aSize[2] = 2 -> Coluna inicial área trabalho.
 aSize[3] = 3 -> Linha final área trabalho.
 aSize[4] = 4 -> Coluna final área trabalho.
 aSize[5] = 5 -> Coluna final dialog (janela).
 aSize[6] = 6 -> Linha final dialog (janela).
 aSize[7] = 7 -> Linha inicial dialog (janela).
 */
Define MsDialog oDialog TITLE "Titulo" STYLE DS_MODALFRAME From aSize[7],0 To aSize[6],aSize[5] OF oMainWnd PIXEL
 //Se não utilizar o MsAdvSize, pode-se utilizar a propriedade lMaximized igual a T para maximizar a janela
 //oDialog:lMaximized := .T. //Maximiza a janela
 //Usando o estilo STYLE DS_MODALFRAME, remove o botão X
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

 

Propósito

 

Define o componente básico da interface visual, sobre o qual serão definidos os demais componentes.

 

Argumentos

 

< oObjetoDLG >

 

Posição do objeto Say em função da janela na qual ele será definido.

 

< cTitulo >

 

Título da janela de diálogo.

 

< nLinIni >

 

Posição inicial da linha da janela.

 

< nColIni >

 

Posição inicial da coluna da janela.

 

< nLinFim >

 

Posição final da linha da janela.

 

< nColFim >

 

Posição final da coluna da janela.

 

< oObjetoRef >

 

Nome do objeto dialog no qual a janela será definida.

 

< UNIDADE >

 

Unidade de medida das dimensões da janela. O mais comum é em pixels.

 

Utilização

 

O componente MSDIALOG() é uma janela de aplicação, dentro da qual são construídas as demais interfaces, como telas, botões, validações, etc.

 

Exemplos

 

DEFINE MSDIALOG oDlg TITLE cTitulo FROM 000,000 TO 080,300 PIXEL

 

ACTIVATE MSDIALOG oDlg CENTERED

 

3 pessoas gostam disto
Sem rótulos
2 Comentários
Ícone de usuário: rodrigo.araujo@marel.com
Rodrigo Araujo
Segue um exemplo mais completo:
*/
