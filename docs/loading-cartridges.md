# Loading from physical game cartridges

The Howard device allows physical game cartridges to be inserted and run. 

## Options to run programs

There are two options to run a program or game from a physical cartridge. 

1. **Use Howard in `Handy` mode**  
   In the `Handy` mode Howard behaves as if it is a regular Handy (i.e. Lynx) device. It will load the boot ROM and look for a loaded cartridge. 
2. **Start loaded cartridge in `Debug` mode**  
   The normal mode is `Debug` where connection is made with the Amiga first. Typically, one would load a ROM file into emulation RAM memory first. When a physical cartridge is inserted, the hardware will use the ROM of the cartridge instead of the RAM emulating a game ROM. It will immediately go to the boot screen and skip the normal boot loader.

## Steps for `Handy` mode

- Make sure Howard is turned off
- Switch SW7 to `On` to put Howard in `Handy` mode
- Insert game cartridge with the label down into the slot
- Start Howard to get the normal boot sequence

## Steps for `Debug` mode

- Make sure Howard is turned off
- Switch SW7 to `Off` to put Howard in `Debug` mode
- Insert game cartridge with the label down into the slot
- Start Howard and verify that the connection with `HowDebug` is made. It should report `Parallel Port is ACTIVE` at the top
- Press `Shift+F5` to run the loaded ROM