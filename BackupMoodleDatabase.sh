############################################
#  Objetivo: Backup Moodle Database        #
#  Autor: Vagner Carvalho                  #
#  Data Criacao: 23/05/2018                #
#  Ultima Alteração: 23/05/2018            #
############################################

#!/bin/bash
echo "Inciando Backup Moodle Database"

dia=$(date +%d)
mes=$(date +%m)
ano=$(date +%Y)

mount -t cifs -o username=usuario,password=senha //192.168.0.4/pasta /mnt/storage/

destino1=/mnt/storage/BackupMoodleDatabase

########## Cria as Pasta ###################
d_destino1=$destino1/$ano/$mes/$dia
if [ ! -d $d_destino1 ]
then 
mkdir -m 755 -p $d_destino1
else 
echo "Diretorio ja exite"
fi
############################################

########## Fazendo o DUMP do Banco #########
mysqldump -u usuario -p senha moodle > $d_destino1/backup_moodle.sql
#####


#########  Desmontando Unidade #############
cd
umount /mnt/storage
echo "Finalizado Backup Moodle Database"
############################################
