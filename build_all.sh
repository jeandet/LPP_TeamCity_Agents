#!/bin/bash
repo_list="teamcity-docker-minimal-agent
teamcity-docker-sciqlop-fedora
teamcity-docker-agent-fedora-lppic
teamcity-docker-complete-agent
teamcity-docker-agent-fedora-HPC"


git submodule init
git submodule update

for d in ${repo_list}; do
    cd $d && bash build_image.sh && cd ..
    image_name=$(grep "docker build " $d/build_image.sh | rev | cut -d ' ' -f 2 | rev)
    docker tag $image_name kube-master:32219/$image_name
    docker push kube-master:32219/$image_name
done

