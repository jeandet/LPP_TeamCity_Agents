FROM fedora:30
#Derived from official TeamCity image
LABEL modified "Alexis Jeandet <alexis.jeandet@member.fsf.org>"

RUN dnf install -y java-1.8.0-openjdk mercurial git make cmake tar gzip unzip xorg-x11-server-Xvfb docker-common docker pyside2-tools.x86_64\
                   python3-pyside2-devel.x86_64 python3-shiboken2.x86_64 python3-shiboken2-devel.x86_64 g++ clang qt5-qtbase-devel.x86_64 \
                   qt5-qtsvg-devel.x86_64 catch-devel.x86_64 python3-devel libuuid-devel python3-numpy && pip3 insatll meson

VOLUME /data/teamcity_agent/conf
ENV CONFIG_FILE=/data/teamcity_agent/conf/buildAgent.properties \
    TEAMCITY_AGENT_DIST=/opt/buildagent

RUN mkdir $TEAMCITY_AGENT_DIST

ADD https://teamcity.jetbrains.com/update/buildAgent.zip $TEAMCITY_AGENT_DIST/
RUN unzip $TEAMCITY_AGENT_DIST/buildAgent.zip -d $TEAMCITY_AGENT_DIST/

LABEL dockerImage.teamcity.version="latest" \
      dockerImage.teamcity.buildNumber="latest"

COPY run-agent.sh /run-agent.sh
COPY run-services.sh /run-services.sh

RUN useradd -m buildagent && \
    chmod +x /run-agent.sh /run-services.sh && \
    rm $TEAMCITY_AGENT_DIST/buildAgent.zip && \
    sync
#add line return for derived images
RUN echo " " >> /opt/buildagent/conf/buildAgent.dist.properties && \
    echo "system.distrib=fedora" >> /opt/buildagent/conf/buildAgent.dist.properties && \
    echo "system.agent_name=teamcity-docker-sciqlop-fedora" >> /opt/buildagent/conf/buildAgent.dist.properties

CMD ["/run-services.sh"]

EXPOSE 9090
