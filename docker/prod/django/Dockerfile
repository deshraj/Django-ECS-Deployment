FROM python:latest

ENV PYTHONUNBUFFERED 1

RUN mkdir /code

WORKDIR /code

ADD ./ /code

RUN pip install -r requirements.txt

EXPOSE 8000

ENTRYPOINT ["docker/prod/django/docker-entrypoint.sh"]
