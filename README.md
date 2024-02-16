# osed_scripts
Anyscripts I create for osed course I will share here.


## search_rops.txt

This simple script is used to search the output of `rp-win-x86.exe`

Sample way to run and exclude badchars.
```
rp-win-x86.exe -r5 -f <filename> --unique --bad-bytes=\x00\x09\x0a\x0b\x0c\x0d\x20
```


## XORing Null Bytes:

You can XOR the null bytes in the IP address to avoid having literal null bytes in your code. 

For example:
```
    "   push 0x8000000a                 ;"  # Push the IP address (initial push)
    "   xor eax, eax                    ;"  # Clear EAX
    "   mov al, 10                      ;"  # Set the first octet
    "   push eax                        ;"  # Push the first byte of IP address
    "   xor eax, eax                    ;"  # Clear EAX
    "   mov al, 0                       ;"  # Set the second octet
    "   mov ah, 0                       ;"  # Clear AH
    "   push eax                        ;"  # Push the second byte of IP address
    "   xor eax, eax                    ;"  # Clear EAX again for the next octets
    "   mov al, 0                       ;"  # Set the third octet
    "   mov ah, 0                       ;"  # Clear AH
    "   mov al, 0                       ;"  # Clear AL
    "   mov al, 128                     ;"  # Set the last octet
    "   push  eax                        ;"  # Push the third byte of IP address
```


## PWNTOOLS Push String to stack

```
import pwn
>>> print(pwn.shellcraft.i386.pushstr("meowTheCatSaid"))
    /* push 'meowTheCatSaid\x00' */
    push 0x1010101
    xor dword ptr [esp], 0x1016568
    push 0x61537461
    push 0x43656854
    push 0x776f656d

List all functions and attributes of the pwn module
```

``` python
import pwn

print(dir(pwn))
```

