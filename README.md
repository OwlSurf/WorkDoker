# Ubuntu docker container.
## Description:

Just a linux for some tests, working, and what you  need to do in linux.

## Note!
Set your git the following command.

    git config --global core.autocrlf false

Because trailing characters ^M will affect the docker image build.

## How to use:
### Build docker image.
    docker build -t your_image_tag .
### Run container with 22 port forwarding.
    docker run -id --name container_name -p 22:22 your_image_tag
### Connect to your container:
    docker exec -it  container_name /bin/bash
### Or use ssh 
    login:root password:root
Enjoy...
