#INCLUDE 'PROTHEUS.CH'

User Function ADIVINHA()

Local nNumero := -1
Local nChute := 1
Local nTentativas := 0
Local nDificult := 0


MsgInfo("Jogo ADIVINHE O NÚMERO !")
MsgInfo("Tente adivinhar o número que está na memória do computador!!!")


While nChute <> nNumero
  While nDificult == 0 .OR. nDificult > 3
        nDificult:= Val(FwInputBox("Escolha o nível de dificuldade: 1,2 ou 3", ""))
        If nDificult == 0 .OR. nDificult > 3
        MSGAlert("Valor inválido, o níveis são 1, 2 ou 3 e vc digitou " +Cvaltochar(nDificult)+ " .Por favor, digite corretamente desta vez!")
        EndIf
  EndDo
  
  If nDificult == 1
    While nChute <> nNumero
          If nNumero == 0
             nNumero := Randomize(1,10)
          EndIF

          Do
              nChute := Val(FwInputBox("Digite um número entre 1 e 10"))
                If nChute < 1 .OR. nChute > 10
                  MSGAlert("Valor inválido, você deve digitar números entre 1 à 10 " +Cvaltochar(nChute)+ " .Por favor, digite corretamente desta vez!")
                  nChute := 0
                EndIF
          While nchute <> nNumero

          If nChute < nNumero
              nTentativas += 1
              MsgAlert("Você errou, na tentativa " +CvalToChar(nTentativas)+ " o  valor " + Cvaltochar(nChute)+ " é muito baixo, tente novamente !")
              nChute := 0
          ElseIf nChute > nNumero
                nTentativas += 1  
                MsgAlert("Você errou, na tentativa " +CvalToChar(nTentativas)+ " o  valor " + Cvaltochar(nChute)+ " é muito alto, tente novamente !") 
          Else 
              nTentativas += 1 
              MSgInfo("Parabéns, você acertou o número " + Cvaltochar(nNumero)+" !")
                 
              If nTentativas >= 2
                MSgInfo("Total de tentativas foi de " + Cvaltochar(nTentativas)+" tentativas!")
              ELse 
                MSgInfo("Ainda por cima você acertou na " + Cvaltochar(nTentativas)+"º tentativa!")
              EndIf

          EndIf 

    Enddo
  EndIf 

  
  
  If nDificult == 2  
    While nChute <> nNumero
             If nNumero == 0
                nNumero := Randomize(1,50)
             EndIF

            Do 
              nChute := Val(FwInputBox("Digite um número entre 1 e 50")) 
                If nChute < 1 .OR. nChute > 50
                   MSGAlert("Valor inválido, você deve digitar números entre 1 à 50 " +Cvaltochar(nChute)+ " .Por favor, digite corretamente desta vez!")
                  nChute := 0
                EndIf
            While nChute <> nNumero

            If nChute > nNumero
              nTentativas += 1 
              MsgAlert("Você errou na tentativa " +CvalToChar(nTentativas)+ " ,o valor " + Cvaltochar(nChute)+ " é muito alto, tente novamente !")
              nChute := 0  
            elseIf nChute < nNumero
                nTentativas += 1  
                MsgAlert("Você errou, na tentativa " +CvalToChar(nTentativas)+ " o  valor " + Cvaltochar(nChute)+ " é muito baixo, tente novamente !")
                                    
            Else 
              nTentativas += 1 
              MSgInfo("Parabéns, você acertou o número " + Cvaltochar(nNumero)+" !")
               
               If nTentativas >= 2
                MSgInfo("Total de tentativas foi de " + Cvaltochar(nTentativas)+" tentativas!")
              ELse 
                MSgInfo("Ainda por cima acertou na " + Cvaltochar(nTentativas)+"º tentativa!")
              EndIf

            EndIf   
    EndDo     
  Endif 

  If nDificult == 3 
    While   nChute <> nNumero   //nChute < 1 .OR. nChute > 100
            If nNumero == 0
               nNumero := Randomize(1,100)
            EndIF
            
            While nChute <> nNumero
              nChute := Val(FwInputBox("Digite um número entre 1 e 100")) 
                If nChute < 1 .OR. nChute > 100
                   MSGAlert("Valor inválido, você deve digitar números entre 1 à 100 " +Cvaltochar(nChute)+ " .Por favor, digite corretamente desta vez!")
                EndIf
            EndDo
           
           If nChute > nNumero
              nTentativas += 1 
              MsgAlert("Você errou na tentativa " +CvalToChar(nTentativas)+ " ,o valor " + Cvaltochar(nChute)+ " é muito alto, tente novamente !")
              nChute := 0

           elseIf nChute < nNumero
                nTentativas += 1  
                MsgAlert("Você errou, na tentativa " +CvalToChar(nTentativas)+ " o  valor " + Cvaltochar(nChute)+ " é muito baixo, tente novamente !")
                                    
           Else 
              nTentativas += 1 
              MSgInfo("Parabéns, você acertou o número " + Cvaltochar(nNumero)+" !")
               
              If nTentativas >= 2
                MSgInfo("Total de tentativas foi de " + Cvaltochar(nTentativas)+" tentativas!")
              ELse 
                MSgInfo("Ainda por cima acertou na " + Cvaltochar(nTentativas)+"º tentativa!")
              EndIf

            EndIf 
            
    EndDo     
  Endif 

  
End              

Return


