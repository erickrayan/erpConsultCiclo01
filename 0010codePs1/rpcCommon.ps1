<#
Nome: rpcCommon.ps1
Descricao: Objetos, variaveis e funcoes comuns a todos os otros arquivos
versao: 221128

#>


##### FUNCOES
function fnPastaTrabalho {
    $nomePath = (split-path (Get-Item $PSCommandPath).Fullname)
    Set-Location $nomePath
    $pathData = $nomePath.Substring(0, $nomePath.lastIndexOf('\')) + $folderData
    }

    
function fnBuscaSG($nmTab){

    foreach ($linha in Get-Content -path ($pathData + "\tbSG.txt")){ 
        if(($linha -split " \| ")[2] -eq $nmTab){
            return ($linha -split " \| ")[3]
        }
    }
    return "tabela não encontrada"

}

function fnIncrementaSG($nmTab){
    $text=Get-Content -path ($pathData + "\tbSG.txt")
    $cont=0
    foreach ($linha in $text){
        if(($linha -split " \| ")[2] -eq $nmTab){

           $novaLinha = (($text[$cont]) -split " \| ")[0] + " | "
           $novaLinha+= (($text[$cont]) -split " \| ")[1] + " | "
           $novaLinha+= (($text[$cont]) -split " \| ")[2] + " | "

           $proximo = [int](($text[$cont]) -split " \| ")[3] #variavel recebe o ultimo valor da linha encontrada
           $proximo++ #e eh incrementada

           $novaLinha+= $proximo #agora nova linha já com o valor incrementado

           $text[$cont]=$novaLinha #inserida a nova linha no array

           Set-Content -Value $text -Path ($pathData + "\tbSG.txt") #adicionado novo array no arquivo texto
           
           return $proximo
        }
        $cont++
    }


    Write-Host "Falha ao incrementar. Tabela nao encontrada"

}


##### PARAMETROS
$folderData = "\0020data"
$folderCodePs1 = "\0010codePs1"


##### PROCESSAMENTO INICIAL

$nomePath = (split-path (Get-Item $PSCommandPath).Fullname)
Set-Location $nomePath
$pathData = $nomePath.Substring(0, $nomePath.lastIndexOf('\')) + $folderData









# funcao fnBuscaSG(nmTab) - pendente construir

# funcao fnIncrementaSG(nmTab) - pendente construir


##### USO DAS VARIAVEIS

#Write-Host $folderData
#Write-Host $folderCodePs1
#Write-Host $pathData
