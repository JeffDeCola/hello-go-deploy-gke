#!/bin/sh -e
# hello-go-deploy-gke run.sh

echo " "

if [ "$1" = "-debug" ]
then
    echo "************************************************************************"
    echo "* run.sh -debug (START) ************************************************"
    echo "************************************************************************"
    # set -x enables a mode of the shell where all executed commands are printed to the terminal.
    set -x
    echo " "
else
    echo "************************************************************************"
    echo "* run.sh (START) *******************************************************"
    echo "************************************************************************"
    echo " "
fi

echo "Check that it is working"
echo " "
echo "      curl localhost:8080"
echo "      Goto your local webpage: http://localhost:8080/"
echo " "

echo "go run main.go"
echo " "
go run main.go
echo " "

echo "************************************************************************"
echo "* run.sh (END) **************************************************"
echo "************************************************************************"
echo " "
