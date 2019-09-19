docker build -t jeandet/teamcity-docker-sciqlop-fedora .
docker run -d=true -e SERVER_URL=https://hephaistos.lpp.polytechnique.fr/teamcity --name=teamcity-docker-minimal-agent -it jeandet/teamcity-docker-sciqlop-fedora &
sleep 300
docker stop teamcity-docker-minimal-agent
docker commit teamcity-docker-minimal-agent jeandet/teamcity-docker-sciqlop-fedora
docker rm teamcity-docker-minimal-agent
