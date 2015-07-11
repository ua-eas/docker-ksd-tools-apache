FROM easksd/apache

#Copy in the our custom kuali-tools.conf and activate it
COPY ./conf/kuali-tools-site.conf /etc/apache2/sites-available/kuali-tools-site.conf
RUN a2ensite kuali-tools-site.conf

EXPOSE 80

# See easksd/apache. The startup command is defined there.
CMD ["/start_apache.sh"]
