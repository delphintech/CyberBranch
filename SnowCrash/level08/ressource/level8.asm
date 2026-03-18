Dump of assembler code for function main:
   0x08048554 <+0>:	push   ebp
   0x08048555 <+1>:	mov    ebp,esp
   0x08048557 <+3>:	and    esp,0xfffffff0
   0x0804855a <+6>:	sub    esp,0x430
   0x08048560 <+12>:	mov    eax,DWORD PTR [ebp+0xc]
   0x08048563 <+15>:	mov    DWORD PTR [esp+0x1c],eax     # Load arg in [esp+0x1c] 🔴
   0x08048567 <+19>:	mov    eax,DWORD PTR [ebp+0x10]
   0x0804856a <+22>:	mov    DWORD PTR [esp+0x18],eax
   0x0804856e <+26>:	mov    eax,gs:0x14
   0x08048574 <+32>:	mov    DWORD PTR [esp+0x42c],eax    # Store something in [esp+0x42c] = 0xb4962500 🃏
   0x0804857b <+39>:	xor    eax,eax
   0x0804857d <+41>:	cmp    DWORD PTR [ebp+0x8],0x1
   0x08048581 <+45>:	jne    0x80485a6 <main+82>			# Jump if argument 🟩
   0x08048583 <+47>:	mov    eax,DWORD PTR [esp+0x1c]		# Else
   0x08048587 <+51>:	mov    edx,DWORD PTR [eax]
   0x08048589 <+53>:	mov    eax,0x8048780
   0x0804858e <+58>:	mov    DWORD PTR [esp+0x4],edx
   0x08048592 <+62>:	mov    DWORD PTR [esp],eax
   0x08048595 <+65>:	call   0x8048420 <printf@plt>		# Print 'level08 [file to read]'
   0x0804859a <+70>:	mov    DWORD PTR [esp],0x1
   0x080485a1 <+77>:	call   0x8048460 <exit@plt>			# exit
   0x080485a6 <+82>:	mov    eax,DWORD PTR [esp+0x1c]		# 🟩 
   0x080485aa <+86>:	add    eax,0x4						# eax = file name
   0x080485ad <+89>:	mov    eax,DWORD PTR [eax]
   0x080485af <+91>:	mov    DWORD PTR [esp+0x4],0x8048793	# load 'token' in arg2
   0x080485b7 <+99>:	mov    DWORD PTR [esp],eax				# load fileName in arg1
   0x080485ba <+102>:	call   0x8048400 <strstr@plt>			# strstr(fileName, token)
   0x080485bf <+107>:	test   eax,eax							# test result
   0x080485c1 <+109>:	je     0x80485e9 <main+149>				# jump if token not in fileName 🟧
   0x080485c3 <+111>:	mov    eax,DWORD PTR [esp+0x1c]
   0x080485c7 <+115>:	add    eax,0x4
   0x080485ca <+118>:	mov    edx,DWORD PTR [eax]
   0x080485cc <+120>:	mov    eax,0x8048799
   0x080485d1 <+125>:	mov    DWORD PTR [esp+0x4],edx
   0x080485d5 <+129>:	mov    DWORD PTR [esp],eax
   0x080485d8 <+132>:	call   0x8048420 <printf@plt>          # Print "You may not access <filename>"
   0x080485dd <+137>:	mov    DWORD PTR [esp],0x1 
   0x080485e4 <+144>:	call   0x8048460 <exit@plt>            # Quit 
   0x080485e9 <+149>:	mov    eax,DWORD PTR [esp+0x1c]        # 🟧 Load
   0x080485ed <+153>:	add    eax,0x4                         
   0x080485f0 <+156>:	mov    eax,DWORD PTR [eax]
   0x080485f2 <+158>:	mov    DWORD PTR [esp+0x4],0x0
   0x080485fa <+166>:	mov    DWORD PTR [esp],eax
   0x080485fd <+169>:	call   0x8048470 <open@plt>               # open file
   0x08048602 <+174>:	mov    DWORD PTR [esp+0x24],eax           # store fd in [esp+0x24] ⚪
   0x08048606 <+178>:	cmp    DWORD PTR [esp+0x24],0xffffffff    # Compare with -1
   0x0804860b <+183>:	jne    0x804862e <main+218>               # Jump if 🟪 cannot open
   0x0804860d <+185>:	mov    eax,DWORD PTR [esp+0x1c]
   0x08048611 <+189>:	add    eax,0x4
   0x08048614 <+192>:	mov    eax,DWORD PTR [eax]
   0x08048616 <+194>:	mov    DWORD PTR [esp+0x8],eax
   0x0804861a <+198>:	mov    DWORD PTR [esp+0x4],0x80487b2
   0x08048622 <+206>:	mov    DWORD PTR [esp],0x1
   0x08048629 <+213>:	call   0x8048440 <err@plt>                # Print "Unable to open <filename>"
   0x0804862e <+218>:	mov    DWORD PTR [esp+0x8],0x400          # 🟪 Load size = 1024 in agr3
   0x08048636 <+226>:	lea    eax,[esp+0x2c]                     # Buffer adress ⭕
   0x0804863a <+230>:	mov    DWORD PTR [esp+0x4],eax            # Load in arg2
   0x0804863e <+234>:	mov    eax,DWORD PTR [esp+0x24]           # Load fd ⚪ in agr1
   0x08048642 <+238>:	mov    DWORD PTR [esp],eax
   0x08048645 <+241>:	call   0x8048410 <read@plt>               # Read(fd, buf, 1024)
   0x0804864a <+246>:	mov    DWORD PTR [esp+0x28],eax           # Load result in [esp+0x28]
   0x0804864e <+250>:	cmp    DWORD PTR [esp+0x28],0xffffffff    # Compare if -1
   0x08048653 <+255>:	jne    0x8048671 <main+285>               # jump if can read 🟦
   0x08048655 <+257>:	mov    eax,DWORD PTR [esp+0x24]           # Get read size return
   0x08048659 <+261>:	mov    DWORD PTR [esp+0x8],eax
   0x0804865d <+265>:	mov    DWORD PTR [esp+0x4],0x80487c4
   0x08048665 <+273>:	mov    DWORD PTR [esp],0x1
   0x0804866c <+280>:	call   0x8048440 <err@plt>
   0x08048671 <+285>:	mov    eax,DWORD PTR [esp+0x28]           # 🟦
   0x08048675 <+289>:	mov    DWORD PTR [esp+0x8],eax
   0x08048679 <+293>:	lea    eax,[esp+0x2c]
   0x0804867d <+297>:	mov    DWORD PTR [esp+0x4],eax
   0x08048681 <+301>:	mov    DWORD PTR [esp],0x1
   0x08048688 <+308>:	call   0x8048490 <write@plt>              # Write(1, buffer, size)
   0x0804868d <+313>:	mov    edx,DWORD PTR [esp+0x42c]          # Compare with what is in [esp+0x42c] 
   0x08048694 <+320>:	xor    edx,DWORD PTR gs:0x14
   0x0804869b <+327>:	je     0x80486a2 <main+334>               # Jump if canary intact
   0x0804869d <+329>:	call   0x8048430 <__stack_chk_fail@plt>
   0x080486a2 <+334>:	leave  
   0x080486a3 <+335>:	ret    
End of assembler dump.