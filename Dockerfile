
# Stage 1: Build environment
FROM nvidia/cuda:12.1.1-cudnn8-devel-ubuntu22.04 as builder

RUN apt-get update && \
    apt-get install -y --no-install-recommends python3-pip python3-dev python3-venv build-essential git && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY requirements.txt .

RUN pip install --upgrade pip && \
    pip install --upgrade --force-reinstall --no-cache-dir --target=/app/python-packages torch==2.2.0 triton --index-url https://download.pytorch.org/whl/cu121 && \
    pip install --upgrade --force-reinstall --no-cache-dir --target=/app/python-packages git+https://github.com/unslothai/unsloth.git && \
    pip install --target=/app/python-packages -r requirements.txt

# Stage 2: Runtime environment
FROM nvidia/cuda:12.1.1-cudnn8-runtime-ubuntu22.04

RUN useradd -ms /bin/bash worker && mkdir /app && chown worker:worker /app

USER worker

WORKDIR /app

ENV PYTHONPATH=/app/python-packages
ENV PATH="/app/python-packages/bin:$PATH"

COPY --from=builder /app /app

WORKDIR /mnt

ENTRYPOINT ["jupyter", "notebook", "--ip=0.0.0.0", "--no-browser", "--port=8889"]
