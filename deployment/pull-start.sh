#! /bin/bash

# kill the old container process - stopped & removed
docker stop proj5
docker remove proj5
# pull fresh image
docker pull xjohnsonwsu/3120-cicd:latest
# run new container by name, with restart automagic
docker run -d -p 80:80 --name proj5 --restart always xjohnsonwsu/3120-cicd:latest
