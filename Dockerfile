FROM node:8

# PIMATIC installation
RUN mkdir /home/pimatic-app
RUN /usr/bin/env node --version
RUN cd /home && npm install pimatic --prefix pimatic-app --production

# Copy default config
COPY config_default.json /home/pimatic-app/config.json
# Mount external volume
#VOLUME ["/data"]
# Symlink externally mounted config file replacing the default config
#CMD ln -fs /data/config.json /home/pimatic-app/config.json

# Start pimatic
CMD ["/home/pimatic-app/node_modules/pimatic/pimatic.js"]
