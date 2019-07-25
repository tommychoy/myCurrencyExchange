#!/bin/bash
function jsonval {
    temp=`echo $json | sed 's/\\\\\//\//g' | sed 's/[{}]//g' | awk -v k="text" '{n=split($0,a,","); for (i=1; i<=n; i++) print a[i]}' | sed 's/\"\:\"/\|/g' | sed 's/[\,]/ /g' | sed 's/\"//g' | grep -w $prop`
    echo ${temp##*|}
}

#get all token
#json=`curl -v -u tommychoy:09025417d@HP https://api.github.com/authorizations`
#echo $json

json=`curl -v -u tommychoy:09025417d@HP -X POST https://api.github.com/authorizations --data @tokenp.json`
echo $json
prop='token'
token=`jsonval | cut -d' ' -f 2`
echo $token >> token.txt
echo '##vso[task.setvariable variable=tokenvalue]$token'
echo $tokenvalue
