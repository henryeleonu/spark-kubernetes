kubectl apply -f postgres-storage.yaml
kubectl get pv
kubectl get pvc
kubectl create -f postgres-configmap.yaml
kubectl get configmap
kubectl create -f postgres-deployment.yaml
kubectl get deployments
kubectl get pods
kubectl create -f postgres-service.yaml 
kubectl get svc
#kubectl exec -it <name-of-postgress-pod> -- psql -h localhost -U postgresadmin --password -p 5432 postgres
#kubectl exec -it postgres-5bb9d69b96-nsc77 -- psql -h localhost -U postgres --password -p 5432 mta_data