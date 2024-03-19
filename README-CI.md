# Project 4 - CI

## Part 1 - Dockerize it

### CI Project Overview

- This project creates a container image with a `Dockerfile` that will be used to build a container that will run an Apache2 webserver serving custom content copied into the container during the image creation. The purpose of hosting a webserver in a container is to be able to more easily update site content across multiple servers and to be able to deploy multiple servers more quickly.

### Run Project Locally

- To install docker + dependencies on my laptop running Ubuntu 22.04, I executed the following commands:
    ``` sudo apt-get update
        sudo apt-get install ca-certificates curl
        sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
        sudo chmod a+r /etc/apt/keyrings/docker.asc
        echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
        sudo apt-get update
         sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
         ```
- To build an image from a `Dockerfile` run `sudo docker build -t <image_name> .` from within the directory that contains the `Dockerfile`.
- To run the container, I entered the following command to run the container with its exposed port 80 conected to the `localhost` port 8080:
    - `sudo docker run -dit --name proj4 -p 8080:80 proj4`
- To view the content and verify that it works, open a browser and goto [http://localhost:8080/](http://localhost:8080/).

## Part 2 - GitHub Actions and DockerHub



## Part 3 - Diagramming

### Resources Used

- [Install Docker Engine on Ubuntu - Install using the apt repository](https://docs.docker.com/engine/install/ubuntu/#install-using-the-repository)
- [dockerhub - httpd](https://hub.docker.com/_/httpd)
- [Docker Curriculum - Dockerfile](https://docker-curriculum.com/#dockerfile)
- [CourseNotes - Containers](https://github.com/pattonsgirl/CEG3120/blob/main/CourseNotes/containers.md)
- [CourseNotes - Container Exercises](https://github.com/pattonsgirl/CEG3120/blob/main/CourseNotes/container-exercises.md)
