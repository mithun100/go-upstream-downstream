# Go Autoinstrumentation with OpenTelemetry (OTel)

**Table of Contents**
- [Introduction](#introduction)
- [Prerequisites](#prerequisites)
- [Assumptions](#assumptions)
- [Steps to deploy](#steps-to-deploy)
- [License](#license)

## Introduction

This Go Autoinstrumentation project demonstrates how to instrument your Go applications with OpenTelemetry (OTel) for observability. It includes both upstream and downstream apps running in Docker containers and provides Kubernetes deployment configurations for scalability.

The project showcases the following:

- Setting up Go applications with OpenTelemetry instrumentation.
- Using Docker containers to run instrumented apps.
- Deploying apps to Kubernetes for scalable deployments.
- Testing the instrumentation setup with an upstream app making requests to a downstream app.

## Prerequisites

Before getting started, ensure you have the following prerequisites installed:

- [Go](https://golang.org/doc/install)
- [Docker](https://docs.docker.com/get-docker/)
- [Kubernetes](https://kubernetes.io/docs/setup/)
- [kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/)

## Assumptions
- Application is reported to the [AppDynamics Cloud Native Application Observability](https://docs.appdynamics.com/fso/cloud-native-app-obs/en)
- This assumes you already have the collector deployed in your Kubernetes cluster
- Go is in Alpha build so that things might change and break. So please use caution and do a proper testing before moving to a higher environment like Pre Prod and Production.
- [instrumentation.yml](associated_files/instrumentation.yaml) files points to OTEL_EXPORTER_OTLP_ENDPOINT you might need to change it as per your application or endpoint details.
- 

## Steps to deploy
- Be connected to the Kubernetes using CLI
- Uninstall the Kubernetes Operator and reploy deploy with modified files [operators-values.yaml](associated_files/operators-values.yaml)
   ```
   helm uninstall appdynamics-operators -n appdynamics
   helm install appdynamics-operators appdynamics-cloud-helmcharts/appdynamics-operators -n appdynamics -f operators-values.yaml --wait

  ```


- Navigate to the deploy folder and use ./deploy_kubernetes.sh (It is using image from mithun100 github repository using all the Kubernetes manifest files)
- Key element to remember is the both the deployment files. This will enable the auto-instrumentation of the Go application
- 
  ```
  annotations:
        instrumentation.opentelemetry.io/inject-go: "default/auto-instrumentation" 
        instrumentation.opentelemetry.io/otel-go-auto-target-exe: '/root/downstream-app'
  ```
- Since Go is in Alpha release, we have to explictly enable it by using the featureGate
- 
  ```  featureGates: "operator.autoinstrumentation.go"```

- Delete the auto-instrumentation  from the Kubernetes if already present and apply this   [instrumentation.yml](associated_files/instrumentation.yaml)
  ```
   kubectl delete otelinst auto-instrumentation

   kubectl create -f instrumentation.yaml

  ```
  
- Use the below command to deploy the application

  ```
  deploy/deploy_kubernetes.sh
  ```
- Access the upstream in a browser using the upstream application's external IP.

   ```sh
   kubectl get service go-upstream-service | awk '{print $4}'
   ```

   Visit `http://EXTERNAL_IP` in a web browser to access the upstream application.
   
## License
This project is licensed under the MIT License - see the  [LICENSE](LICENSE) file for details.


