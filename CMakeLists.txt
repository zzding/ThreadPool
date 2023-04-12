cmake_minimum_required(VERSION 3.0)
project(TestThreadPool)
set(CMAKE_CXX_STANDARD 11)
add_executable(${PROJECT_NAME} ../src/TestThreadPool.cpp ../src/ThreadPool.cpp)
