FROM  multiarch/ubuntu-core:armhf-wily

LABEL VERSION="0.0.1" 
LABEL AUTHOR="Carlos Delfino - consultoria@carlosdelfino.eti.br"

ENV LANG pt_BR.UTF-8
RUN locale-gen $LANG

ENV DOCKER_ANDROID_LANG pt_BR
ENV DOCKER_ANDROID_DISPLAY_NAME nanopi=m3

# Never ask for confirmations
ENV DEBIAN_FRONTEND noninteractive

# Update apt-get
RUN rm -rf /var/lib/apt/lists/*
RUN apt-get update
RUN apt-get dist-upgrade -y

# Installing packages
RUN apt-get install -y \
   gcc \
   binutils \
   git

WORKDIR /workspace/contadordeciclistas
ADD . /workspace/contadordeciclistas

CMD [“make”, “all”]

