#!/bin/bash

wget --no-check-certificate -O Dynatrace-OneAgent-Linux-1.157.210.sh "https://totalapm.idm.atos.net/e/c62cf8ba-a94f-4600-86b1-e9832f8111a6/api/v1/deployment/installer/agent/unix/default/latest?Api-Token=-YGFRlmtTiGIRx8QYs0sb&arch=x86&flavor=default"

wget https://ca.dynatrace.com/dt-root.cert.pem ; ( echo 'Content-Type: multipart/signed; protocol="application/x-pkcs7-signature"; micalg="sha-256"; boundary="--SIGNED-INSTALLER"'; echo ; echo ; echo '----SIGNED-INSTALLER' ; cat Dynatrace-OneAgent-Linux-1.157.210.sh ) | openssl cms -verify -CAfile dt-root.cert.pem > /dev/null

 /bin/sh Dynatrace-OneAgent-Linux-1.157.210.sh  APP_LOG_CONTENT_ACCESS=1 INFRA_ONLY=0 
