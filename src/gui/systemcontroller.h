#ifndef SYSTEMCONTROLLER_H
#define SYSTEMCONTROLLER_H

#include <QObject>
#include <QVariant>
#include <QByteArray>
#include "collector.h"
#include "iostream"
#include "string"
#include "serialcommunicationestablishment.h"

using namespace std;

class SystemController : public QObject
{
    Q_OBJECT

    Collector collector;
    SerialCommunicationEstablishment serial;
public:
    explicit SystemController(QObject *parent = nullptr);

    Q_INVOKABLE void startSendingBitsProcess(bool saveData, bool startProtocol, bool enableSimulation,
                                             const QVariant &startSequence, const QVariant &faultTolerantBits,
                                             const QVariant &xAddress, const QVariant &yAddress,
                                             const QVariant &dac8, const QVariant &dac7, const QVariant &dac6,
                                             const QVariant &dac5, const QVariant &dac4, const QVariant &dac3,
                                             const QVariant &dac2, const QVariant &dac1, const QVariant &ack);

private:
    string formattedData;
    void formatDataPacket();

signals:
};

#endif // SYSTEMCONTROLLER_H
