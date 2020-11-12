FROM kalilinux/kali-rolling

RUN echo "deb http://ftp2.nluug.nl/os/Linux/distr/kali kali-rolling main non-free contrib" | tee /etc/apt/sources.list

RUN apt update --fix-missing && \
    apt upgrade -y --fix-missing && \
    DEBIAN_FRONTEND=noninteractive apt install -y kali-tools-top10/kali-rolling dnsutils procps

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]