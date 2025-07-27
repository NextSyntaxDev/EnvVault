# Use uma versão específica do Nginx, com Alpine para ser leve
FROM nginx:1.28-alpine

RUN apk add --no-cache openssl

# Crie o diretório para os certificados
RUN mkdir -p /etc/nginx/certs

# Copie o script de entrada para o contêiner
COPY entrypoint.sh /entrypoint.sh

# Torne o script executável
RUN chmod +x /entrypoint.sh

# Exponha as portas HTTP e HTTPS
EXPOSE 80
EXPOSE 443

# Defina o ponto de entrada do contêiner
ENTRYPOINT ["/entrypoint.sh"]

# Defina o comando padrão para o Nginx (o entrypoint vai chamá-lo)
CMD ["nginx", "-g", "daemon off;"]