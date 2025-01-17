<#
Nome: rpcAterarContaContabilForm.ps1
Descricao: Criacao de objetos para o formulario de alteracao de contas contabeis
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
$labelFormAlterarCodConta.Location =  New-Object System.Drawing.Size(20,165)
$labelFormAlterarCodConta.AutoSize = $true
$labelFormAlterarCodConta.Enabled = $false
$formAlterarContabil.Controls.Add($labelFormAlterarCodConta)

#Label Descricao conta
$labelFormAlterarDescrConta = New-Object System.Windows.Forms.Label
$labelFormAlterarDescrConta.Text = "Descricao da conta contabil:"
$labelFormAlterarDescrConta.Location =  New-Object System.Drawing.Size(20,255) #antes 95y
$labelFormAlterarDescrConta.AutoSize = $true
$labelFormAlterarDescrConta.Enabled = $false
$formAlterarContabil.Controls.Add($labelFormAlterarDescrConta)

#Caixa de texto codigo da conta
$textboxFormAlterarCodConta = New-Object System.Windows.Forms.TextBox
#$textboxFormAlterarCodConta.Minimum = 10000000
#$textboxFormAlterarCodConta.Maximum = 29999999
#$textboxFormAlterarCodConta.Value   = 10000001
#$textboxFormAlterarCodConta.Text = 1
$textboxFormAlterarCodConta.Location = New-Object System.Drawing.Size(22,200)
$textboxFormAlterarCodConta.Size = New-Object System.Drawing.Size(286,20)
$textboxFormAlterarCodConta.Enabled = $false
$formAlterarContabil.Controls.Add($textboxFormAlterarCodConta)

#Caixa de texto descricao de conta contabil
$textboxFormAlterarDescrConta = New-Object System.Windows.Forms.TextBox
$textboxFormAlterarDescrConta.Location = New-Object System.Drawing.Size(22,290) #antes 130y
$textboxFormAlterarDescrConta.Size = New-Object System.Drawing.Size(286,20)
$textboxFormAlterarDescrConta.Enabled = $false
$formAlterarContabil.Controls.Add($textboxFormAlterarDescrConta)

#botao voltar
$botaoFormAlterarCancelar = New-Object System.Windows.Forms.Button 
$botaoFormAlterarCancelar.Location = New-Object System.Drawing.Size(130,390)
$botaoFormAlterarCancelar.Size = New-Object System.Drawing.Size(100,20)
$botaoFormAlterarCancelar.Text = "Voltar"
#$botaoFormAlterarCancelar.Add_Click({$formAlterarContabil.Tag = $formAlterarContabil.close()}) 
$formAlterarContabil.Controls.Add($botaoFormAlterarCancelar)

#botao ok
$botaoFormAlterarOk = New-Object System.Windows.Forms.Button #botao ok
$botaoFormAlterarOk.Location = New-Object System.Drawing.Size(20,390)
$botaoFormAlterarOk.Size = New-Object System.Drawing.Size(100,20)
$botaoFormAlterarOk.Text = "Salvar"
$formAlterarContabil.Controls.Add($botaoFormAlterarOk)

#Groupbox para botoes radiais status da conta
$groupboxFormAlterarStatusConta = New-Object System.Windows.Forms.GroupBox 
$groupboxFormAlterarStatusConta.Location = New-Object System.Drawing.Size(20,325)
$groupboxFormAlterarStatusConta.Size = New-Object System.Drawing.Size(286, 50)
$groupboxFormAlterarStatusConta.Text = "Status da conta"
$groupboxFormAlterarStatusConta.Enabled = $false
$formAlterarContabil.Controls.Add($groupboxFormAlterarStatusConta)

#Groupbox para botoes radiais exibir somente
$groupboxExibirSomente = New-Object System.Windows.Forms.GroupBox 
$groupboxExibirSomente.Location = New-Object System.Drawing.Size(20,20)
$groupboxExibirSomente.Size = New-Object System.Drawing.Size(286, 50)
$groupboxExibirSomente.Text = "Exibir somente:"
$formAlterarContabil.Controls.Add($groupboxExibirSomente)

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

$radiobuttonExibirSomenteAtivas = New-Object System.Windows.Forms.RadioButton
$radiobuttonExibirSomenteAtivas.Location = '11,20'
$radiobuttonExibirSomenteAtivas.size = '99,20'
$radiobuttonExibirSomenteAtivas.Text = "Contas ativas"

$radiobuttonExibirSomenteInativas = New-Object System.Windows.Forms.RadioButton
$radiobuttonExibirSomenteInativas.Location = '110,20'
$radiobuttonExibirSomenteInativas.size = '120,20'
$radiobuttonExibirSomenteInativas.Checked = $false
$radiobuttonExibirSomenteInativas.Text = "Contas inativas"
$groupboxExibirSomente.Controls.AddRange(@($radiobuttonExibirSomenteAtivas,$radiobuttonExibirSomenteInativas))

#Label alterar Conta
$labelFormAlterarConta = New-Object System.Windows.Forms.Label
$labelFormAlterarConta.Text = "Selecione a conta a ser alterada:"
$labelFormAlterarConta.Location =  New-Object System.Drawing.Size(20,95)
$labelFormAlterarConta.AutoSize = $true
$formAlterarContabil.Controls.Add($labelFormAlterarConta)

#combobox Tipo de Conta
$listboxFormAlterarConta = New-Object System.Windows.Forms.ComboBox
$listboxFormAlterarConta.Location = New-Object System.Drawing.Size(20,122)
$listboxFormAlterarConta.Size = New-Object System.Drawing.Size(260,20)
$listboxFormAlterarConta.Height = 80
$listboxFormAlterarConta.DropDownStyle = [System.Windows.Forms.ComboBoxStyle]::DropDownList
$formAlterarContabil.Controls.Add($listboxFormAlterarConta)
