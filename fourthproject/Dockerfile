#FROM mcr.microsoft.com/dotnet/framework/samples:aspnetapp
FROM mcr.microsoft.com/windows/servercore:ltsc2019
ARG source
WORKDIR /inetpub/wwwroot
COPY ${source:-obj/Docker/Publish} .