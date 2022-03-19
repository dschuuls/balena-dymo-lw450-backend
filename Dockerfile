# https://www.balena.io/docs/reference/base-images/base-images-ref

FROM balenalib/raspberry-pi:latest

RUN apt-get update \
 && apt-get install -y \
    cups \
    cups-client \
    printer-driver-dymo \
    usbutils

# http://download.dymo.com/dymo/Software/Download%20Drivers/Linux/Download/dymo-cups-drivers-1.4.0.tar.gz

#COPY start.sh dymo-cups-drivers-1.4.0.tar.gz ./

#RUN tar -xzf dymo-cups-drivers-1.4.0.tar.gz \
# && mkdir -p /usr/share/cups/model \
# && cp ./dymo-cups-drivers-1.4.0.5/ppd/lw450.ppd /usr/share/cups/model/ \
# && rm -rf ./dymo-cups-drivers-1.4.0.5 \
# && rm -rf ./dymo-cups-drivers-1.4.0.tar.gz

#RUN chmod +x start.sh

COPY lw450.ppd /usr/share/cups/model/
COPY start.sh ./

RUN chmod +x start.sh

# Expose SMB printer sharing
EXPOSE 137/udp 139/tcp 445/tcp

# Expose IPP printer sharing
EXPOSE 631/tcp 5353/udp

# https://www.cups.org/doc/firewalls.html

ENV UDEV=1

# Start CUPS instance
CMD ./start.sh