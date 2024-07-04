# Ubuntu docker container.
## Description:

Just a linux for some tests, working, and what you  need to do in linux.

## Note!
Set your git the following command.

    git config --global core.autocrlf false

Because trailing characters ^M will affect the docker image build.

## How to use:
    docker built -t your_image_tag .
    docker run -id --name container_name -p 22:22 -p your_image_tag
    Connect to your container:
    docker exec -it  container_name /bin/bash
    or use ssh login:root password:root
    Enjoy...
