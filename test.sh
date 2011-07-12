#!/bin/bash

function c_echo(){
  echo -e "\033[32m $1 \033[0m"; tput sgr0
}

function execute()
{
  mkdir -p testes/resultados
  
  for arquivo in ${arquivos[@]}; do
    c_echo "Executando: $arquivo"
    ./$1 < testes/entradas/$arquivo > testes/resultados/$arquivo
    c_echo "Comparando Resposta"
    diff testes/resp_$1/$arquivo testes/resultados/$arquivo
    echo "-----------------------------------------------"
  done
  rm -rf testes/resultados
}

c_echo "Carregando dados"

contador=0
arquivos=

cd testes/entradas

for i in *
do
  arquivos[$contador]=$i
  let "contador = contador + 1"
done

cd .. 
cd ..

echo "-----------------------------------------------"
c_echo "Executando Busca em Profundidade"
echo "-----------------------------------------------"

execute "dfs"

echo "|||||||||||||||||||||||||||||||||||||||||||||||"

echo "-----------------------------------------------"
c_echo "Executando Busca em Largura"
echo "-----------------------------------------------"

execute "bfs"






