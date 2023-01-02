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


$botaoOkCcusto.Add_Click({
    if ("" -eq $textboxDescrCcusto.Text -or "" -eq $textboxCodCcusto.Text.Length){
        [System.Windows.MessageBox]::Show('Preencha todos os campos com valores validos.', 'Erro')
    }
    else{
        $cont=0
        foreach ($linha in Get-Content -path ($pathdata +"\tbCentroCusto.txt")){ #verifica se ja existe algum codigo de conta igual
            if(($linha -split " \| ")[1] -eq $textboxCodCcusto.text){
                $cont++
                break
            }
        }
        if($cont -ne 0){
            [System.Windows.MessageBox]::Show('Conta ja existente.')
        }
        else{ #se estiver tudo correto
            $sgconta=(fnBuscaSG "tbCentroCusto")
            Add-Content -Value "$sgconta | $($textboxCodCcusto.Text) | $($textboxDescrCcusto.Text)" -Path ($pathdata +"\tbCentroCusto.txt")
            fnIncrementaSG "tbCentroCusto"

            $labelSgCcusto.Text = "SgCcusto: " + ([string](fnBuscaSG "tbCentroCusto")).PadLeft(4,'0') + ":"

            [System.Windows.MessageBox]::Show('Centro de custo adicionado.')
        }
    }
}) 

$labelSgCcusto.Text = "SgCcusto: " + ([string](fnBuscaSG "tbCentroCusto")).PadLeft(4,'0') + ":"

[void]$formCcusto.ShowDialog()