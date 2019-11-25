FROM python:3.7.2
COPY . /app
WORKDIR /app
RUN curl -sSL https://raw.githubusercontent.com/sdispater/poetry/master/get-poetry.py | python - --preview
RUN /root/.poetry/bin/poetry install
