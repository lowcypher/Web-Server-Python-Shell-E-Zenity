#!/bin/bash
#
#Script para modulo simple http server do python 2.7.12
#Habilitando o servidor para compartilhamento de arquivos
#Com opcao de escolha de diretorios do usuario corrente
#
#Autor: Mario Medeiros
#Site: www.mariomedeiros.eti.br
#Data: 2018-09-04
#Versao: 0.1-Z
#############################################################

dir=$(zenity --file-selection --directory)

pushd "$dir";
python -m SimpleHTTPServer | zenity --progress --text="WebServer Python Habilitado $dir" --pulsate --auto-kill &
popd;

(RUNNING=0
while [ $RUNNING -eq 0 ]
do
if [ -z "$(pidof zenity)" ]
    then
    pkill -9 python
    RUNNING=1
fi
done
)
