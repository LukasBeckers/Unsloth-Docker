ROM nvidia/cuda:12.1.1-cudnn8-devel-ubuntu22.04 

RUN apt-get update  

RUN apt-get install -y python3-pip \ 
                       python3-dev \
		       python3-venv \
                       build-essential

RUN apt-get install -y git

WORKDIR /app

COPY entrypoint.sh /app/entrypoint.sh

RUN chmod +x /app/entrypoint.sh

CMD ["/app/entrypoint.sh"]

