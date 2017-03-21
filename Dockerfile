FROM centos:7
MAINTAINER Diego Gutierrez <dgutierrez1287@gmail.com>

RUN yum -y update && yum clean all
RUN yum -y install epel-release && yum clean all

RUN yum -y install gcc-c++ patch readline readline-devel zlib zlib-devel which \
    libyaml-devel libffi-devel openssl-devel make bzip2 autoconf automake libtool bison iconv-devel \
    && yum clean all

RUN gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 \
    && curl -sSL https://get.rvm.io | bash -s stable --ruby && source usr/local/rvm/scripts/rvm

RUN /bin/bash -l -c "rvm install 2.0.0 && rvm use 2.0.0 --default && gem update --system \
    && source usr/local/rvm/scripts/rvm"

RUN /bin/bash -l -c "gem install bundler"

RUN /bin/bash -l -c "gem install jekyll -v 3.4.2"

EXPOSE 4000

WORKDIR /data
VOLUME /data

