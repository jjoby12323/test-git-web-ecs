FROM httpd:2.4-alpine
LABEL maintainer="Jonathan from Forbes Advisor"

# Enable necessary Apache modules
RUN sed -i '/LoadModule proxy_module/s/^#//g' /usr/local/apache2/conf/httpd.conf \
    && sed -i '/LoadModule proxy_http_module/s/^#//g' /usr/local/apache2/conf/httpd.conf

# Configure reverse proxy
RUN echo 'ProxyPass /javaapp http://43.205.99.236:8080/EC2_test_webapp/' >> /usr/local/apache2/conf/httpd.conf \
    && echo 'ProxyPassReverse /javaapp http://43.205.99.236:8080/EC2_test_webapp/' >> /usr/local/apache2/conf/httpd.conf

# Expose port 80
EXPOSE 80

# Start Apache HTTPD
CMD ["httpd-foreground"]
