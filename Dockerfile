FROM python:3.9-slim-buster

LABEL version="1.0"
LABEL description="Stock Portfolio Tracking Image"
LABEL maintainer="Kyle Warner"

ENV PYTHONUNBUFFERED 1

COPY ./requirements.txt /requirements.txt
RUN pip install -r /requirements.txt

RUN mkdir /app
WORKDIR /app
COPY ./app /app

RUN adduser --system --no-create-home appuser
USER appuser