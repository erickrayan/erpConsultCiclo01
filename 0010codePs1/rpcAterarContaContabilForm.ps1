<#
Nome: rpcAterarContaContabilForm.ps1
Descricao: Criacao de objetos para o formulario de alteração de contas contabeis
versao: 221204

#>

#Janela principal
$formAlterarContabil = New-Object System.Windows.Forms.Form
$formAlterarContabil.text = "Alterar conta contabil"
$formAlterarContabil.size = New-Object System.Drawing.Size(350,480)
$formAlterarContabil.StartPosition = "CenterScreen"

#Label codigo da conta
$labelFormAlterarCodConta = New-Object System.Windows.Forms.Label
$labelFormAlterarCodConta.Text = "Codigo da conta:"
$labelFormAlterarCodConta.Location =  New-Object System.Drawing.Size(20,85)
$labelFormAlterarCodConta.AutoSize = $true
$labelFormAlterarCodConta.Enabled = $false
$formAlterarContabil.Controls.Add($labelFormAlterarCodConta)

#Label Descricao conta
$labelFormAlterarDescrConta = New-Object System.Windows.Forms.Label
$labelFormAlterarDescrConta.Text = "Descricao da conta contabil:"
$labelFormAlterarDescrConta.Location =  New-Object System.Drawing.Size(20,175) #antes 95y
$labelFormAlterarDescrConta.AutoSize = $true
$labelFormAlterarDescrConta.Enabled = $false
$formAlterarContabil.Controls.Add($labelFormAlterarDescrConta)

#Caixa de texto codigo da conta
$textboxFormAlterarCodConta = New-Object System.Windows.Forms.TextBox
#$textboxFormAlterarCodConta.Minimum = 10000000
#$textboxFormAlterarCodConta.Maximum = 29999999
#$textboxFormAlterarCodConta.Value   = 10000001
#$textboxFormAlterarCodConta.Text = 1
$textboxFormAlterarCodConta.Location = New-Object System.Drawing.Size(22,120)
$textboxFormAlterarCodConta.Size = New-Object System.Drawing.Size(286,20)
$textboxFormAlterarCodConta.Enabled = $false
$formAlterarContabil.Controls.Add($textboxFormAlterarCodConta)

#Caixa de texto descricao de conta contabil
$textboxFormAlterarDescrConta = New-Object System.Windows.Forms.TextBox
$textboxFormAlterarDescrConta.Location = New-Object System.Drawing.Size(22,210) #antes 130y
$textboxFormAlterarDescrConta.Size = New-Object System.Drawing.Size(286,20)
$textboxFormAlterarDescrConta.Enabled = $false
$formAlterarContabil.Controls.Add($textboxFormAlterarDescrConta)

#botao cancelar 
$botaoFormAlterarCancelar = New-Object System.Windows.Forms.Button 
$botaoFormAlterarCancelar.Location = New-Object System.Drawing.Size(130,390)
$botaoFormAlterarCancelar.Size = New-Object System.Drawing.Size(100,20)
$botaoFormAlterarCancelar.Text = "Fechar"
$botaoFormAlterarCancelar.Add_Click({$formAlterarContabil.Tag = $formAlterarContabil.close()}) 
$formAlterarContabil.Controls.Add($botaoFormAlterarCancelar)

#botao ok
$botaoFormAlterarOk = New-Object System.Windows.Forms.Button #botão ok
$botaoFormAlterarOk.Location = New-Object System.Drawing.Size(20,390)
$botaoFormAlterarOk.Size = New-Object System.Drawing.Size(100,20)
$botaoFormAlterarOk.Text = "Salvar"
$formAlterarContabil.Controls.Add($botaoFormAlterarOk)

#Groupbox para botoes radiais status da conta
$groupboxFormAlterarStatusConta = New-Object System.Windows.Forms.GroupBox 
$groupboxFormAlterarStatusConta.Location = New-Object System.Drawing.Size(20,245)
$groupboxFormAlterarStatusConta.Size = New-Object System.Drawing.Size(286, 50)
$groupboxFormAlterarStatusConta.Text = "Status da conta"
$groupboxFormAlterarStatusConta.Enabled = $false
$formAlterarContabil.Controls.Add($groupboxFormAlterarStatusConta)

$radiobuttonFormAlterarContaAtiva = New-Object System.Windows.Forms.RadioButton
$radiobuttonFormAlterarContaAtiva.Location = '11,20'
$radiobuttonFormAlterarContaAtiva.size = '99,20'
$radiobuttonFormAlterarContaAtiva.Checked = $true 
$radiobuttonFormAlterarContaAtiva.Text = "Ativo"

$radiobuttonFormAlterarContaInativa = New-Object System.Windows.Forms.RadioButton
$radiobuttonFormAlterarContaInativa.Location = '110,20'
$radiobuttonFormAlterarContaInativa.size = '80,20'
$radiobuttonFormAlterarContaInativa.Checked = $false
$radiobuttonFormAlterarContaInativa.Text = "Inativo"
$groupboxFormAlterarStatusConta.Controls.AddRange(@($radiobuttonFormAlterarContaAtiva,$radiobuttonFormAlterarContaInativa))

#Label alterar Conta
$labelFormAlterarConta = New-Object System.Windows.Forms.Label
$labelFormAlterarConta.Text = "Selecione a conta a ser alterada:"
$labelFormAlterarConta.Location =  New-Object System.Drawing.Size(20,15)
$labelFormAlterarConta.AutoSize = $true
$formAlterarContabil.Controls.Add($labelFormAlterarConta)

#combobox Tipo de Conta
$listboxFormAlterarConta = New-Object System.Windows.Forms.ComboBox
$listboxFormAlterarConta.Location = New-Object System.Drawing.Size(20,42)
$listboxFormAlterarConta.Size = New-Object System.Drawing.Size(260,20)
$listboxFormAlterarConta.Height = 80
$listboxFormAlterarConta.DropDownStyle = [System.Windows.Forms.ComboBoxStyle]::DropDownList
$formAlterarContabil.Controls.Add($listboxFormAlterarConta)
