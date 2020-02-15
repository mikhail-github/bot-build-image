FROM python:3.7-alpine
WORKDIR /build
COPY requirements.txt .
RUN apk --update add --no-cache gcc musl-dev libffi-dev libressl-dev openssh-client rsync \
  && pip install -r requirements.txt \
  && wget https://github.com/golang-migrate/migrate/releases/download/v4.8.0/migrate.linux-amd64.tar.gz -O migrate.tar.gz \
  && tar -xzvf migrate.tar.gz \
  && mv migrate.linux-amd64 /usr/local/bin/migrate \
  && chown root:root /usr/local/bin/migrate \
  && rm -f migrate.tar.gz && ls -la