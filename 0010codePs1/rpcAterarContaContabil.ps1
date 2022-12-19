<#
Nome: rpcAterarContaContabil.ps1
Descricao: Menu de alteração de contas contabeis
versao: 221128

#>

$nomePath = (split-path (Get-Item $PSCommandPath).Fullname)
Set-Location $nomePath
$pathData = $nomePath.Substring(0, $nomePath.lastIndexOf('\')) + $folderData

. .\rpcAterarContaContabilForm.ps1 #carrega os comandos para a interface grafica



class Conta { #objeto para adicionar na lista
    [string]$sgConta
    [string]$codConta
    [string]$descrConta
    [string]$stConta
    [string]$display; #variavel estetica

 }

$listboxFormAlterarConta.add_SelectedIndexChanged({ #ativado ao mudar a selecao da listbox

    #ativa os elementos de entrada
    $labelFormAlterarConta.Enabled =          $true
    $labelFormAlterarCodConta.Enabled =       $true
    $labelFormAlterarDescrConta.Enabled =     $true
    $textboxFormAlterarCodConta.Enabled =     $true
    $textboxFormAlterarDescrConta.Enabled =   $true
    $groupboxFormAlterarStatusConta.Enabled = $true

    $digitos = $listboxFormAlterarConta.SelectedItem.codConta.Length
    $primeiroDigito = $listboxFormAlterarConta.SelectedItem.codConta.Substring(0,1)
    $labelFormAlterarCodConta.Text = "Codigo da conta com $digitos digitos :"

    $textboxFormAlterarCodConta.MaxLength = $digitos #define a capacidade maxima de caracteres da caixa de texto
     
    if($textboxFormAlterarCodConta.Text.Length -eq 0){ #impossibilitar caixa de texto vazia
        $textboxFormAlterarCodConta.Text = 1
    } 
    else{
        $textboxFormAlterarCodConta.Text=$textboxFormAlterarCodConta.Text.Remove(0,1).Insert(0, $primeiroDigito)
    }

    $textboxFormAlterarCodConta.Text=$listboxFormAlterarConta.SelectedItem.codConta
    $textboxFormAlterarDescrConta.Text=$listboxFormAlterarConta.SelectedItem.descrConta
    if($listboxFormAlterarConta.SelectedItem.stConta -eq 1){
        $radiobuttonFormAlterarContaAtiva.Checked = $true
    }
    else{
        $radiobuttonFormAlterarContaInativa.Checked = $true
    }

})


$textboxFormAlterarCodConta.Add_TextChanged({ #evento acionado toda vez que a caixa de texto eh modificada

    $this.Text = $this.Text -replace '\D' #substitui qualquer item nao decimal por vazio
    $this.Select($this.Text.Length, 0); #coloca o cursor de volta no final do texto

    $primeiroDigito = $listboxFormAlterarConta.SelectedItem.codConta.Substring(0,1)
    
    if($this.Text.Length -ne 0){ #se a caixa de texto nao estiver vazia
            $this.Text=$this.Text.Remove(0,1).Insert(0, $primeiroDigito) #troca o primeiro caracter
    }
    else{
        $this.Text = 1
    }
})



$counter=0
foreach ($linha in Get-Content -path ($pathdata +"\tbConta.txt")){
    
    if($counter++ -eq 0){continue} #pula a primeira iteracao
    
    #Adiciona cada linha do txt como um objeto da lista
    $item= ([Conta]@{
        sgConta=    (($linha -split " \| ")[0]);
        codConta=   (($linha -split " \| ")[1]);
        descrConta= (($linha -split " \| ")[2]);
        stConta=    (($linha -split " \| ")[3]);
        display=    (($linha -split " \| ")[1] + "    " + ($linha -split " \| ")[2]) #variável estética

    })

    [void]$listboxFormAlterarConta.Items.Add($item)
}

$listboxFormAlterarConta.DisplayMember = "display"

if (-not (Test-Path -path ($pathdata +"\tbConta.txt") -PathType Leaf)){ #Caso não exista, arquivo é criado
    set-Content -Value "sgConta| cdConta | dsConta| stConta" -Path ($pathdata +"\tbConta.txt")
    [System.Windows.MessageBox]::Show('Arquivo tbConta.txt nao existia e, portanto, foi criado.')
}

[void]$formAlterarContabil.ShowDialog()