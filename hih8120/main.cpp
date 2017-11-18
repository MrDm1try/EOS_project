#include<iostream>
#include<string>
#include"HIH8120.h"

using namespace exploringBB;

int main(int argc, char **args)
{
    HIH8120* sensor = new HIH8120(2, 0x27);
    float* data = sensor->getData();
    delete sensor;

    if (argc == 1) {
        std::cout << "Humidity: " << *data << std::endl;
        std::cout << "Temperature: " << *(data+1) << std::endl;
    }
    else {
        std::string target =  *(args+1);
        if (target.compare("hum") == 0) {
            std::cout << *data << std::endl;
        }
        else if (target.compare("temp") == 0) {
            std::cout << *(data+1) << std::endl;
        }
        else {
            std::cout << "Not available" << std::endl;
            return 1;
        }
    }
    return 0;
}
