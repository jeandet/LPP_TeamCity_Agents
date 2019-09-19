#!/bin/bash
repo_list="teamcity-docker-minimal-agent
teamcity-docker-sciqlop-fedora
teamcity-docker-agent-fedora-lppic
teamcity-docker-in-docker
teamcity-docker-VM-base-agent
teamcity-docker-agent-ubuntu-17-10
teamcity-docker-complete-agent
teamcity-docker-SolarOrbiter-LFR-agent
teamcity-docker-agent-debian-stable
teamcity-docker-agent-osx
teamcity-docker-agent-freebsd
teamcity-docker-agent-fedora-HPC"


git submodule init
git submodule update

for d in ${repo_list}; do
    cd $d && bash build_image.sh && cd ..
    image_name=$(grep "docker build " $d/build_image.sh | rev | cut -d ' ' -f 2 | rev)
    docker tag $image_name pc-solar5:5000/$image_name
    docker push pc-solar5:5000/$image_name
done
