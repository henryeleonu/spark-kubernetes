cd mta
#docker build -t heleonu/spark-and-kubernetes:1 .
#docker push heleonu/spark-and-kubernetes:1
kubectl create -f postgres-configmap.yaml
kubectl get configmap
kubectl apply -f spark-pod.yaml 