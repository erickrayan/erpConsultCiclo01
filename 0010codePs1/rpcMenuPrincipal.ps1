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
    #[void]$formContabil.ShowDialog()
    . .\rpcContaContabil.ps1
})

$inserirCCusto.Add_click({
    #[void]$formCCusto.ShowDialog()
   # . .\rpcCentroCusto.ps1
})

[void]$menu.ShowDialog()