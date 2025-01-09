## Bash to create SSL certificate
- [Ver](https://raw.githubusercontent.com/gbolivar/simple_ssl_creator/refs/heads/bash-add-readme/generate-SSL-CSR-Certificates.sh)

```bash
#!/bin/bash

# Request information from the user
echo "SSL and CSR certificate generation"
read -p "Enter the domain name (e.g. mydomain.com): " DOMAIN
read -p "Enter the name of the organization (e.g. My Company): " ORG
read -p "Enter the name of the organizational unit (e.g. IT Department): " ORG_UNIT
read -p "Enter the name of the city (e.g. San Francisco): " CITY
read -p "Enter the name of the state (e.g. California): " STATE
read -p "Enter the country code (e.g. US): " COUNTRY

# Output file names
PRIVATE_KEY="${DOMAIN}_key.pem"
CSR_FILE="${DOMAIN}_csr.pem"
CERT_FILE="${DOMAIN}_cert.pem"

# Generate 2048-bit private key
echo "Generating private key..."
openssl genrsa -out $PRIVATE_KEY 2048

# Generate CSR
echo "Generating CSR (Certificate Signing Request)..."
openssl req -new -key $PRIVATE_KEY -out $CSR_FILE -subj "/C=$COUNTRY/ST=$STATE/L=$CITY/O=$ORG/OU=$ORG_UNIT/CN=$DOMAIN"

# Generate self-signed certificate valid for 1 year
echo "Generating self-signed certificate..."
openssl x509 -req -days 365 -in $CSR_FILE -signkey $PRIVATE_KEY -out $CERT_FILE

echo "Process completed. Generated files:"
echo "  - Private key: $PRIVATE_KEY"
echo "  - CSR: $CSR_FILE"
echo "  - Self-signed certificate: $CERT_FILE"
```


## Bash check SSL certificate
- [Ver](https://raw.githubusercontent.com/gbolivar/simple_ssl_creator/refs/heads/bash-add-readme/verify-SSL-Certificates.sh)
```bash
read -p "Enter the domain name (e.g. mydomain.com): " DOMAIN

# Verify the content of the CSR
openssl req -in ${DOMAIN}_csr.pem -noout -text

# Verify the content of the certificate
openssl x509 -in ${DOMAIN}_cert.pem -noout -text
```