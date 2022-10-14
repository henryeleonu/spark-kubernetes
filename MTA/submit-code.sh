#kubectl exec -it spark-pod bash
#cd /opt/spark-data
#unzip -o MTA_2014_08-10.zip
#cd /opt/spark
#echo finished unzipping...
#/opt/spark/bin/spark-submit --master spark://spark-master:7077 \
#--jars /opt/spark-apps/postgresql-42.2.22.jar \
#--driver-memory 1G \
#--executor-memory 1G \
#/opt/spark-apps/main.py"

$SPARK_HOME/bin/spark-submit \
    --conf spark.kubernetes.authenticate.driver.serviceAccountName=spark-sa \
    --master k8s://https://kubernetes.docker.internal:6443 \
    --deploy-mode cluster \
    --name trip-app \
    --conf spark.jars.ivy=/tmp/.ivy \
    --files local:///opt/spark-data/MTA_2014_08_01.csv \
    --conf spark.executor.instances=2 \
    --conf spark.kubernetes.container.image=heleonu/spark-py-kube:1.1 \
    --jars local:///opt/spark-apps/postgresql-42.2.22.jar \
    local:///opt/spark-apps/main.py
    #--jars local:///opt/spark/examples/jars/spark-examples_2.12-3.3.0.jar \
    #local:///opt/spark/examples/src/main/python/pi.py 
    
    

#$SPARK_HOME/bin/spark-submit \
    #--conf spark.kubernetes.authenticate.driver.serviceAccountName=spark-sa \
    #--master k8s://https://kubernetes.docker.internal:6443 \
    #--deploy-mode cluster \
    #--name spark-pi \
    #--conf spark.jars.ivy=/tmp/.ivy \
    #--class org.apache.spark.examples.SparkPi \
    #--conf spark.executor.instances=2 \
    #--conf spark.kubernetes.container.image=heleonu/spark-py:1.1 \
    #local:///opt/spark/examples/jars/spark-examples_2.12-3.3.0.jar 1000