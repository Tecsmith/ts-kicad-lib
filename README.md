# ts-kicad-lib

> After over 30 years of using EagleCAD as my design tool, and the constant reminder that it will stop working in June 2026, I finally put the time in to learn KiCAD. Version 9 is really stable now and as far as I can tell it's, in some cases, even much better than Eagle.  And so I now need to port my Eagle libraries to KiCAD ... and most is not by conversion (as the layers don't 100% match 1-on-1).  And so this will be the slow progression of that effort.

## What's included

| Library | Description |
|:--- | --- |
| [ts-kicad-lib](#ts-kicad-lib) | Collection of general components used in most projects. |
| [ts-keyboard-lib](#ts-keyboard-lib) | Collection of custom keyboard specific components. |

A variety of [3D Models](#3d-models), as `STEP` files.

---

## ts-kicad-lib

Most of these are already available, but not to my liking. *(What's with the giant symbols?)* Also added a few tweaks to suite my preferences.

### Symbols

- Multi-pin connectors: 2, 3, 4, 5 & 6 pin variants
- Ferrite Beed
- M25C EEPROM
- Mounting holes: M2
- QWIIC connector
- ESD's: SRV05-4 & TPDxE05U06
- USB-C Receptacle

### Footprints

- M2 Hole (no copper)
- M2 Mounting Hole (copper sleave), 2 variants
- SMB jumpers
- Common Footprints
    - SOIC-8, 2 variants
    - SOP-8
- USB-C Receptacle `USB4085` PHT variant


---

## ts-keyboard-lib

A port of my `ts-eagle-lib`.

### Symbols

- 156120M Common Anode BRG *(RGB)*
- SK6812MINI-E Addressable RGB *(ARGB)*
- Stabilisers: 2, 3, 6, 6¼ & 7U variants
- Momentary Switch *(oriented at 45° to fit a matrix better)*

### Footprints

- 156120M Common Anode BRG *(RGB)*
- SK6812MINI-E Addressable RGB *(ARGB)*
- Stabilisers: 2, 3, 6, 6¼ & 7U variants
- MX Keyboard switches: Hotswap and MillMax variants


---

### 3D Models

- Kailh Hotswap socket
- RGB
    - 156120M
    - SK6812MINI-E
- JST-SH: 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15 & 20 pin variants
- SOIC8 chip
- SOP-5 chip


---

> Made with :heart:
