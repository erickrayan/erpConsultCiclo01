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



$inserirCContabeis.Add_click({
    . .\rpcContaContabil.ps1
})

$inserirCCusto.Add_click({
   # . .\rpcCentroCusto.ps1
})

$alterarCContabeis.Add_click({
    . .\rpcAterarContaContabil.ps1
})

criaArquivo "tbSG.txt"




[void]$menu.ShowDialog()