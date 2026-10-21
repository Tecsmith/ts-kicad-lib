# Changelog

This file records notable changes to this project.

The format follows [Keep a Changelog](https://keepachangelog.com/en/1.1.0/).
Release versions use dates in `YYYY.MM.DD` format.

## [Unreleased]

### Added

- The `ts-flat-flex-cable` library with footprints and 3D models for Molex 503480 (4 to 14 pin) and Hirose FH12 (10 to 20 pin) connectors. Its symbol library is empty.
- The `ts-jlcpcb-lib` library with JLCPCB order number placeholders.
- General IC symbols: 74HC595, DW01A, INA180, MC74HC08A, TLV803E, TPS25221, TS3USB30E, TS5A23157, and TS5A3157.
- General symbols: LEDs, jumpers, mouse bite, net tie, 2-up resistor, crystal, Schottky diode, TVS diodes, push button, and SPDT switch.
- General footprints: fiducials, net junctions, net ties, 2-up 0603 resistor, mirrored 0603 resistor jumper, ML414H coin cell, and Tag-Connect TC2030 and EC-06.
- Keyboard items: SK6803MINI-E symbol and footprint, EC11-J encoder, MX hotswap variant `SW_MX_HotSwap_Spec`, and SOD-323 diode footprints.
- Keyboard MCU symbols: REF30E, STM32G0B1CB, STM32G474CB, TC2030 SWD, and USB3320.
- The copper variant of the 20 mm Tecsmith logo.
- The MillMax 3305 3D model and more datasheets in `docs/`.
- README sections for all libraries, model dependencies, local archive builds, and releases.
- README instructions to install through `ts-kicad-repository` with the Plugin and Content Manager (PCM).
- README instructions for local clones and the `TECSMITH_3DMODEL_DIR` path variable.

### Changed

- All symbol and footprint libraries now use the KiCad 10 file format. This includes `ts-lumissil-lib` and eight footprints that used the KiCad 9 format.
- The `USB3300-EZK` symbol is now `USB3300`, and the `MC74HC589AD` symbol is now `MC74HC589`.
- The PCM archive builder now uses Python 3.9 or later instead of platform-specific `sed` and `grep` commands.
- Local archive builds now default to version `0.0.0` and work without `GITHUB_ENV`.
- Archive builds preserve other ZIP files, skip editor `.bak` files, and replace the target archive only after a successful build.
- A manual run of the PCM workflow now builds the archive from the latest tag instead of from the current branch.

### Removed

- The `TPS2552/53` symbol.
- The `RGB-156120M_VIA` footprint.

### Fixed

- The battery, SOIC-8, and DIP switch footprints now reference KiCad 10 model paths instead of KiCad 9 paths.
- The SOP-8 footprint now references the existing bundled `SOP-8.step` model.
- The EC11-E encoder now uses the bundled `EC11-THT-15F-green.step` model with a 90-degree rotation that aligns its pins and mounting tabs.
- The 6¼U stabilizer symbol now references the existing `ts-keyboard-lib:STAB_6¼U` footprint.
- Footprint filters now include the assigned footprints in the general, keyboard, Lumissil, and Seeed XIAO symbol libraries.
- The RGB3528, MC74HC589, and TS5A3159 symbols now have valid datasheet links.
- PCM archives now use the default `PCM_` prefix for bundled footprint references and resolve bundled models through `KICAD10_3RD_PARTY`.
- The PCM metadata template now contains valid JSON and excludes download fields from the archive.
- Archive builds no longer require the missing root `VERSION` file or include an unnecessary `plugins/VERSION` file.
- The PCM workflow no longer sets `branches` on the `release` trigger, which GitHub ignores for that event.

[Unreleased]: https://github.com/Tecsmith/ts-kicad-lib/compare/2026.05.11...HEAD
