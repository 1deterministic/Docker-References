FROM fedora:latest

COPY installer.sh /opt/installer.sh

RUN chmod +x /opt/installer.sh && bash /opt/installer.sh

USER user
ENV HOME /home/user
CMD glxgears
