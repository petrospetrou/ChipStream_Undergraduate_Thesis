#ifndef COLLECTOR_H
#define COLLECTOR_H

/**
 * The purpose of this class is to collect all the data from the applicaiton
 * and further process it in C++ business logic. The data is coming from
 * InputParam.qml
 **/

#include <QObject>
#include <QString>

using namespace std;

class Collector : public QObject
{
    Q_OBJECT
public:
    explicit Collector(QObject *parent = nullptr);

    struct Data {
        // Change the data Type to as per requirement later
        string m_startSequence;
        string m_faultTolerantBits;
        string m_xAddress;
        string m_yAddress;
        string m_dac8;
        string m_dac7;
        string m_dac6;
        string m_dac5;
        string m_dac4;
        string m_dac3;
        string m_dac2;
        string m_dac1;
        string m_ack;
    };

    Q_INVOKABLE void collectData(const QVariant &startSequence, const QVariant &faultTolerantBits,
                                 const QVariant &xAddress, const QVariant &yAddress,
                                 const QVariant &dac8, const QVariant &dac7, const QVariant &dac6,
                                 const QVariant &dac5, const QVariant &dac4, const QVariant &dac3,
                                 const QVariant &dac2, const QVariant &dac1, const QVariant &ack);

    Q_INVOKABLE Data getAllData() const;

    // Add other member functions and variables as needed

private:
    Data userData;
    // Add other variables as needed
};

#endif // COLLECTOR_H
