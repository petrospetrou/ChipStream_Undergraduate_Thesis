#include "collector.h"
#include <QDebug>

using namespace std;
Collector::Collector(QObject *parent) : QObject(parent)
{
    // Initialize your variables
}

void Collector::collectData(const QVariant &startSequence, const QVariant &faultTolerantBits,
                            const QVariant &xAddress, const QVariant &yAddress,
                            const QVariant &dac8, const QVariant &dac7, const QVariant &dac6,
                            const QVariant &dac5, const QVariant &dac4, const QVariant &dac3,
                            const QVariant &dac2, const QVariant &dac1, const QVariant &ack)
{
    // From QVariant you can convert to any datatype of your liking
    userData.m_startSequence = startSequence.toString().toStdString();
    userData.m_faultTolerantBits = faultTolerantBits.toString().toStdString();
    userData.m_xAddress = xAddress.toString().toStdString();
    userData.m_yAddress = yAddress.toString().toStdString();
    userData.m_dac8 = dac8.toString().toStdString();
    userData.m_dac7 = dac7.toString().toStdString();
    userData.m_dac6 = dac6.toString().toStdString();
    userData.m_dac5 = dac5.toString().toStdString();
    userData.m_dac4 = dac4.toString().toStdString();
    userData.m_dac3 = dac3.toString().toStdString();
    userData.m_dac2 = dac2.toString().toStdString();
    userData.m_dac1 = dac1.toString().toStdString();
    userData.m_ack = ack.toString().toStdString();

    qDebug() << QString::fromStdString(userData.m_startSequence)
             << QString::fromStdString(userData.m_faultTolerantBits)
             << QString::fromStdString(userData.m_xAddress)
             << QString::fromStdString(userData.m_yAddress)
             << QString::fromStdString(userData.m_dac8)
             << QString::fromStdString(userData.m_dac7)
             << QString::fromStdString(userData.m_dac6)
             << QString::fromStdString(userData.m_dac5)
             << QString::fromStdString(userData.m_dac4)
             << QString::fromStdString(userData.m_dac3)
             << QString::fromStdString(userData.m_dac2)
             << QString::fromStdString(userData.m_dac1)
             << QString::fromStdString(userData.m_ack);


    /** Process the collected data or trigger other actions
     *  Further development or processing of the data should be done here
     *  Or generate a signal to sink in a slot
    **/

}

Collector::Data Collector::getAllData() const {
    return userData;
}
