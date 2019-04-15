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

echo "cd into the deploy-gke directory"
cd hello-go-deploy-gke/example-01/deploy-gce
echo " "

echo "sh deploy-gke.sh"
sh deploy-gke.sh
echo " "

echo "deploy.sh (END)"
echo " "
