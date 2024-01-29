# cmake function 구현

# function('func name' '매개변수')
function(add_git_submodule dir)
	# git이 없으면 cmake 실패
  find_package(Git REQUIRED)
  
	# cmake가 없으면 해당 dir에서 초기화 하고 업데이트 시행
	if (NOT EXISTS ${CMAKE_SOURCE_DIR}/${dir}/CMakeLists.txt)
		execute_process(COMMAND ${GIT_EXECUTABLE}
			submodule update --init --recursive -- ${CMAKE_SOURCE_DIR}/${dir}
			WORKING_DIRECTORY ${PROJECT_SOURCE_DIR})
	endif()

	if (EXISTS ${CMAKE_SOURCE_DIR}/${dir}/CMakeLists.txt)
		message("Adding: ${CMAKE_SOURCE_DIR}/${dir}/CMakeLists.txt")
		add_subdirectory(${CMAKE_SOURCE_DIR}/${dir})
	else()
		message("Could not add: ${CMAKE_SOURCE_DIR}/${dir}/CMakeLists.txt")
	endif()
endfunction(add_git_submodule)
