#!/bin/sh
######################################################################################
# Description:	Calculates the LOC for all git repositories below the passed folder
#
# Author: 	Christian Zirkelbach (czi@informatik.uni-kiel.de)
# Date: 	01.03.2018
######################################################################################

# check if parameters are passed
if [ $# -eq 0 ]; then
	echo 'Usage: ' $0 ' DOWNLOADFOLDER USERNAME [ORGANIZATIONNAME]'
	exit 1
fi

# variables
FOLDER=$1
USERNAME=$2
ORGANIZATIONNAME=$3
PATH_GITIM='./gitim'
PATH_CLOC='./cloc/cloc'

LOGFILE='results.log'

# clone git repositories with gitim
if [ -z "$3" ]; then
	cd $PATH_GITIM; python3 -m gitim -u $USERNAME -d $FOLDER; cd ..
else
 	cd $PATH_GITIM; python3 -m gitim -u $USERNAME -o $ORGANIZATIONNAME -d $FOLDER; cd ..
fi

# retrieve LOC with cloc
for d in ./$FOLDER/*/ ; do (cd "$d" && echo "$d" && ../../$PATH_CLOC --vcs git); done > ../../$LOGFILE; cd ../..

# calculate LOC
ALLLOC=`cat $LOGFILE | grep SUM | awk -F ' ' '{sum+=$5} END {print sum}'`
BLANKS=`cat $LOGFILE | grep SUM | awk -F ' ' '{sum+=$3} END {print sum}'`
COMMENTS=`cat $LOGFILE | grep SUM | awk -F ' ' '{sum+=$4} END {print sum}'`

result=`expr $ALLLOC - $BLANKS - $COMMENTS`

cat $LOGFILE

echo 'LOC ['$1'./*] (without comments and blanks):' $result
