#INCLUDE 'PROTHEUS.CH'

User Function ADIVINHA()

	Local nNumero := 0
	Local nChute := -1
	Local nTentativas := 0
	Local nDificult := -1
	Local lNdig := .F.


	MsgInfo("Jogo **ADIVINHE O NÚMERO** !")
	MsgInfo("Tente adivinhar o número que está na memória do computador!!!")


	While nChute <> nNumero
		While nDificult == -1 .OR. nDificult > 3
			nDificult:= Val(FwInputBox("Escolha o nível de dificuldade: 1,2 ou 3 (0 cancela)", ""))
			If nDificult > 3
				MSGAlert("Valor inválido, o níveis são 1, 2 ou 3 e vc digitou " +Cvaltochar(nDificult)+ " .Por favor, digite corretamente desta vez!")
			ELSEIF nDificult < 1
				MSGAlert("Cancelado pelo usuário")
				Return
			EndIf
		EndDo

		If nDificult == 1
			While nChute <> nNumero
				If nNumero == 0
					nNumero := Randomize(1,10)
				EndIF

				While !lNdig
					nChute := Val(FwInputBox("Digite um número entre 1 e 10"))
					If nChute < 0 .OR. nChute > 10
						MSGAlert("Valor inválido, o número deve estar entre 1 e 10 e vc digitou: " +Cvaltochar(nChute)+ " .Por favor, digite corretamente desta vez!")
					ElseIf nChute == 0
						MsgAlert("Cancelado pelo usuário")
            Return
					ElseIf nChute > 0 .AND. nChute < 11
						lNdig := .T.
					EndIf
				EndDo

				If nChute < nNumero
					nTentativas += 1
					MsgAlert("Você errou, na tentativa " +CvalToChar(nTentativas)+ "º, o  valor " + Cvaltochar(nChute)+ " é muito baixo, tente novamente !")
					nChute := 0
					lNdig := .F.
				ElseIf nChute > nNumero
					nTentativas += 1
					MsgAlert("Você errou, na " +CvalToChar(nTentativas)+ "º, o  valor " + Cvaltochar(nChute)+ " é muito alto, tente novamente !")
					nChute := 0
					lNdig := .F.
				Else
					nTentativas += 1
					MSgInfo("Parabéns você acertou! O número randômico é: " + Cvaltochar(nNumero)+" !")

					If nTentativas >= 2
						MSgInfo("Total de tentativas: " + Cvaltochar(nTentativas))
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

				While !lNdig
					nChute := Val(FwInputBox("Digite um número entre 1 e 50"))
					If nChute < 1 .OR. nChute > 50
						MSGAlert("Valor inválido, o número deve estar entre 1 e 50 e você digitou "+CValtoChar(nChute)+" .Por favor, digite corretamente desta vez!")
					
					ElseIf nChute == 0
          MsfAlert("Cancelado pelo usuário")
          Return
          ElseIf nChute > 0 .And. nChute < 51
						lNdig := .T.

					EndIf
				EndDo

				If nChute > nNumero
					nTentativas += 1
					MsgAlert("Você errou na " +CvalToChar(nTentativas)+ "º tentativa, o valor " + Cvaltochar(nChute)+ " é muito alto, tente novamente !")
					nChute := 0
					lNdig := .F.
				elseIf nChute < nNumero
					nTentativas += 1
					MsgAlert("Você errou, na " +CvalToChar(nTentativas)+ ",º tentativa, o  valor " + Cvaltochar(nChute)+ " é muito baixo, tente novamente !")
					nChute := 0
					lNdig := .F.
				Else
					nTentativas += 1
					MSgInfo("Parabéns você acertou! O número randômico é: " + Cvaltochar(nNumero)+" !")

					If nTentativas >= 2
						MSgInfo("Total de tentativas: " + Cvaltochar(nTentativas)+" tentativas!")
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

				While !lNdig
					nChute := Val(FwInputBox("Digite um número entre 1 e 100"))
					If nChute < 1 .OR. nChute > 100
						MSGAlert("Valor inválido, o número deve estar entre 1 e 100 e você digitou " +Cvaltochar(nChute)+ " .Por favor, digite corretamente desta vez!")
					ElseIf nChute == 0
            MsgAlert("Cancelado pelo usuário")
            Return
          ElseIf nChute > 0 .AND. nChute < 101  
						lNdig := .T.
					EndIf
				EndDo

				If nChute > nNumero
					nTentativas += 1
					MsgAlert("Você errou na " +CvalToChar(nTentativas)+ "º tentativa, o valor " + Cvaltochar(nChute)+ " é muito alto, tente novamente !")
					nChute := 0
					lNdig := .F.

				elseIf nChute < nNumero
					nTentativas += 1
					MsgAlert("Você errou, na "+CvalToChar(nTentativas)+ "º, o  valor " + Cvaltochar(nChute)+ " é muito baixo, tente novamente !")
					nChute := 0
					lNdig := .F.

				Else
					nTentativas += 1
					MSgInfo("Parabéns você acertou! O número randômico é: " + Cvaltochar(nNumero))

					If nTentativas >= 2
						MSgInfo("Total de tentativas:" + Cvaltochar(nTentativas)+" tentativas!")
					ELse
						MSgInfo("Ainda por cima acertou na " + Cvaltochar(nTentativas)+"º tentativa!")
					EndIf

				EndIf

			EndDo
		Endif


	End

Return


