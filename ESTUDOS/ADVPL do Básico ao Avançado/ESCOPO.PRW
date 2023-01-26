
 #INCLUDE 'PROTHEUS.CH' 
 //-Crie um rdmake chamado escopo.prw

//-Insira o include Protheus.ch

//-crie as funções e variaveis conforme a tipagem:

Static cTexto := 'Estatica'

User Function Principal()

Local   nNumero := 10 
Private dData   := Date()

Filha()

Return           

Static Function Filha() 

Local   nNumero    := 20
Private lContinua := .T.
PUBLIC aDados := {1,3,7}
Local nResult := 0

ctexto := 'Alterada'

dData := 10

nResult := nNumero + dData


Secundaria()

Return

Static Function Secundaria()

Local nNumero := 30

aDados := {0,0,0}

Return



/*- Na user function PRINCIPAL chame a função FILHA

- Na static function FILHA chame a user function SECUNDARIA



Salve, compile e inicie o debug, adicione as variaveis na INSPEÇÃO e veja como elas se comportam ao debugar

Perguntas dessa tarefa
Uma variável Local funciona em uma outra função chamada depois que ela foi declarada? */
