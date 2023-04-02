#!/bin/sh -e
# hello-go-deploy-gke destroy-gke-cluster.sh

echo " "

if [ "$1" = "-debug" ]
then
    echo "**************************************************************************************"
    echo "* destroy-gke-cluster.sh -debug (START) **********************************************"
    echo "**************************************************************************************"
    # set -x enables a mode of the shell where all executed commands are printed to the terminal.
    set -x
    echo " "
else
    echo "**************************************************************************************"
    echo "* destroy-gke-cluster.sh (START) *****************************************************"
    echo "**************************************************************************************"
    echo " "
fi

echo "Destroy cluster at gke"
gcloud container --project "$GCP_JEFFS_PROJECT_ID" \
    clusters delete jeffs-gke-cluster-hello-go-deploy-gke \
    --zone "us-west1-a"
echo " "

echo "**************************************************************************************"
echo "* destroy-gke-cluster.sh (END) *******************************************************"
echo "**************************************************************************************"
echo " "