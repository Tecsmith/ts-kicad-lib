# ts-kicad-lib

> After over 30 years of using EagleCAD as my design tool, and the constant reminder that it will stop working in June 2026, I finally put the time in to learn KiCAD. Version 9 is really stable now and as far as I can tell it's, in some cases, even much better than Eagle.  And so I now need to port my Eagle libraries to KiCAD ... and most is not by conversion (as the layers don't 100% match 1-on-1).  And so this will be the slow progression of that effort.

This library is for KiCad 10. All symbol and footprint files use the KiCad 10 file format. KiCad 9 cannot open them.

## What's included

| Library | Symbols | Footprints | Description |
|:--- |:---:|:---:| --- |
| [ts-kicad-lib](#ts-kicad-lib) | Yes | Yes | General components used in most projects. |
| [ts-keyboard-lib](#ts-keyboard-lib) | Yes | Yes | Keyboard components: switches, stabilizers, LEDs, and encoders. |
| [ts-keyboard-ec-lib](#ts-keyboard-ec-lib) | Yes | Yes | Electro-capacitive (EC) keyboard switches and their support parts. |
| [ts-keyboard-mcu-lib](#ts-keyboard-mcu-lib) | Yes | No | Microcontrollers and USB PHYs for keyboard controllers. |
| [ts-keyboard-pcb-lib](#ts-keyboard-pcb-lib) | No | Yes | Keyboard PCB outlines. |
| [ts-lumissil-lib](#ts-lumissil-lib) | Yes | No | Lumissil LED matrix drivers. |
| [ts-seeed-xiao-lib](#ts-seeed-xiao-lib) | Yes | Yes | Seeed Studio XIAO modules. |
| [ts-flat-flex-cable](#ts-flat-flex-cable) | Empty | Yes | 0.5 mm flat flex cable (FFC) connectors. |
| [ts-jlcpcb-lib](#ts-jlcpcb-lib) | No | Yes | JLCPCB order number placeholders. |
| [ts-logos-lib](#ts-logos-lib) | No | Yes | Logos. |

A variety of [3D Models](#3d-models), as `STEP` files.

---

## Installation

### With the Plugin and Content Manager (PCM)

The `ts-kicad-repository` package index publishes each release of this library.

1. In KiCad, open the **Plugin and Content Manager**.
2. Click **Manage...**, then click **+** *(Add)*.
3. Enter the name `Tecsmith repository`.
4. Enter this URL:
   `https://raw.githubusercontent.com/Tecsmith/ts-kicad-repository/main/repository.json`
5. Select the **Tecsmith repository**, then install **ts-kicad-lib**.
6. Click **Apply Pending Changes**.

The PCM adds each library with a `PCM_` prefix, for example `PCM_ts-kicad-lib`. The bundled 3D models install below `${KICAD10_3RD_PARTY}/3dmodels/com_github_tecsmith_ts-kicad-lib`.

### From a local clone

Use a local clone to edit the libraries, or to use changes before a release.

1. Clone this repository.
2. In KiCad, open **Preferences > Configure Paths**.
3. Add the path variable `TECSMITH_3DMODEL_DIR`. Set it to the `3dmodels` folder of your clone.
4. Open **Preferences > Manage Symbol Libraries**. Add each `symbols/*.kicad_sym` file.
5. Open **Preferences > Manage Footprint Libraries**. Add each `footprints/*.pretty` folder.

Use the file name without its extension as the library nickname, for example `ts-keyboard-lib`. The symbols refer to footprints by these nicknames.

### Dependencies

Some symbols use footprints from the standard KiCad 10 libraries, for example `Package_SO` and `Package_TO_SOT_SMD`.

The `ML414H_IV01E` battery footprint uses a 3D model from the SparkFun KiCad library. To show that model, install **SparkFun KiCad Libraries** from the default KiCad PCM repository.

---

## ts-kicad-lib

Most of these are already available, but not to my liking. *(What's with the giant symbols?)* Also added a few tweaks to suit my preferences.

### Symbols

- Passives: resistor, resistor array, capacitor, ferrite bead, crystal
- Diodes: diode, Schottky, dual diodes, TVS, LEDs (red, green, blue, yellow)
- Connectors: 2, 3, 4, 5, 6 & 8 pin variants, QWIIC, USB-C Receptacle, 5V ARGB header
- Jumpers, net ties, test points, mounting holes, mounting points, mouse bites
- Switches: small push button & SPDT
- Logic: 74HC1G66, 74HC595, MC74HC08A, MC74HC589, SN74AHCT1G125, SN74LVC1G14
- Memory: M25C EEPROM
- Power: AP2112 & x1117 LDOs, DW01A, INA180, TLV803E, TPS22810, TPS22919, TPS25221
- ESD's: SRV05-4 & TPDxE05U06
- Analog switches: TS3USB30E, TS5A23157, TS5A3157, TS5A3159
- TTP223 touch sensor

### Footprints

- M2 Hole (no copper)
- M2 Mounting Hole (copper sleeve), 2 variants
- Fiducials, 3 variants
- Solder jumpers and 0603 resistor jumpers
- Net junctions and net ties
- Mouse bites: 2 mm slot
- Common Footprints
    - SOIC-8, 2 variants
    - SOP-8
    - 0603 resistor, 2-up
- STEMMA QT / QWIIC, 2 variants
- JRAINBOW 5V ARGB header
- 4-way DIP switch
- ML414H coin cell
- Tag-Connect: TC2030 & EC-06, 3 variants
- USB-C Receptacle `USB4085` PHT variant


---

## ts-keyboard-lib

A port of my `ts-eagle-lib`.

### Symbols

- 156120M Common Anode BRG *(RGB)*
- RGB3528 Common Anode RGB
- SK6812MINI-E & SK6803MINI-E Addressable RGB *(ARGB)*
- Stabilizers: 2, 3, 6, 6¼ & 7U variants
- Momentary Switch *(oriented at 45° to fit a matrix better)*
- SPST & SPDT switches
- DRV5056 Hall effect switch
- EC11 rotary encoder
- Skyloong encoder key switch
- Unified Daughterboard (UDB) connector

### Footprints

- 156120M Common Anode BRG *(RGB)*
- RGB3528 & MHT151C LEDs
- SK6812MINI-E & SK6803MINI-E Addressable RGB *(ARGB)*
- Stabilizers: 2, 3, 6, 6¼ & 7U variants
- MX Keyboard switches: Hotswap and MillMax variants
- MX plate cutouts: 1U and stabilizer variants
- DRV5056 Hall effect switch
- EC11 rotary encoders: EC11-E & EC11-J
- Skyloong encoder key switch
- JST-SH 4 pin connector
- SOD-323 diode


---

## ts-keyboard-ec-lib

### Symbols

- DynaCap EC switch
- 74HC4051 analog multiplexer
- OPA350 operational amplifier

### Footprints

- EC switch pads: 1U, half, and quarter variants
- DynaCap and Trope plate cutouts: 1U, 2U, and 3, 6, 6¼ & 7U stabilizer variants


---

## ts-keyboard-mcu-lib

### Symbols

- STM32F405RG, STM32G0B1CB & STM32G474CB
- USB3300 & USB3320 USB PHYs
- REF30E voltage reference
- TC2030 SWD connector


---

## ts-keyboard-pcb-lib

### Footprints

- Board outlines with mounting holes: Bakeneko 60 v3, Bakeneko 65 v3, Bakeneko GH60 Hybrid, and GH60 Original


---

## ts-lumissil-lib

### Symbols

- IS31FL3743A & IS31FL3743B
- IS31FL3746A & IS31FL3746B


---

## ts-seeed-xiao-lib

### Symbols

- XIAO ESP32-C3, ESP32-C5, ESP32-C6, ESP32-S3, nRF52840, RP2040 & RP2350: DIP and SMD variants
- XIAO header

### Footprints

- XIAO SMD footprints for each module
- Generic XIAO DIP, SMD, and combined SMD/DIP footprints
- XIAO add-on board and 7 pin header


---

## ts-flat-flex-cable

### Footprints

- Molex 503480: 4, 6, 8, 10, 12 & 14 pin variants
- Hirose FH12: 10, 12, 14, 16, 18 & 20 pin variants

The symbol library is empty at this time.


---

## ts-jlcpcb-lib

### Footprints

- JLCPCB order number placeholders: 2x10, 5x5, 8x8 & 10x10 mm


---

## ts-logos-lib

### Footprints

- Tecsmith logo, 20 mm: silkscreen and copper variants
- UDK logo, 5 mm


---

### 3D Models

- Kailh Hotswap socket
- MillMax 3305 socket
- EC11 rotary encoder
- RGB
    - 156120M
    - SK6812MINI-E
- JST-SH: 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15 & 20 pin variants
- Molex 503480 and Hirose FH12 FFC connectors
- Seeed Studio XIAO and XIAO ESP32-C3
- OLED 128x32 display
- SGM6029
- SOIC8 chip
- SOP-8 chip


---

## Building a PCM archive

You need `sh` and Python 3.9 or later.

```sh
sh pcm/create_pcm_archive.sh 2026.10.21
```

The script writes `pcm/ts-kicad-lib-<version>.zip`. If you do not give a version, the script uses `0.0.0`.

The archive builder changes two things in the packaged copies of the libraries:

- It replaces `${TECSMITH_3DMODEL_DIR}` with the PCM model folder.
- It adds the `PCM_` prefix to footprint references that point to the libraries in this repository.

### Releases

Release versions use dates in `YYYY.MM.DD` format. When you publish a GitHub release, the `KiCAD PCM packaging` workflow does these steps:

1. It builds the archive from the release tag.
2. It attaches the archive to the release.
3. It starts the `Rebuild repository` workflow in `ts-kicad-repository`. This step needs the `PERSONAL_TOKEN` secret.

If you start the workflow manually, it rebuilds the archive for the latest tag from that tag.


---

> Made with :heart:
