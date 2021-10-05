#!/bin/bash

#set -x
Thang01="1ubR2BqEFutgHtBMIrpEz7FWvfY-_rJvo"
Thang02="1ulVfVr5Uf9TMNW8g20IS5Ll7gMFyeMjj"
Thang03="1un4KDCvD-SBT_VFlV135y3Wim7xSKJGb"
Thang04="1uoUpW3xnnGEK1l3pS_3l6RfN8ez6zUAW"
Thang05="1uodfFjzeM-AEpFmsxvDJrp1vr1k0wzmN"
Thang06="1uuIPkcUxqYCVTEeM8-9bwN3NXaLLirtl"
Thang07="1uxQIeBa32Mh0kY73my5dyb59mkG2vTAJ"
Thang08="1uxiGPELv3L9JUYxv-psLYYSuzsN_4RVz"
Thang09="1uxqui_MpNNRySEOURCSVz6qj4vXD0GTF"
Thang10="1v2PL32P7XXy2kVHn2jcKDMa8q3qwMe95"
Thang11="1v8PeYx9I_xtBhsgTHVtV6FrHZ5dk3bcc"
Thang12="1v9Pk6IQt0cAF0WI_ouPH_9nR8B2ZAmWx"

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