docker exec -ti spark-standalone_demo-database_1 bash -c "echo setting up database...
psql -U postgres -c \"create database mta_data;\"
psql -U postgres -c \"\c mta_data;\""
echo "switching bash sessions..."
docker exec -ti spark-standalone_spark-master_1 bash -c "echo unzipping data...
cd /opt/spark-data
unzip -o MTA_2014_08-10.zip
cd /opt/spark
echo finished unzipping...
/opt/spark/bin/spark-submit --master spark://spark-master:7077 \
--jars /opt/spark-apps/postgresql-42.2.22.jar \
--driver-memory 1G \
--executor-memory 1G \
/opt/spark-apps/main.py"