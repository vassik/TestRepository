#!/bin/bash

nametmp="test$1"
name=$nametmp$2$3
prop="$name.properties"
psh="$name.sh"

printf "Creating files $prop and $psh\n"


cp testEmpty$2$3.properties $prop
cp testEmpty$2$3.sh $psh

sub="s/Empty/$1/g"

sed -i $sub $prop
sed -i $sub $psh
ref=$1"PosixPosix"
sed -i '/oracle/c\'"$(grep "oracle" test$ref.properties)" $name.properties
