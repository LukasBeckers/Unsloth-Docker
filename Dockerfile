FROM nvidia/cuda:12.1.1-cudnn8-devel-ubuntu22.04 

RUN apt-get update  

RUN apt-get install -y python3-pip \ 
                       python3-dev \
		       python3-venv \
                       build-essential

RUN apt-get install -y git

RUN cd /mnt/Lukas/Unsloth-Docker/

RUN python -m venv .venv

RUN source .venv/bin/activate

RUN pip3 install notebook jupyter
 
RUN pip install --upgrade --force-reinstall --no-cache-dir torch==2.2.0 triton \
  --index-url https://download.pytorch.org/whl/cu121

RUN pip install "unsloth[cu121-ampere-torch220] @ git+https://github.com/unslothai/unsloth.git"

CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--no-browser", "--port=8101"]

