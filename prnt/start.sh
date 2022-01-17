#!/bin/bash

# Start cups
/usr/sbin/cupsd

# Install the printer
lpadmin -p dymo -v $(lpinfo -v | grep -o 'usb://DYMO.*$') -P /usr/share/cups/model/lw450.ppd

# Start the printer
cupsenable dymo

# Accept jobs to the printer
cupsaccept dymo

# Set the printer as default
lpoptions -d dymo

# Set the size of labels used
lpoptions -o media=w102h252

# Share printer
cupsctl --remote-any

# Restart service
/etc/init.d/cups restart

# Keep container running
tail -f /dev/null
