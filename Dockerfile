FROM debian:stable-slim

RUN apt update && \
    apt install -y ca-certificates

ADD https://packages.microsoft.com/config/debian/12/packages-microsoft-prod.deb /tmp/packages-microsoft-prod.deb 
RUN dpkg -i /tmp/packages-microsoft-prod.deb && \
    apt update && \
    apt install -y procps screen dotnet-sdk-7.0 && \
    adduser vintagestory --shell /sbin/nologin && \
    mkdir -p /var/vintagestory/data/Logs && \
    chown -R vintagestory:vintagestory /var/vintagestory

USER vintagestory
WORKDIR /home/vintagestory/server

ADD  --chown=vintagestory:vintagestory https://cdn.vintagestory.at/gamefiles/stable/vs_server_linux-x64_1.20.0.tar.gz /home/vintagestory/server/vs_server_linux-x64_1.20.0.tar.gz
RUN tar -xvf vs_server_linux-x64_*.*.*.tar.gz && \
    chmod +x server.sh 

ENV USERNAME=vintagestory
ENV VSPATH=/server

ENTRYPOINT ["dotnet", "VintagestoryServer.dll", "--dataPath", "/var/vintagestory/data"]
CMD []
