FROM python:3.7.2
RUN mkdir /app
WORKDIR /app
RUN curl -sSL https://raw.githubusercontent.com/sdispater/poetry/master/get-poetry.py | python - --preview
RUN /root/.poetry/bin/poetry install

# RUN pip install poetry
RUN /root/.poetry/bin/poetry config settings.virtualenvs.create false
COPY poetry.lock pyproject.toml /app

# to prevent poetry from installing my actual app,
# and keep docker able to cache layers
RUN mkdir -p /app/src/app
RUN touch /app/src/app/__init__.py

RUN /root/.poetry/bin/poetry install -n
