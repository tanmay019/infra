#!/bin/bash

# K8s updating clusterRole G.Cloud
kubectl create clusterrolebinding cluster-admin-binding \
    --clusterrole cluster-admin \
    --user $(gcloud config get-value account)


# 1-time ingress installation for G-Cloud
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v0.34.1/deploy/static/provider/cloud/deploy.yaml

# Setting up monitoring and Grafana-Dashboard installation
# helm install monitor-prom charts/prometheus-operator


# Setting up Ingress service in K8s cluster
kubectl apply -f ./ingress.yaml
kubectl apply -f ./nginx-controller.yaml
