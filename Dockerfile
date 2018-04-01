FROM bigboards/java7-butterfly-__arch__

MAINTAINER bigboards <hello@bigboards.io>

# hadoop
RUN curl -s https://archive.apache.org/dist/hadoop/core/hadoop-2.6.4/hadoop-2.6.4.tar.gz | tar -xz -C /opt
RUN cd /opt && ln -s ./hadoop-2.6.4 hadoop

# Download Hive
RUN curl -s http://archive.apache.org/dist/hive/hive-2.3.2/apache-hive-2.3.2-bin.tar.gz | tar -xz -C /opt
# RUN curl -s https://jdbc.postgresql.org/download/postgresql-9.4.1212.jar -O /opt/apache-hive-2.3.2-bin/lib/postgresql-jdbc.jar
RUN cd /opt && ln -s ./apache-hive-2.3.2-bin hive

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

ENV HADOOP_USER_CLASSPATH_FIRST=true
ENV HIVE_HOME /opt/hive
ENV PATH ${PATH}:${HIVE_HOME}/bin

CMD ["/bin/bash"]
