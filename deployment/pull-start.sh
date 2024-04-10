#! /bin/bash

# stop and remove outdated container and report
docker stop proj5
docker remove proj5
echo "old container removed"

# pull fresh image from DockerHub
docker pull xjohnsonwsu/3120-cicd:latest

# run new container with name and automatic restart
docker run -d -p 80:80 --name proj5 --restart always xjohnsonwsu/3120-cicd:latest

# report that all commands have been executed
echo "Everything's shiny, Captain!"
