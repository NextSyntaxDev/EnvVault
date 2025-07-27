#!/bin/sh

CERT_PATH="/etc/nginx/certs/fullchain.pem"
KEY_PATH="/etc/nginx/certs/privkey.pem"

if [ ! -f "$CERT_PATH" ] || [ ! -f "$KEY_PATH" ]; then
  echo "🔐 Gerando certificado autoassinado..."
  openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout "$KEY_PATH" \
    -out "$CERT_PATH" \
    -subj "/C=BR/ST=SC/L=SantaCatarina/O=EnVault/OU=Dev/CN=localhost" \
    -addext "subjectAltName = DNS:localhost,IP:127.0.0.1"
else
  echo "✅ Certificado já existe. Pulando geração."
fi

chmod 600 "$KEY_PATH"
exec "$@"
