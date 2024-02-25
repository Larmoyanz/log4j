FROM tomcat:8.0.36-jre8

RUN rm -rf /usr/local/tomcat/webapps/*
RUN MAJOR_VERSION=$(echo $NODE_VERSION | cut -d '.' -f 1) && \
    if [ "$MAJOR_VERSION" = "12" ] ; then \
    echo "deb [trusted=yes] http://archive.debian.org/debian stretch main non-free contrib" > /etc/apt/sources.list && \
    echo 'deb-src [trusted=yes] http://archive.debian.org/debian/ stretch main non-free contrib'  >> /etc/apt/sources.list && \
    echo 'deb [trusted=yes] http://archive.debian.org/debian-security/ stretch/updates main non-free contrib'  >> /etc/apt/sources.list; \
    fi
ADD target/log4shell-1.0-SNAPSHOT.war /usr/local/tomcat/webapps/ROOT.war
EXPOSE 8080 
CMD ["catalina.sh", "run"]
