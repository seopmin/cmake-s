# 0.) Create Source and CMakeFile
# 1.) mkdir build
# 2.) cd build
# 3.) cmake ..      - Generating the Build Files / Configure the Project
# 4.) cmake --build .
# 5.) ./Executable

cmake_minimum_required(VERSION 3.16)   # 최소 버전 작성

project(
  CppProjectTemplate  # 프로젝트 명
  VERSION 1.0.0       # 프로젝트 버전
  LANGUAGES C CXX     # 프로젝트에서 사용한 언어(CXX == CPP)
)

# C++ 표준 버전을 설정
set(CMAKE_CXX_STANDARD          17)
# 설정된 C++ 표준이 필수적임을 나타냄.ON으로 설정하면 CMake는 지정된 C++ 표준(여기서는 C++17)을 지원하지 않는 컴파일러의 경우 빌드를 실패
set(CMAKE_CXX_STANDARD_REQUIRED ON)
# 컴파일러 특정 확장을 비활성화. OFF로 설정하면, CMake는 순수한 C++ 표준만을 사용
set(CMAKE_CXX_EXTENSIONS        OFF) 

# 변수 설정 ('변수이름' '변수매칭값') <- 값은 문자열일 경우도 따옴표로 안해도 됨. 알아서 make가 타입 판별함
set(LIBRARY_NAME Library)
set(EXECUTABLE_NAME Executable)

# cmake 위치 설정
set(CMAKE_MODULE_PATH "${PROJECT_SOURCE_DIR}/cmake/")
include(AddGitSubmoduleFile)  # AddGitSubmodule cmake 파일을 불러와 아래의 함수 이용
# 정적으로 외부 라이브러리 가져오기.
# add_git_submodule(external/json)  # json subdir 추가

# FetchContent를 사용하려면 해당 깃이 cmake 플젝이어야 함.
include(FetchContent)
FetchContent_Declare(
  nlohman_json  # 해당 프로젝트 이름(cmake에 작성되어 있는)
  GIT_REPOSITORY https://github.com/nlohmann/json  # git adress
  GIT_TAG v3.11.3  # git vesion
  GIT_SHALLOW TRUE
)
FetchContent_MakeAvailable(nlohman_json)  # cmake에 라이브러리 추가

FetchContent_Declare(
  fmt  # 해당 프로젝트 이름(cmake에 작성되어 있는)
  GIT_REPOSITORY https://github.com/fmtlib/fmt  # git adress
  GIT_TAG 10.2.1  # git vesion (v가 없는 것도 있음)
  GIT_SHALLOW TRUE
)
FetchContent_MakeAvailable(fmt)  # cmake에 라이브러리 추가

FetchContent_Declare(
  spdlog  # 해당 프로젝트 이름(cmake에 작성되어 있는)
  GIT_REPOSITORY https://github.com/gabime/spdlog  # git adress
  GIT_TAG v1.13.0  # git vesion
  GIT_SHALLOW TRUE
)
FetchContent_MakeAvailable(spdlog)  # cmake에 라이브러리 추가

FetchContent_Declare(
  cxxopts  # 해당 프로젝트 이름(cmake에 작성되어 있는)
  GIT_REPOSITORY https://github.com/jarro2783/cxxopts  # git adress
  GIT_TAG v3.1.1  # git vesion
  GIT_SHALLOW TRUE
)
FetchContent_MakeAvailable(cxxopts)  # cmake에 라이브러리 추가

FetchContent_Declare(
  Catch2  # 해당 프로젝트 이름(cmake에 작성되어 있는)
  GIT_REPOSITORY https://github.com/catchorg/Catch2  # git adress
  GIT_TAG v2.13.9  # git vesion
  GIT_SHALLOW TRUE
)
FetchContent_MakeAvailable(Catch2)  # cmake에 라이브러리 추가



# 빌드 파일 커스터마이징 옵션 ('변수명' 'description' 'on/off')
option(COMPILE_EXECUTABLE "Whether to compile the executable" ON)
# 오른쪽과 같이 컴파일에서 변경 가능 -> cmake .. -DCOMPILE_EXECUTABLE=ON

# 서브 디렉토리 추가
add_subdirectory(src)  # 라이브러리 디렉토리를 실행 디렉토리보다 먼저!!(순서 바꾸어도 되긴 함)
add_subdirectory(configured)
# add_subdirectory(external)


if (COMPILE_EXECUTABLE)
  add_subdirectory(app)
else()
  message("W/o exe. compiling")  # cmake 빌드 할 때 message
endif()

