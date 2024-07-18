This is a dockerized deployment of Unsloth AI (link: https://github.com/unslothai/unsloth)

To start:
    on main: docker compose up -d --build

    on smaller-image: bash start_unsloth.sh

On the main branch unsloth is added to the docker image.

On the smaller-image branch unsloth is installed in the entrypoint in a python
venv in the same folder in which the start_unsloth.sh skript is placed.
