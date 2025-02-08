#include "serialcommunicationestablishment.h"
#include <unistd.h>
#include <fcntl.h>
#include <glob.h>
#include <termios.h>
#include <cstring>
#include "iostream"

SerialCommunicationEstablishment::SerialCommunicationEstablishment(QObject *parent) :
    QObject(parent), serial(new QSerialPort(this))
{
}

int SerialCommunicationEstablishment::getSerialPort() {
    return serialPort;
}

void SerialCommunicationEstablishment::openSerialPort() {
    glob_t glob_result;
    int result = glob("/dev/cu.usbserial-*", GLOB_TILDE, NULL, &glob_result);

    if (result == 0 && glob_result.gl_pathc > 0) {
        const char* portName = glob_result.gl_pathv[0];
        int serialPort = open(portName, O_RDWR | O_NOCTTY | O_SYNC);

        if (serialPort >= 0) {
            std::cout << "Successfully opened " << portName << std::endl;
            configurePort(serialPort);
        } else {
            std::cerr << "Error opening " << portName << ": " << std::strerror(errno) << std::endl;
        }
    } else if (glob_result.gl_pathc == 0) {
        std::cerr << "No serial devices found matching the pattern '/dev/cu.usbserial-*'." << std::endl;
    } else {
        std::cerr << "An error occurred while searching for serial devices: " << std::strerror(errno) << std::endl;
    }
    globfree(&glob_result);
}


void SerialCommunicationEstablishment::configurePort(int serialPort) {
    struct termios tty;
    memset(&tty, 0, sizeof tty);
    if (tcgetattr(serialPort, &tty) != 0) {
        std::cerr << "Error from tcgetattr" << std::endl;
        close(serialPort);
        return;
    }

    cfsetospeed(&tty, B115200);
    cfsetispeed(&tty, B115200);

    tty.c_cflag = (tty.c_cflag & ~CSIZE) | CS8; // 8-bit chars
    tty.c_cflag &= ~PARENB; // No parity bit
    tty.c_cflag &= ~CSTOPB; // One stop bit
    tty.c_cflag |= CLOCAL | CREAD;
    tty.c_iflag = 0; // No input processing
    tty.c_oflag = 0; // No output processing
    tty.c_lflag = 0; // No line processing

    tty.c_lflag &= ~(ICANON | ECHO | ECHOE | ISIG); // Raw input
    tty.c_iflag &= ~(IXON | IXOFF | IXANY);

    if (tcsetattr(serialPort, TCSANOW, &tty) != 0) {
        std::cerr << "Error from tcsetattr" << std::endl;
        close(serialPort);
        return;
    }

    std::cout << "Port is open" << std::endl;
}

void SerialCommunicationEstablishment::sendBooleanValues(int serialPort, bool bool1, bool bool2, bool bool3) {
    unsigned char boolBytes[3];
    boolBytes[0] = bool1 ? 0xFF : 0x00; // Convert bool1 to byte
    boolBytes[1] = bool2 ? 0xFF : 0x00; // Convert bool2 to byte
    boolBytes[2] = bool3 ? 0xFF : 0x00; // Convert bool3 to byte

    write(serialPort, boolBytes, 3); // Send the boolean bytes
    std::cout << "Boolean values sent" << std::endl;
}


void SerialCommunicationEstablishment::sendData(int serialPort, const std::string &data) {
    write(serialPort, data.data(), data.size());
    std::cout << "Data sent" << std::endl;
}

void SerialCommunicationEstablishment::closeSerialPort(int serialPort) {
    close(serialPort); // Close the serial port
    std::cout << "Port closed" << std::endl;
}
