#!/bin/bash
#clear
#echo "Google Time"
gtime=$(date -d "$(echo $(curl -I -s http://www.google.com | grep -E 'Date:' )| tail -c 26)" +"%s")
#echo $gtime;
#echo "Local Time"
#date --set="02 OCT 2010 00:00:00"
ltime=$(date +"%s")
#$echo $ltime
#echo "Difference"
#date --set="02 OCT 2010 00:00:00"
#date +%s -s @1371729865
#hwclock --systohc --localtime
timebuff=`expr 6 \* 3600`
#echo `expr $gtime + $timebuff`
gtimea=`expr $gtime + $timebuff`
diff=`expr $gtimea - $ltime`
echo $diff
if [ "$diff" -ne 0 ]; then
date +%s -s @$gtimea
hwclock --systohc --localtime
fi
