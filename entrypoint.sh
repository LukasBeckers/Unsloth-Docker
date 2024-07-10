#!/bin/bash
#
cd /mnt/

python -m venv .venv

source .venv/bin/activate

pip install --upgrade pip 

pip3 install notebook jupyter
 
pip3 install --upgrade --force-reinstall --no-cache-dir torch==2.2.0 triton \
  --index-url https://download.pytorch.org/whl/cu121

pip3 install "unsloth[cu121-ampere-torch220] @ git+https://github.com/unslothai/unsloth.git"

exec jupyter notebook -ip=0.0.0.0 --no-browser --port=8889 

