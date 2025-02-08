# ChipStream_Undergraduate_Thesis
A comprehensive repository for my undergraduate thesis, exploring the implementation of a 4-phase dual-rail asynchronous communication protocol to enhance cross-domain interoperability between synchronous and asynchronous circuits. Includes the thesis document, GUI demonstration, and source code for hardware-software integration.

## Author: Petros Petrou  
**Supervised by:** Professor Julius Georgiou  
**Degree:** Bachelor of Science in Computer Engineering 
**University:** University of Cyprus
**Date:** May 2024  

---

## 📜 Overview
This repository contains the source files, documentation, and supplementary materials for my undergraduate thesis: **"Bridging Cross-Domain Communication in Asynchronous and Synchronous Digital Systems."** The thesis explores the challenges and methodologies of enabling reliable communication between synchronous and asynchronous digital circuits to improve interoperability and efficiency in semiconductor technology.

A **Graphical User Interface (GUI)** was developed as part of this research, and a **video demonstration** of the system is included.

The novelty of this research is the implementation of the **4-phase dual-rail asynchronous communication protocol**, which ensures efficient and reliable data transfer between synchronous and asynchronous circuits.

---

## 📑 Thesis Abstract
This thesis investigates the communication dynamics between synchronous and asynchronous digital circuits to enhance their interoperability and efficiency. Through an extensive study of semiconductor evolution, comparative analysis of synchronous vs. asynchronous systems, and a hands-on implementation, this research aims to minimize latency, maximize throughput, and ensure robust data integrity. The final system demonstrates effective cross-domain communication through strategic hardware and software integration.

For full details, refer to the **thesis document** (`Undergraduate Thesis - Petros Petrou.pdf`).

---

## 📌 Features
- **Comprehensive Theoretical Analysis:** Examines semiconductor technology evolution, system design, and implementation.
- **Hardware Integration:** Implements a communication bridge using **Microcontrollers (MCUs)** or **FPGAs**.
- **Software Development:** Includes a user-friendly GUI for data exchange.
- **Testing & Evaluation:** Measures communication latency and throughput between circuits.
- **Practical Demonstration:** A real-time implementation showcasing the feasibility of cross-domain communication.
- **Novelty:** Implements the **4-phase dual-rail asynchronous communication protocol** for robust and efficient data transfer.

---

## 📂 Repository Contents

| File / Directory | Description |
|-----------------|-------------|
| `Undergraduate Thesis - Petros Petrou.pdf` | Full thesis document detailing the research and implementation. |
| `Demonstration/` | Video demonstration of the implemented GUI and demonstration of the whole system. |
| `src/` | Source code for the GUI and firmware for the hardware components. |
| `docs/` | Additional documentation, reports, and reference materials. |
| `README.md` | This document providing an overview of the project. |

---

## 🛠️ Installation & Setup

### 1️⃣ Clone the Repository
```bash
 git clone https://github.com/petrospetrou/ChipStream_Undergraduate_Thesis.git
 cd ChipStream_Undergraduate_Thesis
```

### 2️⃣ GUI Application Setup
- The GUI application was developed using **Qt Creator IDE** with **C++**.
- Ensure you have the Qt Creator IDE installed on your system: [Qt Documentation](https://www.qt.io/).
- Open the GUI project in Qt Creator and build it following the IDE's build instructions.

### 3️⃣ Hardware Setup (MCU/FPGAs)
- The microcontroller used for the bridge hardware is an **ESP32-C6-DevKitM-1**.
- Refer to the hardware documentation: [ESP32-C6-DevKitM-1 User Guide](https://docs.espressif.com/projects/esp-dev-kits/en/latest/esp32c6/esp32-c6-devkitm-1/user_guide.html).
- Development for the UART communication was done using **PlatformIO** and **CLion IDE**.
- Follow these steps to set up the hardware:
  1. Install [PlatformIO](https://docs.platformio.org/en/latest/) and CLion IDE.
  2. Open the firmware project in CLion with PlatformIO enabled.
  3. Connect the ESP32-C6-DevKitM-1 to your computer.
  4. Flash the firmware to the microcontroller using:
     ```bash
     platformio run --target upload
     ```

---

## 🚀 Usage
1. **Launch the GUI Application** through the Qt Creator build.
2. **Input Data** to be sent to the asynchronous chip.
3. **Initiate Communication** through the GUI.
4. **Monitor Results** for latency and throughput statistics.
5. **Refer to the Video Demonstration** (`Screen Recording.mov`) for visual guidance.

---

## 🛠️ Known Issues and Troubleshooting
- **Improper Default Initialization of Flash Size:**
  - Issue: During the setup phase of the ESP32-C6-DevKitM-1, flash size was improperly initialized, causing startup errors.
  - Resolution: Flash size configuration was corrected in the initialization script. Ensure your environment settings match the hardware specifications.

- **Data Reception Challenges:**
  - Issue: Data reception between the GUI and bridge hardware occasionally failed due to improper handling of UART buffer overflow.
  - Resolution: Enhanced buffer management logic in firmware resolved the issue.

For more detailed troubleshooting information, please refer to the thesis document.

---

## 📖 References
For further details on semiconductor technologies, synchronous and asynchronous communication, refer to:
- **Main Thesis Document:** `Undergraduate Thesis - Petros Petrou.pdf`
- **Relevant Research Papers:** Listed in the thesis bibliography.
- **Technical References:** Available in `docs/references.txt`.

---

## 📜 License
This repository is released under a **Custom Academic License**. Usage, modification, and distribution are restricted based on the original academic institution’s policies. Any reuse or adaptation of this work must be approved by the author and comply with academic integrity guidelines.

---

🎉 **Thank you for checking out my thesis repository!** I hope this work contributes to the understanding and advancement of cross-domain digital communication systems. 🚀
