#ifndef HIH_H_
#define HIH_H_

#include"I2CDevice.h"

using namespace exploringBB;

/**
 * @class HIH8120
 * @brief Class that can be used to get temperature and humidity data from HIH8120 sensor
 */
class HIH8120{
private:
	I2CDevice* i2c_sensor;
public:
	HIH8120(unsigned int bus, unsigned int device);
	virtual ~HIH8120();
	virtual float* getData();
};

#endif /* HIH_H_ */
