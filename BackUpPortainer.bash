#!/bin/bash

#set -x

Thang12="1vpywAIDTcNaDiOS8VpM4Jfoasd3iWMFf"
Thang11="1vjjz1j2PvrxiRDHMig7VOE03abIFiOPv"
Thang10="1vbLU0iJxm5V-E3daqE81E5dVE_Hrjlnf"
Thang09="1v_wRATpBUqa2aUAKXmSJb7OaOECFB4oG"
Thang08="1vZEflnkI0suybX9X0xKrnvhKyKEPqmyR"
Thang07="1vY-WlMCwQ1mMovdk5UpS8nLE9ktgoy16"
Thang06="1vX--R_GYCMG04pBaZV4G4IRop6WeiS4v"
Thang05="1vPWogIgF-6YAI8GF2ZaHaDJu12sZ7Z89"
Thang04="1vPEV7asaF6GPKrj0YCj1xAXy9NLr-v74"
Thang03="1vOXJHslGMgFvkSD560uai1nyN__Ogar3"
Thang02="1vGLeP-FdqWj9VUkTlgB2erq8mdTuiAiv"
Thang01="1vE2ZwbOBq7BsNK3jRqV4BrfYoKLGN_5f"

thismonth=$(date +%B)
today=$(date +%F)
GDRIVE=/home/holao09/go/bin/gdrive
case $thismonth in

        January)
            backupfolder=$($GDRIVE mkdir $today -p $Thang01 | awk '{print $2}')
        ;;
        February)
            backupfolder=$($GDRIVE mkdir $today -p $Thang02 | awk '{print $2}')
        ;;
        March)
            backupfolder=$($GDRIVE mkdir $today -p $Thang03 | awk '{print $2}')
        ;;
        April)
            backupfolder=$($GDRIVE mkdir $today -p $Thang04 | awk '{print $2}')
        ;;
        May)
            backupfolder=$($GDRIVE mkdir $today -p $Thang05 | awk '{print $2}')
        ;;
        June)
            backupfolder=$($GDRIVE mkdir $today -p $Thang06 | awk '{print $2}')
        ;;
        July)
            backupfolder=$($GDRIVE mkdir $today -p $Thang07 | awk '{print $2}')
        ;;
        August)
            backupfolder=$($GDRIVE mkdir $today -p $Thang08 | awk '{print $2}')
        ;;
        September)
            backupfolder=$($GDRIVE mkdir $today -p $Thang09 | awk '{print $2}')
        ;;
        October)
            backupfolder=$($GDRIVE mkdir $today -p $Thang10 | awk '{print $2}')
        ;;
        November)
            backupfolder=$($GDRIVE mkdir $today -p $Thang11 | awk '{print $2}')
        ;;
        December)
            backupfolder=$($GDRIVE mkdir $today -p $Thang12 | awk '{print $2}')
        ;;
esac

#backup all container
cd /backup && sudo /home/holao09/go/bin/docker-backup backup --tar --all && sudo chmod 777 /backup && sudo chown holao09:holao09 /backup/*.tar
todaybackup=$(ls /backup/ |grep ".tar")

for filename in $todaybackup
do
    $GDRIVE upload /backup/$filename -p $backupfolder && rm -rf "$filename"
done