FROM ubuntu:12.04
RUN apt-get update && apt-get install -yq python-pip && apt-get clean
RUN pip install -U pip
