FROM ubuntu:14.04

RUN apt-get update
RUN apt-get install -y apache2 \
  libapache2-mod-auth-cas

#Copy in the our httpd.conf and activate it
COPY apache2.conf /etc/apache2/httpd.conf

#Copy in the our custom kuali-tools.conf and activate it
COPY kuali-tools-site.conf /etc/apache2/sites-available/kuali-tools-site.conf
RUN ln -s /etc/apache2/sites-available/kuali-tools-site.conf /etc/apache2/sites-enabled/kuali-tools-site.conf

#Copy in the our custom auth_cas.conf
COPY auth_cas.conf /etc/apache2/mods-available/auth_cas.conf

#Enable mod_proxy
RUN a2enmod proxy_http

