# The project practicing node.js and GCP.

# Building image
docker build -t gcr.io/dingnweb/dingnweb-node:v1 .
# Running the container
docker run -d -p 8080:8080 --name dingnweb gcr.io/dingnweb/dingnweb-node:v1
# Verify in browser http://localhost:8080/
# Stopping the running container
docker stop dingnweb
# Push the image to gcr 
gcloud docker push gcr.io/dingnweb/dingnweb-node:v1

# Create cluster 
gcloud container clusters create dingnweb

# Deploy containerized app into Kubernetes cluster
gcloud container clusters get-credentials dingnweb

# Create the pod: A Kubernetes pod is a group of containers, tied together for the purposes of administration and networking. It can contain a single container or multiple.
kubectl run dingnweb-node --image=gcr.io/dingnweb/dingnweb-node:v1 --port=8080

# To view the deployment 
kubectl get deployments

# To view the Pod created by the deployment run:
kubectl get pods

# Expose to external traffic
kubectl expose deployment dingnweb-node --port=80 --target-port=8080 --type="LoadBalancer"

# Get services and IP/port
kubectl get services dingnweb-node

# Scale up the website
kubectl scale deployment dingnweb-node --replicas=4

# Upgrade to new version
docker build -t gcr.io/dingnweb/dingnweb-node:v2 .
gcloud docker push gcr.io/dingnweb/dingnweb-node:v2

# Update deployment to new version
kubectl set image deployment/dingnweb-node dingnweb-node=gcr.io/dingnweb/dingnweb-node:v2


# Cleanup
kubectl delete service,deployment dingnweb-node
gcloud container clusters delete dingnweb
gsutil rm -r gs://artifacts.dingnweb.appspot.com/


# Useful utility command
# List all processes listening on ports
lsof -nP +c 15 | grep LISTEN
# Kill process
kill -9 6218