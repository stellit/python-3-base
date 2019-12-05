FROM stellit/python-3-base:v2

RUN pip install -i https://mirrors.ustc.edu.cn/pypi/web/simple pip -U
RUN pip config set global.index-url https://mirrors.ustc.edu.cn/pypi/web/simple
WORKDIR /app
RUN pip install --pre poetry

# RUN pip install poetry
COPY poetry.lock pyproject.toml /app/

# to prevent poetry from installing my actual app,
# and keep docker able to cache layers
RUN mkdir -p /app/src/app
RUN touch /app/src/app/__init__.py

RUN poetry install -n
