FROM python:3.5.6
ENV LANG C.UTF-8

RUN mkdir /notebooks
WORKDIR /notebooks

COPY requirements.txt /notebooks
RUN pip install --no-cache-dir -r requirements.txt

COPY notebooks /notebooks
