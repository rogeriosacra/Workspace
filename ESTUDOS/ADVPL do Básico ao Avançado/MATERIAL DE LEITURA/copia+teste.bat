c:
;abre pasta do ambiente de testes para copiar o RPO
cd\Totvs_teste12\Protheus\apo
;copia do ambiente de produção
copy /y c:\Totvs12\Protheus\apo\*.rpo

;abre pasta do ambiente de testes e apaga os arquivos 
cd\Totvs_teste12\Protheus_data\system
del *.cdx
del sx*.dtc
del six*.dtc
del xx*.dtc
del *.xnu
del sigahlp.*
del *.fpt 
del *.spf 

 ;copia do ambiente de produção
 copy /y C:\Totvs12\Protheus_data\system\sx*.dtc
 copy /y C:\Totvs12\Protheus_data\system\six*.dtc
 copy /y C:\Totvs12\Protheus_data\system\xx*.dtc
 copy /y C:\Totvs12\Protheus_data\system\*.xnu
 copy /y C:\Totvs12\Protheus_data\system\sigahlp.*
 copy /y C:\Totvs12\Protheus_data\system\*.spf
 