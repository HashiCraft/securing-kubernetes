#!/bin/sh

# Enable auth
kubectl exec $(kubectl get pods --selector "app.kubernetes.io/instance=vault,component=server" -o jsonpath="{.items[0].metadata.name}") -c vault -- \
    vault auth enable kubernetes

kubectl exec $(kubectl get pods --selector "app.kubernetes.io/instance=vault,component=server" -o jsonpath="{.items[0].metadata.name}") -c vault -- \
  sh -c '
    vault write auth/kubernetes/config \
       token_reviewer_jwt="$(cat /var/run/secrets/kubernetes.io/serviceaccount/token)" \
       kubernetes_host=https://${KUBERNETES_SERVICE_HOST}:443 \
       kubernetes_ca_cert=@/var/run/secrets/kubernetes.io/serviceaccount/ca.crt'

# Enable database engine
kubectl exec $(kubectl get pods --selector "app.kubernetes.io/instance=vault,component=server" -o jsonpath="{.items[0].metadata.name}") -c vault -- \
    vault secrets enable database

# Configure Vault access for the database
kubectl exec $(kubectl get pods --selector "app.kubernetes.io/instance=vault,component=server" -o jsonpath="{.items[0].metadata.name}") -c vault -- \
    vault write database/config/root \
      plugin_name=postgresql-database-plugin \
      allowed_roles="*" \
      connection_url="postgresql://{{username}}:{{password}}@database:5432/root?sslmode=disable" \
      username="root" \
      password="please_change_me_barry"

# Force Vault to rotate the root password
kubectl exec $(kubectl get pods --selector "app.kubernetes.io/instance=vault,component=server" -o jsonpath="{.items[0].metadata.name}") -c vault -- \
  sh -c ' \
    vault write --force /database/rotate-root/root'

# Create the policy to read payments credentials
cat <<EOF | vault policy write payments -
path "database/creds/db-payments" {
  capabilities = ["read"]
}
EOF

# Create the policy to read search credentials
cat <<EOF | vault policy write search -
path "database/creds/db-search" {
  capabilities = ["read"]
}
EOF

# Create k8s auth role for search
kubectl exec $(kubectl get pods --selector "app.kubernetes.io/instance=vault,component=server" -o jsonpath="{.items[0].metadata.name}") -c vault -- \
    vault write auth/kubernetes/role/search \
      bound_service_account_names=search \
      bound_service_account_namespaces=default \
      policies=search \
      ttl=1h

# Create k8s auth role for payments
kubectl exec $(kubectl get pods --selector "app.kubernetes.io/instance=vault,component=server" -o jsonpath="{.items[0].metadata.name}") -c vault -- \
    vault write auth/kubernetes/role/payments \
      bound_service_account_names=payments \
      bound_service_account_namespaces=default \
      policies=payments\
      ttl=1h

# Configure db auth limited creds for the search 
kubectl exec $(kubectl get pods --selector "app.kubernetes.io/instance=vault,component=server" -o jsonpath="{.items[0].metadata.name}") -c vault -- \
    vault write database/roles/db-search \
      db_name=root \
      creation_statements="CREATE ROLE \"{{name}}\" WITH LOGIN PASSWORD '{{password}}' VALID UNTIL '{{expiration}}'; \
          GRANT SELECT ON branches TO \"{{name}}\";" \
      revocation_statements="ALTER ROLE \"{{name}}\" NOLOGIN;"\
      default_ttl="1h" \
      max_ttl="24h"

# Configure db auth limited creds for payments
kubectl exec $(kubectl get pods --selector "app.kubernetes.io/instance=vault,component=server" -o jsonpath="{.items[0].metadata.name}") -c vault -- \
    vault write database/roles/db-payments \
      db_name=root \
      creation_statements="CREATE ROLE \"{{name}}\" WITH LOGIN PASSWORD '{{password}}' VALID UNTIL '{{expiration}}'; \
          GRANT SELECT ON ALL TABLES IN SCHEMA public TO \"{{name}}\";" \
      revocation_statements="ALTER ROLE \"{{name}}\" NOLOGIN;"\
      default_ttl="1h" \
      max_ttl="24h"
