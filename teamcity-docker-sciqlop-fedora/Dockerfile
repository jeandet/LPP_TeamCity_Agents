FROM fedora:33
#Derived from official TeamCity image
LABEL modified "Alexis Jeandet <alexis.jeandet@member.fsf.org>"

RUN dnf install -y java-1.8.0-openjdk mercurial git make cmake ccache tar gzip unzip xorg-x11-server-Xvfb pyside2-tools.x86_64\
                   python3-pyside2-devel.x86_64 python3-shiboken2.x86_64 python3-shiboken2-devel.x86_64 g++ clang qt5-qtbase-devel.x86_64 \
                   qt5-qtsvg-devel.x86_64 catch-devel.x86_64 python3-devel libuuid-devel python3-numpy ninja-build.x86_64 gcovr rubygems \
                   ruby-devel rubygems-devel.noarch rubygem-nokogiri.x86_64 libxslt-devel.x86_64 libxml2-devel.x86_64 zlib-devel.x86_64 \
                   gmp-devel.x86_64 /usr/lib/rpm/redhat/redhat-hardened-cc1 && pip3 install meson && gem install git_stats

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
