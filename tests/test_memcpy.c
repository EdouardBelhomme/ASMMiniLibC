/*
** EPITECH PROJECT, 2023
** B-ASM-400-BDX-4-1-asmminilibc-edouard.belhomme
** File description:
** test_memcpy
*/

#include <criterion/criterion.h>
#include <stdlib.h>
#include <string.h>
#include <dlfcn.h>
#include <stdio.h>
#include <unistd.h>

void *(*my_memcpy)(void *dest, const void *src, size_t n);

void starter_memcpy(void)
{
    void *handle = dlopen("./libasm.so", RTLD_LAZY);

    if (!handle)
        write(2, ".libasm.so not found\n", 22);
    else {
        my_memcpy = dlsym(handle, "memcpy");
    }
}

Test(memcpy, basic, .init = starter_memcpy)
{
    char str[] = "Hello";
    char *str2 = str;

    my_memcpy(str2, str2, 5);
    cr_assert_str_eq(str2, str);
}