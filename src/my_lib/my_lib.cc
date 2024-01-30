#include "my_lib.hpp"

#include <nlohmann/json.hpp>

void print_hello_world() {
  std::cout << "Hello World\n";

    std::cout << "JSON Lib Version:"
    << NLOHMANN_JSON_VERSION_MAJOR << "."
    << NLOHMANN_JSON_VERSION_MINOR << "."
    << NLOHMANN_JSON_VERSION_PATCH << "\n";
}