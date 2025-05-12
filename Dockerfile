FROM python:2.7-slim

RUN apt-get update && apt-get install -y \
      supervisor \
      libx11-6 libxext6 libxrender1 libxrandr2 \
      libgl1-mesa-glx libglu1-mesa \
      qtbase5-dev \
      libopencv-dev python-opencv ffmpeg libusb-1.0-0-dev \
      python-numpy \
      python-yaml \
    && rm -rf /var/lib/apt/lists/*

# Upgrade pip, then install pytz and scikit-image into dist-packages
RUN pip2 install --no-cache-dir --upgrade pip \
 && pip2 install --no-cache-dir \
      pytz \
      scikit-image \
      --target /usr/local/lib/python2.7/dist-packages

COPY dist-packages/ /usr/local/lib/python2.7/dist-packages/
COPY bin/            /usr/local/bin/
RUN chmod +x /usr/local/bin/*

ENTRYPOINT ["/bin/bash"]
