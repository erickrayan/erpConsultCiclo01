<#
Nome: rpcCentrosDeCustoForm.ps1
Descricao: Criacao de objetos para o formulario de centros de custo
versao: 221229

#>

#Janela principal
$formCcusto = New-Object System.Windows.Forms.Form
$formCcusto.text = "Centro de custo"
$formCcusto.size = New-Object System.Drawing.Size(350,480)
$formCcusto.StartPosition = "CenterScreen"

#Label c�digo da centro de custo
$labelcodCcusto = New-Object System.Windows.Forms.Label
$labelcodCcusto.Text = "Digite o c�digo do centro de custo:"
$labelcodCcusto.Location =  New-Object System.Drawing.Size(20,85)
$labelcodCcusto.AutoSize = $true
$formCcusto.Controls.Add($labelcodCcusto)

#Label com o c�digo sgConta gerado automaticamente
$labelSgCcusto = New-Object System.Windows.Forms.Label
$labelSgCcusto.Location =  New-Object System.Drawing.Size(23,122)
$labelSgCcusto.AutoSize = $true
$formCcusto.Controls.Add($labelSgCcusto)

#Label Descri��o centro de custo
$labelDescrCcusto = New-Object System.Windows.Forms.Label
$labelDescrCcusto.Text = "Digite descri��o do centro de custo:"
$labelDescrCcusto.Location =  New-Object System.Drawing.Size(20,175) #antes 95y
$labelDescrCcusto.AutoSize = $true
$formCcusto.Controls.Add($labelDescrCcusto)

#Caixa de texto c�digo do centro de custo
$textboxCodCcusto = New-Object System.Windows.Forms.TextBox
$textboxCodCcusto.Location = New-Object System.Drawing.Size(103,120)
$textboxCodCcusto.Size = New-Object System.Drawing.Size(205,20)
$formCcusto.Controls.Add($textboxCodCcusto)

#Caixa de texto descri��o de centro de custo
$textboxDescrCcusto = New-Object System.Windows.Forms.TextBox
$textboxDescrCcusto.Location = New-Object System.Drawing.Size(22,210) #antes 130y
$textboxDescrCcusto.Size = New-Object System.Drawing.Size(286,20)
$formCcusto.Controls.Add($textboxDescrCcusto)

#bot�o cancelar 
$botaoVoltarCcusto = New-Object System.Windows.Forms.Button 
$botaoVoltarCcusto.Location = New-Object System.Drawing.Size(130,390)
$botaoVoltarCcusto.Size = New-Object System.Drawing.Size(100,20)
$botaoVoltarCcusto.Text = "Voltar"
$formCcusto.Controls.Add($botaoVoltarCcusto)

#bot�o ok
$botaoOkCcusto = New-Object System.Windows.Forms.Button #bot�o ok
$botaoOkCcusto.Location = New-Object System.Drawing.Size(20,390)
$botaoOkCcusto.Size = New-Object System.Drawing.Size(100,20)
$botaoOkCcusto.Text = "Ok"
$formCcusto.Controls.Add($botaoOkCcusto)

