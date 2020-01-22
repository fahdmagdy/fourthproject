#FROM mcr.microsoft.com/windows/servercore:ltsc2019
#SHELL ["powershell"]
#ARG source
#WORKDIR /inetpub/wwwroot
#COPY ${source:-obj/Docker/Publish} .
#RUN Invoke-WebRequest -UseBasicParsing -Uri "https://dotnetbinaries.blob.core.windows.net/servicemonitor/2.0.1.6/ServiceMonitor.exe" -OutFile "C:\ServiceMonitor.exe"
#CMD ["C:\\ServiceMonitor.exe", "w3svc"]

FROM microsoft/mssql-server-windows-express
COPY ./Table.sql .
ENV ACCEPT_EULA Y
ENV sa_password Xyz78901
RUN sqlcmd -i Table.sql 

