#!/usr/bin/env bash
# first, build it: docker build . -t alpine-tools:0.1
# next, run: ./dbaggins.sh '0.2'
set -x

# vars
myRegID="todddsm"
myImage='alpine-tools'
myVersn="$1"

# tag and push
docker tag  "${myImage}:${myVersn}" "${myRegID}/${myImage}:${myVersn}"
docker push "${myRegID}/${myImage}:${myVersn}"

