#!/bin/sh
# hello-go-deploy-gke deploy.sh

echo " "

if [ "$1" = "-debug" ]
then
    echo "deploy.sh -debug (START)"
    # set -e causes the shell to exit if any subcommand or pipeline returns a non-zero status. Needed for concourse.
    # set -x enables a mode of the shell where all executed commands are printed to the terminal.
    set -e -x
    echo " "
else
    echo "deploy.sh (START)"
    # set -e causes the shell to exit if any subcommand or pipeline returns a non-zero status.  Needed for concourse.
    set -e
    echo " "
fi

echo "At start, you should be in a /tmp/build/xxxxx directory with one folder:"
echo "   /hello-go-deploy-gke"
echo " "

echo "We are Assuming you have a Kubernetes cluster running at GKE"
echo " "

echo "PRESTEPS"
echo " "

echo "Note: $GCP_JEFFS_PROJECT_ID AND $GCP_JEFFS_APP_SERVICE_ACCOUNT_EMAIL_ADDRESS env variable already preset"
echo " "

echo "Write credential.json file to /root from preset $GCP_JEFFS_APP_SERVICE_ACCOUNT_FILE"
echo "$GCP_JEFFS_APP_SERVICE_ACCOUNT_FILE" | base64 -d > /root/google-credentials.json

echo "Set $GCP_JEFFS_APP_SERVICE_ACCOUNT_PATH (file location) env variable"
export GCP_JEFFS_APP_SERVICE_ACCOUNT_PATH="/root/google-credentials.json"
echo " "

echo "gcloud auth activate-service-account $GCP_JEFFS_APP_SERVICE_ACCOUNT_EMAIL_ADDRESS --key-file $GCP_JEFFS_APP_SERVICE_ACCOUNT_PATH"
gcloud auth activate-service-account "$GCP_JEFFS_APP_SERVICE_ACCOUNT_EMAIL_ADDRESS" --key-file "$GCP_JEFFS_APP_SERVICE_ACCOUNT_PATH"
echo " "

echo "gcloud config set project $GCP_JEFFS_PROJECT_ID"
gcloud config set project "$GCP_JEFFS_PROJECT_ID"
echo " "

echo "gcloud version"
gcloud version
echo " "

echo "gcloud components list"
gcloud components list
echo " "

echo "gcloud config list"
gcloud config list
echo " "

echo "Connect to your cluster"
gcloud container clusters get-credentials jeffs-gke-cluster-hello-go-deploy-gke \
    --zone us-west1-a \
    --project "$GCP_JEFFS_PROJECT_ID"
echo " "

echo "cd into the deploy-gke directory"
cd hello-go-deploy-gke/example-01/deploy-gke
echo " "

echo "sh deploy-gke.sh"
sh deploy-gke.sh
echo " "

echo "deploy.sh (END)"
echo " "
