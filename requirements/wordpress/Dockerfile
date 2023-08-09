FROM debian:buster-slim

# Instalação de pacotes necessários
RUN apt update && apt install -y php php-fpm php-mysql wordpress mariadb-client curl \
    && apt clean && rm -rf /var/lib/apt/lists/*

# Instalação do WP-CLI
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp \
    && mkdir /run/php \
    && wp core download --allow-root

# Copiar o script para o contêiner
COPY script.sh /script.sh
RUN chmod +x /script.sh

# Diretório de trabalho
WORKDIR /var/www/html

# Comando padrão
CMD ["/script.sh"]
