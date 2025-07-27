#!/bin/sh
CERT_PATH="/cert/fullchain.pem"
KEY_PATH="/cert/privkey.pem"  

if [ ! -f "$CERT_PATH" ] || [ ! -f "$KEY_PATH" ]; then
  echo "🔐 Gerando certificado autoassinado..."
  openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout "$KEY_PATH" \
    -out "$CERT_PATH" \
    -subj "/C=BR/ST=SP/L=SaoPaulo/O=MinhaEmpresa/OU=Dev/CN=localhost" \
    -addext "subjectAltName = DNS:localhost,IP:127.0.0.1"
else
  echo "✅ Certificado já existe. Pulando geração."
fi

chmod 600 "$KEY_PATH"
exec "$@"