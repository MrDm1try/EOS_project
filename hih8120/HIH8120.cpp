#include<iostream>
#include<unistd.h>
#include"HIH8120.h"

/**
 * Constructor for the HIH8210 class. It requires the bus number and device number. The constructor
 * opens a handle to the I2C device, which is destroyed when the destructor is called
 * @param bus The bus number. Usually 0 or 1 on the BBB
 * @param device The device ID on the bus.
 */
HIH8120::HIH8120(unsigned int bus, unsigned int device) {
    i2c_sensor = new I2CDevice(bus, device);
}

/**
 * Get temperature and humidity data from HIH8210 sensor.
 * @return array of two values: first is humidity data, second is temperature data
 */
float* HIH8120::getData(){
    // Generate measurement request
    int status = i2c_sensor->write(0);
    //Wait for the measurement cycle - typically 36.65 ms
    usleep(40000);
    // Fetch data
    unsigned char* data = i2c_sensor->readDevice(0x27);

    if (data[0] & (1<<6)) {
        std::cout << "WARNING: stale data" << std::endl;
    }
    unsigned short raw_hum = ((data[0] << 8) | data[1]) & 0x3fff;
    unsigned short raw_temp = (data[2] << 6) | (data[3] >> 2);
    float* toReturn = new float[2];
    toReturn[0] = raw_hum * (100.0/((1<<14) - 2));
    toReturn[1] = raw_temp * (165.0/((1<<14) - 2)) - 40;
    return toReturn;
}

/**
 * Destroyes the instance of an I2C devise.
 */
HIH8120::~HIH8120() {
    delete i2c_sensor;
}
