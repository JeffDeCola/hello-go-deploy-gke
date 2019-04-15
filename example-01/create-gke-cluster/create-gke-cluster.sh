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

echo "What machine Type do you want to username (all preemptible)"
echo "   [1] f1-micro      (.6GB)    3 Node  \$9/month - Good for 1 pod only."
echo "   [2] g1-small      (1.7GB)   1 Node  \$6/month - Good for 3 pods."
echo "   [3] g1-small      (1.7GB)   2 Node \$12/month"
echo "   [4] g1-small      (1.7GB)   3 Node \$18/month"
echo "   [5] n1-standard-1 (3.75GB)  1 Node  \$8/month - Recommended for testing"
echo "   [6] n1-standard-1 (3.75GB)  2 Node \$16/month"
echo "   [7] n1-standard-1 (3.75GB)  3 Node \$24/month"
echo " "

printf  "> "
read -r choice
echo " "

if [ "$choice" = "1" ]
then
    MACHINE_TYPE="f1-micro"
    NUM_NODES="3"
elif [ "$choice" = "2" ]
then
    MACHINE_TYPE="g1-small"
    NUM_NODES="1"
elif [ "$choice" = "3" ]
then
    MACHINE_TYPE="g1-small"
    NUM_NODES="2"
elif [ "$choice" = "4" ]
then
    MACHINE_TYPE="g1-small"
    NUM_NODES="3"
elif [ "$choice" = "5" ]
then
    MACHINE_TYPE="n1-standard-1"
    NUM_NODES="1"
elif [ "$choice" = "6" ]
then
    MACHINE_TYPE="n1-standard-1"
    NUM_NODES="2"
elif [ "$choice" = "7" ]
then
    MACHINE_TYPE="n1-standard-1"
    NUM_NODES="3"
else
    echo "Please make a valid choice"
    echo " "
    exit 0
fi

echo "Creating a $NUM_NODES node Kubernetes cluster at gke using preemptible $MACHINE_TYPE "
echo " "
gcloud container --project "$GCP_JEFFS_PROJECT_ID" \
    clusters create jeffs-gke-cluster-hello-go-deploy-gke \
    --addons HorizontalPodAutoscaling,HttpLoadBalancing,KubernetesDashboard \
    --disk-size "10" \
    --disk-type "pd-standard" \
    --enable-autorepair \
    --enable-autoupgrade \
    --enable-cloud-logging \
    --enable-cloud-monitoring \
    --image-type "COS" \
    --machine-type "$MACHINE_TYPE" \
    --no-enable-ip-alias \
    --num-nodes "$NUM_NODES" \
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