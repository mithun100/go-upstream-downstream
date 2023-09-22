# Go Autoinstrumentation with OpenTelemetry (OTel)

**Table of Contents**
- [Introduction](#introduction)
- [Prerequisites](#prerequisites)
- [Project Structure](#project-structure)
- [Getting Started](#getting-started)
  - [Set Up Downstream App](#1-set-up-downstream-app)
  - [Set Up Upstream App](#2-set-up-upstream-app)
  - [Docker Compose Configuration](#3-docker-compose-configuration)
  - [Kubernetes Configuration](#4-kubernetes-configuration)
  - [Deploy to Kubernetes](#5-deploy-to-kubernetes)
  - [Testing](#6-testing)
- [Contributing](#contributing)
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
- [Docker Compose](https://docs.docker.com/compose/install/)
- [Kubernetes](https://kubernetes.io/docs/setup/)
- [kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/)

## Assumptions
- Application is reported to the [AppDynamics Cloud Native Application Observability](https://docs.appdynamics.com/fso/cloud-native-app-obs/en)
- This assumes you already have the collector deployed in your Kubernetes cluster
- Go is in Alpha build so that things might change and break. So please use caution and do a proper testing before moving to a higher environment like Pre Prod and Production.
- instrumentation.yml files points to OTEL_EXPORTER_OTLP_ENDPOINT you might need to change it as per your application or endpoint details.
- 

## Steps to deploy
- Be connected to the Kubernetes using CLI
- Uninstall the Kubernetes Operator and reploy deploy with modified files 
- Navigate to the deploy folder and use ./deploy_kubernetes.sh (It is using image from mithun100 github repository using all the Kubernetes manifest files)
- Key elemen
  



