FROM mcr.microsoft.com/powershell:lts-7.2-alpine-3.14

RUN apk update
RUN apk upgrade
RUN pwsh -c "install-module restps -Scope AllUsers -force"
RUN mkdir /app

COPY RestPSRoutes.json /app/RestPSRoutes.json

ARG port=80
ARG path_to_endpoints_json_file=/app/RestPSRoutes.json

ENV port=$port
ENV path_to_endpoints_json_file=$path_to_endpoints_json_file

CMD pwsh -C "Import-Module RestPS;if ((test-path ${path_to_endpoints_json_file} -erroraction silentlycontinue)){}else{write-host 'JSON Config file ${path_to_endpoints_json_file} does not exist';exit}; Start-RestPSListener -RoutesFilePath ${path_to_endpoints_json_file} -Port ${port}"