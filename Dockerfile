From ubuntu

WORKDIR /app

RUN apt-get update \
    && apt-get install -y nodejs npm \
    && apt-get install -y libfontconfig \
    && rm -rf /var/lib/apt/lists/* /var/cache/apt/* \
    && update-alternatives --install /usr/bin/node node /usr/bin/nodejs 10

RUN npm install -g mocha
RUN npm install -g grunt-cli
RUN npm install grunt --save-dev
RUN npm install grunt-contrib-qunit --save-dev
RUN npm install phantomjs-prebuilt --save-dev

ADD . /app

CMD ["/bin/sh runTests.sh"]
