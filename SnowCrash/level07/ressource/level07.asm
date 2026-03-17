Dump of assembler code for function main:
   0x08048514 <+0>:	push   ebp
   0x08048515 <+1>:	mov    ebp,esp
   0x08048517 <+3>:	and    esp,0xfffffff0
   0x0804851a <+6>:	sub    esp,0x20
   0x0804851d <+9>:	call   0x80483f0 <getegid@plt>			# Get effective group of current process ( flag07 )
   0x08048522 <+14>:	mov    DWORD PTR [esp+0x18],eax		# Store result in [esp+0x18] 🟪
   0x08048526 <+18>:	call   0x80483e0 <geteuid@plt>		# Get effective user id of calling process ( flag07 )
   0x0804852b <+23>:	mov    DWORD PTR [esp+0x1c],eax		# Store result in [esp+0x1c] 🟨
   0x0804852f <+27>:	mov    eax,DWORD PTR [esp+0x18]		# Load group id 🟪
   0x08048533 <+31>:	mov    DWORD PTR [esp+0x8],eax		# Store in arg1
   0x08048537 <+35>:	mov    eax,DWORD PTR [esp+0x18]		# Load group id 🟪
   0x0804853b <+39>:	mov    DWORD PTR [esp+0x4],eax		# Store in arg2
   0x0804853f <+43>:	mov    eax,DWORD PTR [esp+0x18]		# Load group id 🟪
   0x08048543 <+47>:	mov    DWORD PTR [esp],eax			# Store in arg3
   0x08048546 <+50>:	call   0x8048450 <setresgid@plt>	# Set real group ID, the effective group ID, and the saved set-group-ID as 🟨
   0x0804854b <+55>:	mov    eax,DWORD PTR [esp+0x1c]		# Load user id 🟨
   0x0804854f <+59>:	mov    DWORD PTR [esp+0x8],eax		# Store in arg1
   0x08048553 <+63>:	mov    eax,DWORD PTR [esp+0x1c]		# Load user id 🟨
   0x08048557 <+67>:	mov    DWORD PTR [esp+0x4],eax		# Store in arg2
   0x0804855b <+71>:	mov    eax,DWORD PTR [esp+0x1c]		# Load user id 🟨
   0x0804855f <+75>:	mov    DWORD PTR [esp],eax			# Store in arg3
   0x08048562 <+78>:	call   0x80483d0 <setresuid@plt>	# Set real user ID, the effective user ID, and the saved set-user-ID as 🟪
   0x0804854b <+55>:	mov    eax,DWORD PTR [esp+0x1c]		
   0x08048567 <+83>:	mov    DWORD PTR [esp+0x14],0x0		# Set [esp+0x14] = 0 🟦
   0x0804856f <+91>:	mov    DWORD PTR [esp],0x8048680	# load 'LOGNAME' as arg
   0x08048576 <+98>:	call   0x8048400 <getenv@plt>		# get env variable of LOGNAME
   0x0804857b <+103>:	mov    DWORD PTR [esp+0x8],eax			# Store in arg 1
   0x0804857f <+107>:	mov    DWORD PTR [esp+0x4],0x8048688	# Store "/bin/echo %s " in arg2
   0x08048587 <+115>:	lea    eax,[esp+0x14]					# eax = 0
   0x0804858b <+119>:	mov    DWORD PTR [esp],eax				# load as arg3
   0x0804858e <+122>:	call   0x8048440 <asprintf@plt>			# asprintf(0, "/bin/echo %s ", <logname>)
   0x08048593 <+127>:	mov    eax,DWORD PTR [esp+0x14]			# Store pointer to full string 
   0x08048597 <+131>:	mov    DWORD PTR [esp],eax				# Load it as arg
   0x0804859a <+134>:	call   0x8048410 <system@plt>			# Call System(arg) as flag07
   0x0804859f <+139>:	leave  
   0x080485a0 <+140>:	ret    
End of assembler dump.
