FROM cloudera/quickstart

RUN yum install -y spark-core spark-master spark-worker spark-history-server spark-python

ADD livy-server-0.3.0 /livy
ADD docker-quickstart /usr/bin/docker-quickstart

RUN mkdir -p /livy/logs
RUN chmod +x /usr/bin/docker-quickstart

ENV SPARK_HOME /usr/lib/spark