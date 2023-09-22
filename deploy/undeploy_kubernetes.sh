#!/bin/bash

# Undeploy the upstream application
echo "Undeploying upstream application..."
kubectl delete -f upstream-deployment.yaml
kubectl delete -f upstream-service.yaml

# Undeploy the downstream application
echo "Undeploying downstream application..."
kubectl delete -f downstream-deployment.yaml
kubectl delete -f downstream-service.yaml

# #Undeploy loadgen job
echo "Undeploying loadgen job"
kubectl delete -f loadgen-job.yaml


echo "Undeployment completed!"

