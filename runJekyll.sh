#!/bin/bash

# command line args
jekyllAction=$1 # either create, serve or build
blogName=$2 # the name of the blog to create or serve
hostPort=$3 # the optional port to forward to on the host, default is 4000

# error check for a incorrect jekyll action
if [[ "${jekyllAction}" != "serve" ]] && [[ "${jekyllAction}" != "create" ]] && [[ "${jekyllAction}" != "build" ]]; then
    echo "ERROR: unknown jekyll action, must be create or serve"
    exit 1
fi

# if the action is create
if [[ "${jekyllAction}" == "create" ]]; then
        docker run --rm -i --net=none -v "${PWD}":/data dgutierrez1287/jekyll /bin/bash -l -c "jekyll new ${blogName}"

# else if action is build
elif [[ "${jekyllAction}" == "build" ]]; then
        docker run --rm -i --net=none -v "${PWD}/${blogName}":/data dgutierrez1287/jekyll /bin/bash -l -c "jekyll build"

# else action is serve
else

    # check if custom host port is set
    if [[ -z ${hostPort} ]]; then

        docker run --rm -i -v "${PWD}/${blogName}":/data -p 4000:4000 dgutierrez1287/jekyll /bin/bash -l -c "jekyll serve --host=0.0.0.0"
    else
        docker run --rm -i -v "${PWD}/${blogName}":/data -p ${hostPort}:4000 dgutierrez1287/jekyll /bin/bash -l -c "jekyll serve --host=0.0.0.0"
    fi
fi