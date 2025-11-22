#pragma once

#include <cinttypes>

struct Arena
{
    uint8_t* base;
    size_t capacity;
    size_t used;
};

void* arena_alloc(Arena* a, size_t size);
void arena_reset(Arena* a);