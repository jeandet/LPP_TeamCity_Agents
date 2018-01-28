#!/bin/bash
repo_list="teamcity-docker-minimal-agent
teamcity-docker-VM-base-agent
teamcity-docker-agent-ubuntu-17-10
teamcity-docker-complete-agent
teamcity-docker-SolarOrbiter-LFR-agent
teamcity-docker-agent-debian-stable
teamcity-docker-agent-osx
teamcity-docker-agent-freebsd"


for d in ${repo_list}; do
    cd $d && bash build_image.sh && cd ..
done
