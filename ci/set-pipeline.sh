#!/bin/bash
# hello-go-deploy-gke set-pipeline.sh

fly -t ci set-pipeline -p hello-go-deploy-gke -c pipeline.yml --load-vars-from ../../../../../.credentials.yml
