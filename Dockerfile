FROM eheimwbn/ubuntu_go1.10

ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8
ENV DEBIAN_FRONTEND noninteractive
ENV INITRD No
ENV LANG en_US.UTF-8
ENV GOVERSION 1.10.1
ENV GOROOT /opt/go
ENV GOPATH /root/.go

#get updates && install go 1.10
RUN apt-get update && \
  apt-get dist-upgrade -y && \
  apt-get install -y software-properties-common redis-server nmap sqlite3 nsis rpm alien bzip2 && \
  add-apt-repository ppa:mrazavi/openvas && \
  apt-get update && \
  apt-get install -y openvas9 && \
  greenbone-nvt-sync && \
  greenbone-scapdata-sync && \
  greenbone-certdata-sync
