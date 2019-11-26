FROM python:3.7.2
RUN mkdir /app
WORKDIR /app
RUN pip install --pre poetry

# RUN pip install poetry
COPY poetry.lock pyproject.toml /app/

# to prevent poetry from installing my actual app,
# and keep docker able to cache layers
RUN mkdir -p /app/src/app
RUN touch /app/src/app/__init__.py

RUN poetry install -n
