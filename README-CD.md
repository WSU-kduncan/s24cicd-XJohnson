# Project 5 - CD

## Part 1 - Semantic Versioning

- This project uses `git tag` to add tags to the repository which will then be used by the `metadata-action` and the `build-push-action` to appropriately tag images that are being pushed to DockerHub. After that, utilizing a restart script and `webhook` on an EC2 instance to listen for a new image then pull it and deploy the new container automatically.

- To generate a tag for the repo:
    - `commit` the changes
    - run `git tag -a v<*.*.*> <commit hash> -m "<message>"`
    - run `git push origin v<*.*.*>` to push the tag and changes to GitHub.

- The workflow will run when a new tag is pushed to GitHub. This will eliminate extraneous images from being built and pushed to DockerHub: only ready versions will be pushed. The workflow pulls the tag from the GitHub metadata and uses it to tag the image sent to DockerHub.

- [DockerHub Repo](https://hub.docker.com/repository/docker/xjohnsonwsu/3120-cicd/general)

## Part 2 - Deployment

