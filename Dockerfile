FROM bigboards/java7-butterfly-__arch__

MAINTAINER bigboards <hello@bigboards.io>

# hadoop
RUN curl -s http://www.eu.apache.org/dist/hadoop/common/hadoop-2.6.0/hadoop-2.6.0.tar.gz | tar -xz -C /opt
RUN cd /opt && ln -s ./hadoop-2.6.0 hadoop

# Download Hive
RUN curl -s http://www.eu.apache.org/dist/hive/hive-1.2.1/apache-hive-1.2.1-bin.tar.gz | tar -xz -C /opt
RUN cd /opt && ln -s ./apache-hive-1.2.1-bin hive

# Set the environment variables
ENV HADOOP_PREFIX /opt/hadoop
ENV YARN_HOME /opt/hadoop
ENV HADOOP_YARN_HOME /opt/hadoop
ENV HADOOP_HDFS_HOME /opt/hadoop
ENV HADOOP_COMMON_HOME /opt/hadoop
ENV HADOOP_MAPRED_HOME /opt/hadoop
ENV HADOOP_CONF_DIR /opt/hadoop/etc/hadoop
ENV HDFS_CONF_DIR /opt/hadoop/etc/hadoop
ENV YARN_CONF_DIR /opt/hadoop/etc/hadoop

ENV HIVE_HOME /opt/hive
ENV PATH ${PATH}:${HIVE_HOME}/bin

CMD ["/bin/bash"]
