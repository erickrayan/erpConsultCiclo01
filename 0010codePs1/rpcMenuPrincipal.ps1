<#
Nome: rpcMenuPrincipal.ps1
Descricao: Script para controle do menu principal da aplicaco rpc
versao: 221128

#>

$nomePath = (split-path (Get-Item $PSCommandPath).Fullname)
Set-Location $nomePath
$pathData = $nomePath.Substring(0, $nomePath.lastIndexOf('\')) + $folderData


# carrega e executa funcoes comuns ao script
. .\rpcCommon.ps1 

# carrega os comandos para a interface grafica
. .\rpcMenuPrincipalForm.ps1



$CCusto.Add_click({
    $menu.Dispose()
    . .\rpcMenuCCusto.ps1
   
})

$CContabeis.Add_click({
    $menu.Dispose()
    #.\rpcAterarContaContabil.ps1
    . .\rpcMenuContabil.ps1
})

criaArquivo "tbSG.txt"
criaArquivo "tbConta.txt"



[void]$menu.ShowDialog()