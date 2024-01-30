set(EXE_SOURCES
  "main.cc")

# 실행 파일 추가 ('실행파일이름' '실행할 파일의 이름')
add_executable(${EXECUTABLE_NAME} ${EXE_SOURCES}) 


# 실행파일 라이브러리 링킹 ('실행파일이름' '옵션' '라이브러리이름')
target_link_libraries(${EXECUTABLE_NAME} PUBLIC 
    ${LIBRARY_NAME})