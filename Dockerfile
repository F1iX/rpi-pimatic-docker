FROM node:8

# Set timezone passed from build-arg
ARG timezone
ENV TZ=$timezone
RUN cp /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# PIMATIC installation
RUN mkdir /home/pimatic-app
RUN /usr/bin/env node --version
RUN cd /home && npm install pimatic --prefix pimatic-app --production

# Copy default config
COPY config_default.json /home/pimatic-app/config.json

# Start pimatic
CMD ["/home/pimatic-app/node_modules/pimatic/pimatic.js"]
