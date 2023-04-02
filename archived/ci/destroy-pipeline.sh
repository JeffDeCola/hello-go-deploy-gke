#!/bin/bash
# hello-go-deploy-gke destroy-pipeline.sh

fly -t ci destroy-pipeline --pipeline hello-go-deploy-gke
