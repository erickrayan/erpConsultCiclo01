<#
Nome: rpcMenuPrincipalForm.ps1
Descricao: Criacao de objetos para o formulario do menu
versao: 221128

#>

Add-Type -AssemblyName System.Windows.forms
Add-Type -Assemblyname System.Drawing
Add-Type -AssemblyName PresentationFramework #para janelas de erro ou sucesso




#menu ####################################################################################################################
#Janela principal menu
$menu = New-Object System.Windows.Forms.Form
#$menu.text = "Menu principal"
$menu.size = New-Object System.Drawing.Size(350,200)
$menu.StartPosition = "CenterScreen"



#Label menu
$mLabel = New-Object System.Windows.Forms.Label
$mLabel.Text = "Menu principal"
$mLabel.Location =  New-Object System.Drawing.Size(20,15)
$mLabel.AutoSize = $true
$menu.Controls.Add($mLabel)

#botão inserir conta contabil
$inserirCContabeis = New-Object System.Windows.Forms.Button 
$inserirCContabeis.Location = New-Object System.Drawing.Size(20,50)
$inserirCContabeis.Size = New-Object System.Drawing.Size(130,40)
$inserirCContabeis.Text = "Cadastrar contas contabeis"
$menu.Controls.Add($inserirCContabeis)

#botão inserir centro de custo
$inserirCCusto = New-Object System.Windows.Forms.Button 
$inserirCCusto.Location = New-Object System.Drawing.Size(180,50)
$inserirCCusto.Size = New-Object System.Drawing.Size(130,40)
$inserirCCusto.Text = "Cadastrar centros de custo"
$menu.Controls.Add($inserirCCusto)




