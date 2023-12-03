# pull official python base image
FROM python:3.12.0

# set work directory
WORKDIR /app

# add non-root user
RUN adduser user

# install verleihnix
RUN pip install sabogaapi --index-url https://gitlab.com/api/v4/projects/52722115/packages/pypi/simple

# run command as flask
USER user

# run uvicorn wsgi server
CMD uvicorn sabogaapi.main:app --workers 1 --host 0.0.0.0 --port 8000
