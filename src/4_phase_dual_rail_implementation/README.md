# 4-Phase Dual-Rail Asynchronous Protocol (ESP32-C6)

This project implements a **4-phase dual-rail asynchronous communication protocol** on an ESP32-C6 microcontroller. It demonstrates handshake-driven, delay-insensitive data transfer using dual signaling rails per bit and ready/acknowledge control logic.

---

## Built With

- ESP-IDF v5.x (recommended)
- CMake
- `idf.py` tooling
- ESP32-C6 DevKit board

---

## Protocol Overview

The **4-phase dual-rail** protocol uses two wires per bit:

| Logical Value | Rail0 | Rail1 |
|--------------|-------|-------|
| `0`          | 1     | 0     |
| `1`          | 0     | 1     |
| Idle/Spacer  | 0     | 0     |

A complete transaction cycles through:

1. **Drive Data** (dual-rail lines asserted)
2. **Receiver ACK** rises
3. **Sender clears rails** to spacer
4. **Receiver deasserts ACK**

This ensures robustness regardless of propagation delay or clock domain boundaries.

---

## Hardware Requirements

- **ESP32-C6-DevKitM-1**
- Breadboard or PCB
- External asynchronous device (optional)
- Jumper wires, logic analyzer (for debugging)

---

## External Dependencies

No external libraries are required outside of ESP-IDF.

Install ESP-IDF:
```sh
git clone --recursive https://github.com/espressif/esp-idf.git
cd esp-idf
./install.sh
. export.sh
```

---

## Project Structure

```
4_phase_dual_rail_implementation/
├── CMakeLists.txt
├── sdkconfig
├── sdkconfig.old
└── main/
    ├── CMakeLists.txt
    └── main.c
```

- `main.c`  
  Implements dual-rail transmission, handshake signaling, GPIO initialization, and the protocol state machine.

- `sdkconfig`  
  ESP-IDF configuration for this board.

---

## Pin Configuration

Dual-rail pairs and handshake lines are defined in `main.c`.  
Adjust GPIO assignments there as needed.

Typical mapping:

| Signal | Description | Direction |
|--------|-------------|-----------|
| D0_0   | Bit0 rail0  | Output    |
| D0_1   | Bit0 rail1  | Output    |
| ...    | ...         | ...       |
| ACK    | Receiver acknowledge | Input |

All rails reset to `0` during spacer phase.

---

## Building the Project

From the project folder:

```sh
idf.py set-target esp32c6
idf.py build
```

Flash using USB:

```sh
idf.py flash
```

Monitor serial output:

```sh
idf.py monitor
```

Exit monitor with `Ctrl+]`.

---

## Usage

1. Connect the ESP32-C6 to the asynchronous device.
2. Observe the dual-rail lines with a logic analyzer (recommended).
3. Trigger data transmission internally (demo mode) or modify `main.c` to accept UART input.
4. Follow the rail/ACK transitions.

Expected sequence:

```
Sender -> drives rails
Receiver -> ACK high
Sender -> clear rails
Receiver -> ACK low
```

---

## Modifying Data Width

The default implementation demonstrates **1-bit dual-rail**, but can be expanded by:

- Adding more rail pairs
- Scaling the state machine
- Extending the clear/spacer logic

---

## Troubleshooting

| Issue | Cause | Fix |
|-------|-------|-----|
Rails never clear | ACK not received | Verify input pin wiring |
Unexpected rail conflicts | Logic analyzer oversampling | Add small pull-downs |
No ACK transitions | Device idle | Ensure asynchronous device responds |

Use `idf.py monitor` logs for state feedback.

---
