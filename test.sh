#!/bin/bash

function c_echo(){
  echo -e "\033[32m $1 \033[0m"; tput sgr0
}

function execute()
{
  c_echo "Carregando dados"

  contador=0
  arquivos=

  cd tests/input/$1

  for i in *
  do
    arquivos[$contador]=$i
    let "contador = contador + 1"
  done

  cd .. 
  cd ..
  cd ..

  mkdir -p tests/results

  for arquivo in ${arquivos[@]}; do
    c_echo "Executando: $arquivo"
    ./$1 < tests/input/$1/$arquivo > tests/results/$arquivo
    c_echo "Comparando Resposta"
    diff tests/output/resp_$1/$arquivo tests/results/$arquivo
    echo "-----------------------------------------------"
  done
  rm -rf tests/results
}


echo "-----------------------------------------------"
c_echo "Executando Teste de Isomorfismo em Grafos"
echo "-----------------------------------------------"

execute "isomorfos"

echo "|||||||||||||||||||||||||||||||||||||||||||||||"

echo "-----------------------------------------------"
c_echo "Executando Busca em Largura"
echo "-----------------------------------------------"

#execute "k-conexo"






