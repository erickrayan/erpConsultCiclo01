<#
Nome: rpcCentrosDeCusto.ps1
Descricao: Menu de insercao de centros de custo
versao: 221229

#>

$nomePath = (split-path (Get-Item $PSCommandPath).Fullname)
Set-Location $nomePath
$pathData = $nomePath.Substring(0, $nomePath.lastIndexOf('\')) + $folderData

. .\rpcCommon.ps1 
. .\rpcCentrosDeCustoForm.ps1 #carrega os comandos para a interface grafica

$botaoVoltarCcusto.Add_Click({
    $formCcusto.Dispose()
    . .\rpcMenuCCusto.ps1
}) 


[void]$formCcusto.ShowDialog()