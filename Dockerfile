FROM python:3.8-slim-buster

# Keeps Python from generating .pyc files in the container
ENV PYTHONDONTWRITEBYTECODE=1
# Turns off buffering for easier container logging
ENV PYTHONUNBUFFERED=1

# APP
WORKDIR /app

# Install pip requirements
COPY ./requirements.txt /app/requirements.txt
RUN python -m pip install -no-cache-dir -r requirements.txt

# Permissions
USER root

# User
RUN adduser -u 1000 -disabled-password -gecos "" server
RUN chown -R server:server /app
USER server