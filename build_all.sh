#!/bin/bash
repo_list="teamcity-docker-minimal-agent
teamcity-docker-sciqlop-fedora
teamcity-docker-agent-fedora-lppic
teamcity-docker-complete-agent
teamcity-docker-agent-fedora-HPC"

REGISTRY="129.104.6.165:32219"

git submodule init
git submodule update

for d in ${repo_list}; do
    cd $d && bash build_image.sh && cd ..
    image_name=$(grep "docker build " $d/build_image.sh | rev | cut -d ' ' -f 2 | rev)
    docker tag $image_name $REGISTRY/$image_name
    docker push $REGISTRY/$image_name
done

