#Include "TOTVS.ch"

// FUN��O PRINCIPAL
User function PBFWMSG()
    Local oSay := NIL // CAIXA DE DI�LOGO GERADA

    // GERA A TELA DE PROCESSAMENTO
    FwMsgRun(NIL, {|oSay| RunMessage(oSay)}, "Processing", "Starting process...")
Return 

// FUN��O PARA ALTERA��O DA MENSAGEM
Static Function RunMessage(oSay)
    Local nX := 0 // CONTROLE CONTADOR DO LA�O

    // SIMULA A PREPARA��O PARA EXECU��O
    Sleep(2000)

    // LA�O COM PAUSA DE UM SEGUNDO PARA SIMULA��O
    For nX := 1 To 10
        oSay:SetText("Working at: " + StrZero(nX, 6)) // ALTERA O TEXTO CORRETO
        ProcessMessage() // FOR�A O DESCONGELAMENTO DO SMARTCLIENT

        Sleep(1000) // SIMULA O PROCESSAMENTO DA FUN��O
    Next nX
Return
