FROM cloudera/quickstart:latest

#installing Java
RUN yum -y install wget \
	&& yum install -y wget openssl ca-certificates \
	&& wget --no-cookies --no-check-certificate --header "Cookie: oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/8u151-b12/e758a0de34e24606bca991d704f6dcbf/jdk-8u151-linux-x64.rpm" -O /tmp/jdk-8u151-linux-x64.rpm \
	&& rpm -ivh /tmp/jdk-8u151-linux-x64.rpm
	
	
RUN alternatives --install /usr/bin/java jar /usr/java/latest/bin/java 200000
RUN alternatives --install /usr/bin/javaws javaws /usr/java/latest/bin/javaws 200000
RUN alternatives --install /usr/bin/javac javac /usr/java/latest/bin/javac 200000

#installing SPARK
ARG SPARK_ARCHIVE=http://d3kbcqa49mib13.cloudfront.net/spark-2.1.0-bin-hadoop2.7.tgz
RUN curl -s $SPARK_ARCHIVE | tar -xz -C /usr/local/


RUN rm /usr/bin/docker-quickstart
ADD docker-quickstart /usr/bin/
RUN chmod 777 /usr/bin/docker-quickstart



CMD ["bash"]
