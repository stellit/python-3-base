FROM python:3.7.2
RUN curl -sSL https://raw.githubusercontent.com/sdispater/poetry/master/get-poetry.py | python - --preview
RUN /root/.poetry/bin/poetry install
