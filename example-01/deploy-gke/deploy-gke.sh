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
echo "  image: jeffdecola/hello-go-deploy-gke:latest"
echo " "

#echo "Deploy via kubectl run"
#kubectl run jeffs-web-counter-deployment \
#    --replicas 2 \
#    --image "jeffdecola/hello-go-deploy-gke:latest" \
#    --port "8080"
#echo " "

echo "Deploy via yaml file"
kubectl create -f deploy.yaml
echo " "

echo "Start your service - Expose to the world"
echo " "

#echo "Service via kubectl expose"
#kubectl expose deployment jeffs-web-counter-deployment \
#    --name jeffs-web-counter-service \
#    --type LoadBalancer \
#    --port 80 \
#    --target-port 8080
#echo " "

echo "Service via yaml file"
kubectl create -f service.yaml
echo " "

echo "Inspect your deployment"
echo "    kubectl get deployments"
echo "    kubectl get deployment jeffs-web-counter-deployment"
echo " "
echo "Delete your deployment" 
echo "    kubectl delete service jeffs-web-counter-service"
echo " "
echo "Inspect your service" 
echo "    kubectl get services"
echo "    kubectl get service jeffs-web-counter-service"
echo " "
echo "Delete your service" 
echo "    kubectl delete service jeffs-web-counter-service"
echo " "

echo "*****************************************************************************"
echo "* deploy-gke.sh (END) *******************************************************"
echo "*****************************************************************************"
echo " "