# Unsloth-Docker 

## Overview

This is a dockerized deployment of Unsloth AI (link: https://github.com/unslothai/unsloth)

This branch includes a docker-compose.yaml to:
- Deploy the Docker container.
- Mount the directory of this repository into the Docker container at `/mnt/`.
- Spawn and expose a Jupyter notebook on port 8889 on all network interfaces of the host.
    - You can change the port in the ENTRYPOINT line of the Dockerfile.

## Getting Started 
### Clone the Repository 
```
git clone https://github.com/LukasBeckers/Unsloth-Docker.git
cd Unsloth-Docker.git
```
### Building and Deploying the Unsloth-Docker Container
```
bash start_unsloth.sh
```

### Stopping and Removing the Unsloth-Docker Container
```
bash stop_unsloth.sh
```

The skript are needed to determine the path of the Repo on your system

## License
This project is licensed uder the GPL-3.0 license. See the LICENSE file for details.

