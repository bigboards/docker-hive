FROM bigboards/hadoop-__arch__

MAINTAINER bigboards <hello@bigboards.io>

# Download Hive
RUN curl -s http://www.eu.apache.org/dist/hive/hive-1.2.1/apache-hive-1.2.1-bin.tar.gz | tar -xz -C /opt
RUN cd /opt && ln -s ./hive-1.2.1 hive

ENV HIVE_HOME /opt/hive
ENV PATH ${PATH}:${HIVE_HOME}/bin

CMD ["/bin/bash"]
