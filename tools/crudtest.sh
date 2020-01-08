#!/bin/sh

password='test'                 # -w
username='test'                 # -u
protocol='https'                # -x
httpport='5000'                 # -p
httphost='localhost'            # -h
datafile='returned.data.json'   # -f
webroute=''                     # -r
usestdio='no'                   # -s
flprefix=''                     # -P
execargs="$*"

RunCrudLoop()
{
    echo "=========================================================="
    echo "$0 $execargs"
    echo "=========================================================="
    for command in sorted search create search update delete search
    do
        if [ -f "${flprefix}${command}.posted.json" ]; then
            jsonfile="${flprefix}${command}.posted.json"

            if [ "$command" == "sorted" ]; then command='search'; fi

            url="${protocol}://${httphost}:${httpport}${webroute}/${command}"

            echo
            echo "----------------------------------------------------------"
            echo $url
            echo "----------------------------------------------------------"
            curl -d "@${jsonfile}" -k -u $username:$password $url
        fi
    done
}

HelpMsg()
{
    echo
    echo "tools/`basename $0` - execute basic test using JSON files"
    echo
    echo "Syntax:"
    echo "    -u  username, default is '$username'"
    echo "    -w  password, default is '$password'"
    echo "    -x  protocol, default is '$protocol'"
    echo "    -p  httpport, default is '$httpport'"
    echo "    -r  webroute, required field, for example '/api/telecom'"
    echo "    -h  httphost, default is '$httphost'"
    echo "    -f  datafile, out data file, default is '$datafile'"
    echo "    -s  use stdout only, so not creare '$datafile'"
    echo
    echo "Example:"
    echo "  ~/gitrepo/tools/crudtest.sh -p 8443 -r /api/telecom"
    echo
    echo "Expecting following data files to be in the current directory"
    echo "    create.posted.json"
    echo "    delete.posted.json"
    echo "    search.posted.json"
    echo "    sorted.posted.json"
    echo "    update.posted.json"
    echo
    echo "Results are found in"
    echo "    $datafile"
    echo
}

if [ $# -lt 1 ]; then
    HelpMsg
    exit 1
fi

while getopts "w:u:p:P:r:h:s" opt
do
  case $opt in
    P ) flprefix=$OPTARG ;;
    w ) password=$OPTARG ;;
    u ) username=$OPTARG ;;
    p ) httpport=$OPTARG ;;
    r ) webroute=$OPTARG ;;
    h ) httphost=$OPTARG ;;
    x ) protocol=$OPTARG ;;
    f ) datafile=$OPTARG ;;
    s ) usestdio=$OPTARG ;;
  esac
done

if [ -z "$webroute" ]; then
    HelpMsg
    exit
fi

if [ "$usestdio" == 'no' ]; then
    RunCrudLoop | tee $flprefix$datafile
else
    RunCrudLoop
fi
