$nomePath = (split-path (Get-Item $PSCommandPath).Fullname)
Set-Location $nomePath
$pathData = $nomePath.Substring(0, $nomePath.lastIndexOf('\')) + "\Data"

. .\rpcContaContabilForm.ps1 #carrega os comandos para a interface grafica

$data = @(
[pscustomobject]@{NomeCod='Conta';TamanhoCod=9;TipoCod='Receita';PrefixCod='1'}
[pscustomobject]@{NomeCod='Conta';TamanhoCod=9;TipoCod='Despesa';PrefixCod='2'}
[pscustomobject]@{NomeCod='CentroCusto';TamanhoCod=7}
)

$botaoOk.Add_click({ #essa parte eh executada ao clicar no botao ok
    if ("" -eq $textboxDescrConta.Text -or $textboxCodConta.Text.Length -ne $listboxTipoConta.SelectedItem.TamanhoCod){
        [System.Windows.MessageBox]::Show('Preencha todos os campos com valores validos.', 'Erro')
    }
    else{
        $cont=0
        foreach ($linha in Get-Content -path ($pathdata +"\tbSgConta.txt")){ #verifica se ja existe algum codigo de conta igual
            if(($linha -split " \| ")[1] -eq $textboxCodConta.text){
                $cont++
                break
            }
        }
        if($cont -ne 0){
            [System.Windows.MessageBox]::Show('Conta ja existente.')
        }
        else{ #se estiver tudo correto

            #preenche variaveis para adicionar no arquivo
            $sgconta=(Get-Content -path ($pathdata + "\ixSgConta.txt"))
            $cdConta=$textboxCodConta.Text
            $dsConta=$textboxDescrConta.Text
            
            if ($radiobuttonContaAtiva.Checked){ #se o status for ativo
                [string]$stConta=01
            }
            else { #se o status for inativo
                [string]$stConta=02
            }

            Add-Content -Value "$sgconta | $cdConta | $dsConta | $stConta" -Path ($pathdata +"\tbSgConta.txt")

            $ultimo=(Get-Content -path ($pathdata +"\ixSgConta.txt")) #variavel recebe conteudo do texto
            [int]$ultimo=$ultimo #variavel eh convertida para int
            $ultimo++ #e eh incrementada
            [string]$ultimo=([string]$ultimo).PadLeft(4,'0') #variavel volta a ser string padronizada com zeros a esquerda
            Clear-Content -path ($pathdata +"\ixSgConta.txt")
            Add-Content -Value $ultimo -Path ($pathdata +"\ixSgConta.txt")
            $labelSgConta.Text = "sgConta: " + $ultimo + ":"

            
            [System.Windows.MessageBox]::Show('Conta adicionada.')
        }
    }
})

$textboxCodConta.Add_TextChanged({ #evento acionado toda vez que a caixa de texto eh modificada

    $this.Text = $this.Text -replace '\D' #substitui qualquer item nao decimal por vazio
    $this.Select($this.Text.Length, 0); #coloca o cursor de volta no final do texto
    
    if($this.Text.Length -ne 0){ #se a caixa de texto nao estiver vazia
            $this.Text=$this.Text.Remove(0,1).Insert(0,$listboxTipoConta.SelectedItem.PrefixCod) #troca o primeiro caracter
    }
    else{
        $this.Text = 1
    }
})

$listboxTipoConta.add_SelectedIndexChanged({ #ativado ao mudar a selecao da listbox

    #ativa os elementos de entrada
    $labelSgConta.Enabled =        $true
    $labelCodConta.Enabled =       $true
    $labelDescrConta.Enabled =     $true
    $textboxCodConta.Enabled =     $true
    $textboxDescrConta.Enabled =   $true
    $groupboxStatusConta.Enabled = $true

    $textboxCodConta.MaxLength = $listboxTipoConta.SelectedItem.TamanhoCod #define a capacidade maxima de caracteres da caixa de texto
     
    if($textboxCodConta.Text.Length -eq 0){ #impossibilitar caixa de texto vazia
        $textboxCodConta.Text = 1
    } 
    else{
        $textboxCodConta.Text=$textboxCodConta.Text.Remove(0,1).Insert(0, $listboxTipoConta.SelectedItem.PrefixCod)
    }
    

    
    $digitos = $listboxTipoConta.SelectedItem.TamanhoCod
    $labelCodConta.Text = "Digite o codigo da conta com $digitos digitos :"
})



$listboxTipoConta.DisplayMember = "TipoCod"

$botaoSalvar.Add_click({
    if ($openFileDialog.ShowDialog() -eq "OK"){
        $labelSalvo.Text = $OpenFileDialog.FileName #remover essa linha
        [System.Windows.MessageBox]::Show("Arquivo salvo em: $($OpenFileDialog.FileName)", 'Sucesso') #teste

    }
    
})



$labelSgConta.Text = "sgConta: " + (Get-Content -path ($pathdata +"\ixSgConta.txt")) + ":" #preenche o label

foreach ($item in $data) {
    if($item.NomeCod -eq 'Conta' ){
        [void]$listboxTipoConta.Items.Add($item)
    }
}

[void]$formContabil.ShowDialog()