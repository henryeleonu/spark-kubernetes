from pyspark.sql import SparkSession
from pyspark.sql.functions import col, date_format
import os

def init_spark():
  sql = SparkSession.builder\
    .appName("trip-app")\
    .config("spark.jars", "/opt/spark-apps/postgresql-42.2.22.jar")\
    .getOrCreate()
  sc = sql.sparkContext
  return sql,sc

def main():
  #databasename = os.getenv('POSTGRES_DB')
  username = os.environ['POSTGRES_USER']
  password = os.environ['POSTGRES_PASSWORD']
  #hostname = os.getenv('POSTGRES_SERVICE_NAME')
  #port = os.getenv('POSTGRES_SERVICE_PORT')
  #postgres.default.svc.cluster.local
  url = "jdbc:postgresql://postgres.default.svc.cluster.local:31653/mta_data"
  #url = "jdbc:postgresql://" + hostname + ":" + port + "/" + databasename
  print(url)
  properties = {
    "user": username,
    "password": password,
    "driver": "org.postgresql.Driver"
  }

  file = "/opt/spark-data/MTA_2014_08_01.csv"
  sql,sc = init_spark()

  df = sql.read.load(file, format = "csv", inferSchema="true", sep="|", header="true")  \
      .withColumn("report_hour",date_format(col("time_received"),"yyyy-MM-dd HH:00:00")) \
      .withColumn("report_date",date_format(col("time_received"),"yyyy-MM-dd"))
  
  # Filter invalid coordinates
  df = df.where("latitude <= 90 AND latitude >= -90 AND longitude <= 180 AND longitude >= -180") \
    .where("latitude != 0.000000 OR longitude !=  0.000000 ")
  
  df.show()

  df.write.jdbc(url=url, table="mta_reports", mode='append', properties=properties) 
    #.save()

if __name__ == '__main__':
  main()