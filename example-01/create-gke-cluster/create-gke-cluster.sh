#!/bin/sh -e
# hello-go-deploy-gke create-gke-cluster.sh

echo " "

if [ "$1" = "-debug" ]
then
    echo "*************************************************************************************"
    echo "* create-gke-cluster.sh -debug (START) **********************************************"
    echo "*************************************************************************************"
    # set -x enables a mode of the shell where all executed commands are printed to the terminal.
    set -x
    echo " "
else
    echo "*************************************************************************************"
    echo "* create-gke-cluster.sh (START) *****************************************************"
    echo "*************************************************************************************"
    echo " "
fi

echo "Create an affordable 3 node Kubernetes cluster at gke"
gcloud container --project "$GCP_JEFFS_PROJECT_ID" \
    clusters create jeffs-gke-cluster-hello-go-deploy-gke \
    --addons HorizontalPodAutoscaling,HttpLoadBalancing \
    --disk-size "10" \
    --disk-type "pd-standard" \
    --enable-autorepair \
    --enable-autoupgrade \
    --enable-cloud-logging \
    --enable-cloud-monitoring \
    --image-type "COS" \
    --machine-type "f1-micro" \
    --no-enable-ip-alias \
    --num-nodes "3" \
    --preemptible \
    --username "admin" \
    --zone "us-west1-a" 
    # --cluster-version "1.11.7-gke.12"
echo " "

echo "Authenticate cluster"
gcloud container clusters get-credentials jeffs-gke-cluster-hello-go-deploy-gke \
    --zone us-west1-a \
    --project $GCP_JEFFS_PROJECT_ID
echo " "

echo "*************************************************************************************"
echo "* create-gke-cluster.sh (END) *******************************************************"
echo "*************************************************************************************"
echo " "