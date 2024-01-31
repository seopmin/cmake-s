#include "my_lib.hpp"

#include <nlohmann/json.hpp>

// Doxygen Documentation Generator : /***/ 과 enter키
/**
 * @brief Prints out hello world and tests the JSON Lib.
 * 
 */

void print_hello_world() {
  std::cout << "Hello World\n";

    std::cout << "JSON Lib Version:"
    << NLOHMANN_JSON_VERSION_MAJOR << "."
    << NLOHMANN_JSON_VERSION_MINOR << "."
    << NLOHMANN_JSON_VERSION_PATCH << "\n";
}