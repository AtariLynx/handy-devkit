# Pinky hardware documentation

## Jumpers

There are 10 jumpers on the Pinky board. This is the individual function of each pin:

|Jumper|Out|In|Remark|
|---|---|---|---|
|1|SWVCC|VCC|Set in|
|2,3|1 chip|2 or 4 chips|
|4,5|1 or 2 chips|4 chips|
|6|1 Mb|256 Kb chips|
|7|Run ROM|Download to RAM|
|8,9|Eprom|RAM|
|10|n/c||Set in|

### Switched or constant voltage

Pin 1 defines switched or constant voltage and should always be set in. 

### RAM Chips 
Pins 2 through 5 define how many RAM chips are present (or to be used). These are moved in pairs as 2 and 3, and also 4 and 5. 

Another way to check the correct configuration of the pins for the number of chips is  

|# Chips|Pin 2|Pin 3|Pin 4|Pin 5|
|---|---|---|---|---|
|1|Out|Out|Out|Out|
|2|In|In|Out|Out|
|4|In|In|In|In|

The type of RAM chips used is either 128K x 8 bit (128KB or 1 Mb) or 32K x 8 bit (32KB or 256 Kb) chips. You indicate which type is used by setting pin 6 out respectively in. 

> #### Note about bit and byte notation  
> When referring to the size of ROM or RAM it is important to notice the difference between lowercase and uppercase use of the letter 'b' and 'B'. IN this document 'b' indicates bit and 'B' is used for byte. 

In Howard and Pinky the typical types of RAM chips used are:

- **Mitsubishi M5M51008P-10L**  
  1,048,576 bit CMOS static RAM, organized as 131072 words of 8 bit.  
  32 pin 600 mil DIP package
- **Fujitsu MB84256A-10L**  
  262,144 bit CMOS 256 Kbit low power SRAM, organized as 32768 words of 8 bit  
  28 pin DIP package (DIP-28P-M02) 

Given that 1, 2 or 4 chips can be selected, it is possible to configure game ROM sizes of 32, 64 and 128 KB using 32KB chips and 128, 256 or 512 KB

## Wiring

The Pinky and Mandy combination is connected to a host development machine consisting of an Amiga 500 or 2000. Later setup, such as used by Handmade Software, also used a desktop PC with proprietary software to replace *Mandebug*.

```
Amiga <-> Pinky <-> Mandy
         (Modem)    (Lynx)
```

Two additional wires run from Pinky to Mandy next to the flat ribbon cable. These are blue for an NMI signal and brown for Reset. (Unclear for now: NMI is denoted as '*out*', whereas Reset is '*in*'.) 

It is not known how this is wired on the inside of Mandy, but presumably the blue wire with NMI signal is connected to the NMI pin of the Mikey chipset. This NMI pin was removed in the later Hayato chipset.
