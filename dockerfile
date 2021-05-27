FROM httpd
RUN apt-get update && apt-get install -y vim && apt-get install -y tree && apt-get install -y curl
#CMD ["python","app.py"]
WORKDIR /usr/local/apache2/htdocs/
RUN mkdir -p /usr/src/app/
COPY ./index.html /usr/local/apache2/htdocs/
EXPOSE 80
