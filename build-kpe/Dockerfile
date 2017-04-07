FROM ubuntu:14.04
RUN rm -Rf /home/hhndez
RUN useradd -ms /bin/bash hhndez
USER root





###################################################
#cdt2
###################################################
RUN apt-get update && apt-get install -y unzip
RUN apt-get install -y curl

#Install node dependencies
#RUN curl -sL https://deb.nodesource.com/setup_7.x | apt-get install -y nodejs npm
RUN curl -sL https://deb.nodesource.com/setup_0.12 | apt-get install -y nodejs npm
#RUN apt-get install -y build-essential checkinstall
RUN ln -s /usr/bin/nodejs /usr/bin/node
RUN npm install -g cdt2 --registry http://presentation-layer.lmera.ericsson.se/registry --proxy null
RUN cdt2 self-update

###################################################
#ADD phantomjs-bin/ /usr/local/lib/node_modules/phantomjs-bin/
###################################################

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

run mkdir /root/KPIs/

# Clone the conf files into the docker container
RUN cd /root/KPIs/ && git clone --quiet ssh://ehuhern@gerrit.ericsson.se:29418/DCOM/KPIs .
RUN cd /root/KPIs/ && git fetch -p && git pull

#RUN mkdir /home/hhndez/KPIs/
RUN cp -r /root/KPIs/ /home/hhndez
RUN chown -R hhndez:hhndez /home/hhndez/KPIs/

ADD buildKPEApps.sh /home/hhndez/buildKPEApps.sh
ADD test.sh /home/hhndez/test.sh
ADD _icons.less /home/hhndez/_icons.less
RUN chown -R hhndez:hhndez /home/hhndez/*.sh
RUN chown -R hhndez:hhndez /home/hhndez/*.less

USER hhndez
WORKDIR /home/hhndez/

RUN mkdir -p /home/hhndez/buildKPE/
RUN mkdir -p /home/hhndez/temp/


#RUN /home/hhndez/test.sh
RUN /home/hhndez/buildKPEApps.sh

RUN node -v
RUN npm -v

RUN ls -la

