<#
Nome: rpcMenuPrincipalForm.ps1
Descricao: Criacao de objetos para o formulario do menu de centros de custo
versao: 221229

#>

Add-Type -AssemblyName System.Windows.forms
Add-Type -Assemblyname System.Drawing
Add-Type -AssemblyName PresentationFramework #para janelas de erro ou sucesso

#menu ####################################################################################################################

$menuCCusto = New-Object System.Windows.Forms.Form
$menuCCusto.size = New-Object System.Drawing.Size(350,240)
$menuCCusto.StartPosition = "CenterScreen"

#Label menu Contabil
$mCCustolLabel = New-Object System.Windows.Forms.Label
$mCCustolLabel.Text = "Centros de custo"
$mCCustolLabel.Location =  New-Object System.Drawing.Size(20,15)
$mCCustolLabel.AutoSize = $true
$menuCCusto.Controls.Add($mCCustolLabel)

#botao inserir conta contabil
$inserirCCusto = New-Object System.Windows.Forms.Button 
$inserirCCusto.Location = New-Object System.Drawing.Size(20,50)
$inserirCCusto.Size = New-Object System.Drawing.Size(130,40)
$inserirCCusto.Text = "Cadastrar centros de custo"
$menuCCusto.Controls.Add($inserirCCusto)

#botao alterar conta contabil
$alterarCCusto = New-Object System.Windows.Forms.Button 
$alterarCCusto.Location = New-Object System.Drawing.Size(180,50)
$alterarCCusto.Size = New-Object System.Drawing.Size(130,40)
$alterarCCusto.Text = "Alterar centros de custo"
$menuCCusto.Controls.Add($alterarCCusto)

#botao voltar
$botaoMenuCCustoVoltar = New-Object System.Windows.Forms.Button 
$botaoMenuCCustoVoltar.Location = New-Object System.Drawing.Size(210,120)
$botaoMenuCCustoVoltar.Size = New-Object System.Drawing.Size(100,20)
$botaoMenuCCustoVoltar.Text = "Voltar"
$botaoMenuCCustoVoltar.Add_Click({
    $menuCCusto.Dispose()
    . .\rpcMenuPrincipal.ps1
}) 
$menuCCusto.Controls.Add($botaoMenuCCustoVoltar)