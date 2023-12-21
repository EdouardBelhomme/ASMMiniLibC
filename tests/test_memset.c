/*
** EPITECH PROJECT, 2023
** B-ASM-400-BDX-4-1-asmminilibc-edouard.belhomme
** File description:
** test_memset
*/

#include <criterion/criterion.h>
#include <stdlib.h>
#include <string.h>
#include <dlfcn.h>
#include <stdio.h>
#include <unistd.h>

void *(*my_memset)(void *str, int c, size_t n);

void asm_memset(void)
{
    void *handle = dlopen("./libasm.so", RTLD_LAZY);
    my_memset = dlsym(handle, "memset");
}

Test(memset, basic, .init = asm_memset)
{
    char str[] = "Hello";
    char *str2 = str;
    char str3[] = "World";
    char *str4 = str3;

    my_memset(str2, 'a', 5);
    my_memset(str4, 'a', 5);
    cr_assert_str_eq(str2, str4);
}
