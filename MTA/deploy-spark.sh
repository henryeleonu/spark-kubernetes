cd mta
#docker build -t heleonu/spark-and-kubernetes:1 .
#docker push heleonu/spark-and-kubernetes:1
kubectl apply -f service-account.yaml
kubectl apply -f postgres-login-secret.yaml
kubectl apply -f postgres-configmap.yaml
kubectl get configmap
kubectl apply -f spark-pod.yaml 