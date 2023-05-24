#### crosgpiopatch
Various macOS patches to enable GPIO interrupt mode on the Asus C425. Includes the following:
- Patched `VoodooGPIO.kext` to switch pin from ACPI Mode to GPIO driver mode.
- `SSDT-I2C` to disable polling.
- `config.plist` patch to enable GPIO interrupts.

------------------------------------------------------------------------

>**Warning** The `config.plist` patch **is required** and can be found in the decompiled version of SSDT-I2C and/or `patches_GPIO.plist`.

The changes to VoodooGPIO are available at: https://github.com/VoodooI2C/VoodooGPIO/pull/15

#### Credits:
- [1Revenger1](https://github.com/1Revenger1) for writing this
