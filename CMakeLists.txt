cmake_minimum_required(VERSION 3.20)
project(LearnVulkan)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_POSITION_INDEPENDENT_CODE ON)

set(SRC_ROOT ${CMAKE_CURRENT_SOURCE_DIR}/src)
set(INCLUDE_ROOT ${CMAKE_CURRENT_SOURCE_DIR}/include)

option(USE_GLFW "Use GLFW for windowing" ON)

add_executable(LearnVulkan
    ${SRC_ROOT}/main.cpp
    ${SRC_ROOT}/Engine/Renderer.cpp
)

file(GLOB_RECURSE RENDERER_SOURCES
    ${SRC_ROOT}/Renderers/Vulkan/*.cpp
)

target_sources(${PROJECT_NAME} PRIVATE ${RENDERER_SOURCES})

find_package(Vulkan REQUIRED)

if(CMAKE_CXX_COMPILER_ID MATCHES "Clang|GNU")
    target_compile_options(${PROJECT_NAME} PRIVATE -Wall -Wextra -Wpedantic)
elseif(MSVC)
    target_compile_options(${PROJECT_NAME} PRIVATE /W4)
endif()

target_include_directories(${PROJECT_NAME}
    PRIVATE
        ${INCLUDE_ROOT}
        ${Vulkan_INCLUDE_DIR}
)

if(USE_GLFW)
    target_compile_definitions(${PROJECT_NAME}
        PRIVATE
            USE_GLFW
    )
endif()


if(WIN32)
    target_compile_definitions(${PROJECT_NAME}
        PRIVATE
            OS_WINDOWS
    )
elseif(UNIX)
    target_compile_definitions(${PROJECT_NAME}
        PRIVATE
            OS_LINUX
    )
endif()

add_subdirectory(Libraries)

target_link_libraries(${PROJECT_NAME}
    PRIVATE
        Vulkan::Vulkan
)