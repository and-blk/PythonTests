FROM python:3.10.0
USER root
RUN mkdir /app
WORKDIR /app
ADD requirements.txt .
RUN pip install -r requirements.txt \
    && wget https://github.com/mozilla/geckodriver/releases/download/v0.29.1/geckodriver-v0.29.1-linux64.tar.gz \
    && tar xvfz geckodriver-v0.29.1-linux64.tar.gz \
    && mv geckodriver /usr/local/bin \
    && chmod 777 /usr/local/bin/geckodriver
