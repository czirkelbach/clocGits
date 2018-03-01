#!/bin/sh
#######################################################################
# Description:  Installs the dependecies for the LOC counter
#
# Author:       Christian Zirkelbach (czi@informatik.uni-kiel.de)
# Date:         01.03.2018
######################################################################


#!/bin/sh

git clone https://github.com/AlDanial/cloc.git
git clone https://github.com/muhasturk/gitim.git

echo "Please install python3 and afterwards execute [cd ./gitim; python3 setup.py install;cd ..]!"
