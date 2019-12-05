FROM mcr.microsoft.com/dotnet/framework/samples:aspnetapp
#FROM mcr.microsoft.com/windows/servercore:ltsc2019
RUN mkdir -p c:\inetpub\wwwroot\myApp
#SHELL ["powershell"]
##RUN ["powershell.exe", "Install-WindowsFeature NET-Framework-45-ASPNET"]
##RUN ["powershell.exe", "Install-WindowsFeature Web-Asp-Net45"]
##RUN ["powershell.exe", "Install-WindowsFeature web-server"]
RUN ["powershell.exe", "Remove-WebSite -Name 'Default Web Site'"]
RUN New-Website -Name 'MyApp' -Port 80 -PhysicalPath 'c:\inetpub\wwwroot\myApp' -ApplicationPool '.NET v4.5'
ARG source
WORKDIR /inetpub/wwwroot/myApp
COPY ${source:-obj/Docker/Publish} .
#ENTRYPOINT powershell
