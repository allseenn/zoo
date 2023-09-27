FROM ubuntu:22.04

LABEL maintainer="Romashin Rostislav"
LABEL hostname="strogino"

RUN apt-get update && \
    apt-get install -y openssh-server vim git curl wget python3.10-venv gnupg locales openjdk-8-jdk file sudo tree graphviz && \
    locale-gen ru_RU.UTF-8 && \
    mkdir /var/run/sshd && \
    chmod 755 /var/run/sshd && \ 
    rm -rf /var/lib/apt/lists/*     

RUN echo 'PermitRootLogin yes' >> /etc/ssh/sshd_config && \
    echo 'PasswordAuthentication yes' >> /etc/ssh/sshd_config && \
    echo 'service ssh start' >> /usr/sbin/start.sh && \
    chmod 777 /usr/sbin/start.sh

RUN echo "root:Test123" | chpasswd

EXPOSE 3306:3306
EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]

