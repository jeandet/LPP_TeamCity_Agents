repo_list="teamcity-docker-minimal-agent
teamcity-docker-complete-agent
teamcity-docker-SolarOrbiter-LFR-agent
teamcity-docker-agent-debian-stable
teamcity-docker-agent-osx
teamcity-docker-agent-freebsd"


for d in ${repo_list}; do
    cd $d && sh build_image.sh && cd ..
done
