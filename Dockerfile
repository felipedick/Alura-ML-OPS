
FROM python:3.10-slim

ARG BASIC_AUTH_USERNAME_ARG
ARG BASIC_AUTH_PASSWORD_ARG

ENV BASIC_AUTH_USERNAME=$BASIC_AUTH_USERNAME_ARG
ENV BASIC_AUTH_PASSWORD=$BASIC_AUTH_PASSWORD_ARG


COPY ./requirements.txt /usr/requirements.txt

WORKDIR /usr

RUN pip install --no-cache-dir -r requirements.txt

COPY ./module /usr/module
COPY ./models /usr/models


ENTRYPOINT [ "python3" ]
CMD [ "module/app/main.py" ]       