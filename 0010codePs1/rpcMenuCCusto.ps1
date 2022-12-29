<#
Nome: rpcMenuPrincipal.ps1
Descricao: Script para controle do menu de centros de custo da aplicaco rpc
versao: 221229

#>

$nomePath = (split-path (Get-Item $PSCommandPath).Fullname)
Set-Location $nomePath
$pathData = $nomePath.Substring(0, $nomePath.lastIndexOf('\')) + $folderData


# carrega e executa funcoes comuns ao script
. .\rpcCommon.ps1 

# carrega os comandos para a interface grafica
. .\rpcMenuCCustoForm.ps1

$inserirCCusto.Add_click({
    $menuCCusto.Dispose()
    . .\rpcCentrosDeCusto.ps1
 })

 $alterarCCusto.Add_click({
    [System.Windows.MessageBox]::Show("Em construcao")
    #$menuCCusto.Dispose()
    
 })

[void]$menuCCusto.ShowDialog()