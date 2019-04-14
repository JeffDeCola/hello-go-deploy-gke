#!/bin/sh -e
# hello-go-deploy-gke deploy-gke.sh

echo " "

if [ "$1" = "-debug" ]
then
    echo "*****************************************************************************"
    echo "* deploy-gke.sh -debug (START) **********************************************"
    echo "*****************************************************************************"
    # set -x enables a mode of the shell where all executed commands are printed to the terminal.
    set -x
    echo " "
else
    echo "*****************************************************************************"
    echo "* deploy-gke.sh (START) *****************************************************"
    echo "*****************************************************************************"
    echo " "
fi

echo "Deploy your docker image on Dockerhub to your cluster"
kubectl run jeffs-web-counter \
    --image "jeffdecola/hello-go-deploy-gke:latest" \
    --port "8080"
echo " "

echo "Export to the world"
kubectl expose deployment jeffs-web-counter \
    --type LoadBalancer \
    --port 80 \
    --target-port 8080
echo " "

echo "You can inspect your service" 
echo "    kubectl get service jeffs-web-counter"
echo " "
echo "You can delete your service" 
echo "    kubectl delete service jeffs-web-counter"
echo " "

echo "*****************************************************************************"
echo "* deploy-gke.sh (END) *******************************************************"
echo "*****************************************************************************"
echo " "