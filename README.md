# Dymo LW450 Backend  
A Docker container which runs a CUPS / IPP print server with drivers for the Dymo LabelWriter 450.

It was created to run on a RaspberryPi in BalenaCloud. Find info on BalenaCloud here: https://www.balena.io.

## Requirements
- A Dymo LabelWriter 450 printer, obviously
- A RaspberryPi to connect the printer to
- An account at Balena, see link above  

## Install and run

You can deploy this app to a new balenaCloud fleet in one click using the button below:

[![](https://balena.io/deploy.svg)](https://dashboard.balena-cloud.com/deploy?repoUrl=https://github.com/dschuuls/dymo-lw450-backend)

... or follow these steps:

- Add the RaspberryPi to a fleet as per Balena's instructions
- Push this repo to the fleet and watch a Docker image being build
- Connect the printer to the RaspberryPi, if you haven't already
- The RaspberryPi should pull the image and start a container
- Print at `ipp://<RPi-IP>:631/printers/dymo`

## Further remarks
- Added lw450.ppd file to this repo because download from dymo.com needs a captcha to be solved
- Companion repo with a simple web frontend to print address labels: https://github.com/dschuuls/dymo-lw450-frontend
