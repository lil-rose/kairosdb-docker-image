FROM centos

# Installing Java and others libraris needed
RUN yum update -y & yum install -y java-1.8.0-openjdk
ENV JAVA_HOME /usr/lib/jvm/java-1.8.0-openjdk-1.8.0.262.b10-0.el8_2.x86_64/jre/

# Install KairosDB
WORKDIR /opt
RUN curl -L https://github.com/kairosdb/kairosdb/releases/download/v1.2.2/kairosdb-1.2.2-1.tar.gz | \
    tar zxfp -

ADD files/kairosdb.properties /opt/kairosdb/conf/kairosdb.properties

# Set Kairos config vars
#ENV KAIROS_JETTY_PORT 8083
ENV CASSANDRA_HOST_LIST cassandra-1:9160

# Copy scripts into container to set kairos config params
ADD files/config-kairos.sh /usr/bin/config-kairos.sh
RUN chmod +x /usr/bin/config-kairos.sh

# Run kairosdb in foreground on boot
CMD ["/usr/bin/config-kairos.sh"]

# Kairos API telnet and jetty ports
EXPOSE 4242 8080