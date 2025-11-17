cmake_minimum_required(VERSION 3.20)
project(LearnVulkan)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_POSITION_INDEPENDENT_CODE ON)

add_subdirectory(Libraries)

set(SRC_ROOT ${CMAKE_CURRENT_SOURCE_DIR}/src CACHE INTERNAL "")

target_link_libraries(${PROJECT_NAME}
    PUBLIC
)

target_include_directories(${PROJECT_NAME}
    PUBLIC

)

if(WIN32)
    target_compile_definitions(${PROJECT_NAME}
        PRIVATE
            PLATFORM_WINDOWS
            PLATFORM_GLFW
    )
elseif(UNIX)
    target_compile_definitions(${PROJECT_NAME}
        PRIVATE
            PLATFORM_LINUX
    )
endif()