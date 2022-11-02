from pyspark.sql import SparkSession
from pyspark.sql.functions import col,date_format

sql = SparkSession.builder\
    .appName("trip-app")\
    .config("spark.jars")\
    .getOrCreate()
  sc = sql.sparkContext

# Create a distributed data set to test the session.
t = sc.parallelize(range(10))

# Calculate the approximate sum of values in the dataset
r = t.sumApprox(3)
print('Approximate sum: %s' % r)