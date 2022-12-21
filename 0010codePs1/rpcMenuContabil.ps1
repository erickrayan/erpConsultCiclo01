<#
Nome: rpcMenuPrincipal.ps1
Descricao: Script para controle do menu de contas contabeis da aplicaco rpc
versao: 221221

#>

$nomePath = (split-path (Get-Item $PSCommandPath).Fullname)
Set-Location $nomePath
$pathData = $nomePath.Substring(0, $nomePath.lastIndexOf('\')) + $folderData


# carrega e executa funcoes comuns ao script
. .\rpcCommon.ps1 

# carrega os comandos para a interface grafica
. .\rpcMenuContabilForm.ps1

$inserirCContabeis.Add_click({
    $menuContabil.Dispose()
    . .\rpcContaContabil.ps1
 })

 $alterarCContabeis.Add_click({
    $menuContabil.Dispose()
    . .\rpcAterarContaContabil.ps1
 })

[void]$menuContabil.ShowDialog()