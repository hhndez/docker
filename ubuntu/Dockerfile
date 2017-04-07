FROM ubuntu
RUN useradd -ms /bin/bash hhndez
USER root
RUN apt-get update && apt-get install -y unzip
RUN apt-get install -y curl

#Install node dependencies
RUN curl -sL https://deb.nodesource.com/setup_7.x | apt-get install -y nodejs npm
RUN apt-get install -y build-essential checkinstall
RUN ln -s /usr/bin/nodejs /usr/bin/node


RUN npm install -g cdt2 --registry http://presentation-layer.lmera.ericsson.se/registry --proxy null

RUN cdt2 self-update

USER hhndez
WORKDIR /home/hhndez/

RUN mkdir /home/hhndez/myapp/
RUN cd /home/hhndez/myapp/ && cdt2 skeleton

RUN echo "Check the /home/hhndez/myapp/ directory"
