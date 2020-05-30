FROM fedora:32

COPY opt /opt

RUN chmod +x /opt/installer.sh && bash /opt/installer.sh

USER user
ENV HOME /home/user
CMD pacat /dev/urandom
