FROM nvidia/cuda:11.3.1-cudnn8-devel-ubuntu20.04
# FROM nvidia/cuda:11.3.1-base-ubuntu20.04

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive

# Install system dependencies
RUN apt-get update && \
    apt-get install -y \
        git \
        python3-pip \
        python3-dev \
        python3-opencv \
        libglib2.0-0
# Install any python packages you need

# RUN python3 -m pip install -r requirements.txt

# Upgrade pip
RUN python3 -m pip install --upgrade pip

COPY req.txt req.txt
RUN pip install -r req.txt

RUN pip install torch==1.11.0+cu113 torchvision==0.12.0+cu113 torchaudio==0.11.0 --extra-index-url https://download.pytorch.org/whl/cu113
# RUN pip install pyg_lib -f https://data.pyg.org/whl/torch-1.11.0+cu113.html
# RUN MAKEFLAGS="-j16" pip install torch_scatter torch_sparse torch_cluster torch_spline_conv -f https://data.pyg.org/whl/torch-1.11.0+cu113.html --global-option="build_ext" --global-option="-j16"
RUN pip install pyg_lib torch_scatter torch_sparse torch_cluster torch_spline_conv -f https://data.pyg.org/whl/torch-1.11.0+cu113.html
RUN pip install install torch-geometric

RUN ln -s /usr/bin/python3 /usr/bin/python

RUN pip install pytorch_lightning==1.6.4
# Set the working directory
WORKDIR /data

