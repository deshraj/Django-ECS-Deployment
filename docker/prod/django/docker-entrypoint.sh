#!/bin/bash
python manage.py migrate        # Apply database migrations
python manage.py collectstatic --clear --noinput # clearstatic files
python manage.py collectstatic --noinput  # collect static files
# Prepare log files and start outputting logs to stdout
touch /code/logs/uwsgi.log
touch /code/logs/access.log
tail -n 0 -f /code/logs/*.log &
# Start Uwsgi processes
echo Starting Uwsgi.
exec uwsgi --ini docker/prod/django/uwsgi.ini
