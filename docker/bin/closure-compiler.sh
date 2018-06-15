#!/bin/sh

#######################################################################################################

java_bin=`which java`;
java_opt="-Xms128m -Xmx512m";

#######################################################################################################

compiler=$(find /opt -type f -name "closure-compiler*")

#######################################################################################################

$java_bin -jar $compiler "$@";