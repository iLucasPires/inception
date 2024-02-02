<p align="center">
    <img src="https://game.42sp.org.br/static/assets/achievements/inceptione.png">
</p>

<p align="center">
    <img src="https://img.shields.io/badge/Grade-100%2F100-brightgreen" alt="Grade">
    <img src="https://img.shields.io/badge/Status-Completed-brightgreen" alt="Status">
</p>

# Inception

Inception is a 42 São Paulo project that aims to introduce the concept of Docker and Docker Compose. The project consists of creating a Dockerfile for a MariaDB image, a WordPress image and a Nginx image. The images must be able to communicate with each other and the WordPress image must be able to communicate with the Nginx image.

## How to use

### requirements

- docker
- docker-compose
- GNU Make

### Run the project

```bash
make
```

## Mandatory part

- [x] create a image MariaDB from the image Debian Buster
- [x] create a image WordPress from the image Debian Buster
- [x] create a image Nginx from the image Debian Buster
