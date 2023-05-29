/*
 *  _CRS method to return GPIO pin. GPIO Pin was found using:
 *  https://voodooi2c.github.io/#GPIO%20Pinning/GPIO%20Pinning
 * The following patch is required. A example can be found in `patches_GPIO.plist`
 *  Assumes that the following patch is being used:
 * --------------------------------------------------------------------
 *  Base: \_SB.PCI0.I2C1.D015 (or whatever I2C device you are patching)
 *  Count: 1
 *  Find: 5F435253 (_CRS in hexadecimal)
 *  Replace: 58435253 (XCRS in hexadecimal)
 *  Enabled: True
 */

#define I2C_DEVICE \_SB.PCI0.I2C1.D015

DefinitionBlock ("", "SSDT", 2, "GWYD", "I2CPIN", 0x1) {
    External (I2C_DEVICE, DeviceObj)

    Scope (I2C_DEVICE) {
        
        Name (_CRS,
            ResourceTemplate() {
        
               // copied and pasted from coreboot ACPI
               
                    I2cSerialBusV2 (
                   
                            0x0015, ControllerInitiated, 0x00061A80,
                            AddressingMode7Bit, "\\_SB.PCI0.I2C1", // <- This may need to be changed on other devices
                            0x00, ResourceConsumer, , Exclusive,
                        )
                
                // edited interrupt details 
                    GpioInt (
                    Level, ActiveLow, ExclusiveAndWake, PullDefault, 0x0000,
                    "\\_SB.PCI0.GPI0", 0x00, ResourceConsumer, , // <- This may need to be changed on other devices
                    ) { 27 } // GPIO Pin
                
            }
        )
    }
}

// Credits:
// 1Revenger1 for writing
