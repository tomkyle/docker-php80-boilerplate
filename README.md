# Dockerfile boilerplate



**Following the article** [How to setup an Apache, PHP, and HTTPS development environment with Docker](https://dockerwebdev.com/tutorials/docker-php-development/)

## Installation

Clone repo and dive into project directory:

```bash 
$ gh repo clone tomkyle/docker-php74-boilerplate docker-php74
$ cd docker-php74
```

Install [**mkcert**](https://github.com/FiloSottile/mkcert), a simple tool for making locally-trusted development certificates. 

```bash
$ brew install mkcert
```

## Make certificates

Make sure to keep the cert file names as seen here as they are copied to the Docker image and then referenced in `000-default.conf`

```bash
$ mkcert \
-key-file localhost-php74-key.pem \
-cert-file localhost-php74.pem \
localhost 127.0.0.1 ::1
```

## Build docker image

Use this section to build a Docker image. The image is also available on https://hub.docker.com/repository/docker/tomkyle/php74

```bash
$ docker image build -t php74 .
```

Assuming you don’t have errors, a new Docker image will be built. Run `docker image ls` to see `php74` in the list of images.

```bash
$ docker image ls
```

## Example usage in a project

Copy [docker-compose.yml](./docker-compose.yml) to your app project and adapt to your needs

```yaml
version: '3'
services:

  app:
    # Change as you need
    container_name: app

    # The image from above Dockerfile
    image: php74

    # Assume "htdocs" being the public folder
    # which itself is a sub-directory of the project root
    volumes:
      - ./:/var/www
      - ./htdocs/:/var/www/html

    ports:
      - "8080:80"
      - "443:443"
```

Go to project dir and start Docker machine:

```bash
$ cd ~/path/tp/app
$ docker compose up
```

Shutdown:

```bash
$ docker compose down
```

Your project can now be reached via

- **HTTPS: [https://localhost](https://localhost)**

- **HTTP-only: [http://localhost:8080](http://localhost:8080)**

  

