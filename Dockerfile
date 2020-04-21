FROM registry.access.redhat.com/ubi8/nodejs-10:latest

# Home directory for Node-RED application source code.
RUN mkdir -p /usr/src/node-red

# User data directory, contains flows, config and nodes.
RUN mkdir /data

WORKDIR /usr/src/node-red

# package.json contains Node-RED NPM module and node dependencies
COPY package.json /usr/src/node-red/
RUN npm install

# User configuration directory volume
VOLUME ["/data"]
EXPOSE 1880

# Environment variable holding file path for flows configuration
ENV FLOWS=flows.json

CMD ["npm", "start", "--", "--userDir", "/data"]