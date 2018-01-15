#include<iostream>
#include<string>
#include"HIH8120.h"

using namespace exploringBB;

// argc - number of arguments, args - array of arguments of length argc 
int main(int argc, char **args)
{
    // Create pointer to a new HIH8120 object
    HIH8120* sensor = new HIH8120(2, 0x27);
    // Call the method and get the two values
    float* data = sensor->getData();
    // Remove the object to free some memory
    delete sensor;

    // If no arguments - output both values
    if (argc == 1) {
        std::cout << "Humidity: " << *data << std::endl;
        std::cout << "Temperature: " << *(data+1) << std::endl;
    }
    else {
        // get the argument provided, evaluate and output needed value
        std::string target =  *(args+1);
        if (target.compare("hum") == 0) {
            std::cout << *data << std::endl;
        }
        else if (target.compare("temp") == 0) {
            std::cout << *(data+1) << std::endl;
        }
        // Otherwise output 'Not available' and leave with error-code 1
        else {
            std::cout << "Not available" << std::endl;
            return 1;
        }
    }
    // Leave with error-code 0
    return 0;
}
