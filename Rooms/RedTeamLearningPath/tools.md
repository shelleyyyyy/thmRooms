# Table of Contents
## [Recon](#Recon)
## [Weaponization](#Weaponization)

# Recon
************************************

```bash
whois thmredteam.com
```

### gives useful info on the domain name

************************************

```bash
nslookup cafe.thmredteam.com
```

### gets default records related to domain

************************************

```bash
dig @1.1.1.1 thmredteam.com
```

@ specifys the dns serve to use

### domain information grapper

************************************

```bash
host cafe.thmredteam.com
```

### another way to query dns records

************************************

```bash 
traceroute cafe.thmredteam.com
```

### gives the number of hops between you and target

************************************

```bash
recon-ng
```

### starts the recon-ng tool
### run this -w [workspacename] to specify workspace

```bash
db insert domains
```

### run this to insert domain names

```bash
marketplace search [keywork]
```

### to search for modules

```bash
marketplace install [module]
```

### to install module

```bash
modules load [modulename]
```

### to load module

```bash
run
```

### to this to run the module against the domains that you have already added

**************************************

# Weaponization

************************************

```powershell
Set shell = WScript.CreateObject("Wscript.Shell")
shell.Run("C:\Windows\System32\calc.exe " & WScript.ScriptFullName),0,True
```
execute programs in vbs

```powershell
wscipt filename.vbs
```
or
```powershell
wscript /e:VBScript filenmae.txt
```
