#FROM mcr.microsoft.com/dotnet/framework/samples:aspnetapp
FROM mcr.microsoft.com/windows/servercore:ltsc2019
SHELL ["powershell"]
RUN ["powershell.exe", "Install-WindowsFeature NET-Framework-45-ASPNET"]
RUN ["powershell.exe", "Install-WindowsFeature Web-Asp-Net45"]
RUN ["powershell.exe", "Install-WindowsFeature web-server"]
RUN ["powershell.exe", "New-Website Name 'MyApp' Port 80 PhysicalPath 'c:\inetpub\wwwroot' ApplicationPool '.NET v4.5'"]
ARG source
WORKDIR /inetpub/wwwroot
COPY ${source:-obj/Docker/Publish} .
ENTRYPOINT powershell
