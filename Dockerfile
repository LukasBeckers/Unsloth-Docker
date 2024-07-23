FROM nvidia/cuda:12.1.1-cudnn8-devel-ubuntu22.04

RUN apt-get update

RUN apt-get install -y python3-pip \
    python3-dev \
    python3-venv \
    build-essential \
    git

RUN useradd -ms /bin/bash worker \
    && mkdir /app \
    && chown worker:worker /app

USER worker

WORKDIR /

COPY requirements.txt .

RUN pip install --upgrade pip && \
    pip install --upgrade --force-reinstall --no-cache-dir torch==2.2.0 triton \
    --index-url https://download.pytorch.org/whl/cu121 && \
    pip install --upgrade --force-reinstall --no-cache-dir git+https://github.com/unslothai/unsloth.git && \
    pip install -r requirements.txt && \
    python3 -m ipykernel install --user --name unsloth

ENV PATH="/home/worker/.local/bin:$PATH"

ENTRYPOINT ["jupyter", "notebook", "--ip=0.0.0.0", "--no-browser", "--port=8889"]
