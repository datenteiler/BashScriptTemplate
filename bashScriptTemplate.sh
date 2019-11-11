#!/usr/bin/env bash

# -- ABOUT THIS PROGRAM: ------------------------------------------------------
#
AUTHOR="Christian Imhorst"
PROGRAM="bashScriptTemplate"
VERSION="1.0.0"
DESCRIPTION=""
SOURCE=""
#
# -- INSTRUCTIONS: ------------------------------------------------------------
#
# Execute:
#   $ chmod u+x bashScriptTemplate.sh && ./bashScriptTemplate.sh
#
# -- CHANGELOG: ---------------------------------------------------------------
#
#   DESCRIPTION:    First release
#   VERSION    :    1.0.0
#   DATE       :    10/16/2019
#   AUTHOR     :    Christian Imhorst
#
# -- TODO & FIXES: ------------------------------------------------------------
#
#   - some FIX or TODO here
#
# -- MAIN FUNCTIONS ------------------------------------------------------------
Get_help() { # Help text

cat <<EOF
Usage: $0 [options]
Example:

Options:
    -h, --help                  print this help
    -v, --version               print script version
EOF
}

Get_version() { # Script Version
    echo "$PROGRAM: v$VERSION"
}

# -- RUN SCRIPT ----------------------------------------------------------------

# Parsing bash script options with getopt
options=$(getopt -o hv -l help,version -- "$@")
if [ $? != 0 ] ; then echo "Terminating..." >&2; exit 1; fi

set -- $options
while [ $# -gt 0 ]
do
   case $1 in
        -h|--help) Get_help; exit;;
        -v|--version) Get_version; exit;;
        (--) shift; break;;
        (-*) echo "$0: error - unrecognized option $1" 1>&2; exit 1;;
        (*)  break;;
    esac
done
