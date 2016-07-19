FROM ubuntu:16.04

MAINTAINER sentinel1985

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y wget

# Install Pip
RUN apt-get install -y python-setuptools python-dev build-essential
RUN easy_install pip

# install uwsgi now because it takes a little while
RUN pip install uwsgi

# install nginx
RUN apt-get install -y nginx supervisor
RUN apt-get install -y software-properties-common python-software-properties
RUN add-apt-repository -y ppa:nginx/stable

# install our code
add . /application

# setup all the configfiles
RUN echo "daemon off;" >> /etc/nginx/nginx.conf
RUN rm /etc/nginx/sites-enabled/default
RUN ln -s /application/environment_configs/nginx-app.conf /etc/nginx/sites-enabled/
RUN ln -s /application/environment_configs/supervisor-app.conf /etc/supervisor/conf.d/

# run pip install
RUN pip install -r /application/requirements.txt

EXPOSE 80
CMD ["supervisord", "-n"]
