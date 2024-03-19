# Project 4 - CI

## Part 1 - Dockerize it

### CI Project Overview

- This project creates a container image with a `Dockerfile` that will be used to build a container that will run an Apache2 webserver serving custom content copied into the container during the image creation. The purpose of hosting a webserver in a container is to be able to more easily update site content across multiple servers and to be able to deploy multiple servers more quickly.

### Run Project Locally

- To install docker + dependencies on my laptop running Ubuntu 22.04, I executed the following commands:
```
        sudo apt-get update
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

- To create a public repo in DockerHub, from your `Repositories` screen: click `Create repository`. Fill out the necessary fields, then select `Create`.
- To authenticate with DockerHub via CLI use `docker login`.
    - Using the credential stores with a token is generally the safest option.
- To push a container image to Dockerhub without GitHub Actions, use `docker push <username>/<image_name>`.
- [DockerHub Repo](https://hub.docker.com/repository/docker/xjohnsonwsu/3120-cicd/general)
- To configure GitHub Secrets, in the repo goto `Settings`, then `Secrets and variables` and select `Actions`, then select `New repository secret`.
    - `DOCKER_USERNAME` and `DOCKER_PASSWORD` are set for this project.
- Whenever there is a push to the main branch of the GitHub repo, this workflow will push the image to the DockerHub repo.
    - The custom variable for this is the `images: xjohnsonwsu/3120-cicd` which directs where the image is pushed.

## Part 3 - Diagramming

### Resources Used

- [Install Docker Engine on Ubuntu - Install using the apt repository](https://docs.docker.com/engine/install/ubuntu/#install-using-the-repository)
- [dockerhub - httpd](https://hub.docker.com/_/httpd)
- [Docker Curriculum - Dockerfile](https://docker-curriculum.com/#dockerfile)
- [CourseNotes - Containers](https://github.com/pattonsgirl/CEG3120/blob/main/CourseNotes/containers.md)
- [CourseNotes - Container Exercises](https://github.com/pattonsgirl/CEG3120/blob/main/CourseNotes/container-exercises.md)
- [Use the Docker command line](https://docs.docker.com/engine/reference/commandline/cli/)
- [docker login](https://docs.docker.com/reference/cli/docker/login/)
- [GitHub - publishing images to DockerHub](https://docs.github.com/en/actions/publishing-packages/publishing-docker-images#publishing-images-to-docker-hub)
- [Introduction to GitHub Actions](https://docs.docker.com/build/ci/github-actions/)