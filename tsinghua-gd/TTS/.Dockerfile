# Pull base image.
FROM nvidia/cuda:10.0-cudnn7-devel

LABEL maintainer Aaron "aaronwlj@foxmail.com"

# Install dependencies
RUN apt-get -y update && \
    DEBIAN_FRONTEND=noninteractive \
    apt-get install -y --no-install-recommends \
        python3-dev \
        python3-pip \
        git \
        g++ \
        make \
        wget \
        unzip \
        vim
     
# pip 升级
# RUN python3 -m pip install --upgrade pip

# 安装基础库
RUN pip3 install -U setuptools \
    && pip3 --no-cache-dir install \
        numpy==1.14.5 \
        pandas \
        scipy==0.19.0 \
        scikit-learn \
        tqdm==4.11.2 \
        matplotlib==2.0.2 \
        tensorflow-gpu==1.10.0 \
        librosa==0.7.1 \
        Unidecode==0.4.20 \
        pyaudio==0.2.11 \
        jieba3k==0.35.1 \
        pypinyin==0.36.0 \
        pydub==0.23.1 \
        sounddevice==0.3.14 \
        falcon==1.2.0 \
        inflect==0.2.5

# 安装服务常用包
RUN pip3 --no-cache-dir install \
    flask \
    flask-restful \
    flask_jsonrpc \
    fire \
    requests_toolbelt

# 删除 apt lists
RUN rm -rf /var/lib/apt/lists/*

# 终端设置
# 默认值是dumb，这时在终端操作时可能会出现：terminal is not fully functional
ENV TERM xterm

# 解决时区问题
ENV TZ "Asia/Shanghai"