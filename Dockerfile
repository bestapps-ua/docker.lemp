FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y software-properties-common && \
    add-apt-repository ppa:ondrej/php && \
    apt-get install -y locales mc nginx mysql-server php8.2-fpm php8.2-mysql php8.2-curl php8.2-pdo-mysql php8.2-mcrypt php8.2-dom php8.2-xml php8.2-gd

RUN rm -rf /var/lib/apt/lists/* \
	&& localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8

ENV LANG en_US.utf8

COPY start.sh /start.sh
COPY src/nginx.conf /etc/nginx/custom.conf
RUN chmod 755 /start.sh
RUN mv /etc/nginx/sites-available/default /etc/nginx/sites-available/default_orig
RUN mv /etc/nginx/custom.conf /etc/nginx/sites-available/default
CMD /start.sh && /bin/bash



