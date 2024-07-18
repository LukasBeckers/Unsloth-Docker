# Unsloth-Docker 

## Overview

This project provides a dockerized deployment of **Unsloth AI** (link: [Unsloth AI Github](https://github.com/unslothai/unsloth)

A Jupyter notebook instance is included in the Docker container for direct use of Unsloth from the container. The notebook listens on port 8889 by default, but this can be changed in the Dockerfile ENTRYPOINT if needed.

The **main** branch contains only the Dockerfile and the requirements.txt file.

The **docker-compose** branch includes a docker-compose.yaml to:
- Deploy the Docker container.
- Mount the directory of this repository into the Docker container at `/mnt/`.
- Spawn and expose a Jupyter notebook on port 8889 on all network interfaces of the host.
    - The port can be changed in the ENTRYPOINT line of the Dockerfile.

## License
This project is licensed uder the GPL-3.0 license. See the LICENSE file for details.
