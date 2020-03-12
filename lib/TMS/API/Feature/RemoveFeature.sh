#!/bin/sh

if [ $# -lt 1 ]; then
    echo "`basename $0` <Feature Library>"
    exit 1
fi

pwd|grep "/lib/TMS/API/Feature$" >/dev/null
if [ $? -ne 0 ]; then
    echo "You have to be in lib/TMS/API/Feature directory of the TMS"
    echo "tree in order for this utility to work properly with GIT"
    exit 1
fi

for file in $*
do
    json=`echo "$file"|sed -e "s/\.pm$/.sample.json/"`
    if [ -f "$file" ]; then
        class=`grep "^package" $file | awk -F'[; ]' '{print $2}'`
        for route in `find ../../Transport/Dancer/Routes -type f -name "*.pm" -exec grep -l "^use $class;" {} \;`
        do
            if [ -f "$json" ]; then
                git rm $file $route $json
                git commit -m "Depricated feature" $file $route $json
            else
                git rm $file $route
                git commit -m "Depricated feature" $file $route
            fi
        done
    fi
done
