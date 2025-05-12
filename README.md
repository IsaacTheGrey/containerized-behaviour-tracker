# containerized-behaviour-tracker
Containerized version of the behaviour tracking computer

## Installation
cd into the loop-docker folder and run
```bash
sudo docker build -t loopb-py2 .
```

## Spinning up the container
```bash
xhost +local:docker

docker run -it --rm -v ~/loopb-data:/path/to/data:/data:Z -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix loopb-py2
```
