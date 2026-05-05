# Pinky hardware documentation

## External connectors

The front of the Pinky device has two push buttons, a 25 pin connector and a red status LED indicator.

### Red LED indicator

The LED at the front is an indicator that will signal the state of Pinky.

After powering on Mandy, the LED might not light up. After a reset the LED will briefly be on, and switches off as soon as the boot sequence of Mandy has completed.

By pressing the NMI button, Pinky's boot loader switches to a state where it is waiting for an active connection and incoming data from the host. The LED will be lit continuously, even after the bootstrap procedure on the Commodore Amiga is completed and the parallel port is active. It will remain lit until the parallel port has become inactive, for example by running a downloaded binary program or by downloading a ROM to RAM and executing it.

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

The pins are arranged in a horizontal row delineated with JP3, JP4 and JP5. JP3 is located closest to the (bottom) edge of the Pinky board, and JP5 is located most to the centre. A jumper over JP3 and JP4 is considered out, whereas over JP4 and JP5 is in (as in inwards).

```
       _            middle
JP5   | |   _         ^
JP4   |_|  | |        |   |
JP3        |_|            v
      in   out          outside
```


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

- **Mitsubishi M5M51008P-10**  
  1,048,576 bit CMOS static RAM, organized as 131072 words of 8 bit.  
  32 pin 600 mil DIP package
- **Fujitsu MB84256A-10L**  
  262,144 bit CMOS 256 Kbit low power SRAM, organized as 32768 words of 8 bit  
  28 pin DIP package (DIP-28P-M02)
- **Sony CXK58256PM-10L**
  32K words x 8 bit
  High speed CMOS static RAM
  28 pin DIP package

Also found inside Howard boards
- **Toshiba TC55257BPL-10** 
  28 pin DIP package

Given that 1, 2 or 4 chips can be selected, it is possible to configure game ROM sizes of 32, 64 and 128 KB using 32KB Fujitsu chips and sizes of 128, 256 or 512 KB using the 128 KB Mitsubishi chips.

The available RAM/EPROM slots are named U2 to U5, starting at the side of the jumpers for the first slot U2 and ending on the opposite side with the fourth chip in U5. These must be filled from U2 through U5, using 1, 2 or 4 chips. Using 3 chips is not possible.

Also, since the 32KB chips have only 28 pins in the DIP package, these should be inserted all the way to the right (outside of the board), with the centre indentation facing to the left (towards the middle of the board).

### Running from ROM or RAM

Pin 7 indicates whether a program or game should be run from either ROM or RAM. 

The following EPROM and EEPROM chips are potentially usable as static ROM

- 27C010 (EPROM)
- 28C010 (EEPROM)
- 29F010 / 29F040 (EEPROM)

### Example jumper configurations

4 chips each 1 Mb or 128 kilobytes, where the game ROM is downloaded to RAM and the type of chips is RAM:

```
       1   2   3   4   5   6   7   8   9   10
       _   _   _   _   _       _   _   _   _
JP5   | | | | | | | | | |  _  | | | | | | | |
JP4   |_| |_| |_| |_| |_| | | |_| |_| |_| |_|
JP3                       |_|
      VCC <---4 chips---> 1Mb RAM <-RAM-> N/C
```

2 chips each 256 Kb or 32 kilobytes, where the game ROM is run from ROM and the type of chips is EPROM:

```
       1   2   3   4   5   6   7   8   9   10
       _   _   _           _               _
JP5   | | | | | |  _   _  | |  _   _   _  | |
JP4   |_| |_| |_| | | | | |_| | | | | | | |_|
JP3               |_| |_|     |_| |_| |_|
      VCC <---2 chips---> 256 ROM <EPROM> N/C
```

## Wiring

The Pinky and Mandy combination is connected to a host development machine consisting of an Amiga 500 or 2000. Later setup, such as used by Handmade Software, also used a desktop PC with proprietary software to replace *Mandebug* to establish a connection to Pinky.

```
Amiga     <--->     Pinky    <--->    Mandy
                 (Modem case)        (Lynx)
```

Two additional wires run from Pinky to Mandy next to the flat ribbon cable. These are blue for an NMI signal and brown for Reset. (Unclear for now: NMI is denoted as '*out*', whereas Reset is '*in*'.) 

It is not known how this is wired on the inside of Mandy, but presumably the blue wire with NMI signal is connected to the NMI pin of the Mikey chipset. This NMI pin was removed in the later Hayato chipset, as used in the later Lynx 2 models.

## Generic Array Logic chipset

The Pinky board has a single GAL (Generic Array Logic) chip on the board. It is presumably used to define the logic of the interaction between the various components of the board and their inputs and outputs.

The GAL chip is a National Semiconductor GAL16V8-**25LNC**. The bold part is uncertain, as most of it is covered by stickers indicating `UP9` for the programmable part that is inserted into slot `U9` of the board. The GAL16V8-25LNC was also used in Commodore Amiga computers, e.g. the Amiga 1000 memory expansion module.

> #### Contents of GAL  
> So far, no attempts have been made to see what the programming of the GAL is. This would require removing it from its socket and placing it into a ROM programmer. The programmer can check whether the GAL had its security fuse enabled, which means the logic could not be read back. Only if the GAL turns out to be unprotected, can the logic be retrieved. 

## Pinky Boot ROM

The Pinky boot ROM is stored on an EPROM. Its type is Texas Instruments NMC27C64Q-200, a EPROM UV 64K-Bit 8K x 8 200ns 28-Pin windowed CDIP. 

The checksum for the contents of the ROM is `1C6B` for boot loaders of april 13th, 1990. You can find the reverse engineered source code for the boot loader [here](../pinky/pinky.src).

## References

https://devkits.handheldmuseum.com/Atari_LynxPinky.htm