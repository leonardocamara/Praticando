#!/bin/bash
echo \"Bem vindo $USER\"
sudo su -
sudo userdel eagletote#ns
echo \"criando usuario eagletotens\"
sudo adduser eagletotens;
echo \"dando super permissao\"
sudo usermod -aG sudo eagletotens;
echo \"upgrade e update\"
sudo apt upgrade && sudo apt update -y
echo \"aqui\"
echo \"se faz necessário instalar a GUI, iniciando...\"
sudo apt-get install xrdp lxde-core lxde tigervnc-standalone-server -y;
java -version
if [ $? -eq 0 ]
then
echo \"java instalado\"
else
echo \"java não instalado\"
echo \"gostaria de instalar o java? S/n \"
read inst
if [ \"$inst\" == \"s\" ]
then
echo \"voce escolheu instalar o java\"
sleep 2
echo \"Aqui estamos adicionando o repositório java\"
sudo add-apt-repository ppa:openjdk-r/ppa -y
clear
echo \"Atualizando gerenciador de pacotes\"
sleep 2
apt-get update -y
clear
echo \"preparando para instalar versão 8\"
sudo apt install default-jdk
clear
echo \"java instalado versão 8\"
else echo \"você escolheu não instalar\"
fi
fi
echo \"Clonando repositório\"
git clone https://github.com/leonardocamara/Praticando.git -y
cd Praticando
chmod a+rx eagle-back-1.0-SNAPSHOT-jar-with-dependencies.jar
java -jar eagle-back-1.0-SNAPSHOT-jar-with-dependencies.jar
