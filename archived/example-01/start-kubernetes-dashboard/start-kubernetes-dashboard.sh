#!/bin/sh -e
# hello-go-start-kubernetes-dashboard start-kubernetes-dashboard.sh

echo " "

if [ "$1" = "-debug" ]
then
    echo "*********************************************************************************************"
    echo "* start-kubernetes-dashboard.sh -debug (START) **********************************************"
    echo "*********************************************************************************************"
    # set -x enables a mode of the shell where all executed commands are printed to the terminal.
    set -x
    echo " "
else
    echo "*********************************************************************************************"
    echo "* start-kubernetes-dashboard.sh (START) *****************************************************"
    echo "*********************************************************************************************"
    echo " "
fi

echo " Get a secret token"
echo " "
gcloud config config-helper --format=json | jq -r '.credential.access_token'
echo " "

echo "Run a proxy"
kubectl proxy &
echo " "

echo "Kubernetes Dashboard"
echo " "
echo "    http://localhost:8001/api/v1/namespaces/kube-system/services/https:kubernetes-dashboard:/proxy"
echo " "

echo "*********************************************************************************************"
echo "* start-kubernetes-dashboard.sh (END) *******************************************************"
echo "*********************************************************************************************"
echo " "