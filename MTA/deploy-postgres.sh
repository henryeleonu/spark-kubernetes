kubectl apply -f postgres-storage.yaml
kubectl get pv
kubectl get pvc
kubectl create -f postgres-login-secret.yaml
kubectl get secret
kubectl create -f postgres-deployment.yaml
kubectl get deployments
kubectl get pods
kubectl create -f postgres-service.yaml 
kubectl get svc
#kubectl exec -it <name-of-postgress-pod> -- psql -h localhost -U postgres --password -p 5432 postgres
#kubectl exec -it postgres-99f645699-mrv9l -- psql -h localhost -U postgres --password -p 5432 postgres
kubectl exec -it postgres-99f645699-9d27v -- psql -h localhost -U postgres --password -p 5432 postgres