#include "datapacketformation.h"
#include "iostream"

using namespace std;

string formatData(const Collector::Data& rawData) {
    string tempConcatenationString;

    // Start with an std::string object to ensure concatenation works as expected
    tempConcatenationString = to_string(rawData.m_startSequence) + "00" + to_string(rawData.m_faultTolerantBits) + "00" +
                              to_string(rawData.m_xAddress) + "00" +
                              to_string(rawData.m_yAddress) + "00" +
                              to_string(rawData.m_dac8) + "00" +
                              to_string(rawData.m_dac7) + "00" +
                              to_string(rawData.m_dac6) + "00" +
                              to_string(rawData.m_dac5) + "00" +
                              to_string(rawData.m_dac4) + "00" +
                              to_string(rawData.m_dac3) + "00" +
                              to_string(rawData.m_dac2) + "00" +
                              to_string(rawData.m_dac1) + "00" +
                              to_string(rawData.m_ack) + "00";

    return tempConcatenationString;
}
