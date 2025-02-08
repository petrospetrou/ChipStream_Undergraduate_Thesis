#include "systemcontroller.h"
#include "iostream"

using namespace std;

SystemController::SystemController(QObject *parent)
    : QObject{parent}
{}

void SystemController::startSendingBitsProcess(bool saveData, bool startProtocol, bool enableSimulation,
                                               const QVariant &startSequence, const QVariant &faultTolerantBits,
                                               const QVariant &xAddress, const QVariant &yAddress,
                                               const QVariant &dac8, const QVariant &dac7, const QVariant &dac6,
                                               const QVariant &dac5, const QVariant &dac4, const QVariant &dac3,
                                               const QVariant &dac2, const QVariant &dac1, const QVariant &ack) {
    collector.collectData(startSequence, faultTolerantBits,
                          xAddress, yAddress,
                          dac8, dac7, dac6,
                          dac5, dac4, dac3,
                          dac2, dac1, ack);

    formatDataPacket();

        std::cout << "HI";

    serial.openSerialPort();
    serial.configurePort(serial.getSerialPort());
    serial.sendBooleanValues(serial.getSerialPort(), saveData, startProtocol, enableSimulation);
    serial.sendData(serial.getSerialPort(), formattedData);
    serial.closeSerialPort(serial.getSerialPort());

    saveData = false;
    startProtocol = false;
    enableSimulation = false;



}

void SystemController::formatDataPacket() {
    Collector::Data my_data = collector.getAllData();

    formattedData = my_data.m_startSequence + "00"
                    + my_data.m_faultTolerantBits + "00"
                    + my_data.m_xAddress + "00"
                    + my_data.m_yAddress + "00"
                    + my_data.m_dac8 + "00"
                    + my_data.m_dac7 + "00"
                    + my_data.m_dac6 + "00"
                    + my_data.m_dac5 + "00"
                    + my_data.m_dac4 + "00"
                    + my_data.m_dac3 + "00"
                    + my_data.m_dac2 + "00"
                    + my_data.m_dac1 + "00"
                    + my_data.m_ack + "00" + "00";
}
