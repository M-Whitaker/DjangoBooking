# More Datascience frendly gist can be found here: https://gist.github.com/ruddra/870d7a51238ddfa4b50375086c12a4f5
# pull official python alpine image
FROM python:3.8.3-alpine

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
ENV C_FORCE_ROOT true

# Making source and static directory
RUN mkdir /src
RUN mkdir /var/www
RUN mkdir /var/www/static
RUN mkdir /var/www/media

# Creating Work Directory
WORKDIR /src

# Adding mandatory packages to docker
RUN apk update && apk add --no-cache \
    postgresql \
    zlib \
    jpeg \
    openblas \ 
    libstdc++

# Installing temporary packages required for installing requirements.pip 
RUN apk add --no-cache --virtual build-deps \
    gcc \  
    python3-dev \ 
    musl-dev \
    postgresql-dev\
    zlib-dev \
    jpeg-dev \
    libressl-dev \
    musl-dev \
    libffi-dev
# un-comment if you want to install numpy, pandas, scipy etc and their supported dependencies
# g++ \
# openblas-dev \
# cmake \
# && ln -s /usr/include/locale.h /usr/include/xlocale.h

# Update pip
RUN pip install --upgrade pip

# Installing requirements.pip from project
COPY ./src/requirements.pip /scripts/
RUN pip install --no-cache-dir -r /scripts/requirements.pip

# copy entrypoint.sh & runserver.sh
COPY ./docker/compose/postgres/entrypoint.sh /scripts/
COPY ./docker/compose/django/runserver.sh /scripts/

# removing temporary packages from docker and removing cache 
RUN apk del build-deps \
    libressl-dev \
    musl-dev \
    libffi-dev && \
    find -type d -name __pycache__ -prune -exec rm -rf {} \; && \
    rm -rf ~/.cache/pip

# run entrypoint.sh
ENTRYPOINT ["/scripts/entrypoint.sh"]

# CMD will run when this dockerfile is running
CMD ["/scripts/runserver.sh"]
