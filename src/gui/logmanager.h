#ifndef LOGMANAGER_H
#define LOGMANAGER_H

#include <QObject>
#include <QStringList>

class LogManager : public QObject {
    Q_OBJECT
    Q_PROPERTY(QStringList logMessages READ logMessages NOTIFY logMessagesChanged)

public:
    explicit LogManager(QObject *parent = nullptr);

    QStringList logMessages() const;
    Q_INVOKABLE void addLog(const QString &logMessage);
    Q_INVOKABLE void displayData(const QVariant &startSequence, const QVariant &faultTolerantBits,
                                  const QVariant &xAddress, const QVariant &yAddress,
                                  const QVariant &dac8, const QVariant &dac7, const QVariant &dac6,
                                  const QVariant &dac5, const QVariant &dac4, const QVariant &dac3,
                                  const QVariant &dac2, const QVariant &dac1, const QVariant &ack);
    Q_INVOKABLE void clearLogs();

signals:
    void logMessagesChanged();

private:
    QStringList m_logMessages;
};

#endif // LOGMANAGER_H
