FROM tutum/debian:wheezy
 
# Install packages
RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get -y install python python-apt man less vim cowsay curl wget

RUN export LANGUAGE=en_US.UTF-8
RUN export LANG=en_US.UTF-8
RUN export LC_ALL=en_US.UTF-8
#RUN dpkg-reconfigure locales
#RUN locale-gen en_US.UTF-8

# Create a nonroot user, and switch to it
RUN mkdir /home/nonroot
RUN /usr/sbin/useradd --create-home --home-dir /home/nonroot --shell /bin/bash nonroot
RUN /usr/sbin/adduser nonroot sudo
#RUN chown -R nonroot:nonroot /usr/local/
#RUN chown -R nonroot:nonroot /usr/lib/
#RUN chown -R nonroot:nonroot /usr/bin/
RUN chown -R nonroot:nonroot /home/nonroot
RUN echo "nonroot:nonroot" | chpasswd

EXPOSE 22
EXPOSE 80
EXPOSE 9200
CMD ["/run.sh"]
