# library들을 하나의 변수로 만듦( 파일명은 문자열로 안해도 됨 )
set(LIBRARY_SOURCES
  "my_lib.cc")  
set(LIBRARY_HEADERS
  "my_lib.hpp")
set(LIBRARY_INCLUDES
  "./"
  "${CMAKE_BINARY_DIR}/configured_files/include")

# 라이브러리 추가 ('라이브러리이름' '옵션' '추가할 파일')
add_library(${LIBRARY_NAME} STATIC
  ${LIBRARY_SOURCES}
  ${LIBRARY_HEADERS})  

# 헤더파일을 찾기 위해 추가 ('라이브러리이름' '옵션' '위치')
target_include_directories(${LIBRARY_NAME} PUBLIC 
  ${LIBRARY_INCLUDES})

target_link_libraries(${LIBRARY_NAME} PUBLIC
  nlohmann_json::nlohmann_json
  fmt::fmt
  spdlog::spdlog
  cxxopts::cxxopts)  # 프로젝트이름::라이브러리이름