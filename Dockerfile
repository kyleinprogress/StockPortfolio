FROM python:3.9-slim-buster

LABEL version="1.0"
LABEL description="Stock Portfolio Tracking Image"
LABEL maintainer="Kyle Warner"

ENV PYTHONUNBUFFERED 1

# Install system packages into image
RUN apt-get update && apt-get upgrade -y
RUN apt-get install --no-install-recommends postgresql-client -y
RUN apt-get install --no-install-recommends gcc libc-dev -y

 # Install python packages
COPY ./requirements.txt /requirements.txt
RUN pip install -r /requirements.txt

RUN apt remove gcc libc-dev -y

RUN mkdir /app
WORKDIR /app
COPY ./app /app

RUN adduser --system --no-create-home appuser
USER appuser