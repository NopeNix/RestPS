![GitHub Workflow Status](https://img.shields.io/github/actions/workflow/status/NopeNix/RestPS/Build%20and%20Push%20to%20Docker%20Hub.yml?label=Build%20and%20Push%20to%20Docker%20Hub)
![GitHub issues](https://img.shields.io/github/issues-raw/NopeNix/RestPS)
![Docker Stars](https://img.shields.io/docker/stars/nopenix/restps)
![GitHub Repo stars](https://img.shields.io/github/stars/NopeNix/RestPS?label=GitHub%20Stars)
# RestPS
General use RestPS PowerShell Container for x64 platforms. (Feel free to use the [dockerfile] to build for other Platforms, too (RaspberryPi's (3+4) are supported!)
RestPS is a awesome super easy to use PowerShell Module. I made a container out of it.

#### RestPS is not build by me please check out the original Repo on Github: [https://github.com/jpsider/RestPS](https://github.com/jpsider/RestPS) don't forget to leave a Star

# Getting Started
## RestPS Module
RestPS is easy and learned within 2 minutes but [you have to check it out first](https://github.com/jpsider/RestPS).

## Quick test
You can start the container with just Port 80 exposed and try to access either /endpoint/status (which will return a 1) or /proc (which will return all running processes in the container, long ugly JSON List) to get your first response

## Running on your own Endpoints JSON and implementing your own Script
### docker-compose.yml
```yml
version: "3"

services:
  restps:
    image: nopenix/restps:latest # !!!! Use :latest for x64, use :arm64v8 for arm64v8
    restart: unless-stopped
    ports:
      - 80:80
    volumes:
      - /path/to/your/endpoints.json:/app/endpoints.json # mounting endpoints file
      #- /path/to/a/powershell-script.ps1:/app/script.ps1 # do not forget to mount your Scripts!
    environment: 
      port: 80
      path_to_endpoints_json_file: /app/endpoints.json # using the in the volumes block previous mounted endpoints file
```

# Env Variables
| Variable | Effect |
| --- | --- |
|port|Specify the Port RestPS should listen on|
|path_to_endpoints_json_file|Path to the JSON Endpoints definition file |


# Tags
| Tag | Arch | Comment |
| --- | --- | --- |
|latest|x64|Default image|
|arm64v8|arm64v8|ARM 64Bit Build for e.g. Raspberry Pi 3 or 4|
