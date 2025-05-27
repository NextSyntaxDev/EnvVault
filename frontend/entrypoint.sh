#!/bin/sh

CERT_DIR="./cert"
KEY_FILE="$CERT_DIR/privkey.pem"
CERT_FILE="$CERT_DIR/fullchain.pem"
DAYS_VALID=365

mkdir -p "$CERT_DIR"

if [[ -f "$KEY_FILE" && -f "$CERT_FILE" ]]; then
    echo " ^|^e Certificado j   existe em $CERT_DIR. Pulando gera    o."
    exit 0
fi

echo " ^=^t^p Gerando certificado SSL autoassinado..."

openssl req -x509 -nodes -days $DAYS_VALID \
  -newkey rsa:2048 \
  -keyout "$KEY_FILE" \
  -out "$CERT_FILE" \
  -subj "/C=BR/ST=SP/L=Localhost/O=Dev/OU=Dev/CN=localhost"

if [[ -f "$KEY_FILE" && -f "$CERT_FILE" ]]; then
    echo " ^|^e Certificado criado com sucesso:"
    echo "   - Chave privada: $KEY_FILE"
    echo "   - Certificado (fullchain): $CERT_FILE"
else
    echo " ^}^l Falha ao gerar o certificado."
    exit 1
fi
