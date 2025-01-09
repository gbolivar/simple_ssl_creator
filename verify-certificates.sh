read -p "Introduce el nombre del dominio (ej. mydomain.com): " DOMAIN

# verificar el contenido del CSR
openssl req -in ${DOMAIN}_csr.pem -noout -text

# verificar el contenido del certificado
openssl x509 -in ${DOMAIN}_cert.pem -noout -text