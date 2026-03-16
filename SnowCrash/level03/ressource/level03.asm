   0x080484a4 <+0>:	push   ebp
   0x080484a5 <+1>:	mov    ebp,esp
   0x080484a7 <+3>:	and    esp,0xfffffff0
   0x080484aa <+6>:	sub    esp,0x20
   0x080484ad <+9>:	call   0x80483a0 <getegid@plt>				# returns the effective group ID of the calling process.
   0x080484b2 <+14>:	mov    DWORD PTR [esp+0x18],eax			# Store it in esp+0x18 = flag03 🟨
   0x080484b6 <+18>:	call   0x8048390 <geteuid@plt>			# get effective user identity (user id)
   0x080484bb <+23>:	mov    DWORD PTR [esp+0x1c],eax			# store in esp+0x1c 🟥
   0x080484bf <+27>:	mov    eax,DWORD PTR [esp+0x18]			# get value from esp+0x18 🟨
   0x080484c3 <+31>:	mov    DWORD PTR [esp+0x8],eax			# load in arg1
   0x080484c7 <+35>:	mov    eax,DWORD PTR [esp+0x18]			# get value from esp+0x18 🟨
   0x080484cb <+39>:	mov    DWORD PTR [esp+0x4],eax			# load in arg2
   0x080484cf <+43>:	mov    eax,DWORD PTR [esp+0x18]			# get value from esp+0x18 🟨
   0x080484d3 <+47>:	mov    DWORD PTR [esp],eax				# load in arg3
   0x080484d6 <+50>:	call   0x80483e0 <setresgid@plt>		# sets the real user ID, the effective user ID, and the saved set-user-ID of the calling process. 
   0x080484db <+55>:	mov    eax,DWORD PTR [esp+0x1c]			# Get stored user id 🟥
   0x080484df <+59>:	mov    DWORD PTR [esp+0x8],eax			# load in arg1
   0x080484e3 <+63>:	mov    eax,DWORD PTR [esp+0x1c]			# Get stored user id 🟥
   0x080484e7 <+67>:	mov    DWORD PTR [esp+0x4],eax			# load in arg2
   0x080484eb <+71>:	mov    eax,DWORD PTR [esp+0x1c]			# Get stored user id 🟥
   0x080484ef <+75>:	mov    DWORD PTR [esp],eax				# load in arg3
   0x080484f2 <+78>:	call   0x8048380 <setresuid@plt>		# set real, effective, and saved user or group ID
   0x080484f7 <+83>:	mov    DWORD PTR [esp],0x80485e0		# set arg = 0x80485e0 = "/usr/bin/env echo Exploit me"
   0x080484fe <+90>:	call   0x80483b0 <system@plt>			# exec the command 
   0x08048503 <+95>:	leave  
   0x08048504 <+96>:	ret  
