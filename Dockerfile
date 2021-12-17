FROM python:3.7-alpine

WORKDIR /usr/src/app

# set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
ENV CRYPTOGRAPHY_DONT_BUILD_RUST=1

# install dependencies
COPY ./requirements.txt .
RUN apk add --no-cache libffi-dev openssl-dev build-base python3-dev musl-dev mariadb-dev mariadb-connector-c-dev openssh \
  && pip install --no-cache-dir --upgrade pip \
  && pip install mysql \
  && pip install --no-cache-dir -r requirements.txt \
  && pip install --no-cache-dir gunicorn \
  && apk del libffi-dev openssl-dev build-base python3-dev musl-dev \
