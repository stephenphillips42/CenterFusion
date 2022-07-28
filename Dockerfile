FROM pytorch/pytorch:1.8.1-cuda11.1-cudnn8-runtime

# Prevent stop building ubuntu at time zone selection.  
ENV DEBIAN_FRONTEND=noninteractive

# Prepare and empty machine for building
# RUN apt-get update 
RUN --mount=type=cache,id=apt-dev,target=/var/cache/apt apt-get update
# Install all relevant libraries
RUN apt-get install -y --no-install-recommends \
      git \
      cmake \
      build-essential \
      ca-certificates \
      ccache \
      curl \
      libjpeg-dev \
      ffmpeg \
      libsm6 \
      libxext6 \
      libpng-dev && \
    rm -rf /var/lib/apt/lists/*

# Clean up after installation
RUN /usr/sbin/update-ccache-symlinks
RUN mkdir /opt/ccache && ccache --set-config=cache_dir=/opt/ccache
ENV PATH /opt/conda/bin:$PATH


