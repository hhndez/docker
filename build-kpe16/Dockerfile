FROM ubuntu
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
#RUN curl -sL https://deb.nodesource.com/setup_0.12 | apt-get install -y nodejs npm
#RUN apt-get install -y build-essential checkinstall
#RUN ln -s /usr/bin/nodejs /usr/bin/node
