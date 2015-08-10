FROM easksd/apache

#Copy in the our custom kuali-tools.conf
COPY ./conf/kuali-tools.conf /etc/apache2/conf-enabled/kuali-tools.conf

RUN a2enmod headers

EXPOSE 80

# See easksd/apache. The startup command is defined there.
CMD ["/start_apache.sh"]
