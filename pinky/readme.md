# Pinky boot ROM

The Pinky ROM lives inside an EPROM in the Pinky device. The ROM consists of an encrypted frame with three blocks. The code contains two sections:

1. Initialization
2. NMI handler

The purpose of the first section is to copy the NMI handler routine from the decrypted header at $0200 to $3000 and initialize the NMI vector.

The first section ends with an endless loop and which can only be escaped when an NMI occurs and execution continues at the NMI vector at $3000.

# Compiling

Assemble all files with Epyx toolkit and encryption tooling:

```
asm +L pinky.src
asmstrip pinky.bin pinky.raw
premod pinky.raw pinky.pre
copy pinky.pre DF0:input

; Encrypt using encryption disks 1, 2 and 3

copy DF0:output pinky.enc
postmod pinky.enc pinky.rom 3
make_lnx pinky.rom -b0 128K
```

The other files are for reference:

|Name|Description|
|---|---|
|`pinky.lst`|Listing file|
|`pinky.bin`|Assembled Epyx binary|
|`pinky.raw`|Raw binary|
|`pinky.pre`|Premodded binary|
|`pinky.enc`|Encrypted header|
|`pinky.rom`|Postmodded ROM|
|`pinky.lnx`|Emulation file|