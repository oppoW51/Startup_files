## Cloned repo from codeberg - https://codeberg.org/oppoW51/Startup_files

# Startup files for STM32F103 MCU family

Minimal bare metal startup for STM32F103 (Cortex-M3). Linker script and startup file written from scratch without HAL or CubeMX.

## What`s inside

- `stm32.ld` - linker script for STM32F103 (64K Flash, 20K RAM)
- `startup.c` - init MCU (vector table and reset handle)
- `main.c` - where youre code should be
- `Makefile` - build with arm-none-eabi-gcc, flash with st-flash

## How it works

After reset, Cortex-M3 looking at 0x08000000 for stack pointer and reset handle adress. We use vector table at the start of flash to control.

## Build 

arm-none-eabi-gcc and st-flash required

>[!WARNING]
>Check your RAM and Flash lengths and adresses before start

```bash
make # build
```
```bash
make flash # flash on device
```
```bash
make clean # clean build files
```
