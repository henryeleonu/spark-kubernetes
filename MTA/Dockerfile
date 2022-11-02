# builder step used to download and configure spark environment

FROM heleonu/spark-py:1.1


#Download and uncompress kubectl, and install unzip, ping and nslookup
RUN apt-get install -y curl && curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
RUN chmod +x ./kubectl && mv ./kubectl /usr/local/bin && apt-get install -y unzip && apt-get install -y iputils-ping && apt-get install -y dnsutils

#COPY start-spark.sh /
COPY ./app /opt/spark-apps
COPY ./data /opt/spark-data
COPY submit-code.sh /

RUN cd /opt/spark-data && tar -xzf MTA_2014_08_01.tar.gz && rm MTA_2014_08_01.tar.gz
#RUN sleep 10s
#RUN cd /opt/spark-data
#RUN unzip -o MTA_2014_08-10.zip

