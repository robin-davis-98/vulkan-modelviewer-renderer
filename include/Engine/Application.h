#pragma once

#include <cinttypes>

struct ApplicationConfig
{
    const char* window_title;
    uint32_t window_width;
    uint32_t window_height;
};

struct Application
{
    bool isRunning;

};