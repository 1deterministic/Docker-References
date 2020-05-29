FROM fedora:latest

COPY installer.sh /opt/installer.sh
COPY client.conf /etc/pulse/client.conf

RUN chmod +x /opt/installer.sh && bash /opt/installer.sh

USER user
CMD pacat /dev/urandom
