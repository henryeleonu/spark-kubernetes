# builder step used to download and configure spark environment

FROM heleonu/spark-py:1.1

# Install Jupyter and Data Science libraries
#USER root
 
RUN pip install numpy pandas 
RUN pip install notedown plotly seaborn matplotlib 
RUN apt-get install sudo 

RUN apt-get -y update
RUN apt-get -y install git
RUN sudo apt-get install -y binutils libproj-dev gdal-bin libgeos-dev libpq-dev python3-dev
RUN pip install geos proj cartopy
#RUN git clone https://github.com/grst/geos.git && cd geos && pip install -e geos && cd ..
RUN pip install shapely geopandas geoplot folium branca
RUN pip install missingno psycopg2 SQLAlchemy
RUN pip install bokeh xlrd yellowbrick
RUN pip install scikit-learn scikit-image
RUN pip install scipy 
RUN pip install jupyter
RUN pip install findspark

#Download and uncompress kubectl, and install unzip, ping and nslookup
RUN apt-get install -y curl && curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
RUN chmod +x ./kubectl && mv ./kubectl /usr/local/bin && apt-get install -y unzip && apt-get install -y iputils-ping && apt-get install -y dnsutils

COPY ./app /opt/spark-apps
COPY ./data /opt/spark-data
COPY submit-code.sh /

RUN cd /opt/spark-data && tar -xzf MTA_2014_08_01.tar.gz && rm MTA_2014_08_01.tar.gz

#CMD jupyter notebook --no-browser --ip=0.0.0.0 --allow-root


