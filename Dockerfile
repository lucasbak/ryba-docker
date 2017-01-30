FROM centos:7
MAINTAINER Lucas BAKALIAN

WORKDIR '/tmp'
RUN yum install -y wget tar vim curl git

WORKDIR '/tmp'
RUN wget --no-check-certificate https://nodejs.org/download/release/v6.2.2/node-v6.2.2-linux-x64.tar.gz
WORKDIR /usr/local
RUN tar --strip-components 1 -xzf /tmp/node-v6.2.2-linux-x64.tar.gz
RUN node -v
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
