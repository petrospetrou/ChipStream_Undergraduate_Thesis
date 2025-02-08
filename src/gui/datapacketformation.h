#ifndef DATAPACKETFORMATION_H
#define DATAPACKETFORMATION_H

#include "iostream"
#include "string"
#include "collector.h"

class DataPacketFormation
{
public:

    std::string formatData(const Collector::Data& rawData);
};

#endif // DATAPACKETFORMATION_H
