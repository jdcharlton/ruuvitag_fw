#!/bin/bash

nrfutil settings generate --family NRF52 --application _build/ruuvi_sensor.hex --application-version 1 --bootloader-version 1 --bl-settings-version 1 settings.hex
mergehex -m ~/projects/nordic/ruuvi/SD132/s132_nrf52_3.1.0/s132_nrf52_3.1.0_softdevice.hex ~/projects/nordic/ruuvi/ruuvitag_fw_local/bootloader/ruuvitag_b_debug/armgcc/_build/ruuvitag_b_bootloader.hex settings.hex -o sbc.hex
mergehex -m sbc.hex _build/ruuvi_sensor.hex -o packet.hex
nrfjprog --family nrf52 --eraseall
nrfjprog --family nrf52 --program packet.hex
nrfjprog --family nrf52 --reset
  
