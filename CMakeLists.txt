cmake_minimum_required(VERSION 3.19.2)
project(BoneHeat LANGUAGES CXX)

set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${CMAKE_CURRENT_SOURCE_DIR}/cmake)

# LIBIGL PACKAGE
option(LIBIGL_WITH_EMBREE              "Use Embree"                   ON)
find_package(LIBIGL REQUIRED QUIET)

# Add your project files
file(GLOB_RECURSE SRCFILES src/*.cpp src/*.hpp)
add_executable(${PROJECT_NAME} ${SRCFILES})

# Link libraries
target_link_libraries(${PROJECT_NAME} igl::core igl::embree)
