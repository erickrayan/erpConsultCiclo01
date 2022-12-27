<#
Nome: rpcAterarContaContabil.ps1
Descricao: Menu de alteracao de contas contabeis
versao: 221227

#>

$nomePath = (split-path (Get-Item $PSCommandPath).Fullname)
Set-Location $nomePath
$pathData = $nomePath.Substring(0, $nomePath.lastIndexOf('\')) + $folderData

. .\rpcCommon.ps1 
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
    #$textboxFormAlterarCodConta.Enabled =     $true
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

$botaoFormAlterarCancelar.Add_Click({
    $formAlterarContabil.Dispose()
    . .\rpcMenuContabil.ps1
}) 

$radiobuttonExibirSomenteAtivas.add_CheckedChanged({
    if ($radiobuttonExibirSomenteAtivas.Checked -eq $true ){  
    
        $listboxFormAlterarConta.Items.Clear()
        
        foreach ($linha in Get-Content -path ($pathdata +"\tbConta.txt")){
            if(($linha -split " \| ")[3] -eq "1"){
                #Adiciona cada linha do txt como um objeto da lista
                $item= ([Conta]@{
                sgConta=    (($linha -split " \| ")[0]);
                codConta=   (($linha -split " \| ")[1]);
                descrConta= (($linha -split " \| ")[2]);
                stConta=    (($linha -split " \| ")[3]);
                display=    (($linha -split " \| ")[1] + "    " + ($linha -split " \| ")[2]) #variavel estetica
                })
                [void]$listboxFormAlterarConta.Items.Add($item)
            }
        }
    }
})

$radiobuttonExibirSomenteInativas.add_CheckedChanged({
    if ($radiobuttonExibirSomenteInativas.Checked -eq $true ){  
        $listboxFormAlterarConta.Items.Clear()
        foreach ($linha in Get-Content -path ($pathdata +"\tbConta.txt")){
            if(($linha -split " \| ")[3] -eq "2"){
                #Adiciona cada linha do txt como um objeto da lista
                $item= ([Conta]@{
                sgConta=    (($linha -split " \| ")[0]);
                codConta=   (($linha -split " \| ")[1]);
                descrConta= (($linha -split " \| ")[2]);
                stConta=    (($linha -split " \| ")[3]);
                display=    (($linha -split " \| ")[1] + "    " + ($linha -split " \| ")[2]) #variavel estetica
                })
                [void]$listboxFormAlterarConta.Items.Add($item)
            }
        }
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
        display=    (($linha -split " \| ")[1] + "    " + ($linha -split " \| ")[2]) #variavel estetica
    })

    [void]$listboxFormAlterarConta.Items.Add($item)
}

$botaoFormAlterarOk.Add_Click({ #botao salvar
    if("" -eq $textboxFormAlterarDescrConta.Text){
        [System.Windows.MessageBox]::Show("A descricao nao pode estar vazia.")
        

    }
    else{

        if ($radiobuttonFormAlterarContaAtiva.Checked -eq $true) {$novoStatus="1"} else {$novoStatus="2"}

        $itemTemp = $listboxFormAlterarConta.SelectedItem #variavel para melhorar legibilidade das linhas abaixo
        $novaLinha = $itemTemp.sgConta + " | " + $itemTemp.codConta + " | " + $textboxFormAlterarDescrConta.Text  + " | " + $novoStatus
       
        $text=Get-Content -path ($pathData + "\tbConta.txt") #variavel recebe todo o conteudo do texto em forma de array
        $text[$itemTemp.sgConta]=$novaLinha #inserida a nova linha no array
        Set-Content -Value $text -Path ($pathData + "\tbConta.txt") #adicionado novo array no arquivo texto
        [System.Windows.MessageBox]::Show("Conta alterada com sucesso.")

        $formAlterarContabil.Dispose() #fecha a janela
        . .\rpcMenuContabil.ps1 #volta ao menu
       
    }
})

$listboxFormAlterarConta.DisplayMember = "display"




[void]$formAlterarContabil.ShowDialog()