FROM ubuntu:14.04

RUN apt-get update && \
  apt-get install -y apache2 \
    libapache2-mod-auth-cas  &&

#Install mod_cas for authentication
RUN apt-get install libapache2-mod-auth-cas  && \

#Copy in the our custom kuali-tools.conf and activate it
COPY ./kuali-tools.conf /usr/local/apache2/conf-available/kuali-tools.conf
RUN ln -s /usr/local/apache2/conf-available/kuali-tools.conf /usr/local/apache2/conf-enabled/kuali-tools.conf


#Copy in the our custom auth_cas.conf
COPY ./auth_cas.conf /etc/apache2/mods-enabled/auth_cas.conf

