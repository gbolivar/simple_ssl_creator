## Bash para crear certificado SSL
- [Ver](https://raw.githubusercontent.com/gbolivar/simple_ssl_creator/refs/heads/bash-add-readme/generate-SSL-CSR-Certificates.sh)
```bash
#!/bin/bash

# Solicitar información al usuario
echo "Generación de certificado SSL y CSR"
read -p "Introduce el nombre del dominio (ej. mydomain.com): " DOMAIN
read -p "Introduce el nombre de la organización (ej. My Company): " ORG
read -p "Introduce el nombre de la unidad organizativa (ej. IT Department): " ORG_UNIT
read -p "Introduce el nombre de la ciudad (ej. San Francisco): " CITY
read -p "Introduce el nombre del estado (ej. California): " STATE
read -p "Introduce el código del país (ej. US): " COUNTRY

# Nombres de los archivos de salida
PRIVATE_KEY="${DOMAIN}_key.pem"
CSR_FILE="${DOMAIN}_csr.pem"
CERT_FILE="${DOMAIN}_cert.pem"

# Generar clave privada de 2048 bits
echo "Generando clave privada..."
openssl genrsa -out $PRIVATE_KEY 2048

# Generar CSR
echo "Generando CSR (Certificate Signing Request)..."
openssl req -new -key $PRIVATE_KEY -out $CSR_FILE -subj "/C=$COUNTRY/ST=$STATE/L=$CITY/O=$ORG/OU=$ORG_UNIT/CN=$DOMAIN"

# Generar certificado autofirmado válido por 1 año
echo "Generando certificado autofirmado..."
openssl x509 -req -days 365 -in $CSR_FILE -signkey $PRIVATE_KEY -out $CERT_FILE

echo "Proceso completado. Archivos generados:"
echo "  - Clave privada: $PRIVATE_KEY"
echo "  - CSR: $CSR_FILE"
echo "  - Certificado autofirmado: $CERT_FILE"
```

## Bash para verificar certificado SSL
- [Ver](https://raw.githubusercontent.com/gbolivar/simple_ssl_creator/refs/heads/bash-add-readme/verify-SSL-Certificates.sh)

```bash
read -p "Introduce el nombre del dominio (ej. mydomain.com): " DOMAIN

# verificar el contenido del CSR
openssl req -in ${DOMAIN}_csr.pem -noout -text

# verificar el contenido del certificado
openssl x509 -in ${DOMAIN}_cert.pem -noout -text
```

