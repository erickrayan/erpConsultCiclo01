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
$menu.size = New-Object System.Drawing.Size(350,240)
$menu.StartPosition = "CenterScreen"



#Label menu
$mLabel = New-Object System.Windows.Forms.Label
$mLabel.Text = "Menu principal"
$mLabel.Location =  New-Object System.Drawing.Size(20,15)
$mLabel.AutoSize = $true
$menu.Controls.Add($mLabel)

#botão inserir conta contabil
$CContabeis = New-Object System.Windows.Forms.Button 
$CContabeis.Location = New-Object System.Drawing.Size(20,50)
$CContabeis.Size = New-Object System.Drawing.Size(130,40)
$CContabeis.Text = "Contas contabeis"
$menu.Controls.Add($CContabeis)



#botão inserir centro de custo
$CCusto = New-Object System.Windows.Forms.Button 
$CCusto.Location = New-Object System.Drawing.Size(180,50)
$CCusto.Size = New-Object System.Drawing.Size(130,40)
$CCusto.Text = "Centros de custo"
$menu.Controls.Add($CCusto)

#botao fechar
$botaoMenuVoltar = New-Object System.Windows.Forms.Button 
$botaoMenuVoltar.Location = New-Object System.Drawing.Size(210,120)
$botaoMenuVoltar.Size = New-Object System.Drawing.Size(100,20)
$botaoMenuVoltar.Text = "Fechar"
#$botaoFormAlterarCancelar.Add_Click({$formAlterarContabil.Tag = $formAlterarContabil.close()}) 
$botaoMenuVoltar.Add_Click({
    $menu.Dispose()
}) 
$menu.Controls.Add($botaoMenuVoltar)




