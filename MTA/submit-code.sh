#kubectl exec -it spark-pod bash
#cd /opt/spark-data
#unzip -o MTA_2014_08_01.zip
#cd /opt/spark
#echo finished unzipping...
#/opt/spark/bin/spark-submit --master spark://spark-master:7077 \
#--jars /opt/spark-apps/postgresql-42.2.22.jar \
#--driver-memory 1G \
#--executor-memory 1G \
#/opt/spark-apps/main.py"

#$SPARK_HOME/bin/spark-submit \
    #--conf spark.kubernetes.authenticate.driver.serviceAccountName=spark-sa \
    #--master k8s://https://kubernetes.docker.internal:6443 \
    #--deploy-mode cluster \
    #--name trip-app \
    #--conf spark.jars.ivy=/tmp/.ivy \
    #--files local:///opt/spark-data/MTA_2014_08_01.csv \
    #--conf spark.executor.instances=2 \
    #--conf spark.kubernetes.container.image=heleonu/spark-py-kube:1.1 \
    #--conf spark.kubernetes.driver.secretKeyRef.POSTGRES_USER=mysecret:POSTGRES_USER \
    #--conf spark.kubernetes.executor.secretKeyRef.POSTGRES_USER=mysecret:POSTGRES_USER \
    #--conf spark.kubernetes.driver.secretKeyRef.POSTGRES_PASSWORD=mysecret:POSTGRES_PASSWORD \
    #--conf spark.kubernetes.executor.secretKeyRef.POSTGRES_PASSWORD=mysecret:POSTGRES_PASSWORD \
    #--jars local:///opt/spark-apps/postgresql-42.2.22.jar \
    #local:///opt/spark-apps/main.py
   
    
$SPARK_HOME/bin/spark-submit \
    --conf spark.kubernetes.authenticate.driver.serviceAccountName=spark-sa \
    --master k8s://https://kubernetes.docker.internal:6443 \
    --deploy-mode cluster \
    --name trip-app \
    --conf spark.jars.ivy=/tmp/.ivy \
    --files local:///opt/spark-data/MTA_2014_08_01.csv \
    --conf spark.dynamicAllocation.enabled=true \
    --conf spark.dynamicAllocation.shuffleTracking.enabled=true \
    --conf spark.dynamicAllocation.shuffleTracking.timeout=120 \
    --conf spark.dynamicAllocation.minExecutors=1 \
    --conf spark.dynamicAllocation.maxExecutors=3 \
    --conf spark.kubernetes.allocation.batch.size=3 \
    --conf spark.dynamicAllocation.executorAllocationRatio=1 \
    --conf spark.dynamicAllocation.schedulerBacklogTimeout=1 \
    --conf spark.kubernetes.namespace=default \
    --conf spark.kubernetes.container.image=heleonu/spark-py-kube:1.1 \
    --conf spark.kubernetes.driver.secretKeyRef.POSTGRES_USER=mysecret:POSTGRES_USER \
    --conf spark.kubernetes.executor.secretKeyRef.POSTGRES_USER=mysecret:POSTGRES_USER \
    --conf spark.kubernetes.driver.secretKeyRef.POSTGRES_PASSWORD=mysecret:POSTGRES_PASSWORD \
    --conf spark.kubernetes.executor.secretKeyRef.POSTGRES_PASSWORD=mysecret:POSTGRES_PASSWORD \
    --jars local:///opt/spark-apps/postgresql-42.2.22.jar \
    local:///opt/spark-apps/main.py
    
    

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