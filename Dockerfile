FROM centos:7
MAINTAINER Lucas BAKALIAN

WORKDIR '/tmp'
RUN yum install -y wget tar python krb5-server krb5-libs krb5-workstation vim curl
RUN yum install -y gcc-c++ make
RUN echo 'y' | yum groupinstall "Development Tools"

WORKDIR '/tmp'
RUN curl --silent --location https://rpm.nodesource.com/setup_6.x | bash -
RUN yum -y install nodejs
RUN npm install -g bower

WORKDIR '/ryba'
RUN git clone https://github.com/ryba-io/ryba
RUN git clone https://github.com/adaltas/node-masson
RUN git clone https://github.com/adaltas/node-mecano
RUN git clone https://github.com/ryba-io/ryba-repos
RUN git clone https://github.com/ryba-io/ryba-cluster
RUN mv node-masson masson
RUN mv node-mecano mecano

WORKDIR '/ryba/mecano'
RUN npm install
RUN npm link

WORKDIR '/ryba/masson'
RUN npm install
RUN npm link 
RUN npm link mecano
 
WORKDIR '/ryba/ryba'
RUN npm install
RUN npm link 
RUN npm link masson
RUN npm link mecano

WORKDIR '/ryba/ryba-cluster'
RUN npm install
RUN npm link mecano
RUN npm link masson
RUN npm link ryba

ADD entrypoint.sh /ryba/entrypoint.sh
RUN chmod 755 /ryba/entrypoint.sh

ENTRYPOINT ["/ryba/entrypoint.sh"]
