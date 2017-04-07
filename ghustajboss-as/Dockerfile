FROM ghusta/jboss-as
RUN /opt/jboss/jboss-as/bin/add-user.sh admin Hugo1120 --silent=true
CMD ["/opt/jboss/jboss-as/bin/standalone.sh", "-b", "0.0.0.0", "-bmanagement", "0.0.0.0"]
