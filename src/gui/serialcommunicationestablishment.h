#ifndef SERIALCOMMUNICATIONESTABLISHMENT_H
#define SERIALCOMMUNICATIONESTABLISHMENT_H

#include "QtCore/qobject.h"
#include <QObject>
#include <QSerialPort>
#include <QByteArray>
class SerialCommunicationEstablishment : public QObject
{
public:
    explicit SerialCommunicationEstablishment(QObject *parent = nullptr);
    int getSerialPort();
    void openSerialPort();
    void configurePort(int serialPort);
    void sendBooleanValues(int serialPort, bool bool1, bool bool2, bool bool3);
    void sendData(int serialPort, const std::string &data);
    void closeSerialPort(int serialPort);

private:
    QSerialPort *serial;
    int serialPort;

private slots:
    void handleError(QSerialPort::SerialPortError error);


};

#endif // SERIALCOMMUNICATIONESTABLISHMENT_H
