FROM centos:7
MAINTAINER Lucas BAKALIAN

WORKDIR '/tmp'
RUN yum install -y wget tar vim curl git

WORKDIR '/tmp'
ENV NPM_CONFIG_LOGLEVEL info
ENV NODE_VERSION 9.4.0
RUN yum install -y xz \
  && curl -SLO "https://nodejs.org/dist/v$NODE_VERSION/node-v$NODE_VERSION-linux-x64.tar.xz" \
  && tar -xJf "node-v$NODE_VERSION-linux-x64.tar.xz" -C /usr/local --strip-components=1 \
  && rm -f "/node-v$NODE_VERSION-linux-x64.tar.xz"
RUN node -v
RUN npm install -g bower yarn


ENV NIKITA_VERSION 0.8.0
ENV MASSON_VERSION 0.1.8
ENV RYBA_VERSION 0.1.1

# Install supervisor
RUN \
  yum install -y iproute python-setuptools hostname inotify-tools yum-utils which && \
  easy_install supervisor

# Install SSH
RUN yum install -y openssh-server openssh-clients \
  && ssh-keygen -t rsa -f ~/.ssh/id_rsa -N '' \
  && cat ~/.ssh/id_rsa.pub > ~/.ssh/authorized_keys \
  && ssh-keygen -f /etc/ssh/ssh_host_rsa_key
  
WORKDIR '/ryba'
RUN git clone https://github.com/ryba-io/ryba --branch v$RYBA_VERSION
RUN git clone https://github.com/adaltas/node-masson --branch v$MASSON_VERSION
RUN git clone https://github.com/adaltas/node-nikita --branch v$NIKITA_VERSION
RUN mv node-masson masson
RUN mv node-nikita nikita

WORKDIR '/ryba/nikita'
RUN yarn
RUN yarn link

WORKDIR '/ryba/masson'
RUN yarn
RUN yarn link 
RUN yarn link nikita
 
WORKDIR '/ryba/ryba'
RUN yarn
RUN yarn link 
RUN yarn link masson
RUN yarn link nikita

WORKDIR '/ryba/ryba-env-metal'
ADD ./package.json /ryba/ryba-env-metal/package.json
RUN yarn
RUN yarn link nikita
RUN yarn link masson
RUN yarn link ryba

#RUN ln -s /ryba/ryba-env-metal/bin/ryba /usr/local/bin/ryba


ADD ./supervisord.conf /etc/supervisord.conf
ADD ./run.sh /run.sh
RUN chmod +x /run.sh
ENTRYPOINT ["/run.sh"]
CMD []
