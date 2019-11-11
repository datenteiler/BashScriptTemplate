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

usage() { echo "Usage: $0 [-h] [-v] [-s <string>]" 1>&2; exit 1; }

help() { # Help text
echo $(usage)
cat <<EOF
Example:

Options:
    -h, --help                  print this help
    -v, --version               print script version
    -s, --say <string>          say something
EOF
}

version() { # Script Version
    echo "$PROGRAM: v$VERSION"
}

say() {
    echo "You said: $1"
}

# -- RUN SCRIPT ----------------------------------------------------------------

if [ -z $1 ]; then usage; fi

# Parsing bash script options with getopt
options=$(getopt -o hvs: -l help,version,say: -- "$@")
if [ $? != 0 ] ; then echo "Terminating..." >&2; exit 1; fi

set -- $options
while [ $# -gt 0 ]
do
   case $1 in
        -h|--help) help; exit;;
        -v|--version) version; exit;;
        -s|--say) say ${2//\'/}; exit;;
        (--) break;;
        (-*) echo "$0: error - unrecognized option $1" 1>&2; exit 1;;
        (*)  break;;
    esac
done
shift $((OPTIND -1))
