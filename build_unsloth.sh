
#!/bin/bash

# Get dir name of repo.
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

export UNSLOTH_DIR=$DIR

docker-compose up -d --build
