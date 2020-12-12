# Pimatic for Raspberry Pi in Docker
Clean and simple Dockerfile to run [pimatic](https://pimatic.org/) in a Docker container.

Based on node.js version 8 (higher versions are not supported as of 2020 with pimatic v0.9.54). Tested on Raspberry Pi 4 B running Raspberry Pi OS Lite buster.

## Usage
### Build
Clone this repository, change into the directory and build the Docker image (this will download all needed base images and bake the Dockerfile instructions into a new image called `f1ix/rpi-pimatic-docker`):
```bash
docker build -t f1ix/rpi-pimatic-docker .
```

### Configure
The example config `config_default.json` with login `admin:admin` is baked into the Docker image upon build. The config file is the central point of configuration for your pimatic instance. You can define ports, usernames and passwords, load plugins and save credentials and API keys for third party services used by plugins there.

To replace the default `config.json`, mount a customized copy to `/home/pimatic-app/config.json` inside of the Docker container using the `-v` (volume) flag as described below.

### Run
Spawn a new container running pimatic based on our newly created image (adapt full path to your `config.json`):
```bash
docker run -v ~/rpi-pimatic-dockerfile/data/config.json:/home/pimatic-app/config.json --net=host --name=pimatic-app --restart unless-stopped f1ix/rpi-pimatic-docker
```
**Installing all needed components such as sqlite can take quite some minutes!**

Once everything is up and running, simply close the ssh session. Pimatic will continue running (check `docker ps -a`) and may be stopped or (re-)started using `docker start/stop pimatic-app`.
