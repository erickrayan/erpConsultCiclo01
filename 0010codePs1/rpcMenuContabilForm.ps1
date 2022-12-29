<#
Nome: rpcMenuPrincipalForm.ps1
Descricao: Criacao de objetos para o formulario do menu de contas contabeis
versao: 221221

#>

Add-Type -AssemblyName System.Windows.forms
Add-Type -Assemblyname System.Drawing
Add-Type -AssemblyName PresentationFramework #para janelas de erro ou sucesso

#menu ####################################################################################################################

$menuContabil = New-Object System.Windows.Forms.Form
$menuContabil.size = New-Object System.Drawing.Size(350,240)
$menuContabil.StartPosition = "CenterScreen"

#Label menu Contabil
$mContabilLabel = New-Object System.Windows.Forms.Label
$mContabilLabel.Text = "Contas contabeis"
$mContabilLabel.Location =  New-Object System.Drawing.Size(20,15)
$mContabilLabel.AutoSize = $true
$menuContabil.Controls.Add($mContabilLabel)

#botao inserir conta contabil
$inserirCContabeis = New-Object System.Windows.Forms.Button 
$inserirCContabeis.Location = New-Object System.Drawing.Size(20,50)
$inserirCContabeis.Size = New-Object System.Drawing.Size(130,40)
$inserirCContabeis.Text = "Cadastrar contas contabeis"
$menuContabil.Controls.Add($inserirCContabeis)

#botao alterar conta contabil
$alterarCContabeis = New-Object System.Windows.Forms.Button 
$alterarCContabeis.Location = New-Object System.Drawing.Size(180,50)
$alterarCContabeis.Size = New-Object System.Drawing.Size(130,40)
$alterarCContabeis.Text = "Alterar contas contabeis"
$menuContabil.Controls.Add($alterarCContabeis)

#botao voltar
$botaoMenuContabilVoltar = New-Object System.Windows.Forms.Button 
$botaoMenuContabilVoltar.Location = New-Object System.Drawing.Size(210,120)
$botaoMenuContabilVoltar.Size = New-Object System.Drawing.Size(100,20)
$botaoMenuContabilVoltar.Text = "Voltar"
$botaoMenuContabilVoltar.Add_Click({
    $menuContabil.Dispose()
    . .\rpcMenuPrincipal.ps1
}) 
$menuContabil.Controls.Add($botaoMenuContabilVoltar)