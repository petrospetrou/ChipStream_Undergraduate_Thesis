#include "logmanager.h"
#include <QVariant>


LogManager::LogManager(QObject *parent) : QObject(parent) {
}

QStringList LogManager::logMessages() const {
    return m_logMessages;
}

void LogManager::addLog(const QString &logMessage) {
    m_logMessages.append(logMessage);
    emit logMessagesChanged();
}

void LogManager::displayData(const QVariant &startSequence, const QVariant &faultTolerantBits,
                             const QVariant &xAddress, const QVariant &yAddress,
                             const QVariant &dac8, const QVariant &dac7, const QVariant &dac6,
                             const QVariant &dac5, const QVariant &dac4, const QVariant &dac3,
                             const QVariant &dac2, const QVariant &dac1, const QVariant &ack) {
    // Create a formatted string from all the parameters
    QString formattedData = QString("Start Sequence: %1, Fault Tolerant Bits: %2, X Address: %3, Y Address: %4, "
                                    "DAC8: %5, DAC7: %6, DAC6: %7, DAC5: %8, DAC4: %9, DAC3: %10, "
                                    "DAC2: %11, DAC1: %12, ACK: %13")
                                .arg(startSequence.toString(), faultTolerantBits.toString(), xAddress.toString(), yAddress.toString(),
                                     dac8.toString(), dac7.toString(), dac6.toString(), dac5.toString(), dac4.toString(),
                                     dac3.toString(), dac2.toString(), dac1.toString(), ack.toString());

    // Assuming you have a method to handle adding this formatted data to a list and emitting a signal
    addLog(formattedData); // Reuse your existing mechanism to add to log
}


void LogManager::clearLogs() {
    m_logMessages.clear();
    emit logMessagesChanged();
}
