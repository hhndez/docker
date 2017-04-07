FROM ubuntu
RUN useradd -ms /bin/bash hhndez
USER root
###################################################
#cdt2
###################################################
RUN apt-get update && apt-get install -y unzip
RUN apt-get install -y curl

#Install node dependencies
RUN curl -sL https://deb.nodesource.com/setup_7.x | apt-get install -y nodejs npm
RUN apt-get install -y build-essential checkinstall
RUN ln -s /usr/bin/nodejs /usr/bin/node
RUN npm install -g cdt2 --registry http://presentation-layer.lmera.ericsson.se/registry --proxy null
RUN cdt2 self-update

###################################################
# GIT
###################################################
RUN apt-get install -y git python-virtualenv

#USER hhndez
#WORKDIR /home/hhndez/

RUN mkdir /root/.ssh/
ADD id_rsa /root/.ssh/id_rsa
ADD known_hosts /root/.ssh/known_hosts
RUN chmod 700 /root/.ssh/id_rsa
RUN chown -R root:root /root/.ssh

#Create known_hosts
#RUN touch /root/.ssh/known_hosts

# Remove host checking
RUN echo "Host bitbucket.org\n\tStrictHostKeyChecking no\n" >> /root/.ssh/config

run mkdir /root/ITTE_WE/

# Clone the conf files into the docker container
RUN cd /root/ITTE_WE/ && git clone --quiet ssh://ehuhern@gerrit.ericsson.se:29418/DCOM/ITTE_WE .
RUN cd /root/ITTE_WE/ && git fetch && git pull

#RUN mkdir /home/hhndez/ITTE_WE/
RUN cp -r /root/ITTE_WE/ /home/hhndez
RUN chown -R hhndez:hhndez /home/hhndez/ITTE_WE/

USER hhndez
WORKDIR /home/hhndez/ITTE_WE
RUN ls -la

#RUN mkdir /home/hhndez/myapp/
#RUN cd /home/hhndez/myapp/ && cdt2 skeleton

#RUN echo "Check the /home/hhndez/myapp/ directory"
