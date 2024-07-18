# Unsloth-Docker 

## Overview

This project provides a dockerized deployment of **Unsloth AI** (link: [Unsloth AI Github](https://github.com/unslothai/unsloth)

A Jupyter notebook instance is included in the Docker container for direct use of Unsloth from the container. 

##Notebook
- port **8889** 
	-can be changed in the **Dockerfile ENTRYPOINT** if needed.

## Branches
### main
The **main** branch contains only the Dockerfile and the requirements.txt file.

### docker-compose
The **docker-compose** branch includes a docker-compose.yaml to:
- Deploy the Docker container.
- Mount the directory of this repository into the Docker container at `/mnt/`.
- Spawn and expose a Jupyter notebook on port 8889 on all network interfaces of the host.
    - **Token**: ´J541hItwh&Q´

For the setup of the **docker-compose** branch view the README.md of the docker-compose branch.

## License
This project is licensed uder the GPL-3.0 license. See the LICENSE file for details.
